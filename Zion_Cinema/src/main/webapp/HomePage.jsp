<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Zion Cinema</title>
        
        <link rel="stylesheet" href="StyleSheet1.css" />

    </head>
    <body>
        <!-- Header -->
        <div class="header-background">
            <div class="header-container">

                <!--Zion Cinema logo-->
                <img src="images/icons/logo.png">
                <a href="HomePage.html" class="logo-name">Zion Cinema</a>

                <!--Navigation Bar-->
                <div class="nav">
                    <span><a href="HomePage.html">Home</a></span>
                    <a href="Movie.html">Movies</a>
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
        </div>
        
        
        

        <!-- Movie Banner carousel -->
        <div class="carousel">
            <div class="carousel-slides">
                <div class="slide">
                    <img src="images/Carousal/Spider Man No Way Home.jpg" alt="Spider-Man No Way Home">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>Spider-Man No Way Home</h1>
                        <p>Experience the thrill of the big screen with Spider-Man: No Way Home! Witness Peter Parker's epic battle to restore his secret identity, featuring jaw-dropping action, multiverse twists, and your favorite iconic villains.!</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/Carousal/The Wild Robot.jpg" alt="Another Movie">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>The Wild Robot</h1>
                        <p>Embark on an extraordinary journey with The Wild Robot! Follow Roz, a robot stranded on a remote island, as she discovers the beauty of nature, forms unexpected friendships, and learns what it truly means to be alive.</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/Carousal/End Game.png" alt="Another Movie">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>Avengers Endgame</h1>
                        <p>After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/Carousal/The Lion King.jpg" alt="Another Movie">
                    <div class="banner-gradient"></div>
                    <div class="slide-content">
                        <h1>Mufasa: The Lion King</h1>
                        <p>Journey into the majestic pride lands with Mufasa: The Lion King! Uncover the untold story of Simba's father, as young Mufasa rises from humble beginnings to become a legendary king. Experience breathtaking visuals, heartfelt bonds!</p>
                        <button class="book-now">Book Tickets</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!--Movie Listing sections-->
        <div class="movie-categories">
            <button id="now-showing-btn" class="category-button">Now Showing</button>
            <button id="coming-soon-btn" class="category-button">Coming Soon</button>
        </div>

        <div class="movie-cards-container">
            <!-- Now Showing Movies -->
            <div class="movie-card now-showing">
                <img src="images/poster/Venom The Last Dance.png" alt="Venom: The Last Dance">
                <h3>Venom: The Last Dance</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Adventure</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 48m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
            <div class="movie-card now-showing">
                <img src="images/poster/Moana 2.jpeg" alt="Venom: The Last Dance">
                <h3>Venom: The Last Dance</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Adventure</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 48m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
            <div class="movie-card now-showing">
                <img src="images/poster/Sonic 3.png" alt="Venom: The Last Dance">
                <h3>Venom: The Last Dance</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Adventure</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 48m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
            <div class="movie-card now-showing">
                <img src="images/poster/Kraven The Hunter.png" alt="Venom: The Last Dance">
                <h3>Venom: The Last Dance</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Adventure</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 48m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>

            <!-- Coming Soon Movies -->
            <div class="movie-card coming-soon">
                <img src="images/poster/Gladiator 2.jpg" alt="Gladiator II">
                <h3>Gladiator II</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Action</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>PG</span> <span>2h 15m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
            <div class="movie-card coming-soon">
                <img src="images/poster/Gladiator 2.jpg" alt="Gladiator II">
                <h3>Gladiator II</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Action</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>PG</span> <span>2h 15m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
            <div class="movie-card coming-soon">
                <img src="images/poster/Gladiator 2.jpg" alt="Gladiator II">
                <h3>Gladiator II</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Action</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>PG</span> <span>2h 15m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
            <div class="movie-card coming-soon">
                <img src="images/poster/Gladiator 2.jpg" alt="Gladiator II">
                <h3>Gladiator II</h3>
                <div class="movie-genre">
                    <span>Genre : </span><span>Action</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>PG</span> <span>2h 15m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
        </div>
        
        
        <!--Advertisement Section-->
        <div class="movie-munchies-section">
            <div class="content-container">
                <div class="text-content">
                    <h1>
                        Movie <span class="highlight">Munchies</span>: Where 
                        <span class="highlight">Flavor</span> Takes Center Stage!
                    </h1>
                    <p>Experience a flavor explosion with outrageous snacks and gourmet treats that elevate your movie night.</p>
                </div>
                <div class="image-container">
                    <img src="images/Popcornposter.png" alt="Popcorn">
                </div>
            </div>
        </div>
        
        
        
        <!--Testimonials Sections-->
        <div class="testimonials-section">
            <h2 class="section-title">
                <span class="highlight">Testimonials</span>
                <br>Our Client Reviews
            </h2>
            <div class="testimonials-container">
                <div class="testimonial-card">
                    <img src="images/customer1.png" class="client-avatar">
                    <h3 class="client-name">Leo Perera </h3>
                    <div class="rating">
                        ★ ★ ★ ★ ★
                    </div>
                    <span class="quote-mark">“</span>
                    <p class="testimonial-text">
                        Zion Cinema offers comfy seats, amazing sound, and easy online booking. Always a great experience!
                    </p>
                </div>

                <div class="testimonial-card">
                    <img src="images/customer2.png" class="client-avatar">
                    <h3 class="client-name">Randy Orton </h3>
                    <div class="rating">
                        ★ ★ ★ ★ ★
                    </div>
                    <span class="quote-mark">“ </span>
                    <p class="testimonial-text">
                         The ambiance is fantastic, and the website makes booking a breeze. Perfect for movie lovers!
                    </p>
                </div>

                <div class="testimonial-card">
                    <img src="images/customer3.png" class="client-avatar">
                    <h3 class="client-name">Diego Nevile </h3>
                    <div class="rating">
                        ★ ★ ★ ★ ★
                    </div>
                    <span class="quote-mark">“</span>
                    <p class="testimonial-text">
                        My go-to cinema for blockbusters! Great value, easy bookings, and memorable experiences every time.
                    </p>
                </div>
            </div>
        </div>
        
        
        
        
        <!-- Footer  -->
        <footer class="footer-container">
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



        <script src="LandingPageScript.js"></script>

    </body>
</html>
