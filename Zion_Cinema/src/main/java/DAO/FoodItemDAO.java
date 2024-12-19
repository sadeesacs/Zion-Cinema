package DAO;

import Db.dbcon;
import model.FoodItem;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class FoodItemDAO {
    public List<FoodItem> getFoodItemsByType(String type) {
        List<FoodItem> foodItems = new ArrayList<>();
        String query = "SELECT * FROM fooditem WHERE Type = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, type);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                FoodItem foodItem = new FoodItem(
                        resultSet.getInt("FoodID"),
                        resultSet.getString("Name"),
                        resultSet.getString("Food_Image"),
                        resultSet.getString("Type"),
                        resultSet.getDouble("Price")
                );
                foodItems.add(foodItem);
            }
        } catch (Exception e) {
        }
        return foodItems;
    }

    public List<String> getAllFoodTypes() {
        List<String> types = new ArrayList<>();
        String query = "SELECT DISTINCT Type FROM fooditem";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                types.add(resultSet.getString("Type"));
            }
        } catch (Exception e) {
        }
        return types;
    }
    
    public List<FoodItem> getAllFoodItems() {
        List<FoodItem> items = new ArrayList<>();
        String sql = "SELECT FoodID, Name, Food_Image, Type, Price FROM fooditem ORDER BY FoodID ASC";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                items.add(new FoodItem(
                    rs.getInt("FoodID"),
                    rs.getString("Name"),
                    rs.getString("Food_Image"),
                    rs.getString("Type"),
                    rs.getDouble("Price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public int insertFoodItem(FoodItem item) {
        String sql = "INSERT INTO fooditem (Name, Food_Image, Type, Price) VALUES (?,?,?,?)";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, item.getName());
            ps.setString(2, item.getFoodImage());
            ps.setString(3, item.getType());
            ps.setDouble(4, item.getPrice());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                return keys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public FoodItem getFoodItemById(int foodId) {
        String sql = "SELECT FoodID, Name, Food_Image, Type, Price FROM fooditem WHERE FoodID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, foodId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new FoodItem(
                    rs.getInt("FoodID"),
                    rs.getString("Name"),
                    rs.getString("Food_Image"),
                    rs.getString("Type"),
                    rs.getDouble("Price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateFoodItem(FoodItem item) {
        String sql = "UPDATE fooditem SET Name=?, Food_Image=?, Type=?, Price=? WHERE FoodID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, item.getName());
            ps.setString(2, item.getFoodImage());
            ps.setString(3, item.getType());
            ps.setDouble(4, item.getPrice());
            ps.setInt(5, item.getFoodId());
            int updated = ps.executeUpdate();
            return updated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteFoodItem(int foodId) {
        String sql = "DELETE FROM fooditem WHERE FoodID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, foodId);
            int deleted = ps.executeUpdate();
            return deleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String getFoodNameById(int foodId) {
        String sql = "SELECT Name FROM fooditem WHERE FoodID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, foodId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("Name");
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return "";
    }
}
