<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel="stylesheet" href="StyleSheet12.css">
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
           <span><a href="ContactUs.jsp">Contact</a></span>
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

    <div class="contact-header">
        <h1>Contact Us</h1><br>
        <pre>
Need help? Just reach out using the contact form below 
and send us your inquiry. We’ll respond to your message
as soon as possible.
        </pre>
    </div>

    <div class="contact-image">
        <img src="images/others/Contactimage.png" alt="contact image">
    </div>

    <div class="contact-info">
        <p><a href="mailto:zioncinema@gmail.com"> zioncinema@gmail.com</a></p>
        <p><a href="tel:(+94) 123 4567 891"> Support: (+94) 123 4567 891</a></p>
    </div>

    <div class="call-image">
        <img src="images/others/callicon.png" alt="call image">
    </div>
    
    <div class="mail-image">
        <img src="images/others/mailicon.png" alt="mail image">
    </div>
    
    <div class="contact-form-container">
        <h1>Let's get in touch</h1>
        <form class="contact-form" action="ContactUsServlet" method="post">
          <label for="full-name">Full Name</label>
          <input type="text" id="full-name" name="fullName" required>
    
          <label for="email">Email</label>
          <input type="email" id="email" name="email" required>
    
          <label for="message">Your Message</label>
          <textarea id="message" name="message" rows="5" required></textarea>
    
          <button type="submit" class="send-btn">Send Message</button>
        </form>
    </div>

    <!--Footer-->
    <footer class="footer-container">
       <div class="footer-column">
           <h2>Zion Cinema</h2>
           <pre>
            Experience premium entertainment with advanced screens,
            immersive sound,and comfortable seating. Enjoy the latest
            blockbusters and timeless classics like never before!
           </pre>
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
                    <li><a href="MovieListing.html">Movies</a></li>
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