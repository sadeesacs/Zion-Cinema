package DAO;

import Db.dbcon;
import model.TemporarySeat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TemporarySeatsDAO {
    public void insertTemporarySeat(int userId, int seatId, double price, int showtimeId, String ticketType) {
        String query = "INSERT INTO temporaryseats (SeatID, UserID, Showtime_ID, TicketType, Price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, seatId);
            statement.setInt(2, userId);
            statement.setInt(3, showtimeId);
            statement.setString(4, ticketType);
            statement.setDouble(5, price);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<TemporarySeat> getAllTemporarySeats() {
        List<TemporarySeat> temporarySeats = new ArrayList<>();
        String query = "SELECT SeatID, UserID, Showtime_ID, TicketType, Price FROM temporaryseats";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                TemporarySeat seat = new TemporarySeat(
                    resultSet.getInt("SeatID"),
                    resultSet.getInt("UserID"),
                    resultSet.getInt("Showtime_ID"),
                    resultSet.getString("TicketType"),
                    resultSet.getDouble("Price")
                );
                temporarySeats.add(seat);
            }
        } catch (Exception e) {
        }
        return temporarySeats;
    }
}
