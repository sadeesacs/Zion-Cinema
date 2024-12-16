package DAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Db.dbcon;

@WebServlet("/BillingDAO")
public class BillingDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if the session exists and the user is logged in
        if (session == null || session.getAttribute("UserID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve the logged-in user's ID from the session
        int userID = (int) session.getAttribute("UserID");

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if the user already exists in the table
            String selectQuery = "SELECT * FROM user WHERE UserID = ?";
            preparedStatement = connection.prepareStatement(selectQuery);
            preparedStatement.setInt(1, userID);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Set session attributes with the existing user details
                session.setAttribute("loggedInFirstName", resultSet.getString("FirstName"));
                session.setAttribute("loggedInLastName", resultSet.getString("LastName"));
                session.setAttribute("loggedInPhoneNumber", resultSet.getString("PhoneNumber"));
                session.setAttribute("loggedInEmail", resultSet.getString("Email"));

                // Update existing user details with the new data (if provided)
                String updateQuery = "UPDATE user SET FirstName = ?, LastName = ?, PhoneNumber = ?, Email = ? WHERE UserID = ?";
                preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setString(1, firstName);
                preparedStatement.setString(2, lastName);
                preparedStatement.setString(3, phoneNumber);
                preparedStatement.setString(4, email);
                preparedStatement.setInt(5, userID);
                preparedStatement.executeUpdate();
            } else {
                // Insert new user details if the user does not exist in the table
                String insertQuery = "INSERT INTO user (UserID, FirstName, LastName, PhoneNumber, Email, IsGuest) VALUES (?, ?, ?, ?, ?, 0)";
                preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setInt(1, userID);
                preparedStatement.setString(2, firstName);
                preparedStatement.setString(3, lastName);
                preparedStatement.setString(4, phoneNumber);
                preparedStatement.setString(5, email);
                preparedStatement.executeUpdate();

                // Set session attributes with the new user details
                session.setAttribute("loggedInFirstName", firstName);
                session.setAttribute("loggedInLastName", lastName);
                session.setAttribute("loggedInPhoneNumber", phoneNumber);
                session.setAttribute("loggedInEmail", email);
            }

            // Redirect to the payment authorization page
            response.sendRedirect("authorize_payment");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Database operation failed.");
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
