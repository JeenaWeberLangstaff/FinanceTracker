<?php
session_start();

// Database configuration
$host = 'localhost';
$db = 'financetracker';
$user = 'root';
$password = '';

try {
    // Create PDO connection (using prepared statements for security)
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Connection failed: ' . htmlspecialchars($e->getMessage()));
}

// Initialize CSRF token if not present
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$error = '';

// Process login form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // ========== 1. CSRF TOKEN VALIDATION ==========
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        $error = 'Invalid request. Please try again.';
        logActivity('CSRF_FAILURE', null, $_SERVER['REMOTE_ADDR']);
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // ========== 2. INPUT SANITIZATION ==========
    // Trim and sanitize user inputs (prevent XSS)
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
    $password_input = isset($_POST['password']) ? $_POST['password'] : '';
    
    // Validate inputs are not empty
    if (empty($email) || empty($phone) || empty($password_input)) {
        $error = 'All fields are required.';
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'Invalid email format.';
        logActivity('INVALID_EMAIL', null, $_SERVER['REMOTE_ADDR']);
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // ========== 3. SQL INJECTION PREVENTION (PREPARED STATEMENTS) ==========
    // Query user with prepared statement to prevent SQL injection
    try {
        $stmt = $pdo->prepare("SELECT id, user_id, password_hash, phone_number FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user_data = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $error = 'Database error. Please try again later.';
        logActivity('DB_ERROR', null, $_SERVER['REMOTE_ADDR']);
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // ========== 4. AUTHENTICATION ==========
    // Verify user exists
    if (!$user_data) {
        $error = 'Invalid email or password.';
        logActivity('LOGIN_FAILED', null, $_SERVER['REMOTE_ADDR'], 'User not found');
        // Don't redirect immediately - use generic error message
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // Verify phone number matches
    if ($user_data['phone_number'] !== $phone) {
        $error = 'Invalid email or password.';
        logActivity('LOGIN_FAILED', $user_data['id'], $_SERVER['REMOTE_ADDR'], 'Phone number mismatch');
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // ========== 5. PASSWORD VERIFICATION (BCRYPT HASHING) ==========
    // Verify password using bcrypt (never store plaintext passwords!)
    if (!password_verify($password_input, $user_data['password_hash'])) {
        $error = 'Invalid email or password.';
        logActivity('LOGIN_FAILED', $user_data['id'], $_SERVER['REMOTE_ADDR'], 'Password incorrect');
        header("Location: login.php?error=" . urlencode($error));
        exit;
    }
    
    // ========== 6. SUCCESSFUL AUTHENTICATION ==========
    // Create secure session
    $_SESSION['user_id'] = $user_data['id'];
    $_SESSION['email'] = htmlspecialchars($user_data['email']); // Store sanitized email
    $_SESSION['login_time'] = time();
    $_SESSION['ip_address'] = $_SERVER['REMOTE_ADDR'];
    
    // Regenerate session ID to prevent session fixation attacks
    session_regenerate_id(true);
    
    // Log successful login
    logActivity('LOGIN_SUCCESS', $user_data['id'], $_SERVER['REMOTE_ADDR']);
    
    // Redirect to dashboard
    header("Location: dashboard.php");
    exit;
}

/**
 * ========== 7. AUDIT LOGGING ==========
 * Log authentication attempts and activities for security monitoring
 */
function logActivity($action, $user_id, $ip_address, $details = '') {
    global $pdo;
    
    try {
        $stmt = $pdo->prepare("
            INSERT INTO audit_log (action, user_id, ip_address, details, timestamp) 
            VALUES (?, ?, ?, ?, NOW())
        ");
        $stmt->execute([$action, $user_id, $ip_address, $details]);
    } catch (PDOException $e) {
        // Log to file if database logging fails
        error_log("Audit log failed: " . $e->getMessage());
    }
}

// Redirect to login form
require 'login_view.php'; // Your HTML form (login_view.php or login.php)
?>
