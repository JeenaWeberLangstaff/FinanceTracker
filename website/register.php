<?php
    require_once 'includes/database-connection.php';
    require_once 'includes/session.php';

    if ($logged_in) {
        header('Location: index.php');
        exit;
    }

    // ========== CSRF TOKEN GENERATION ==========
    if (!isset($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }

    $error   = '';
    $success = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        // ========== CSRF TOKEN VALIDATION ==========
        if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
            $error = 'Invalid request. Please try again.';
        } else {
            
            // Get and trim user inputs
            $first              = trim($_POST['first_name'] ?? '');
            $last               = trim($_POST['last_name'] ?? '');
            $email              = trim($_POST['email'] ?? '');
            $phone              = trim($_POST['phone_number'] ?? '');
            $password           = $_POST['password'] ?? '';  // Don't trim password
            $confirm_password   = $_POST['confirm_password'] ?? '';  // Don't trim password

            // ========== INPUT VALIDATION ==========
            // Check all required fields
            if (!$first || !$last || !$email || !$phone || !$password || !$confirm_password) {
                $error = 'Please fill in all fields.';
            } 
            // Validate email format
            elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $error = 'Invalid email format.';
            }
            // Validate password length
            elseif (strlen($password) < 8) {
                $error = 'Password must be at least 8 characters long.';
            }
            // Verify passwords match
            elseif ($password !== $confirm_password) {
                $error = 'Passwords do not match.';
            } 
            else {
                // Check if email already exists
                $check = $pdo->prepare('SELECT User_ID FROM Account_Holder WHERE Email = :email');
                $check->execute([':email' => $email]);

                if ($check->fetch()) {
                    $error = 'An account with that email already exists.';
                } else {
                    // ========== PASSWORD HASHING ==========
                    // Hash the password using bcrypt before storing
                    // PASSWORD_BCRYPT: industry-standard algorithm for password hashing
                    // ['cost' => 12]: computation cost (higher = slower/more secure, ~100ms per hash)
                    $password_hash = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
                    
                    // ========== INSERT NEW USER WITH HASHED PASSWORD ==========
                    $stmt = $pdo->prepare(
                        'INSERT INTO Account_Holder (First_Name, Last_Name, Email, Phone_number, Password_Hash)
                         VALUES (:first, :last, :email, :phone, :hash)'
                    );
                    $stmt->execute([
                        ':first' => $first,
                        ':last'  => $last,
                        ':email' => $email,
                        ':phone' => $phone,
                        ':hash'  => $password_hash,  // Store only the hash, never the plaintext password
                    ]);

                    $success = 'Account created! You can now log in.';
                }
            }
        }
    }

    require_once 'includes/header.php';
?>

<div class="login-container animate-bottom">
    <h1>Create Account</h1>
    <hr>

    <?php if ($error): ?>
        <div class="login-error" style="display:block">
            <?= htmlspecialchars($error) ?>
        </div>
    <?php endif; ?>

    <?php if ($success): ?>
        <div class="login-success">
            <?= htmlspecialchars($success) ?>
            <a href="login.php">Log in →</a>
        </div>
    <?php endif; ?>

    <?php if (!$success): ?>
    <form method="POST" action="register.php" class="login-form">

        <!-- ========== CSRF TOKEN FIELD ========== -->
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($_SESSION['csrf_token']) ?>">

        <div class="form-group">
            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name"
                   value="<?= htmlspecialchars($_POST['first_name'] ?? '') ?>"
                   placeholder="John" required>
        </div>

        <div class="form-group">
            <label for="last_name">Last Name:</label>
            <input type="text" id="last_name" name="last_name"
                   value="<?= htmlspecialchars($_POST['last_name'] ?? '') ?>"
                   placeholder="Doe" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"
                   value="<?= htmlspecialchars($_POST['email'] ?? '') ?>"
                   placeholder="you@email.com" required>
        </div>

        <div class="form-group">
            <label for="phone_number">Phone Number:</label>
            <input type="tel" id="phone_number" name="phone_number"
                   value="<?= htmlspecialchars($_POST['phone_number'] ?? '') ?>"
                   placeholder="1234567890" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <!-- Password field - note: we don't preserve value for security reasons -->
            <input type="password" id="password" name="password"
                   placeholder="••••••••" minlength="8" required>
            <small style="color:#999;font-family:sans-serif;font-size:12px">Password must be at least 8 characters</small>
        </div>

        <div class="form-group">
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password"
                   placeholder="••••••••" minlength="8" required>
        </div>

        <div class="form-group">
            <input type="submit" value="Create Account" class="submit-btn">
        </div>

    </form>

    <p class="form-switch">Already have an account? <a href="login.php">Log in</a></p>

    <?php endif; ?>
</div>

<?php require_once 'includes/footer.php'; ?>


<?php require_once 'includes/footer.php'; ?>
