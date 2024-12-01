<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="StyleSheet7.css" />
</head>

<body>
    <!-- Header -->
    <div class="header-container">

        <!--Zion Cinema logo-->
        <img src="images/logo.png">
        <a href="HomePage.html" class="logo-name">Zion Cinema</a>

        <!--Navigation Bar-->
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

    <!-- Login container -->
    <div class="login-container">
        <div class="login-left">
          <div class="movie-art">
            <!-- Add movie-themed image or illustration here -->
            <img src="images/image 50.png" alt="Movie Theme" />
          </div>
        </div>
        <div class="login-right">
            <div class="title">Welcome to <span>Zion Cinema</span></div>
            <div class="tagline">Login to unlock the magic of movies at Zion Cinema!</div>
            <form class="form">
            <div class="form-group">
              <label for="email">Email Address</label>
              <input type="email" id="email"/>
            </div>

            <div class="form-group">
              <label for="password">Password</label>   
              <a href="#" class="forgot-password">Forgot password?</a>                         
              <input type="password" id="password"/>
            </div>

              <div class="checkbox-container">
                  <input type="checkbox" id="keep-logged-in">
                  <span>Keep me logged in</span>
              </div>
            
            <button type="submit" class="login-button">Login</button>
          </form>
          <p class="signup-text">
            Don’t have an account? <a href="#">Sign up</a>
          </p>
          <div class="admin-link">
            <img src="images/AdminIcon.png" alt="Logo" class="admin-logo">
            <a href="#">Admin</a>
        </div>
        </div>
      </div>
    </body>
  </html>