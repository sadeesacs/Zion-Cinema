package DAO;

import Db.dbcon;
import model.Transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    public static List<Transaction> getAllTransaction() {
        List<Transaction> Transaction = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return Transaction; // Return empty list
            }

            // Prepare SQL query
            String query = "SELECT "
                    + "t.transaction_ID, "
                    + "t.showtimeID, "
                    + "s.movie_id, "
                    + "m.movie_name, "
                    + "s.Date, "
                    + "s.show_time, "
                    + "sr.seatID, "
                    + "st.SeatNumber, "
                    + "fo.FoodID, "
                    + "fi.Name AS FoodName, "
                    + "fo.Quantity, "
                    + "t.TotalAmount "
                    + "FROM "
                    + "transaction t "
                    + "INNER JOIN showtime s ON t.showtimeID = s.showtimeID "
                    + "INNER JOIN movies m ON s.movie_id = m.movie_id "
                    + "INNER JOIN seatreservation sr ON t.transaction_ID = sr.TransactionID "
                    + "INNER JOIN seat st ON sr.seatID = st.seatID "
                    + "INNER JOIN foodorder fo ON t.transaction_ID = fo.TransactionID "
                    + "INNER JOIN fooditem fi ON fo.FoodID = fi.FoodID;";

            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();


            // Check if result set is empty
            if (!rs.isBeforeFirst()) {
                System.out.println("No data found in Transaction table");
                return Transaction; // Return empty list
            }

            // Iterate through results
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionID(rs.getInt("transaction_ID"));
                transaction.setShowtimeID(rs.getInt("ShowtimeID"));
                transaction.setMovieID(rs.getInt("movie_id"));
                transaction.setMovieName(rs.getString("movie_name"));
                transaction.setDate(rs.getString("Date"));
                transaction.setTime(rs.getString("Show_time"));
                transaction.setSeatID(rs.getInt("seatID"));
                transaction.setSeatNumber(rs.getString("SeatNumber"));
                transaction.setFoodID(rs.getInt("foodID"));
                transaction.setFoodName(rs.getString("FoodName"));
                transaction.setQuantity(rs.getInt("Quantity"));
                transaction.setTotalPrice(rs.getFloat("TotalPrice"));
                Transaction.add(transaction);
            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            // Log the full stack trace for detailed debugging
            e.printStackTrace();
        } finally {
            // Properly close all database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }

        return Transaction;
    }
}