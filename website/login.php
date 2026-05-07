<?php
    require_once 'includes/database-connection.php';
    require_once 'includes/session.php';

    // Already logged in — go straight to dashboard
    if ($logged_in) {
        header('Location: index.php');
        exit;
    }

    $error = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        // ========== CSRF TOKEN VALIDATION ==========
        // Verify that the CSRF token in the form matches the one in the session
        if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
            $error = 'Invalid request. Please try again.';
        } else {
            
            // Get and trim user inputs
            $email    = trim($_POST['email'] ?? '');
            $phone    = trim($_POST['phone'] ?? '');
            $password = $_POST['password'] ?? '';  // Don't trim password (spaces matter)
            
            // Validate that all fields are provided
            if (!$email || !$phone || !$password) {
                $error = 'All fields are required.';
            } else {
                // Authenticate with all three credentials
                $user = authenticate($pdo, $email, $phone, $password);

                if ($user) {
                    // Authentication successful - create session
                    login($user);
                    
                    // Regenerate session ID to prevent session fixation attacks
                    session_regenerate_id(true);
                    
                    // Redirect to dashboard
                    header('Location: index.php');
                    exit;
                } else {
                    // Authentication failed - use generic message (don't reveal which credential was wrong)
                    $error = 'Invalid email, phone number, or password.';
                }
            }
        }
    }

    require_once 'includes/header.php';
?>

<div class="login-container animate-bottom">
    <h1>Log In</h1>
    <hr>

    <?php if ($error): ?>
        <div class="login-error" style="display:block">
            <?= htmlspecialchars($error) ?>
        </div>
    <?php endif; ?>

    <form method="POST" action="login.php" class="login-form">

        <!-- ========== CSRF TOKEN FIELD ========== -->
        <!-- This hidden field prevents cross-site request forgery attacks -->
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($_SESSION['csrf_token']) ?>">

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"
                   value="<?= htmlspecialchars($_POST['email'] ?? '') ?>"
                   placeholder="you@email.com" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <!-- Changed from type="password" to type="tel" since this is a phone number -->
            <input type="tel" id="phone" name="phone"
                   value="<?= htmlspecialchars($_POST['phone'] ?? '') ?>"
                   placeholder="1234567890" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <!-- Password field - note: we don't preserve value for security reasons -->
            <input type="password" id="password" name="password"
                   placeholder="••••••••" required>
        </div>

        <div class="form-group">
            <input type="submit" value="Log In" class="submit-btn">
        </div>

    </form>
</div>

<?php require_once 'includes/footer.php'; ?>

