package Controller;

import Db.dbcon;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/verifyOtp")
public class VerifyOtpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userOtp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String generatedOtp = (String) session.getAttribute("generatedOtp");
        String transactionId = (String) session.getAttribute("transactionId"); // Retrieve Transaction_ID from session

        if (generatedOtp != null && generatedOtp.equals(userOtp)) {
            // OTP is correct
            session.removeAttribute("generatedOtp"); // Destroy the OTP session attribute

            // Delete record from the transaction table
            Connection connection = dbcon.connect();
            try {
                String deleteQuery = "DELETE FROM `transaction` WHERE `Transaction_ID` = ?";
                PreparedStatement ps = connection.prepareStatement(deleteQuery);
                ps.setInt(1, Integer.parseInt(transactionId));
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    session.setAttribute("results", "Transaction successfully cancelled!"); // Set success message
                } else {
                    session.setAttribute("results", "No transaction found to cancel."); // Set error message
                }

            } catch (SQLException e) {
                session.setAttribute("results", "Error occurred while canceling the transaction: " + e.getMessage());
            } finally {
                try {
                    if (connection != null) connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }

            response.sendRedirect("Cancellation.jsp"); // Redirect to Cancellation.jsp
        } else {
            // OTP is incorrect
            session.setAttribute("results", "Invalid OTP. Please try again."); // Set error message
            response.sendRedirect("Cancellation.jsp"); // Redirect back to OTP verification page
        }
    }
}
