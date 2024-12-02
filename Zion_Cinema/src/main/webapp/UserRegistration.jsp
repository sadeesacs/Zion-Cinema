<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="StyleSheet4.css">
</head>
<body>

    <!-- Header Section -->
    <div class="header-container">
        <!-- Zion Cinema Logo -->
        <img src="images/logo.png" alt="Zion Cinema Logo">
        <a href="HomePage.html" class="logo-name">Zion Cinema</a>

        <!-- Navigation Bar -->
        <div class="nav">
            <a href="HomePage.html">Home</a>
            <span><a href="Movie.html">Movies</a></span>
            <a href="About.html">About us</a>
            <a href="Contact.html">Contact</a>
            <a href="FAQ.html">FAQ</a>
        </div>

        <!-- Header Buttons -->
        <a href="Movies.html" class="but-buytickets">
            <div>Buy Tickets</div>
        </a>
        <a href="Login.html" class="but-login">
            <div>Login</div>
        </a>
    </div>
    <div class="header-line"></div>

    <!-- Main Content Section -->
    <div class="main-content">
        <!-- Left Side Image -->
        <div class="pic">
            <img src="images/pic.png" alt="Cinema illustration">
        </div>
        <!-- Right Side Registration Form -->
        <div class="registration-form"><br><br><br>
            <h1>Welcome to <span>Zion Cinema</span></h1>
            <p>Create Your Zion Cinema Account</p><br><br>
            <form action="register.php" method="POST">
                <div class="form-group">
                    <div class="form-field">
                        <label for="first_name">First Name</label>
                        <input type="text" id="first_name" name="first_name" class="FNamebox">
                    </div>
                    <div class="form-field2">
                        <label for="last_name">Last Name</label>
                        <input type="text" id="last_name" name="last_name" class="LNamebox">
                    </div>
                </div>
                
                <p>Email Address</p>
                <input type="email" name="email">
                <p>Phone number</p>
                <input type="tel" name="phone">
                <p>Password</p>
                <input type="password" name="password">
                <p>Re-type Password</p>
                <input type="password" name="confirm_password">
                <div class="form-group checkbox">
                    <input type="checkbox" id="terms" name="terms" required="">
                    <label for="terms">I agree to terms of use and privacy policy</label>
                </div>
                <button type="submit">Sign up</button>
            </form>
        </div>
    </div>





</body>

</html>

