package DAO;
import Db.dbcon;
import model.CustomerInquiries;
import model.FoodMenu;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerInquiriesDAO {

    // Method to retrieve all customer inquiries from the database
    public static List<CustomerInquiries> getAllInquiries() {
        List<CustomerInquiries> inquiries = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return inquiries; // Return empty list
            }

            // Prepare SQL query
            String query = "SELECT InquiryID, Name, Email, Message FROM CustomerInquiries";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            // Check if result set is empty
            if (!rs.isBeforeFirst()) {
                System.out.println("No data found in CustomerInquiries table");
                return inquiries; // Return empty list
            }

            // Iterate through results
            while (rs.next()) {
                CustomerInquiries inquiry = new CustomerInquiries();
                inquiry.setInquiryID(rs.getInt("InquiryID"));
                inquiry.setName(rs.getString("Name"));
                inquiry.setEmail(rs.getString("Email"));
                inquiry.setMessage(rs.getString("Message"));

                inquiries.add(inquiry);
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

        return inquiries;
    }




        // View Single Food Item
        public static FoodMenu viewFood(int foodID) {
            FoodMenu food = null;
            String query = "SELECT FoodID, Name, Type, Price, Food_Image FROM fooditem WHERE FoodID = ?";

            try (Connection conn = getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(query)) {

                pstmt.setInt(1, foodID);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        food = new FoodMenu();
                        food.setFoodID(rs.getInt("FoodID"));
                        food.setName(rs.getString("Name"));
                        food.setType(rs.getString("Type"));
                        food.setPrice(rs.getDouble("Price"));
                        food.setFood_Image(rs.getString("Food_Image"));
                    }
                }
            } catch (SQLException e) {
                logError("Error viewing food item", e);
            }

            return food;
        }

}