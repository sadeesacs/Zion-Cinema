package DAO;

import Db.dbcon;
import java.sql.*;

public class ShowTimeDAO {
    public boolean showtimeExists(int movieId, String date, String time) {
        String sql = "SELECT ShowtimeID FROM showtime WHERE Movie_ID = ? AND Date = ? AND Show_Time = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.setDate(2, Date.valueOf(date));
            ps.setTime(3, Time.valueOf(time));
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertShowtime(int movieId, String date, String time) {
        String sql = "INSERT INTO showtime (Movie_ID, Date, Show_Time) VALUES (?,?,?)";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.setDate(2, Date.valueOf(date));
            ps.setTime(3, Time.valueOf(time));
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteShowtime(int movieId, String date, String time) {
        String sql = "DELETE FROM showtime WHERE Movie_ID = ? AND Date = ? AND Show_Time = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.setDate(2, Date.valueOf(date));
            ps.setTime(3, Time.valueOf(time));
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public int getShowtimeId(int movieId, String date, String time) {
        String sql = "SELECT ShowtimeID FROM showtime WHERE Movie_ID = ? AND Date = ? AND Show_Time = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.setDate(2, Date.valueOf(date));
            ps.setTime(3, Time.valueOf(time));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("ShowtimeID");
            }
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }
}
