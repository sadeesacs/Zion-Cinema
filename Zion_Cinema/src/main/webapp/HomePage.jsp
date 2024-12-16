<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="model.MovieListing"%>
<%@page import="java.util.List"%>

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
                <a href="HomePageServlet" class="logo-name">Zion Cinema</a>

                <!--Navigation Bar-->
                <div class="nav">
                    <span><a href="HomePageServlet">Home</a></span>
                    <a href="MovieListingServlet">Movies</a>
                    <a href="AboutUs.jsp">About us</a>
                    <a href="ContactUs.jsp">Contact</a>
                    <a href="FAQ.jsp">FAQ</a>
                </div>

                <!-- Header Buttons -->
                <a href="MovieListingServlet" class="but-buytickets">
                    <div>Buy Tickets</div>
                </a>

                <%-- Login/Logout Button --%>
                <% 
                    session = request.getSession(false);
                    if (session != null && session.getAttribute("email") != null) {
                %>
                    <a href="Logout.jsp" class="but-login">
                        <div>Logout</div>
                    </a>
                <% } else { %>
                    <a href="UserLogin.jsp" class="but-login">
                        <div>Login</div>
                    </a>
                <% } %>

            </div>
        </div>
        
        
        

        <!-- Movie Banner carousel -->
        <%
            List<MovieListing> carousalMovies = (List<MovieListing>) request.getAttribute("carousalMovies");
        %>
        <div class="carousel">
            <div class="carousel-slides">
                <%
                    if (carousalMovies != null) {
                        DAO.MovieListingDAO cDao = new DAO.MovieListingDAO();
                        for (MovieListing movie : carousalMovies) {
                            String carousalImg = cDao.getCarousalImage(movie.getMovieId());
                            if (carousalImg != null && !carousalImg.trim().isEmpty()) {
                %>
                    <div class="slide">
                        <img src="<%=carousalImg%>" alt="<%=movie.getName()%>">
                        <div class="banner-gradient"></div>
                        <div class="slide-content">
                            <h1><%=movie.getName()%></h1>
                            <%
                                DAO.MovieListingDAO tempDao = new DAO.MovieListingDAO();
                                String desc = tempDao.getMovieDescription(movie.getMovieId());
                            %>
                            <p><%=desc%></p>
                            <button class="book-now"><a href="MovieDetailServlet?movieId=<%=movie.getMovieId()%>">Book Tickets</a></button>
                        </div>
                    </div>
                <%
                            }
                        }
                    }
                %>
            </div>
        </div>
        
        
        <!--Movie Listing sections-->
        <div class="movie-categories">
            <button id="now-showing-btn" class="category-button">Now Showing</button>
            <button id="coming-soon-btn" class="category-button">Coming Soon</button>
        </div>
        
        <%
            List<MovieListing> nowShowingMovies = (List<MovieListing>) request.getAttribute("nowShowingMovies");
            List<MovieListing> comingSoonMovies = (List<MovieListing>) request.getAttribute("comingSoonMovies");
        %>

        <div class="movie-cards-container">
            <!-- Now Showing Movies -->
            <%
                if (nowShowingMovies != null) {
                    for (MovieListing movie : nowShowingMovies) {
            %>
            <div class="movie-card Now Showing">
                <img src="<%=movie.getPoster()%>" alt="<%=movie.getName()%>">
                <h3><%=movie.getName()%></h3>
                <div class="movie-genre">
                    <span>Genre : </span><span><%=movie.getGenre()%></span>
                </div>
                <div class="movie-info">
                    <span><%=movie.getYear()%></span> <span><%=movie.getRating()%></span> <span><%=movie.getDuration()%></span>
                </div>
                <div class="card-buttons">
                    <button class="get-tickets-button"><a href="MovieDetailServlet?movieId=<%= movie.getMovieId() %>">Get Tickets</a></button>
                    <button class="view-details-button"><a href="<%=movie.getTrailer()%>" target="_blank">Watch Trailer</a></button>
                </div>
            </div>
            <%
                    }
                }
            %>

            <!-- Coming Soon Movies -->
            <%
                if (comingSoonMovies != null) {
                    for (MovieListing movie : comingSoonMovies) {
            %>
            <div class="movie-card Coming Soon">
                <img src="<%=movie.getPoster()%>" alt="<%=movie.getName()%>">
                <h3><%=movie.getName()%></h3>
                <div class="movie-genre">
                    <span>Genre : </span><span><%=movie.getGenre()%></span>
                </div>
                <div class="movie-info">
                    <span><%=movie.getYear()%></span> <span><%=movie.getRating()%></span> <span><%=movie.getDuration()%></span>
                </div>
                <div class="card-buttons">
                    <button class="view-details-button"><a href="<%=movie.getTrailer()%>" target="_blank">Watch Trailer</a></button>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        
        
        
        <!--Testimonials Sections-->
        <div class="testimonials-section">
            <h2 class="section-title">
                <span class="highlight">Testimonials</span>
                <br>Our Client Reviews
            </h2>
            <div class="testimonials-container">
                <div class="testimonial-card">
                    <img src="images/others/customer1.png" class="client-avatar">
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
                    <img src="images/others/customer2.png" class="client-avatar">
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
                    <img src="images/others/customer3.png" class="client-avatar">
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



        <script src="LandingPageScript.js"></script>

    </body>
</html>
