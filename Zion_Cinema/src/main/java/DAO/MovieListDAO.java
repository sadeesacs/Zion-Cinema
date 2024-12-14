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

    public boolean addmoviedata(String name, String description, String duration, String year, String rating, String status, String trailer, String imagebanner, String imageposter, String imagecarousal, String genre1, String genre2, String genre3, String genre4) {
        Connection connection = null;
        PreparedStatement stmtMovie = null;
        PreparedStatement stmtGenre = null;
        ResultSet generatedKeys = null;

        try {
            // Establish database connection
            connection = dbcon.connect();

            // Check if connection is successful
            if (connection == null) {
                System.out.println("Database connection failed");
                return false;
            }

            // Disable auto-commit to manage transaction
            connection.setAutoCommit(false);

            // Prepare SQL insert statement for movie
            String movieQuery = "INSERT INTO movies (Movie_Name, Description, Duration, Trailer, Year, Rating, Status, Poster, Banner, Carousal) VALUES (?,?,?,?,?,?,?,?,?,?)";
            stmtMovie = connection.prepareStatement(movieQuery, PreparedStatement.RETURN_GENERATED_KEYS);

            // Set movie parameters
            stmtMovie.setString(1, name);
            stmtMovie.setString(2, description);
            stmtMovie.setString(3, duration);
            stmtMovie.setString(4, trailer);
            stmtMovie.setString(5, year);
            stmtMovie.setString(6, rating);
            stmtMovie.setString(7, status);
            stmtMovie.setString(8, imagebanner);
            stmtMovie.setString(9, imageposter);
            stmtMovie.setString(10, imagecarousal);

            // Execute the movie insert
            int movieRowsAffected = stmtMovie.executeUpdate();

            // Get the generated movie ID
            generatedKeys = stmtMovie.getGeneratedKeys();
            int movieId = -1;
            if (generatedKeys.next()) {
                movieId = generatedKeys.getInt(1);
            }

            // Prepare genre insert statement
            String genreQuery = "INSERT INTO moviegenre (Movie_ID, GenreID) VALUES (?, ?)";
            stmtGenre = connection.prepareStatement(genreQuery);

            // Insert genres if movie was successfully added and genre IDs are provided
            if (movieRowsAffected > 0 && movieId != -1) {
                // Create an array of genres to process
                String[] genres = {genre1, genre2, genre3, genre4};

                for (String genre : genres) {
                    if (genre != null && !genre.trim().isEmpty()) {
                        // Convert genre to integer GenreID
                        int genreId = Integer.parseInt(genre);

                        // Set parameters for genre insert
                        stmtGenre.setInt(1, movieId);
                        stmtGenre.setInt(2, genreId);

                        // Execute genre insert
                        stmtGenre.executeUpdate();
                    }
                }
            }

            // Commit the transaction
            connection.commit();

            return true;

        } catch (SQLException e) {
            // Rollback the transaction in case of error
            try {
                if (connection != null) connection.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println("Error rolling back transaction: " + rollbackEx.getMessage());
            }

            System.out.println("Error adding movie data: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Properly close database resources
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (stmtMovie != null) stmtMovie.close();
                if (stmtGenre != null) stmtGenre.close();
                if (connection != null) {
                    connection.setAutoCommit(true); // Reset to default
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing database resources: " + e.getMessage());
            }
        }
    }
}

