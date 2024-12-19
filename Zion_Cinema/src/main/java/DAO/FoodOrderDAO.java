
package DAO;

import Db.dbcon;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodOrderDAO {
    public List<FoodOrderItem> getFoodOrders(int userId, int showtimeId) {
        List<FoodOrderItem> list = new ArrayList<>();
        String sql = "SELECT FoodID, Quantity FROM foodorder WHERE UserID=? AND Showtime_ID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, showtimeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FoodOrderItem(rs.getInt("FoodID"), rs.getInt("Quantity")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public static class FoodOrderItem {
        int foodId;
        int quantity;
        public FoodOrderItem(int foodId, int quantity) {
            this.foodId = foodId;
            this.quantity = quantity;
        }
        public int getFoodId() { return foodId; }
        public int getQuantity() { return quantity; }
    }
}
