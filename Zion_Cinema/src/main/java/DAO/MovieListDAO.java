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

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return Movie; // Return empty list
            }

            // Prepare SQL query
            String query = "SELECT Movie_ID, Movie_Name,Description,Duration_Hour,Duration_Minutes,Trailer,Year,Rating,Status,Poster,Banner,Carousal FROM movies";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            // Check if result set is empty
            if (!rs.isBeforeFirst()) {
                System.out.println("No data found in Movies table");
                return Movie; // Return empty list
            }

            // Iterate through results
            while (rs.next()) {
                MovieList Movies = new MovieList();
              Movies.setMovieID(rs.getInt("Movie_ID"));
              Movies.setMovieName(rs.getString("Movie_Name"));
              Movies.setDescription(rs.getString("Description"));
              Movies.setDurationhour(rs.getInt("Duration_Hour"));
              Movies.setDurationminute(rs.getInt("Duration_Minutes"));
              Movies.setTrailer(rs.getString("Trailer"));
              Movies.setYear(rs.getInt("Year"));
              Movies.setRating(rs.getInt("Rating"));
              Movies.setPoster(rs.getString("Poster"));
              Movies.setBanner(rs.getString("Banner"));
              Movies.setCarousal(rs.getString("Carousal"));
              Movie.add(Movies);

            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            // Log the full stack trace for detailed debugging
            e.printStackTrace();
        } finally {
            // Properly close all database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }

        return Movie;
    }
}
