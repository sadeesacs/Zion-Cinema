package Controller;

import model.TransactionDetails;
import model.FoodOrder;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Db.dbcon;
//display data on transaction history in UserAccount page
@WebServlet("/TransactionHistoryServlet")
public class TransactionHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("UserID") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        int userId = (int) session.getAttribute("UserID");
        List<TransactionDetails> transactionHistory = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Get connection
            conn = dbcon.connect();

            // Query to fetch transaction details
            String transactionQuery = 
                "SELECT t.TransactionID, m.MovieName, s.ShowTime, t.TotalAmount " +
                "FROM transaction t " +
                "JOIN showtimes s ON t.ShowtimeID = s.Showtime_ID " +
                "JOIN movie m ON s.Movie_ID = m.MovieID " +
                "WHERE t.UserID = ?";
            pstmt = conn.prepareStatement(transactionQuery);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int receiptNo = rs.getInt("TransactionID");
                String movieName = rs.getString("MovieName");
                String showTime = rs.getString("ShowTime");
                double total = rs.getDouble("TotalAmount");

                // Fetch seats for the transaction
                List<String> seats = new ArrayList<>();
                String seatsQuery = 
                    "SELECT SeatID FROM bookedseats WHERE TransactionID = ?";
                PreparedStatement seatStmt = conn.prepareStatement(seatsQuery);
                seatStmt.setInt(1, receiptNo);
                ResultSet seatRs = seatStmt.executeQuery();
                while (seatRs.next()) {
                    seats.add(seatRs.getString("SeatID"));
                }
                seatRs.close();
                seatStmt.close();

                // Fetch food orders for the transaction
                List<FoodOrder> foodOrders = new ArrayList<>();
                String foodQuery = 
                    "SELECT f.FoodName, fo.Quantity " +
                    "FROM foodorder fo " +
                    "JOIN fooditem f ON fo.FoodID = f.FoodID " +
                    "WHERE fo.Showtime_ID = ?";
                PreparedStatement foodStmt = conn.prepareStatement(foodQuery);
                foodStmt.setInt(1, receiptNo);
                ResultSet foodRs = foodStmt.executeQuery();
                while (foodRs.next()) {
                    String foodName = foodRs.getString("FoodName");
                    int quantity = foodRs.getInt("Quantity");
                    foodOrders.add(new FoodOrder(foodName, quantity));
                }
                foodRs.close();
                foodStmt.close();

                // Add transaction to list
                TransactionDetails transaction = new TransactionDetails(receiptNo, movieName, showTime, seats, foodOrders, total);
                transactionHistory.add(transaction);
            }
            rs.close();
            pstmt.close();

            // Pass data to JSP
            request.setAttribute("transactionHistory", transactionHistory);
            request.getRequestDispatcher("UserAccount.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
}
