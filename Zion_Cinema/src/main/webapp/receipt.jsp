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
            String query = "SELECT id FROM transaction WHERE user_id = ? ORDER BY created_at DESC LIMIT 1";

            // Prepare the statement
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userID);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result
            if (rs.next()) {
                latestTransactionId = rs.getString("id");
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
    <meta charset="UTF-8">
    <title>Latest Transaction</title>
</head>
<body>
    <h1>Latest Transaction</h1>
    <p>User ID: <%= (userID != null) ? userID : "Not Available" %></p>
    <p>Latest Transaction ID: <strong><%= latestTransactionId %></strong></p>
</body>
</html>
