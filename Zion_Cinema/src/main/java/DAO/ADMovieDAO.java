package DAO;

import Db.dbcon;
import model.Movie;
import java.sql.*;

public class ADMovieDAO {
    public Movie getMovieById(int id) {
        String sql = "SELECT Movie_ID, Movie_Name FROM movies WHERE Movie_ID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Movie(rs.getInt("Movie_ID"), rs.getString("Movie_Name"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public ResultSet getAllMoviesResultSet() {
        // We'll return a ResultSet directly and iterate in JSP
        String sql = "SELECT Movie_ID, Movie_Name FROM movies WHERE Status = 'Now Showing' ORDER BY Movie_Name ASC";
        try {
            Connection conn = dbcon.connect();
            PreparedStatement ps = conn.prepareStatement(sql);
            return ps.executeQuery();
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}
