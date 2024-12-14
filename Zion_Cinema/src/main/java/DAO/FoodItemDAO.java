package DAO;

import Db.dbcon;
import model.FoodItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
