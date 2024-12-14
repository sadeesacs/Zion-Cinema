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
    
    public List<MovieListing> getCarousalMovies() {
        List<MovieListing> movies = new ArrayList<>();
        String query = "SELECT movies.Movie_ID, movies.Poster, movies.Movie_Name, movies.Duration, movies.Year, movies.Rating, movies.Status, movies.Trailer, " +
                       "(SELECT genre.Name " +
                       " FROM genre " +
                       " JOIN moviegenre ON genre.GenreID = moviegenre.GenreID " +
                       " WHERE moviegenre.Movie_ID = movies.Movie_ID LIMIT 1) AS Genre, " +
                       "movies.Carousal " +
                       "FROM movies " +
                       "WHERE Carousal IS NOT NULL AND Carousal <> ''";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MovieListing m = new MovieListing(
                    rs.getInt("Movie_ID"),
                    rs.getString("Poster"),
                    rs.getString("Movie_Name"),
                    rs.getString("Duration"),
                    rs.getString("Year"),
                    rs.getString("Rating"),
                    rs.getString("Genre"),
                    rs.getString("Status"),
                    rs.getString("Trailer")
                );
                movies.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    // New Method 2: Get top 'limit' movies by status
    public List<MovieListing> getMoviesByStatus(String status, int limit) {
        List<MovieListing> movies = new ArrayList<>();
        String query = "SELECT movies.Movie_ID, movies.Poster, movies.Movie_Name, movies.Duration, movies.Year, movies.Rating, movies.Status, movies.Trailer, " +
                       "(SELECT genre.Name " +
                       " FROM genre " +
                       " JOIN moviegenre ON genre.GenreID = moviegenre.GenreID " +
                       " WHERE moviegenre.Movie_ID = movies.Movie_ID LIMIT 1) AS Genre " +
                       "FROM movies " +
                       "WHERE Status = ? " +
                       "ORDER BY Movie_ID ASC " +
                       "LIMIT ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    movies.add(new MovieListing(
                            rs.getInt("Movie_ID"),
                            rs.getString("Poster"),
                            rs.getString("Movie_Name"),
                            rs.getString("Duration"),
                            rs.getString("Year"),
                            rs.getString("Rating"),
                            rs.getString("Genre"),
                            rs.getString("Status"),
                            rs.getString("Trailer")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    // New Method 3: Get Carousal image path for a movie
    // Actually, we can just reuse getCarousalMovies and each movie still comes from original query.
    // If we need the Carousal path specifically, we can write another method:
    public String getCarousalImage(int movieId) {
        String sql = "SELECT Carousal FROM movies WHERE Movie_ID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("Carousal");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getMovieDescription(int movieId) {
    String sql = "SELECT Description FROM movies WHERE Movie_ID = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, movieId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("Description");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return "";
}
}