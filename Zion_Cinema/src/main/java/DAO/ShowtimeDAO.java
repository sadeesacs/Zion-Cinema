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
        String query = "SELECT ShowtimeID, Date, Show_Time FROM showtime WHERE ShowtimeID = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, showtimeId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Showtime(
                    resultSet.getInt("ShowtimeID"),
                    resultSet.getString("Date"),
                    resultSet.getString("Show_Time")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no details found
    }
    
    public List<Showtime> getClosestDatesForMovie(int movieId) {
        List<Showtime> showtimes = new ArrayList<>();
        // This query returns only Date columns. If you need ShowtimeID and Time,
        // you could adjust the query accordingly. For now, we only have Date.
        // If you want to fully utilize ShowtimeID here as well, you can SELECT it.
        // But since you're only retrieving distinct dates, ShowtimeID might not be unique per date.
        // We'll leave this unchanged, but note you only get the date and no ID/time from this method.
        String query = "SELECT DISTINCT Date FROM showtime WHERE Movie_ID = ? AND Date >= CURDATE() ORDER BY Date ASC LIMIT 5";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                // Since we don't have ShowtimeID or Show_Time here,
                // we can either not store them or store a dummy value.
                showtimes.add(new Showtime(0, resultSet.getString("Date"), null));
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
            e.printStackTrace();
        }
        return times;
    }
}
