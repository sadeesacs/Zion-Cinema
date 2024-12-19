
package DAO;

import Db.dbcon;
import model.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
     public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT Movie_ID, Movie_Name, Description, Duration, Year, Rating, Status, Trailer, Banner, Poster, Carousal FROM movies ORDER BY Movie_ID ASC";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Movie m = new Movie(
                    rs.getInt("Movie_ID"),
                    rs.getString("Movie_Name"),
                    rs.getString("Description"),
                    rs.getString("Duration"),
                    rs.getString("Year"),
                    rs.getString("Rating"),
                    rs.getString("Status"),
                    rs.getString("Trailer"),
                    rs.getString("Banner"),
                    rs.getString("Poster"),
                    rs.getString("Carousal")
                );
                movies.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public int insertMovie(Movie movie) {
        String sql = "INSERT INTO movies (Movie_Name, Description, Duration, Year, Rating, Status, Trailer, Banner, Poster, Carousal) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, movie.getName());
            ps.setString(2, movie.getDescription());
            ps.setString(3, movie.getDuration());
            ps.setString(4, movie.getYear());
            ps.setString(5, movie.getRating());
            ps.setString(6, movie.getStatus());
            ps.setString(7, movie.getTrailer());
            ps.setString(8, movie.getBanner());
            ps.setString(9, movie.getPoster());
            ps.setString(10, movie.getCarousal());

            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                return keys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public Movie getMovieById(int movieId) {
        String sql = "SELECT Movie_ID, Movie_Name, Description, Duration, Year, Rating, Status, Trailer, Banner, Poster, Carousal FROM movies WHERE Movie_ID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Movie(
                    rs.getInt("Movie_ID"),
                    rs.getString("Movie_Name"),
                    rs.getString("Description"),
                    rs.getString("Duration"),
                    rs.getString("Year"),
                    rs.getString("Rating"),
                    rs.getString("Status"),
                    rs.getString("Trailer"),
                    rs.getString("Banner"),
                    rs.getString("Poster"),
                    rs.getString("Carousal")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateMovie(Movie movie) {
        String sql = "UPDATE movies SET Movie_Name=?, Description=?, Duration=?, Year=?, Rating=?, Status=?, Trailer=?, Banner=?, Poster=?, Carousal=? WHERE Movie_ID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, movie.getName());
            ps.setString(2, movie.getDescription());
            ps.setString(3, movie.getDuration());
            ps.setString(4, movie.getYear());
            ps.setString(5, movie.getRating());
            ps.setString(6, movie.getStatus());
            ps.setString(7, movie.getTrailer());
            ps.setString(8, movie.getBanner());
            ps.setString(9, movie.getPoster());
            ps.setString(10, movie.getCarousal());
            ps.setInt(11, movie.getMovieId());

            int updated = ps.executeUpdate();
            return updated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteMovie(int movieId) {
        String sql = "DELETE FROM movies WHERE Movie_ID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            int deleted = ps.executeUpdate();
            return deleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String getMovieNameById(int movieId) {
        String sql = "SELECT Movie_Name FROM movies WHERE Movie_ID=?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("Movie_Name");
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return "";
    }
}
