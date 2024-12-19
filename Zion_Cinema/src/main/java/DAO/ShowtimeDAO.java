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
        }
        return null; 
    }
    
    public List<Showtime> getClosestDatesForMovie(int movieId) {
        List<Showtime> showtimes = new ArrayList<>();
        String query = "SELECT DISTINCT Date FROM showtime WHERE Movie_ID = ? AND Date >= CURDATE() ORDER BY Date ASC LIMIT 5";

        try (Connection connection = dbcon.connect();
            PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                showtimes.add(new Showtime(0, resultSet.getString("Date"), null));
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
    
    public ShowtimeRaw getShowtimeById(int showtimeId) {
        String sql = "SELECT Movie_ID, Date, Show_Time FROM showtime WHERE ShowtimeID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, showtimeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ShowtimeRaw(
                    rs.getInt("Movie_ID"),
                    rs.getDate("Date"),
                    rs.getTime("Show_Time")
                );
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public static class ShowtimeRaw {
        private int movieId;
        private java.sql.Date date;
        private java.sql.Time time;

        public ShowtimeRaw(int movieId, java.sql.Date date, java.sql.Time time) {
            this.movieId = movieId;
            this.date = date;
            this.time = time;
        }

        public int getMovieId() { return movieId; }
        public java.sql.Date getDate() { return date; }
        public java.sql.Time getTime() { return time; }
    }
}