<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.MovieDetail" %>
<%@ page import="model.Showtime" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.MovieDetailDAO" %>

<%
    MovieDetail movieDetail = (MovieDetail) request.getAttribute("movieDetail");
    List<String> genres = (List<String>) request.getAttribute("genres");
    List<Showtime> closestDates = (List<Showtime>) request.getAttribute("closestDates");
    List<String> timesForDate = (List<String>) request.getAttribute("timesForDate");
    String selectedDate = (String) request.getAttribute("selectedDate");
    List<MovieDetail> topNowShowing = (List<MovieDetail>) request.getAttribute("topNowShowing");
    
%>

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
            <img src="images/icons/logo.png">
            <a href="HomePageServlet" class="logo-name">Zion Cinema</a>

            <!--Navigation Bar-->
            <div class="nav">
                <a href="HomePageServlet">Home</a>
                <span><a href="MovieListingServlet">Movies</a></span>
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

        
        <!-- Movie Detail Container -->
        <div class="Movie-detail-container">
            <img src="<%= movieDetail.getBanner() %>" alt="Poster">
            <div class="gradient"></div>
            <img src="<%= movieDetail.getPoster() %>" alt="Banner" class="vertical-banner-detail">
            <div class="movie-name"><%= movieDetail.getName() %></div>
            <ul class="movie-detail-genre">
                <% for (String genre : genres) { %>
                    <li><%= genre %></li>
                <% } %>
            </ul>
            <p class="movie-desc"><%= movieDetail.getDescription() %></p>
            <div class="bi-stopwatch">
                <span><%= movieDetail.getDuration() %></span>
            </div>    
            <a href="<%= movieDetail.getTrailer() %>" target="_blank" class="but-trailer">
                <div>Watch Trailer</div>
            </a>
        </div>
                
        <!-- Date and Time Selection Container -->
        <div class="selection-container">
            <div class="date-selection">
                <span>Date</span>
                <ul class="date-ul">
                    <% for (Showtime date : closestDates) { %>
                        <li class="date-li"><%= new java.text.SimpleDateFormat("EEE").format(java.sql.Date.valueOf(date.getDate())) %></li>
                    <% } %>
                </ul>
                <form class="date-buttons-form" method="get" action="MovieDetailServlet">
                    <% for (Showtime date : closestDates) { %>
                        <button type="submit" name="selectedDate" value="<%= date.getDate() %>"
                                class="date-button <%= selectedDate != null && selectedDate.equals(date.getDate()) ? "active" : "" %>">
                            <%= new java.text.SimpleDateFormat("dd").format(java.sql.Date.valueOf(date.getDate())) %>
                        </button>
                    <% } %>
                    <input type="hidden" name="movieId" value="<%= movieDetail.getMovieId() %>" />
                </form>
            </div>

            <div class="time-selection">
                <span>Time</span>
                <div class="span-2">Zion Cinema</div>
                <div class="time-buttons-form">
                    <% if (timesForDate != null) {
                        for (String time : timesForDate) {
                            String formattedTime = new java.text.SimpleDateFormat("hh:mm a").format(java.sql.Time.valueOf(time));
                    %>
                            <button type="button" class="time-button" 
                                    onclick="setTime('<%= time %>', '<%= new MovieDetailDAO().getShowtimeId(movieDetail.getMovieId(), selectedDate, time) %>')">
                                <%= formattedTime %>
                            </button>
                    <%  }
                    } else { %>
                        <p>No times available for the selected date.</p>
                    <% } %>
                </div>
            </div>

            <form id="seatReservationForm" method="post" action="SeatReservationServlet">
                <input type="hidden" name="movieId" value="<%= movieDetail.getMovieId() %>" />
                <input type="hidden" name="selectedDate" id="hiddenSelectedDate" value="<%= selectedDate %>" />
                <input type="hidden" name="showtimeId" id="hiddenShowtimeId" value="" />
                <button type="submit" class="book-now-button">
                    <span>Book Now</span>
                </button>
            </form>
        </div>


        <div class="topic-2">Now Screening</div>
        <!-- Movie Cards -->
        <div class="movie-cards-container">
            <% if (topNowShowing != null && !topNowShowing.isEmpty()) {
                for (MovieDetail movie : topNowShowing) { %>
                    <div class="movie-card">
                        <img src="<%= movie.getPoster() %>" alt="<%= movie.getName() %>">
                        <h3><%= movie.getName() %></h3>
                        <div class="movie-genre">
                            <span>Genre: </span>
                            <span><%= movie.getStatus() %></span>
                        </div>
                        <div class="movie-info">
                            <span><%= movie.getDuration() %></span>
                        </div>
                        <div class="card-buttons">
                            <button class="get-tickets-button"><a href="MovieDetailServlet?movieId=<%= movie.getMovieId() %>">Get Tickets</a></button>
                            <button class="view-details-button"><a href="<%= movie.getTrailer() %>" target="_blank">Watch Trailer</a></button>
                        </div>
                    </div>
            <%  }
            } else { %>
                <p>No other movies currently showing.</p>
            <% } %>
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
        
        <script>
            function setTime(selectedTime, showtimeId) {
                document.getElementById('hiddenShowtimeId').value = showtimeId;
                document.getElementById('hiddenSelectedDate').value = selectedTime;
            }
            
            function setDate(date) {
                document.getElementById('hiddenSelectedDate').value = date;
            }

            function setShowtime(time, showtimeId) {
                document.getElementById('hiddenShowtimeId').value = showtimeId;
            }
            
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