package DAO;
import Db.dbcon;
import Modal.CustomerInquiries;
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
}