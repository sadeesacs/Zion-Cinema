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
        Connection connection = dbcon.connect();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String query = "SELECT InquiryID, Name, Email, Message FROM CustomerInquiries";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Create a CustomerInquiries object for each row
                CustomerInquiries inquiry = new CustomerInquiries();
                inquiry.setInquiryID(rs.getInt("InquiryID"));
                inquiry.setName(rs.getString("Name"));
                inquiry.setEmail(rs.getString("Email"));
                inquiry.setMessage(rs.getString("Message"));

                // Add the object to the list
                inquiries.add(inquiry);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching customer inquiries: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return inquiries;
    }
}

