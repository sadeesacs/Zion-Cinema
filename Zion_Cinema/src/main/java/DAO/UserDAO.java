package DAO;

import Db.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
}