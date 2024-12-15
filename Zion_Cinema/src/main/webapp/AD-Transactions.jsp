<%@ page import="model.ADTransaction" %>
<%@ page import="DAO.ADTransactionDAO" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservations</title>
        
        <link rel="stylesheet" href="StyleSheet10.css" />

    </head>
    <body>
        
        <!-- Header of the Admin ADDashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.jsp">Zion Cinema</a></div>

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
        
        
        <!-- Navigational Panel of the Admin ADDashboard -->
        <div class="navigation">
            <ul class="nav-menu">
                <a href="AD-Dashboard.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Dashboardicon.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="AD-Movies.jsp">
                    <li class="nav-item">
                        <img src="images/icons/Movieicon.png"></img>
                        <span>Movies</span>
                    </li>
                </a>
                <a href="AD-FoodMenu.jsp">
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
            <a href="AD-Login.jsp">
                <button class="logout">
                    <img src="images/icons/Logouticon.png"></img>
                    <span>Logout</span>
                </button>
            </a>
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
                <div class="Transactions">

                        <%
                            // Fetching the list of Customer inquiries
                            List<ADTransaction> ADTransaction = ADTransactionDAO.getAllTransaction();
                            // Loop to display data
                            if (!ADTransaction.isEmpty()) {
                                for (ADTransaction Transaction : ADTransaction) {
                        %>
                    <div class="Transactions">
                        <p class="Trans-id"><%=Transaction.getTransactionID() %></p>
                        <p class="Trans-movie-name"><%=Transaction.getMovieName() %></p>
                        <p class="Trans-show-time"><%=Transaction.getDate() %>  <%=Transaction.getTime() %>  </p>

                        <%
                            // Handle multiple seats
                            String[] seats = Transaction.getSeatNumber().split(","); // Assuming seats are comma-separated
                        %>
                        <p class="Trans-seats">
                            Seats:
                            <%
                                for (int i = 0; i < seats.length; i++) {
                                    out.print(seats[i].trim());
                                    if (i < seats.length - 1) {
                                        out.print(", ");
                                    }
                                }
                            %>
                        </p>

                        <%
                            // Handle multiple food items
                            String[] foodItems = Transaction.getFoodName().split(","); // Assuming food items are comma-separated
                        %>
                        <div class="Trans-food-order">
                            Food Orders:
                            <ul>
                                <%
                                    for (String foodItem : foodItems) {
                                %>
                                <li><%=foodItem.trim() %></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>

                        <p class="Trans-total"><%=Transaction.getTotalPrice() %></p>
                    </div>
                        <%
                     }
                    }
                else {
                    %>
                    <p>
                        <span class="header-top" style="margin-left:500px"> No Transaction found</span>
                    </p>
                        <%
                    }
                    %>


        
    </body>
</html>
