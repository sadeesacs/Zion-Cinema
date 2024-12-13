package DAO;
import Db.dbcon;
import model.MovieList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public boolean addmoviedata(String name, String description, String duration, String year,String rating,String status,String trailer,String imagebanner,String imageposter,String imagecarousal) {
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

            // Prepare SQL insert statement
            String query = "INSERT INTO movies (Movie_Name,Description,Duration,Trailer,Year,Rating,Status,Poster,Banner,Carousal) VALUES (?,?,?,?,?,?,?,?,?,?)";
            stmt = connection.prepareStatement(query);

            // Set parameters
            stmt.setString(1,name);
            stmt.setString(2, description);
            stmt.setString(3, duration);
            stmt.setString(4, year);
            stmt.setString(5, trailer);
            stmt.setString(6, rating);
            stmt.setString(7, status);
            stmt.setString(8, imagebanner);
            stmt.setString(9, imageposter);
            stmt.setString(10, imagecarousal);
            int rows = stmt.executeUpdate();

            // Execute the insert
            int rowsAffected = stmt.executeUpdate();

            // Return true if at least one row was inserted
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error adding food item: " + e.getMessage());
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
}

