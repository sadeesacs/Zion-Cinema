package DAO;

import Db.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketPriceDAO {
    public double getTicketPrice(int showtimeId, String category) {
        String query = "SELECT Price FROM ticketprice WHERE ShowtimeID = ? AND Category = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, showtimeId);
            statement.setString(2, category);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getDouble("Price");
            }
        } catch (SQLException e) {
        }
        return 0.0;
    }
}