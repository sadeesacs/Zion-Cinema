package DAO;
import Db.dbcon;
import model.FoodMenu;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodMenuDAO {

    // Method to retrieve all customer inquiries from the database
    public static List<FoodMenu> getAllFood() {
        List<FoodMenu> Food = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return Food; // Return empty list
            }

            // Prepare SQL query
            String query = "SELECT FoodID, Name, Type, Price FROM fooditem";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            // Check if result set is empty
            if (!rs.isBeforeFirst()) {
                System.out.println("No data found in Fooditem table");
                return Food; // Return empty list
            }

            // Iterate through results
            while (rs.next()) {
                FoodMenu food = new FoodMenu();
                food.setFoodID(rs.getInt("FoodID"));
                food.setName(rs.getString("Name"));
                food.setType(rs.getString("Type"));
                food.setPrice(rs.getDouble("Price"));

               Food.add(food);
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

        return Food;
    }
}