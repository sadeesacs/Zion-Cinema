package DAO;
import Db.dbcon;
import model.Customers;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ADCustomersDAO {

    public static List<Customers> getAllCustomers() {
        List<Customers> Customer = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return Customer; // Return empty list
            }

            // Prepare SQL query
            String query = "SELECT UserID, FirstName,Lastname, Email,PhoneNumber  FROM User";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            // Check if result set is empty
            if (!rs.isBeforeFirst()) {
                System.out.println("No data found in User table");
                return Customer; // Return empty list
            }

            // Iterate through results
            while (rs.next()) {
                Customers user = new Customers();
                user.setUserID(rs.getInt("UserID"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("Lastname"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                Customer.add(user);
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

        return Customer;
    }
}

