<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Db.dbcon" %>
<%@ page import="java.sql.*" %>
<%
    // Retrieve the user ID from the session
    Integer userID = (Integer) session.getAttribute("UserID");

    // Initialize variables
    String latestTransactionId = "No transactions found";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // Check if the user is logged in
    if (userID != null) {
        try {
            // Create a connection
            conn = dbcon.connect();

            // SQL query to get the latest transaction ID for the logged-in user
            String query = "SELECT Transaction_ID FROM transaction WHERE UserID = ? ORDER BY TransactionDate DESC LIMIT 1";

            // Prepare the statement
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userID);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result
            if (rs.next()) {
                latestTransactionId = rs.getString("Transaction_ID");
            }

        } catch (Exception e) {
            e.printStackTrace();
            latestTransactionId = "Error retrieving transaction data";
        } finally {
            // Clean up database resources
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    } else {
        latestTransactionId = "User not logged in.";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Account</title>
        <link rel="stylesheet" href="StyleSheet9.css" />
        <style>
            /* Internal CSS for the Latest Transaction Section */
            .transaction-container {
                text-align: center; /* Center alignment */
                margin: 50px auto; /* Adds spacing above and below */
                padding: 20px; /* Inner padding */
                background-color: #333; /* Dark background */
                border-radius: 15px; /* Rounded corners */
                width: 50%; /* Set width to 50% of the page */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Box shadow for depth */
            }

            .transaction-container h1,
            .transaction-container h2 {
                color: #fff; /* White text */
                font-family: Arial, sans-serif; /* Clean, modern font */
                margin: 10px 0; /* Adds spacing between elements */
            }

            .transaction-container strong {
                color: #ffcc00; /* Highlighted color for the Receipt ID */
                font-size: 1.5em; /* Slightly larger font size */
            }

            /* Styling for section title */
            .transaction-container h1 {
                font-size: 2.5em; /* Larger font size */
                text-transform: uppercase; /* Uppercase styling */
                letter-spacing: 2px; /* Adds spacing between letters */
                margin-bottom: 15px;
            }

            /* Styling for the User ID */
            .transaction-container h2 {
                font-size: 1.8em;
                font-weight: 300;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header-container">
            <!-- Zion Cinema logo -->
            <img src="images/icons/logo.png">
            <a href="HomePage.html" class="logo-name">Zion Cinema</a>

            <!-- Navigation Bar -->
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
            <a href="UserLogin.jsp" class="but-login">
                <img src="images/Accounticon.png">
                <div>Account</div>
            </a>
        </div>
        <div class="header-line"></div>

        <!-- User Details listing Container -->
        <div class="userdetails">
            <img src="images/usericon.png" class="user-icon">
            <div class="label-fname">First Name :</div>
            <div class="user-fname">Leo</div>
            <div class="label-lname">Last Name :</div>
            <div class="user-lname">Perera</div>
            <div class="label-phone">Phone Number :</div>
            <div class="user-phone">0712549783</div>
            <div class="label-email">Email Address :</div>
            <div class="user-email">leoperepa@gmail.com</div>
            <a href="Cancellation.jsp" class="but-cancel">
                <div>Cancel Order</div>
            </a>
            <button class="logout">
                <a href="LogoutServlet">
                    <img src="images/icons/Logouticon.png">
                    <span>Logout</span></a>
            </button>
        </div>

        <!-- Latest Transaction Section -->
        <div class="transaction-container">
            <h1>Enjoy Your Movie!</h1>
            <h2>Show this Receipt Number to the Counter</h2>
            <h1>Your Receipt No: <strong><%= latestTransactionId %></strong></h1>
        </div>
    </body>
</html>

