package Controller;

import Db.dbcon;
import model.EmailUtility;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.sql.*;

@WebServlet("/sendOtp")
public class SendOtpServlet extends HttpServlet {
    private static final String EMAIL_USER = "pererasenuri665@gmail.com"; // Your email
    private static final String EMAIL_PASS = "gfsz rzkn yynn cuas";   // Your app password
    private static final String SMTP_HOST = "smtp.gmail.com";         // SMTP server
    private static final String SMTP_PORT = "587";                   // SMTP port

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String transactionId = request.getParameter("transactionId");
        Connection connection = dbcon.connect();
        String email = null;

        try {
            // Query the database for the email
            String query = "SELECT u.Email FROM `transaction` t JOIN `user` u ON t.UserID = u.UserID WHERE t.Transaction_ID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(transactionId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                email = rs.getString("Email");
            }

            if (email != null) {
                // Generate and send OTP
                String otp = EmailUtility.sendOtp(SMTP_HOST, SMTP_PORT, EMAIL_USER, EMAIL_PASS, email);

                // Store OTP in session for verification
                HttpSession session = request.getSession();
                session.setAttribute("transactionId", transactionId);
                session.setAttribute("generatedOtp", otp);
                session.setAttribute("OTPStatus", "OTP sent to " + email + ". Please verify!");

                response.sendRedirect("Cancellation.jsp");
            } else {
                // Handle case where no email is found for the given Transaction_ID
                HttpSession session = request.getSession();
                session.setAttribute("OTPStatus", "No user found for Receipt Number: " + transactionId);
                response.sendRedirect("Cancellation.jsp");
            }
        } catch (Exception e) {
            HttpSession session = request.getSession();
            session.setAttribute("OTPStatus", "Error: " + e.getMessage());
            response.sendRedirect("Cancellation.jsp");
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
