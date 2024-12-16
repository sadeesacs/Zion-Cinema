package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Db.dbcon;

/*deleting temp tables and recording in transaction and
food tables when continue btn clicked on BillingConfirmation jsp*/

@WebServlet("/ConfirmPurchaseServlet")
public class ConfirmPurchaseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("UserID") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        int userId = (int) session.getAttribute("UserID");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Get connection
            conn = dbcon.connect();
            conn.setAutoCommit(false);

            // Step 1: Calculate total amount from temporary tables
            double totalAmount = 0.0;
            int showtimeId = 0;
            String getTotalsQuery
                    = "SELECT (SUM(ts.Price) + SUM(tf.Price * tf.Quantity)) * 1.03 AS TotalAmount, ts.Showtime_ID "
                    + "FROM temporaryseats ts "
                    + "LEFT JOIN temporaryfoodorder tf ON ts.UserID = tf.UserID "
                    + "WHERE ts.UserID = ? GROUP BY ts.Showtime_ID";
            pstmt = conn.prepareStatement(getTotalsQuery);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                totalAmount = rs.getDouble("TotalAmount");
                showtimeId = rs.getInt("Showtime_ID");
            }
            rs.close();
            pstmt.close();

            // Step 2: Insert into transaction table
            String insertTransactionQuery
                    = "INSERT INTO transaction (UserID, ShowtimeID, TransactionDate, TotalAmount, PaymentStatus) "
                    + "VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertTransactionQuery);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, showtimeId);
            pstmt.setObject(3, LocalDateTime.now());
            pstmt.setDouble(4, totalAmount);
            pstmt.setString(5, "Completed");
            pstmt.executeUpdate();
            pstmt.close();

            // Step 3: Transfer data from temporaryfoodorder to foodorder
            String transferFoodQuery
                    = "INSERT INTO foodorder (Showtime_ID, FoodID, Quantity, Price, UserID) "
                    + "SELECT Showtime_ID, FoodID, Quantity, Price, UserID FROM temporaryfoodorder WHERE UserID = ?";
            pstmt = conn.prepareStatement(transferFoodQuery);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
            pstmt.close();

            // Step 4: Delete data from temporaryfoodorder
            String deleteFoodQuery = "DELETE FROM temporaryfoodorder WHERE UserID = ?";
            pstmt = conn.prepareStatement(deleteFoodQuery);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
            pstmt.close();

            // Step 6: Delete data from temporaryseats
            String deleteSeatsQuery = "DELETE FROM temporaryseats WHERE UserID = ?";
            pstmt = conn.prepareStatement(deleteSeatsQuery);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
            pstmt.close();

            String deleteMovieQuery = "DELETE FROM temporarymovies WHERE UserID = ?";
            pstmt = conn.prepareStatement(deleteMovieQuery);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
            pstmt.close();

            // Commit transaction
            conn.commit();
            
            response.sendRedirect("UserAccount.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
}
