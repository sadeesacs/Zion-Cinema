<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ADCustomerInquiriesDAO" %>
<%@ page import="model.CustomerInquiries"%>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customers Inquiries</title>

        <link rel="stylesheet" href="StyleSheet10.css" />
    </head>
    <body>
        <!-- Header of the Admin Dashboard -->
        <header>
            <div class="header">
                <div class="Logo"><img src="images/icons/logo.png" /></div>
                <div class="zion-cinema"><a href="HomePage.jsp">Zion Cinema</a></div>

                <div class="search-bar">
                    <span>Search here.....</span>
                        <span style="left: 210px;color:white"><i class="bi bi-search"></i></span>
                </div>
                <%

                    String username = (session != null) ? (String) session.getAttribute("username") : null;
                    if (username != null){
                        System.out.println("Session is null.");
                    %>
                <div class="AD-username"><%=username%></div>
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
                    <li class="nav-item">
                        <img src="images/icons/Billicon.png"></img>
                        <span>Transactions</span>
                    </li>
                </a>
                <a href="AD-CustomerInquiries.jsp">
                    <li class="nav-item active">
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
                <img src="images/icons/Logouticon.png"></img>
                <span>Logout</span>
            </button>
        </div>
        
        
        <!--Customer Inquirires Content Listing-->
        <div class="middle-container">
            <div class="header-container">
                <span class="header-top" style="margin-left:20px">Customer Name</span>
                <span class="header-top" style="margin-left:220px">Customer Email</span>
                <div class="header-top" style="margin-left:510px">Customer Message</div>
            </div>

            <div class="content-container">

                <%
                    // Fetching the list of Customer inquiries
                    List<CustomerInquiries> inquiries = ADCustomerInquiriesDAO.getAllInquiries();
                    //Loop to display data
                    if (!inquiries.isEmpty()) {
                        for (CustomerInquiries inquiry : inquiries) {
                %>
                <div class="customer-inq">
                    <p class="customer-name"><%=inquiry.getName() %></p>
                    <p class="customer-mail"><%=inquiry.getEmail() %></p>
                    <p class="customer-message"><%=inquiry.getMessage() %></p>
                </div>
                <%
                    }
                }
                    else {
                %>
                <p>
                    <span class="header-top" style="margin-left:500px"> No customer inquiries found</span>
                </p>
                <%
                    }
                %>

            </div>
        </div>
        
    </body>
</html>
