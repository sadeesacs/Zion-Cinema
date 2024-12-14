package DAO;

import Db.dbcon;
import model.Seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}