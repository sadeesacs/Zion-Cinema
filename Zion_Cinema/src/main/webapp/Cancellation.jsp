<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Reservation Cancellation</title>
        <link rel="stylesheet" href="StyleSheet6.css" />
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
        
        
        
    <div class="heading-1">Reservation Cancellation</div>

    <div class="cancellation-container">
        <form>
            <div class="form-group receipt-grp">
                <label for="receipt-no">Enter Receipt No:</label>
                <input type="text" id="receipt-no" name="receipt-no">
                <button type="button" class="send-otp-btn">Send OTP</button>
            </div>

            <div class="form-group otp-grp">
                <label for="otp">Enter OTP:</label>
                <input type="text" id="otp" name="otp" >
            </div>

            <div class="form-group confrim-grp">
                <input type="checkbox" id="confirm" name="confirm">
                <label for="confirm">Confirm Cancellation</label>
            </div>

            <button type="submit" class="cancel-order-btn">Cancel Order</button>
        </form>
    </div>

    <img src="images/cancel.png" class="cancelimg">

    
    
    <!-- Footer  -->
    <footer class="footer-container" style="margin-top: 580px;">
        <div class="footer-column">
            <h2>Zion Cinema</h2>
            <p>
                Experience premium entertainment with advanced screens, immersive sound, 
                and comfortable seating. Enjoy the latest blockbusters and timeless classics like never before!
            </p>
            <div class="social-icons">
                <a href="https://web.facebook.com"><img src="images/fbicon.png"></a>
                <a href="https://www.instagram.com/"><img src="images/instaicon.png"></a>
                <a href="https://x.com"><img src="images/xicon.png"></a>
                <a href="https://www.tiktok.com"><img src="images/tiktokicon.png"></a>
            </div>
        </div>
    
        <div class="footer-column">
            <h3>Quick Links</h3>
            <div class="quick-links-container">
                <ul class="quick-links">
                    <li><a href="HomePage.html">Home</a></li>
                    <li><a href="Movies.html">Buy Tickets</a></li>
                    <li><a href="Movie.html">Movies</a></li>
                    <li><a href="AboutUs.html">About us</a></li>
                    <li><a href="Contact.html">Contact</a></li>
                </ul>
                <ul class="quick-links">
                    <li><a href="Cancellation.html">Cancellations</a></li>
                    <li><a href="UserAccount.html">My Account</a></li>
                    <li><a href="Login.html">Login</a></li>
                    <li><a href="Signup.html">Signup</a></li>
                    <li><a href="FAQ.html">FAQ</a></li>
                </ul>
            </div>
        </div>
    
        <div class="footer-column">
            <h3 style="margin-left: 3px;">Newsletter Subscription</h3>
            <form class="newsletter-form">
                <input type="email" placeholder="Enter Your Email">
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </footer>
       
        
    </body>
</html>
