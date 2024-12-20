<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link rel="stylesheet" href="StyleSheet3.css" />
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
               <span><a href="AboutUs.jsp">About us</a></span>
                <a href="ContactUs.jsp">Contact</a>
                <a href="FAQ.jsp">FAQ</a>
            </div>

            <!-- Header Buttons -->
            <a href="MovieListingServlet" class="but-buytickets">
                <div>Buy Tickets</div>
            </a>
             <%  Integer userID = (Integer) session.getAttribute("UserID");
                if (userID != null) {
            %>
            <a href="UserAccountServlet" class="but-login">
                <div>My Account</div>
            </a>
            <%
            } else {
            %>
            <a href="UserLogin.jsp" class="but-login">
                <div>Login</div>
            </a>
            <%
                }
            %>
        </div>
        <div class="header-line"></div>

        <!-- Welcome Section -->
        <div class="welcome-container">
            <img src="images/others/cinemahall.png" alt="Cinema Background" class="welcome-image" />
            <div class="welcome-content">
                <h1>Welcome to Zion Cinema</h1>
                <p>
                    Welcome to Zion Cinema, where storytelling comes alive! 
                    We are dedicated to providing <br> an unparalleled movie experience with 
                    state-of-the-art technology and exceptional customer service.
                </p>
            </div>
        </div>




        <!-- Our Story Section -->
        <section class="our-story-container">
            <div class="our-story-content">
                <h1>Our Story</h1>
                <pre>
Our journey started with a single screen and a passion for bringing communities together through film. Over the years, we’ve embraced innovation to offer unparalleled movie
experiences. From introducing 4K projectors and immersive sound systems to launching online ticket booking and pre-ordering food, every step has been driven by our 
commitment to audience satisfaction.
                </pre>
                <h2>Vision</h2>
                <p>
                    To redefine the movie-going experience by creating a space where storytelling meets technology, offering
                    unmatched entertainment, comfort, and convenience for all cinema enthusiasts.
                </p>
                <h2>Mission</h2>
                <p>
                    Our mission is to provide an immersive cinematic experience by leveraging state-of-the-art technology,
                    exceptional customer service, and personalized engagement. We aim to connect audiences with captivating
                    stories while ensuring ease of access through innovative online features.
                </p>
            </div>
            <div class="our-story-image">
                <img src="images/others/image 67.png" alt="Movie experience image">
            </div>
        </section>


        <!-- Our Team Section -->
        <section class="our-team-container">
            <h1>Our Team</h1>
            <div class="team-members">
                <div class="team-member">
                    <img src="images/others/natasha.jpg">
                    <pre>Ms. Natasha Peiris</pre>
                    <p>CEO</p>
                </div>
                <div class="team-member">
                    <img src="images/others/anthony.jpg">
                    <pre>Mr. Anthony Dawson</pre>
                    <p>CFO</p>
                </div>
                <div class="team-member">
                    <img src="images/others/alyssa.jpg">
                    <pre> Ms. Alyssa Elizabeth </pre>
                    <p>DIRECTOR</p>
                </div>
                <div class="team-member">
                    <img src="images/others/muchen.jpg">
                    <pre>Mr. Mùchén Hàoráng</pre>
                    <p>MANAGER</p>
                </div>
            </div>
        </section>



        <!-- Location Section -->
        <section class="location-container">
            <h1>Our Location</h1>
            <div class="map-wrapper">
                <!-- Replace the src URL with the iframe link from Google Maps -->
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126770.34035931897!2d79.88879400432788!3d6.821656033539971!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae252fe1b1c6c77%3A0x8fb33145b34a17c7!2sZion!5e0!3m2!1sen!2slk!4v1733741784660!5m2!1sen!2slk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" 
                    width="600"
                    height="450"
                    style="border:0;"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </section>





        <!-- Gallery Section -->    
        <div class="gallery-container">
            <h1>Gallery</h1>
            <div class="gallery-grid">
              <div class="gallery-item">
                <img src="images/others/gallery1.png" alt="Gallery 1" class="image-1">
              </div>
              <div class="gallery-item">
                <img src="images/others/gallery2.png" alt="Gallery 2" class="image-2">
              </div>
              <div class="gallery-item">
                <img src="images/others/gallery3.png" alt="Gallery 3" class="image-3">
              </div>
              <div class="gallery-item">
                <img src="images/others/gallery4.png" alt="Gallery 4" class="image-4">
              </div>
              <div class="gallery-item">
                <img src="images/others/gallery5.png" alt="Gallery 5" class="image-5">
              </div>
              <div class="gallery-item">
                <img src="images/others/gallery6.png" alt="Gallery 6" class="image-6">
              </div>
            </div>
          </div>





            <!--Footer-->
            <footer class="footer-container" style="margin-top: 50px">
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
