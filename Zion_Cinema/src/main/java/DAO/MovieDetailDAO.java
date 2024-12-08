package DAO;

import Db.dbcon;
import model.MovieDetail;
import model.Showtime;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDetailDAO {
    public MovieDetail getMovieDetails(int movieId) {
        String query = "SELECT Movie_ID, Poster, Banner, Movie_Name, Description, Duration, Trailer, Status " +
                       "FROM movies WHERE Movie_ID = ?";
        
        try (Connection connection = dbcon.connect();
            PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new MovieDetail(
                    resultSet.getInt("Movie_ID"),
                    resultSet.getString("Poster"),
                    resultSet.getString("Banner"),
                    resultSet.getString("Movie_Name"),
                    resultSet.getString("Description"),
                    resultSet.getString("Duration"),
                    resultSet.getString("Trailer"),
                    resultSet.getString("Status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<String> getGenres(int movieId) {
        List<String> genres = new ArrayList<>();
        String query = "SELECT genre.Name FROM genre " +
                       "JOIN moviegenre ON genre.GenreID = moviegenre.GenreID " +
                       "WHERE moviegenre.Movie_ID = ?";
        
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                genres.add(resultSet.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }

    public List<Showtime> getShowtimes(int movieId) {
        List<Showtime> showtimes = new ArrayList<>();
        String query = "SELECT Date, Show_Time FROM showtime WHERE Movie_ID = ?";
        
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                showtimes.add(new Showtime(resultSet.getString("Date"), resultSet.getString("Show_Time")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return showtimes;
    }

    public List<MovieDetail> getTopNowShowingMovies(int currentMovieId) {
        List<MovieDetail> nowShowing = new ArrayList<>();
        String query = "SELECT Movie_ID, Poster, Banner, Movie_Name, Description, Duration, Trailer, Status " +
                       "FROM movies WHERE Status = 'Now Showing' AND Movie_ID != ? LIMIT 4";
        
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, currentMovieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                nowShowing.add(new MovieDetail(
                    resultSet.getInt("Movie_ID"),
                    resultSet.getString("Poster"),
                    resultSet.getString("Banner"),
                    resultSet.getString("Movie_Name"),
                    resultSet.getString("Description"),
                    resultSet.getString("Duration"),
                    resultSet.getString("Trailer"),
                    resultSet.getString("Status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nowShowing;
    }
    
    public List<Showtime> getClosestDatesForMovie(int movieId) {
        List<Showtime> showtimes = new ArrayList<>();
        String query = "SELECT DISTINCT Date " +
                       "FROM showtime " +
                       "WHERE Movie_ID = ? " +
                       "AND Date >= CURDATE() " +
                       "ORDER BY Date ASC " +
                       "LIMIT 5";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                showtimes.add(new Showtime(resultSet.getString("Date"), null)); // Only add dates for now
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
