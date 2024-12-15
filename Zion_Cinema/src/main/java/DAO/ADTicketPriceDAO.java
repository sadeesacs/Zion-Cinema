package DAO;

import Db.dbcon;
import java.sql.*;

public class ADTicketPriceDAO {
    public void upsertTicketPrice(int showtimeId, String category, double price) {
        String checkSql = "SELECT TicketPriceID FROM ticketprice WHERE ShowtimeID = ? AND Category = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement checkPs = conn.prepareStatement(checkSql)) {
            checkPs.setInt(1, showtimeId);
            checkPs.setString(2, category);
            ResultSet rs = checkPs.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("TicketPriceID");
                String updateSql = "UPDATE ticketprice SET Price = ? WHERE TicketPriceID = ?";
                try (PreparedStatement upPs = conn.prepareStatement(updateSql)) {
                    upPs.setDouble(1, price);
                    upPs.setInt(2, id);
                    upPs.executeUpdate();
                }
            } else {
                String insertSql = "INSERT INTO ticketprice (ShowtimeID, Category, Price) VALUES (?,?,?)";
                try (PreparedStatement inPs = conn.prepareStatement(insertSql)) {
                    inPs.setInt(1, showtimeId);
                    inPs.setString(2, category);
                    inPs.setDouble(3, price);
                    inPs.executeUpdate();
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteByShowtimeId(int showtimeId) {
        String sql = "DELETE FROM ticketprice WHERE ShowtimeID = ?";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, showtimeId);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
