<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/StyleSheet6.css?ts=<%= System.currentTimeMillis() %>" />
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
        
        
        <!-- Heading and Search bar -->
        <div class="heading-1">Now Showing</div>
        <div class="search-bar">
            <span>Search Here</span>
            <i class="bi bi-search"></i>
        </div>
        
        
        <!-- ADMovie Cards -->
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
        
        
        
        <!-- Comming Soon Heading and Buttons -->
        <div class="heading-1" style="margin-top: 90px;">Comming Soon</div>
        <i class="bi bi-arrow-left-square"></i>
        <i class="bi bi-arrow-right-square"></i>

        <div class="movie-cards-scroll-container">
            <div class="movie-cards-row">
                <!-- ADMovie cards -->
                <div class="movie-card-new">
                    <img src="images/venommovie.png" alt="Venom: The Last Dance">
                    <h3>Venom: The Last Dance</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 5th December</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
                </div>
                <div class="movie-card-new">
                    <img src="images/gladiatormovie.png" alt="Gladiator II">
                    <h3>Gladiator II</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 28th November</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
                </div>
                <div class="movie-card-new">
                    <img src="images/sonicmovie.png" alt="Sonic 3">
                    <h3>Sonic 3</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 5th December</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
                </div>
                <div class="movie-card-new">
                    <img src="images/robotmovie.png" alt="The Wild Robot">
                    <h3>The Wild Robot</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 9th December</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
                </div>
                <div class="movie-card-new">
                    <img src="images/robotmovie.png" alt="The Wild Robot">
                    <h3>The Wild Robot</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 9th December</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
                </div>
                <div class="movie-card-new">
                    <img src="images/sonicmovie.png" alt="Sonic 3">
                    <h3>Sonic 3</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 5th December</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
                </div>
                <div class="movie-card-new">
                    <img src="images/gladiatormovie.png" alt="Gladiator II">
                    <h3>Gladiator II</h3>
                    <div class="movie-genre">
                        <span>Genre : </span>
                        <span>Adventure</span>
                    </div>
                    <div class="release-date">From 28th November</div>
                    <button class="watch-trailer-btn">Watch Trailer</button>
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
            
            document.addEventListener('DOMContentLoaded', () => {
    const leftArrow = document.querySelector('.bi-arrow-left-square');
    const rightArrow = document.querySelector('.bi-arrow-right-square');
    const movieCardsRow = document.querySelector('.movie-cards-row');

    if (!movieCardsRow) {
        console.error("ADMovie cards row not found!");
        return;
    }

    const cardWidth = document.querySelector('.movie-card-new').offsetWidth + 45; 
    let currentTranslateX = 0;

    rightArrow.addEventListener('click', () => {
        console.log('Right arrow clicked');
        const maxTranslateX = movieCardsRow.scrollWidth - movieCardsRow.parentElement.offsetWidth;

        if (Math.abs(currentTranslateX) < maxTranslateX) {
            currentTranslateX -= cardWidth;
            if (Math.abs(currentTranslateX) > maxTranslateX) {
                currentTranslateX = -maxTranslateX;
            }
            movieCardsRow.style.transform = `translateX(${currentTranslateX}px)`;
        }
    });

    leftArrow.addEventListener('click', () => {
        console.log('Left arrow clicked');
        if (currentTranslateX < 0) {
            currentTranslateX += cardWidth;
            if (currentTranslateX > 0) {
                currentTranslateX = 0;
            }
            movieCardsRow.style.transform = `translateX(${currentTranslateX}px)`;
        }
    });
});


            


        </script>


        
        
    </body>
</html>
