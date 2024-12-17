package DAO;

import Db.dbcon;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieGenreDAO {
    public void insertMovieGenre(int movieId, int genreId) {
        String sql = "INSERT INTO moviegenre (Movie_ID, GenreID) VALUES (?, ?)";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.setInt(2, genreId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteByMovieId(int movieId) {
        String sql = "DELETE FROM moviegenre WHERE Movie_ID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getFirstGenreForMovie(int movieId) {
        String sql = "SELECT g.Name FROM genre g JOIN moviegenre mg ON g.GenreID = mg.GenreID WHERE mg.Movie_ID = ? ORDER BY mg.MovieGenreID ASC LIMIT 1";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("Name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ""; // no genre
    }

    public List<String> getAllGenresForMovie(int movieId) {
        List<String> genres = new ArrayList<>();
        String sql = "SELECT g.Name FROM genre g JOIN moviegenre mg ON g.GenreID = mg.GenreID WHERE mg.Movie_ID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                genres.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }
}
