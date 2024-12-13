package DAO;
import Db.dbcon;
import model.MovieList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class MovieListDAO {
    // Method to retrieve all customer inquiries from the database
    public static List<MovieList> getAllMovies() {
        List<MovieList> Movie = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            if (connection == null) {
                System.err.println("ERROR: Database connection is null");
                return Movie;
            }

            // Prepare SQL query
            String query = "SELECT Movie_ID, Movie_Name, Description, Duration, Trailer, Year, Rating, Status, Poster, Banner, Carousal FROM movies";
            stmt = connection.prepareStatement(query);

            // Execute query and log the process
            rs = stmt.executeQuery();

            // Check if any rows exist
            if (!rs.isBeforeFirst()) {
                System.err.println("WARNING: No data found in Movies table");
                return Movie;
            }

            // Iterate through results and log number of rows
            int rowCount = 0;
            while (rs.next()) {
                MovieList Movies = new MovieList();
                Movies.setMovieID(rs.getInt("Movie_ID"));
                Movies.setMovieName(rs.getString("Movie_Name"));
                Movies.setDescription(rs.getString("Description"));
                Movies.setDuration(rs.getString("Duration"));
                Movies.setTrailer(rs.getString("Trailer"));
                Movies.setYear(rs.getInt("Year"));
                Movies.setRating(rs.getString("Rating"));
                Movies.setPoster(rs.getString("Poster"));
                Movies.setBanner(rs.getString("Banner"));
                Movies.setCarousal(rs.getString("Carousal"));
                Movie.add(Movies);
                rowCount++;
            }



        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing database resources: " + e.getMessage());
            }
        }

        return Movie;
    }


    public boolean deleteMovieById(int MovieId) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return false;
            }

            // Prepare SQL delete statement
            String query = "DELETE FROM movies WHERE Movie_ID = ?";
            stmt = connection.prepareStatement(query);

            // Set parameter
            stmt.setInt(1, MovieId);

            // Execute the delete
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            // Return true if at least one row was deleted
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error deleting Movie: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Properly close database resources
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }
    }
    
    // Fetch all movies with Status = 'Now Showing'
    public static List<Map<String, Object>> getNowShowingMovies() {
        List<Map<String, Object>> movies = new ArrayList<>();
        String query = "SELECT Movie_ID, Movie_Name FROM movies WHERE Status = 'Now Showing'";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {

            if (connection == null) {
                System.err.println("Database connection is null");
                return movies;
            }

            while (rs.next()) {
                Map<String, Object> movie = new HashMap<>();
                movie.put("Movie_ID", rs.getInt("Movie_ID"));
                movie.put("Movie_Name", rs.getString("Movie_Name"));
                movies.add(movie);
            }

            System.out.println("Movies retrieved: " + movies.size());

        } catch (SQLException e) {
            System.err.println("Error executing query: " + e.getMessage());
            e.printStackTrace();
        }

        return movies;
    }
    
    public static void main(String[] args) {
        List<Map<String, Object>> movies = getNowShowingMovies();
        for (Map<String, Object> movie : movies) {
            System.out.println("Movie ID: " + movie.get("Movie_ID") + ", Name: " + movie.get("Movie_Name"));
        }
    }
}

