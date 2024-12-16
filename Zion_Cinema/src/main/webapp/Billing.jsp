<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="DAO.BillingHelperDAO " %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.Showtime" %>
<%@ page import="model.MovieDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.FoodItem" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<% 
    session = request.getSession(false);
    Object userIdObj = session.getAttribute("UserID");
    double totalFoodPrice = 0;
    double totalTicketPrice = 0;
    double tax = 0;
    double totalAmount = 0;

    if (userIdObj != null) {
        int userId = Integer.parseInt(userIdObj.toString());
        try {
            double[] totals = BillingHelperDAO.calculateTotals(userId);
            totalFoodPrice = totals[0];
            totalTicketPrice = totals[1];
            tax = totals[2];
            totalAmount = totals[3];
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<%

    String loggedInFirstName = (session != null) ? (String) session.getAttribute("firstName") : null;
    String loggedInLastName = (session != null) ? (String) session.getAttribute("lastName") : null;
    String loggedInPhoneNumber = (session != null) ? (String) session.getAttribute("phoneNumber") : null;
    String loggedInEmail = (session != null) ? (String) session.getAttribute("email") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing</title>

    <link rel="stylesheet" href="StyleSheet3.css" />
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
        <%
            Integer userID = (Integer) session.getAttribute("userID");
            if (userID != null) {
        %>
        <a href="UserAccount.jsp" class="but-login">
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



    <!-- Progress Bar -->
    <div class="progress-bar">

        <div class="step completed">
            <span>Select Seats</span>
            <div class="circle3"></div>            
        </div>      

        <div class="step completed">
            <span>Order Food</span>
            <div class="line" style="background-color: #F5C51B;"></div>
            <div class="circle3"></div>            
        </div>

        <div class="step active">
            <span>Payment</span>
            <div class="line" style="background-color: #F5C51B;"></div>
            <div class="circle3"></div>            
        </div>

        <div class="step">
            <span>Confirm</span>
            <div class="line"></div>
            <div class="circle3"></div>            
        </div>
    </div>


    <%
        MovieDetail movieDetail = (MovieDetail) request.getAttribute("selectedMovie");
        Showtime selectedShowtime = (Showtime) request.getAttribute("selectedShowtime");
        String selectedSeats = (String) request.getAttribute("selectedSeats");


    %>

    <!-- Selected Movie Details -->
    <div class="selected-movie-name">
        <% if (movieDetail != null) { %>
        <%= movieDetail.getName() %>
        <% } else { %>
        Movie Not Selected
        <% } %>
    </div>
    <div class="selected-container" >
        <div class="date-selected" >
            <ul>
                <% if (selectedShowtime != null && selectedShowtime.getDate() != null) { %>
                <li><%= new java.text.SimpleDateFormat("EEE").format(java.sql.Date.valueOf(selectedShowtime.getDate())) %></li>
                <% } else { %>
                <li>Date not available</li>
                <% } %>

            </ul>
            <form class="dateselected-buttons-form">
                <button type="button" class="datesel-button active">
                    <%= new java.text.SimpleDateFormat("dd").format(java.sql.Date.valueOf((String) session.getAttribute("selectedDate"))) %>
                </button>
            </form>
        </div>

        <div class="time-selected">
            <div class="span-2">Zion Cinema</div>
            <div class="timeselected-buttons-form">
                <% if (selectedShowtime != null) { %>
                <button class="timesel-button active">
                    <%= new java.text.SimpleDateFormat("hh:mm a").format(java.sql.Time.valueOf(selectedShowtime.getTime())) %>
                </button>
                <% } %>
            </div>
        </div>

        <div class="seat-selected">
            <div class="span-3">Seat Info</div>
            <div class="seatselected-buttons-form">
                <%
                    if (selectedSeats != null) {
                        org.json.JSONArray seatsArray = new org.json.JSONArray(selectedSeats);
                        for (int i = 0; i < seatsArray.length(); i++) {
                %>
                <button class="seatsel-button"><%= seatsArray.getString(i) %></button>
                <%
                    }
                } else {
                %>
                <p>No Seats Selected</p>
                <% } %>
            </div>
        </div>
    </div>
   <!-- billing Section -->
   <div class="billing-container">
       <h2>Billing Details</h2>
       <form class="billing-form" action="BillingDAO" method="post">
           <!-- First and Last Name -->
           <div class="form-row">
               <div class="form-group">
                   <label for="first-name">First name</label>
                   <input type="text" id="first-name" name="firstName"
                          value="<%= (loggedInFirstName != null) ? loggedInFirstName : ""%>"
                          <%= (loggedInFirstName != null) ? "readonly" : "required"%>>
               </div>
               <div class="form-group">
                   <label for="last-name">Last name</label>
                   <input type="text" id="last-name" name="lastName"
                          value="<%= (loggedInLastName != null) ? loggedInLastName : ""%>"
                          <%= (loggedInLastName != null) ? "readonly" : "required"%>>
               </div>
           </div>

           <!-- Phone Number -->
           <div class="form-group">
               <label for="phone-number">Phone Number</label>
               <input type="text" id="phone-number" name="phoneNumber"
                      value="<%= (loggedInPhoneNumber != null) ? loggedInPhoneNumber : ""%>"
                      <%= (loggedInPhoneNumber != null) ? "readonly" : "required"%>>
           </div>

           <!-- Email Address -->
           <div class="form-group">
               <label for="email-address">Email Address</label>
               <input type="email" id="email-address" name="email"
                      value="<%= (loggedInEmail != null) ? loggedInEmail : "" %>"
                   <%= (loggedInEmail != null) ? "readonly" : "required" %>>
           </div>

           <!-- Terms and Conditions -->
           <div class="checkbox-container">
               <input type="checkbox" id="terms" name="terms" required>
               <span>I agree to terms of use and privacy policy</span>
           </div>

           <!-- Submit Button -->
           <button type="submit" class="pay-button">PAY NOW</button>
       </form>
   </div>
           
             
        <!--summary table-->
        <!-- Purchase Summary Section -->
<div class="purchase-summary-container">
    <div class="purchase-summary">
        <h2>Purchase Summary</h2>
        <h3>Tickets</h3>
        <div class="summary-items">
            <p>Total Ticket Price:<span><%=totalTicketPrice%></span></p>
        </div>
        <h3>Food and Beverages</h3>
        <div class="summary-items1">
            <p>Total Food Price:<span><%=totalFoodPrice%></span></p>
        </div>
        <hr>
        <div class="summary-totals">
            <p>VAT (3%):<span><%=tax%></span></p>
        </div>
        <hr>
        <div class="summary-total-final">
            <strong style="color: white;">Total Amount:</strong>
            <strong><span style="font-size: 1.5rem;"><%=totalAmount%></span></strong>
        </div>
        <hr>
    </div>
</div>

        <!--Footer-->
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
  </body>
</html>
    
        