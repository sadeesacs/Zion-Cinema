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
        <img src="images/logo.png">
        <a href="HomePage.html" class="logo-name">Zion Cinema</a>

        <!--Navigation Bar-->
        <div class="nav">
            <a href="HomePage.html">Home</a>
           <a href="Movie.html">Movies</a>
           <a href="About.html">About us</a>
           <span><a href="Contact.html">Contact</a></span>
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





    <div class="contact-header">
        <h1>Contact Us</h1><br>
        <pre>
Need help? Just reach out using the contact form below 
and send us your inquiry. We’ll respond to your message
as soon as possible.
        </pre>
    </div>



<div class="contact-image">
    <img src="images/contactImage.png" alt="contact image">
</div>





    <div class="contact-info">
      <p><a href="zioncinema@gmail.com"> zioncinema@gmail.com</a></p>
      <p><a href="Support: (+94) 123 4567 891"> Support: (+94) 123 4567 891</a></p>
    </div>
    

    <div class="call-image">
        <img src="images/call-icon.png" alt="call image">
    </div>
    
    <div class="mail-image">
        <img src="images/mail-icon.png" alt="mail image">
    </div>
    





    <div class="contact-form-container">
        <h1>Let's get in touch</h1>
        <form class="contact-form">
          <label for="full-name">Full Name</label>
          <input type="text" id="full-name" name="full-name" required>
    
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
