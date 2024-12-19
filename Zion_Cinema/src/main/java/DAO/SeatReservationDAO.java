package DAO;

import Db.dbcon;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import java.util.ArrayList;
import java.util.List;

public class SeatReservationDAO {
    public Set<Integer> getReservedSeatIds(int showtimeId) {
        Set<Integer> reservedSeatIds = new HashSet<>();
        String query = "SELECT SeatID FROM seatreservation WHERE Showtime_ID = ?";
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
    
    public List<Integer> getSeatIdsByUserAndShowtime(int userId, int showtimeId) {
        List<Integer> seatIds = new ArrayList<>();
        String sql = "SELECT SeatID FROM seatreservation WHERE UserID=? AND Showtime_ID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, showtimeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                seatIds.add(rs.getInt("SeatID"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return seatIds;
    }
}
