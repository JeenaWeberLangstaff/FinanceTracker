<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FinTrack - Log In</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap" rel="stylesheet">
</head>
<body>
<header class="site-header">
    <div class="container header-container">
        <div class="logo">
            <a href="index.php">Fin<span>Track</span></a>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="login.php">Log In</a></li>
                <li><a href="register.php">Register</a></li>
            </ul>
        </nav>
    </div>
</header>
<main class="container">
<div class="login-container animate-bottom">
    <h1>Log In</h1>
    <hr>
    
    <!-- Display error messages if authentication fails -->
    <?php
    if (isset($_GET['error'])) {
        echo '<div class="error-message">' . htmlspecialchars($_GET['error']) . '</div>';
    }
    ?>
    
    <form method="POST" action="login.php" class="login-form">
        <!-- CSRF Token Protection -->
        <?php 
        session_start();
        if (!isset($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }
        ?>
        <input type="hidden" name="csrf_token" value="<?php echo htmlspecialchars($_SESSION['csrf_token']); ?>">
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"
                   placeholder="you@email.com" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone"
                   placeholder="123-456-7890" required>
        </div>
        
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"
                   placeholder="••••••••" required>
        </div>
        
        <div class="form-group">
            <input type="submit" value="Log In" class="submit-btn">
        </div>
    </form>
    
    <p class="login-footer">Don't have an account? <a href="register.php">Register here</a></p>
</div>
</main>
<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 FinTrack</p>
    </div>
</footer>
</body>
</html>
