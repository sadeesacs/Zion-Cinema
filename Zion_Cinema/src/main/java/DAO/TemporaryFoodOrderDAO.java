
package DAO;

import Db.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TemporaryFoodOrderDAO {
    public void insertTemporaryFoodOrder(String showtimeID, int foodID, int quantity, double price, int userID) {
        Connection conn = dbcon.connect();
        PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO temporaryfoodorder (Showtime_ID, FoodID, Quantity, Price, UserID) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, showtimeID);
            ps.setInt(2, foodID);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setInt(5, userID);
            ps.executeUpdate();
        } catch (SQLException e) {
        } finally {
            try { if (ps != null) ps.close(); } catch(SQLException ignore) {}
            try { if (conn != null) conn.close(); } catch(SQLException ignore) {}
        }
    }
}
