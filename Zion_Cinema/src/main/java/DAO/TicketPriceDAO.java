package DAO;

import Db.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketPriceDAO {
    public static void saveTicketPrices(int movieId, double adultPrice, double childPrice) {
        String query = "INSERT INTO ticketprice (ShowtimeID, Category, Price) VALUES (?, ?, ?)";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, movieId);
            statement.setString(2, "Adult");
            statement.setDouble(3, adultPrice);
            statement.addBatch();

            statement.setInt(1, movieId);
            statement.setString(2, "Child");
            statement.setDouble(3, childPrice);
            statement.addBatch();

            statement.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
