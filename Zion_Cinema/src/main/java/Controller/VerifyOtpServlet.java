package Controller;

import Db.dbcon;
import model.EmailUtility;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/verifyOtp")
public class VerifyOtpServlet extends HttpServlet {
    private static final String EMAIL_USER = "pererasenuri665@gmail.com"; // Your email
    private static final String EMAIL_PASS = "gfsz rzkn yynn cuas";       // Your app password
    private static final String SMTP_HOST = "smtp.gmail.com";             // SMTP server
    private static final String SMTP_PORT = "587";                       // SMTP port

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userOtp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String generatedOtp = (String) session.getAttribute("generatedOtp");
        String transactionId = (String) session.getAttribute("transactionId"); // Retrieve Transaction_ID from session
        String email = null;

        if (generatedOtp != null && generatedOtp.equals(userOtp)) {
            // OTP is correct
            session.removeAttribute("generatedOtp"); // Destroy the OTP session attribute

            Connection connection = dbcon.connect();
            try {
                // Get the user's email before deleting the record
                String emailQuery = "SELECT u.Email FROM `transaction` t JOIN `user` u ON t.UserID = u.UserID WHERE t.Transaction_ID = ?";
                PreparedStatement emailPs = connection.prepareStatement(emailQuery);
                emailPs.setInt(1, Integer.parseInt(transactionId));
                var rs = emailPs.executeQuery();
                if (rs.next()) {
                    email = rs.getString("Email");
                }

                // Delete the transaction record
                String deleteQuery = "DELETE FROM `transaction` WHERE `Transaction_ID` = ?";
                PreparedStatement ps = connection.prepareStatement(deleteQuery);
                ps.setInt(1, Integer.parseInt(transactionId));
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    session.setAttribute("results", "Transaction successfully cancelled!");

                    // Send confirmation email to the user
                    if (email != null) {
                        EmailUtility.sendCancellationEmail(SMTP_HOST, SMTP_PORT, EMAIL_USER, EMAIL_PASS, email, transactionId);
                    }
                } else {
                    session.setAttribute("results", "No transaction found to cancel.");
                }
            } catch (SQLException e) {
                session.setAttribute("results", "Error occurred while canceling the transaction: " + e.getMessage());
            } catch (Exception ex) {
                Logger.getLogger(VerifyOtpServlet.class.getName()).log(Level.SEVERE, null, ex);
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
