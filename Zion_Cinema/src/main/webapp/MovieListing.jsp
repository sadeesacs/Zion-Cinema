<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.MovieListing" %>

<%
    List<MovieListing> nowShowing = (List<MovieListing>) request.getAttribute("nowShowing");
    List<MovieListing> comingSoon = (List<MovieListing>) request.getAttribute("comingSoon");
%>

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
            <img src="images/icons/logo.png">
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
            <a href="login.html" class="but-login">
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
        
        <!-- Movie Cards -->
        <div class="movie-cards-container">
            <% if (nowShowing != null && !nowShowing.isEmpty()) {
                for (MovieListing movie : nowShowing) { %>
                <div class="movie-card">
                    <img src="<%= movie.getPoster() %>" alt="<%= movie.getName() %>">
                    <h3><%= movie.getName() %></h3>
                    <div class="movie-genre">
                        <span>Genre: </span><span><%= movie.getGenre() %></span>
                    </div>
                    <div class="movie-info">
                        <span><%= movie.getYear() %></span> 
                        <span><%= movie.getRating() %></span> 
                        <span><%= movie.getDuration() %></span>
                    </div>
                    <div class="card-buttons">
                        <button class="get-tickets-button"><a href="MovieDetailServlet?movieId=<%= movie.getMovieId() %>">Get Tickets</a></button>
                        <button class="view-details-button"><a href="<%= movie.getTrailer() %>" target="_blank">Watch Trailer</a></button>
                    </div>
                </div>
            <% }
            } else { %>
                <p>No movies currently showing.</p>
            <% } %>
        </div>
        
        <!-- Coming Soon Heading and Buttons -->
        <div class="heading-1" style="margin-top: 90px;">Coming Soon</div>
        <i class="bi bi-arrow-left-square"></i>
        <i class="bi bi-arrow-right-square"></i>

        <div class="movie-cards-scroll-container">
            <div class="movie-cards-row">
                <% if (comingSoon != null && !comingSoon.isEmpty()) {
                    for (MovieListing movie : comingSoon) { %>
                    <div class="movie-card-new">
                        <img src="<%= movie.getPoster() %>" alt="<%= movie.getName() %>">
                        <h3><%= movie.getName() %></h3>
                        <div class="movie-genre">
                            <span>Genre: </span>
                            <span><%= movie.getGenre() %></span>
                        </div>
                        <div class="movie-info">
                            <span><%= movie.getYear() %></span> 
                            <span><%= movie.getRating() %></span> 
                            <span><%= movie.getDuration() %></span>
                        </div>
                        <button class="watch-trailer-btn"><a href="<%= movie.getTrailer() %>" target="_blank">Watch Trailer</a></button>
                    </div>
                <% }
                } else { %>
                    <p>No upcoming movies.</p>
                <% } %>
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
                    console.error("Movie cards row not found!");
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