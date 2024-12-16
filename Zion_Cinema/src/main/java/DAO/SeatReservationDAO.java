package DAO;

import Db.dbcon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

public class SeatReservationDAO {
    public Set<Integer> getReservedSeatIds(int showtimeId) {
        Set<Integer> reservedSeatIds = new HashSet<>();
        String query = "SELECT SeatID FROM seatreservation WHERE ShowtimeID = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, showtimeId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    reservedSeatIds.add(resultSet.getInt("SeatID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservedSeatIds;
    }
}
