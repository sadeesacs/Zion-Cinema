package DAO;

import Db.dbcon;
import model.Seat;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class SeatDAO {
    public List<Seat> getAllSeats() {
        List<Seat> seats = new ArrayList<>();
        String query = "SELECT SeatID, SeatNumber FROM seat ORDER BY SeatID";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                seats.add(new Seat(
                    resultSet.getInt("SeatID"),
                    resultSet.getString("SeatNumber")
                ));
            }

        } catch (Exception e) {
        }
        return seats;
    }
    
    public String getSeatNumberById(int seatId) {
        String sql = "SELECT SeatNumber FROM seat WHERE SeatID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, seatId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("SeatNumber");
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return "";
    }
}