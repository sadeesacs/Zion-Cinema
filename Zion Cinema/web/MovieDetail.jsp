
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie Detail</title>

        <link rel="stylesheet" href="StyleSheet2.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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



        <!-- Movie Detail Container -->
        <div class="Movie-detail-container">
            <img src="images/pic1.png">
            <div class="gradient"></div>
            <img src="images/pic2.png" class="vertical-banner-detail">
                <h1>Pirates of the caribbean : Dead Men Tell No Tales</h1>
                <ul>
                    <li>Action</li>
                    <li>Aventure</li>
                    <li>Horror</li>
                    <li>Comedy</li>
                </ul>
                <p>Embark on the final adventure with Captain Jack Sparrow as he faces the vengeful Captain Salazar, who has escaped from the Devil’s Triangle with a deadly ghost crew. With the legendary Trident of Poseidon as the key to survival.</p>
                <div class="bi-stopwatch">
                    <span>2h 30m</span>
                </div>
                <a href="https://www.youtube.com/" class="but-trailer">
                    <div>Watch Trailer</div>
                </a>
        </div>


        <!-- Date and Time Selection Container -->
        <div class="selection-container">
            
            <div class="date-selection">
                <span>Date</span>
                <ul>
                    <li>Mon</li>
                    <li>Tue</li>
                    <li>Wed</li>
                    <li>Thu</li>
                    <li>Fri</li>
                </ul>
                <form class="date-buttons-form">
                    <button type="button" class="date-button">26</button>
                    <button type="button" class="date-button">27</button>
                    <button type="button" class="date-button">28</button>
                    <button type="button" class="date-button">29</button>
                    <button type="button" class="date-button">30</button>
                </form>
            </div>

            <div class="time-selection">
                <span>Time</span>
                <div class="span-2">Zion Cinema</div>
                <div class="time-buttons-form">
                    <button type="button" class="time-button">10.00 AM</button>
                    <button type="button" class="time-button">12.00 AM</button>
                    <button type="button" class="time-button">01.00 PM</button>
                </div>
            </div>

            <button class="book-now-button">
                <span>Book Now</span>
            </button>

        </div>


        <div class="topic-2">Now Screening</div>

        <!-- Movie Cards -->
        <div class="movie-cards-container">
            <!-- Card 1 -->
            <div class="movie-card">
                <img src="images/venommovie.png" alt="Venom: The Last Dance">
                <h3>Venom: The Last Dance</h3>
                <div class="movie-genre">
                    <span>Genre : </span>
                    <span>Adventure</span>
                </div>
                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 48m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button"><i class="bi bi-ticket-star"></i> Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
        
            <!-- Card 2 -->
            <div class="movie-card">
                <img src="images/gladiatormovie.png" alt="Gladiator II">
                <h3>Gladiator II</h3>
                <div class="movie-genre">
                    <span>Genre : </span>
                    <span>Action</span>
                </div>                
                <div class="movie-info">
                    <span>2024</span> 
                    <span>PG</span> 
                    <span>2h 15m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button">Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
        
            <!-- Card 3 -->
            <div class="movie-card">
                <img src="images/sonicmovie.png" alt="Sonic 3">
                <h3>Sonic 3</h3>
                <div class="movie-genre">
                    <span>Genre : </span>
                    <span>Adventure</span>
                </div>                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 30m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button"> Get Tickets</button>
                    <button class="view-details-button">View Details</button>
                </div>
            </div>
        
            <!-- Card 4 -->
            <div class="movie-card">
                <img src="images/robotmovie.png" alt="The Wild Robot">
                <h3>The Wild Robot</h3>
                <div class="movie-genre">
                    <span>Genre : </span>
                    <span>Adventure</span>
                </div>                
                <div class="movie-info">
                    <span>2024</span> <span>NR</span> <span>1h 55m</span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button"> Get Tickets</button>
                    <button class="view-details-button">View Details</button>
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
        
        

        <script>
            // Select all buttons
            const buttons = document.querySelectorAll('.date-button');

            buttons.forEach(button => {
                button.addEventListener('click', () => {
            buttons.forEach(btn => btn.classList.remove('active'));
        
            button.classList.add('active');
                });
            });


            // Select all time buttons
            const timeButtons = document.querySelectorAll('.time-button');

            timeButtons.forEach(button => {
                button.addEventListener('click', () => {
                    timeButtons.forEach(btn => btn.classList.remove('active'));
                    
                    button.classList.add('active');
                });
            });
        </script>

    </body>
</html>
