package DAO;
import Db.dbcon;
import model.ADFoodMenu;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ADFoodMenuDAO {

    // Method to retrieve all customer inquiries from the database
    public static List<ADFoodMenu> getAllFood() {
        List<ADFoodMenu> Food = new ArrayList<>();
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
                ADFoodMenu food = new ADFoodMenu();
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
    // View Single Food Item
    public ADFoodMenu viewFood(int foodID) {
        ADFoodMenu food = null;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return null;
            }

            String query = "SELECT FoodID, Name, Type, Price, Food_Image FROM fooditem WHERE FoodID = ?";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, foodID);  // Set the foodID parameter in the query

            rs = stmt.executeQuery();

            // Check if food item is found
            if (rs.next()) {
                food = new ADFoodMenu();
                food.setFoodID(rs.getInt("FoodID"));
                food.setName(rs.getString("Name"));
                food.setType(rs.getString("Type"));
                food.setPrice(rs.getDouble("Price"));
                food.setFood_Image(rs.getString("Food_Image"));
            } else {
                System.out.println("No food item found for ID: " + foodID);
            }

        } catch (SQLException e) {
            System.out.println("Error viewing food item: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Properly close database resources
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