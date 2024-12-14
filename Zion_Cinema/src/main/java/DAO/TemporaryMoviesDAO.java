package DAO;

import Db.dbcon;
import model.TemporaryMovie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TemporaryMoviesDAO {
    public void insertTemporaryMovie(int movieId, int showtimeId, int userId) {
        String query = "INSERT INTO temporarymovies (Movie_ID, Showtime_ID, UserID) VALUES (?, ?, ?)";
        try (Connection connection = dbcon.connect();
            PreparedStatement statement = connection.prepareStatement(query)) {
            
            System.out.println("Inserting Temporary Movie:");
            System.out.println("Movie ID: " + movieId);
            System.out.println("Showtime ID: " + showtimeId);
            System.out.println("UserID: " + userId);
            
            statement.setInt(1, movieId);
            statement.setInt(2, showtimeId);
            statement.setInt(3, userId);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<TemporaryMovie> getAllTemporaryMovies() {
        List<TemporaryMovie> temporaryMovies = new ArrayList<>();
        String query = "SELECT Movie_ID, Showtime_ID, UserID FROM temporarymovies";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                TemporaryMovie movie = new TemporaryMovie(
                    resultSet.getInt("Movie_ID"),
                    resultSet.getInt("Showtime_ID"),
                    resultSet.getInt("UserID")
                );
                temporaryMovies.add(movie);
            }
        } catch (Exception e) {
        }
        return temporaryMovies;
    }
}