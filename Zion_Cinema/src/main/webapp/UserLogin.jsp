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
        <img src="images/icons/logo.png">
        <a href="HomePageServlet" class="logo-name">Zion Cinema</a>

        <!--Navigation Bar-->
        <div class="nav">
            <a href="HomePageServlet">Home</a>
            <span><a href="MovieListingServlet">Movies</a></span>
            <a href="AboutUs.jsp">About us</a>
            <a href="ContactUs.jsp">Contact</a>
            <a href="FAQ.jsp">FAQ</a>
        </div>

        <!-- Header Buttons -->
        <a href="MovieListingServlet" class="but-buytickets">
            <div>Buy Tickets</div>
        </a>
        <a href="UserLogin.jsp" class="but-login">
            <div>Login</div>
        </a>
    </div>
    <div class="header-line"></div>

    <!-- Login container -->
    <div class="login-container">
        <div class="login-left">
          <div class="movie-art">
            <!-- Add movie-themed image or illustration here -->
            <img src="images/others/login.png" alt="Movie Theme" />
          </div>
        </div>
        <div class="login-right">
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>
            <div class="title">Welcome to <span>Zion Cinema</span></div>
            <div class="tagline">Login to unlock the magic of movies at Zion Cinema!</div>
            
            <form action="LoginServlet" method="POST" class="form">
    <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" />
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <a href="#" class="forgot-password">Forgot password?</a>
        <input type="password" id="password" name="password" />
    </div>
    <div class="checkbox-container">
        <input type="checkbox" id="keep-logged-in" />
        <span>Keep me logged in</span>
    </div>
    <button type="submit" class="login-button">Login</button>
</form>

          <p class="signup-text">
            Don’t have an account? <a href="UserRegistration.jsp">Sign up</a>
          </p>
          <div class="admin-link">
            <img src="images/others/adminicon.png" alt="Logo" class="admin-logo">
            <a href="AD-Login.jsp">Admin</a>
        </div>
        </div>
      </div>
    </body>
  </html>