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
            <img src="images/icons/logo.png">
            <a href="HomePageServlet" class="logo-name">Zion Cinema</a>

            <!--Navigation Bar-->
            <div class="nav">
                <a href="HomePageServlet">Home</a>
                <a href="MovieListingServlet">Movies</a>
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
        
        
        
    <div class="heading-1">Reservation Cancellation</div>

    <div class="cancellation-container">
     
<form action="sendOtp" method="post">
    <div class="form-group receipt-grp">
    <label for="receiptNo">Enter Receipt No:</label>
    <input type="text" name="transactionId" required><br>
    
    <p style="color:red;">
    <%
        String OTPStatus = (String) session.getAttribute("OTPStatus");
        if (OTPStatus != null) {
            out.println(OTPStatus);
            session.removeAttribute("OTPStatus"); // Clear the message after displaying
        }
    %>
    </p>

    <button type="submit" class="send-otp-btn" >Send OTP</button>
    </div>
</form>



        <form action="verifyOtp" method="post">
            <div class="form-group otp-grp">
            <label for="otp">Enter OTP:</label>
                <input type="text" id="otp" name="otp" >
            <p style="color:red;">
    <%
        String results = (String) session.getAttribute("results");
        if (results != null) {
            out.println(results);
            session.removeAttribute("results"); // Clear the message after displaying
        }
    %>
            </p>
            </div>

            <div class="form-group confrim-grp">
                <input type="checkbox" id="confirm" name="confirm">
                <label for="confirm">Confirm Cancellation</label>
            </div>

           <button type="submit" class="cancel-order-btn">Cancel Order</button>
        </form>

        
    </div>

    <img src="images/others/cancel.png" class="cancelimg">

    
    
    <!-- Footer  -->
    <footer class="footer-container" style="margin-top: 580px;">
        <div class="footer-column">
            <h2>Zion Cinema</h2>
            <p>
                Experience premium entertainment with advanced screens, immersive sound, 
                and comfortable seating. Enjoy the latest blockbusters and timeless classics like never before!
            </p>
            <div class="social-icons">
                <a href="https://web.facebook.com"><img src="images/icons/fbicon.png"></a>
                <a href="https://www.instagram.com/"><img src="images/icons/instaicon.png"></a>
                <a href="https://x.com"><img src="images/icons/xicon.png"></a>
                <a href="https://www.tiktok.com"><img src="images/icons/tiktokicon.png"></a>
            </div>
        </div>
    
        <div class="footer-column">
            <h3>Quick Links</h3>
            <div class="quick-links-container">
                <ul class="quick-links">
                    <li><a href="HomePageServlet">Home</a></li>
                    <li><a href="MovieListingServlet">Buy Tickets</a></li>
                    <li><a href="MovieListingServlet">Movies</a></li>
                    <li><a href="AboutUs.jsp">About us</a></li>
                    <li><a href="ContactUs.jsp">Contact</a></li>
                </ul>
                <ul class="quick-links">
                    <li><a href="Cancellation.jsp">Cancellations</a></li>
                    <li><a href="UserAccount.jsp">My Account</a></li>
                    <li><a href="UserLogin.jsp">Login</a></li>
                    <li><a href="UserRegistration.jsp">Signup</a></li>
                    <li><a href="FAQ.jsp">FAQ</a></li>
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
