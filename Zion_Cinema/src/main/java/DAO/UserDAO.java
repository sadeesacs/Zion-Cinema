package DAO;

import Db.dbcon;
import model.User;
import java.sql.*;

public class UserDAO {
    public void insertGuestUser(int userId) {
        String query = "INSERT INTO user (UserID, IsGuest) VALUES (?, 1)";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
            System.out.println("Guest user added with UserID: " + userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public User getUserById(int userId) {
        String sql = "SELECT UserID, Email, PhoneNumber, FirstName, LastName, IsGuest FROM user WHERE UserID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("UserID"),
                    rs.getString("Email"),
                    rs.getString("PhoneNumber"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getInt("IsGuest") == 1
                );
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
}