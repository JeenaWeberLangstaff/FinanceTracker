<?php

session_start();

// Generate CSRF token if it doesn't exist
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$logged_in = isset($_SESSION['user_id']);

function login(array $user): void {
    $_SESSION['user_id']    = $user['User_ID'];
    $_SESSION['first_name'] = $user['First_Name'];
    $_SESSION['last_name']  = $user['Last_Name'];
    $_SESSION['email']      = $user['Email'];
}

function logout(): void {
    session_destroy();
}

function require_login(bool $logged_in): void {
    if (!$logged_in) {
        header('Location: login.php');
        exit;
    }
}

/**
 * Authenticate user with email, phone number, and password
 * 
 * @param PDO $pdo Database connection
 * @param string $email User's email address
 * @param string $phone User's phone number
 * @param string $password User's plaintext password (will be verified against stored hash)
 * @return array|false Returns user data if authentication succeeds, false otherwise
 */
function authenticate(PDO $pdo, string $email, string $phone, string $password): array|false {
    // Step 1: Find user with matching email AND phone number
    $stmt = $pdo->prepare(
        'SELECT * FROM Account_Holder WHERE Email = :email AND Phone_number = :phone'
    );
    $stmt->execute([':email' => $email, ':phone' => $phone]);
    $user = $stmt->fetch();
    
    // Step 2: Verify password against stored hash
    // password_verify() compares plaintext password with bcrypt hash
    // Returns true if they match, false otherwise
    if ($user && password_verify($password, $user['Password_Hash'])) {
        return $user;  // All three credentials match - authentication successful
    }
    
    return false;  // Email/phone not found or password incorrect
}

