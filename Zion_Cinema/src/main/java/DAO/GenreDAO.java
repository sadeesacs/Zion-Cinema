
package DAO;

import Db.dbcon;
import model.Genre;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GenreDAO {
    public List<Genre> getAllGenres() {
        List<Genre> genres = new ArrayList<>();
        String sql = "SELECT GenreID, Name FROM genre ORDER BY Name ASC";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                genres.add(new Genre(rs.getInt("GenreID"), rs.getString("Name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }

    public int getGenreIdByName(String name) {
        String sql = "SELECT GenreID FROM genre WHERE Name = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("GenreID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // not found
    }
}
