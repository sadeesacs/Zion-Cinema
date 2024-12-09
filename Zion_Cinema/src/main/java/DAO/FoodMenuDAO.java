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


    public boolean deleteFoodById(int foodId) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return false;
            }

            // Prepare SQL delete statement
            String query = "DELETE FROM fooditem WHERE FoodID = ?";
            stmt = connection.prepareStatement(query);

            // Set parameter
            stmt.setInt(1, foodId);

            // Execute the delete
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            // Return true if at least one row was deleted
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error deleting food item: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Properly close database resources
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }
    }

    public boolean addFood(String name,String type, double price, String imageName) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return false;
            }

            // Prepare SQL insert statement
            String query = "INSERT INTO fooditem (Name,Type, Price, Food_Image) VALUES (?,?,?,?)";
            stmt = connection.prepareStatement(query);

            // Set parameters
            stmt.setString(1,name );
            stmt.setString(2, type);
            stmt.setDouble(3, price);
            stmt.setString(4, imageName);

            // Execute the insert
            int rowsAffected = stmt.executeUpdate();

            // Return true if at least one row was inserted
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error adding food item: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Properly close database resources
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }
    }


    public boolean editFood(String foodID, String name,String type, double price, String imageName) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return false;
            }

            // Prepare SQL insert statement
            String query = " UPDATE fooditem SET Name = ?, Type = ?, Price = ?, Food_Image = ? WHERE FoodID = ?;";
            stmt = connection.prepareStatement(query);

            // Set parameters
            stmt.setString(1,name );
            stmt.setString(2, type);
            stmt.setDouble(3, price);
            stmt.setString(4, imageName);
            stmt.setString(5, foodID);

            // Execute the insert
            int rowsAffected = stmt.executeUpdate();

            // Return true if at least one row was inserted
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error adding food item: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Properly close database resources
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }
    }
    public static FoodMenu getFoodById(int foodID) {
        FoodMenu food = null;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return null; // Return null if connection failed
            }

            // Prepare SQL query to fetch specific food item by ID
            String query = "SELECT FoodID, Name, Type, Price, Food_Image FROM fooditem WHERE FoodID = ?";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, foodID); // Set the foodID parameter

            rs = stmt.executeQuery();

            // Check if the result set contains data
            if (rs.next()) {
                food = new FoodMenu();
                food.setFoodID(rs.getInt("FoodID"));
                food.setName(rs.getString("Name"));
                food.setType(rs.getString("Type"));
                food.setPrice(rs.getDouble("Price"));
                food.setFood_Image(rs.getString("Food_Image"));
            }

        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close all database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }

        return food;
    }


}