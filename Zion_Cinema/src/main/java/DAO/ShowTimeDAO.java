package DAO;

import Db.dbcon;
import model.MovieList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShowTimeDAO {
    public boolean addFood(String name,String type, double price, String imageName) {
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
            String query = "INSERT INTO fooditem (Name,Type, Price, Food_Image) VALUES (?,?,?,?)";
            stmt = connection.prepareStatement(query);

            // Set parameters
            stmt.setString(1,name );
            stmt.setString(2, type);
            stmt.setDouble(3, price);
            stmt.setString(4, imageName);

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
            String query = "SELECT Movie_ID,Movie_Name FROM movies";
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
    
    public static List<Map<String, Object>> getScheduleByMovieId(int movieId) {
        List<Map<String, Object>> schedule = new ArrayList<>();
        String query = "SELECT Date, Show_Time FROM showtime WHERE Movie_ID = ?";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, movieId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("date", rs.getDate("Date"));
                row.put("time", rs.getTime("Show_Time"));
                schedule.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return schedule;
    }

    public static void updateShowtimes(int movieId, List<Map<String, String>> showtimes) {
        String deleteQuery = "DELETE FROM showtime WHERE Movie_ID = ?";
        String insertQuery = "INSERT INTO showtime (Movie_ID, Date, Show_Time) VALUES (?, ?, ?)";

        try (Connection connection = dbcon.connect();
             PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery);
             PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {

            deleteStmt.setInt(1, movieId);
            deleteStmt.executeUpdate();

            for (Map<String, String> showtime : showtimes) {
                insertStmt.setInt(1, movieId);
                insertStmt.setString(2, showtime.get("date"));
                insertStmt.setString(3, showtime.get("time"));
                insertStmt.addBatch();
            }

            insertStmt.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
