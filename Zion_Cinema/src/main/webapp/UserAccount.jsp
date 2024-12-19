<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="Controller.UserAccountServlet.TransactionDetail"%>
<%@page import="Controller.UserAccountServlet.FoodDetail"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="StyleSheet9.css" />
    </head>
    <body>
        <%
            // Get dynamic data from request attributes
            User user = (User) request.getAttribute("user");
            boolean noTransactions = request.getAttribute("noTransactions") != null;
            List<TransactionDetail> transactionDetails = (List<TransactionDetail>) request.getAttribute("transactionDetails");
        %>

        <!-- Header -->
        <div class="header-container">
            <!--Zion Cinema logo-->
            <img src="images/logo.png">
            <a href="HomePage.html" class="logo-name">Zion Cinema</a>

            <!--Navigation Bar-->
            <div class="nav">
                <a href="HomePageServlet">Home</a>
                <a href="MovieListingServlet">Movies</a>
                <a href="AboutUs.jsp">About us</a>
                <a href="ContactUs.jsp">Contact</a>
                <a href="FAQ.jsp">FAQ</a>
            </div>

            <!-- Header Buttons -->
            <a href="MovieListingServlet" class="but-buytickets">
                <div>Buy Tickets</div>
            </a>
            <% if (user != null) { %>
                <a href="UserAccount.jsp" class="but-login">
                    <img src="images/Accounticon.png">
                    <div>Account</div>
                </a>
            <% } else { %>
                <a href="UserLogin.jsp" class="but-login">
                    <img src="images/Accounticon.png">
                    <div>Account</div>
                </a>
            <% } %>
        </div>
        <div class="header-line"></div>
        
        
        <!-- User Details Section -->
        <div class="userdetails">
            <img src="images/usericon.png" class="user-icon">
            
            <div class="label-fname">First Name :</div>
            <div class="user-fname"><%= user!=null ? user.getFirstName() : "" %></div>
            
            <div class="label-lname">Last Name :</div>
            <div class="user-lname"><%= user!=null ? user.getLastName() : "" %></div>
            
            <div class="label-phone">Phone Number :</div>
            <div class="user-phone"><%= user!=null ? user.getPhoneNumber() : "" %></div>
            
            <div class="label-email">Email Address :</div>
            <div class="user-email"><%= user!=null ? user.getEmail() : "" %></div>
            
            <a href="Cancellation.jsp" class="but-cancel">
                <div>Cancel Order</div>
            </a>
            
            <button class="logout">
                <a href="LogoutServlet">
                <img src="images/icons/Logouticon.png"></img>
                <span>Logout</span></a>
            </button>
        </div>
        
        
        <!-- Transaction History Section -->
        <div class="Trans-history">
            <h1>Transaction History</h1>
            <div class="middle-container">
                <div class="middle-header-container">
                    <span class="header-top" style="margin-left:20px">Receipt No</span>
                    <span class="header-top" style="margin-left:140px">Movie Name</span>
                    <span class="header-top" style="margin-left:34%">Show Time</span>
                    <span class="header-top" style="margin-left:53%">Seats</span>
                    <span class="header-top" style="margin-left:65%">Food Order</span>
                    <span class="header-top" style="margin-left:87%">Total</span>
                </div>
                <div class="content-container">
                    <%
                        if (noTransactions) {
                    %>
                    <div class="no-transactions">No transactions found</div>
                    <%
                        } else if (transactionDetails != null && !transactionDetails.isEmpty()) {
                            for (TransactionDetail td : transactionDetails) {
                    %>
                    <div class="Transactions">
                        <p class="Trans-id"><%= td.getTransactionId() %></p>
                        <p class="Trans-movie-name"><%= td.getMovieName() %></p>
                        <p class="Trans-show-time"><%= td.getDate() %> <%= td.getTime() %></p>
                        <p class="Trans-seats">
                            <%
                                for (String seatNum : td.getSeatNumbers()) {
                            %>
                            <span><%=seatNum%></span>
                            <%
                                }
                            %>
                        </p>
                        <div class="Trans-food-order">
                            <%
                                List<FoodDetail> foods = td.getFoods();
                                if (foods != null && !foods.isEmpty()) {
                                    for (FoodDetail fd : foods) {
                            %>
                            <div class="food-Trow">
                                <span class="food-Tname"><%=fd.getName()%></span>
                                <span class="food-Tquantity"><%=fd.getQuantity()%></span>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                        <p class="Trans-total">LKR <%= td.getTotalAmount() %></p>
                    </div>
                    <%
                            }
                        } else {
                    %>
                    <div class="no-transactions">No transactions found</div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
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

    </body>
</html>
