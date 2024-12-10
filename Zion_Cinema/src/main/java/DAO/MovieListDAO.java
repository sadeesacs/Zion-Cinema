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
            String query = "SELECT Movie_ID, Movie_Name, Description, Duration_Hour, Duration_Minutes, Trailer, Year, Rating, Status, Poster, Banner, Carousal FROM movies";
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
                Movies.setDurationhour(rs.getInt("Duration_Hour"));
                Movies.setDurationminute(rs.getInt("Duration_Minutes"));
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

}
