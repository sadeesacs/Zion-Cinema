package DAO;

import Db.dbcon;
import model.MovieListing;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieListingDAO {
    private Connection connection;

    public MovieListingDAO() {
        this.connection = dbcon.connect();
    }
    public List<MovieListing> getAllMovies() {
        List<MovieListing> movies = new ArrayList<>();
        String query = "SELECT movies.Movie_ID, movies.Poster, movies.Movie_Name, movies.Duration, movies.Year, movies.Rating, movies.Status, movies.Trailer, " +
                       "(SELECT genre.Name " +
                       "FROM genre " +
                       "JOIN moviegenre ON genre.GenreID = moviegenre.GenreID " +
                       "WHERE moviegenre.Movie_ID = movies.Movie_ID LIMIT 1) AS Genre " +
                       "FROM movies";

        try (PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                movies.add(new MovieListing(
                        resultSet.getInt("Movie_ID"),
                        resultSet.getString("Poster"),
                        resultSet.getString("Movie_Name"),
                        resultSet.getString("Duration"),
                        resultSet.getString("Year"),
                        resultSet.getString("Rating"),
                        resultSet.getString("Genre"),
                        resultSet.getString("Status"),
                        resultSet.getString("Trailer")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }
}