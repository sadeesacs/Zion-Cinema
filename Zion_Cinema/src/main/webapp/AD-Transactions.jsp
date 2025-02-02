<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="Controller.UserAccountServlet.TransactionDetail"%>
<%@page import="Controller.UserAccountServlet.FoodDetail"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservations</title>
        
        <link rel="stylesheet" href="StyleSheet10.css" />
    </head>
    <body>
        <%
            // Get dynamic data from request attributes
            User user = (User) request.getAttribute("user");
            boolean noTransactions = request.getAttribute("noTransactions") != null;
            List<TransactionDetail> transactionDetails = (List<TransactionDetail>) request.getAttribute("transactionDetails");
        %>
        
        <!-- Header of the Admin Dashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePageServlet">Zion Cinema</a></div>
                <div class="search-bar">
                    <span>Search here.....</span>
                    <span style="left: 210px;color:white"><i class="bi bi-search"></i></span>
                </div>
                <%
                    // Check if session exists and retrieve the username attribute
                    String username = (session != null) ? (String) session.getAttribute("username") : null;

                    if (username != null) {
                %>
                <div class="AD-username"><%= username %></div>
                <div class="word-admin">Admin</div>
                <%
                } else {
                %>
                <div class="AD-username">Session expired or not logged in.</div>
                <%
                    }
                %>
                <div class="user-icon" ><i class="bi bi-person-fill"></i></div>
                <img src="images/icons/notificationicon.png" class="notification-icon">
                <img src="images/icons/messagesicon.png" class="message-icon">
            </div>
        </header>
        
        
        <!-- Navigational Panel of the Admin Dashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashboard.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="ADMoviesServlet">
                    <li class="nav-item">
                        <img src="images/icons/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="ADFoodMenuServlet">
                    <li class="nav-item">
                        <img src="images/icons/Foodicon.png"></img>
                        <span>Food Menu</span>
                    </li>
                </a>
                <a href="AD-Transactions.jsp">
                    <li class="nav-item active">
                        <img src="images/icons/Billicon.png"></img>
                        <span>Transactions</span>
                    </li>
                </a>
                <a href="AD-CustomerInquiries.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/Inquiryicon.png"></img>
                        <span>Customer Inquiries</span>
                    </li>
                </a>
                <a href="AD-Customers.jsp">
                    <li class="nav-item ">
                        <img src="images/icons/customericon.png"></img>
                        <span>Customers</span>
                    </li>
                </a>
                    <li class="nav-item">
                        <img src="images/icons/Settingicon.png"></img>
                        <span>Settings</span>
                    </li>
            </ul>
            <button class="logout">
                <a href="AD-Login.jsp" style="text-decoration: none;">
                    <li class="nav-item ">
                        <img src="images/icons/Logouticon.png"/>
                        <span>Logout</span>
                    </li>
                </a>
            </button>
        </div>
        
        
        <!--Customer Reservation Details Listing-->
        <div class="middle-container">
            <div class="header-container">
                <span class="header-top" style="margin-left:20px">Receipt No</span>
                <span class="header-top" style="margin-left:140px">Movie Name</span>
                <span class="header-top" style="margin-left:355px">Show Time</span>
                <span class="header-top" style="margin-left:532px">Seats</span>
                <span class="header-top" style="margin-left:656px">Food Order</span>
                <span class="header-top" style="margin-left:900px">Total</span>
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
                    <p class="Trans-movie-name"><%= td.getMovieName() %>e</p>
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
    </body>
</html>