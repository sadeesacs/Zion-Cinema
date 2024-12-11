package DAO;

import Db.dbcon;
import model.Showtime;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ShowtimeDAO {
    public Showtime getShowtimeDetails(int showtimeId) {
        String query = "SELECT Date, Show_Time FROM showtime WHERE ShowtimeID = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, showtimeId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Showtime(resultSet.getString("Date"), resultSet.getString("Show_Time"));
            }
        } catch (SQLException e) {
        }
        return null; // Return null if no details found
    }
    
    public List<Showtime> getClosestDatesForMovie(int movieId) {
        List<Showtime> showtimes = new ArrayList<>();
        String query = "SELECT DISTINCT Date FROM showtime WHERE Movie_ID = ? AND Date >= CURDATE() ORDER BY Date ASC LIMIT 5";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                showtimes.add(new Showtime(resultSet.getString("Date"), null)); // Only dates for now
            }
        } catch (SQLException e) {
        }
        return showtimes;
    }
    
    public List<String> getTimesForDate(int movieId, String date) {
        List<String> times = new ArrayList<>();
        String query = "SELECT Show_Time FROM showtime WHERE Movie_ID = ? AND Date = ?";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            statement.setString(2, date);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                times.add(resultSet.getString("Show_Time"));
            }
        } catch (SQLException e) {
        }
        return times;
    }
}
