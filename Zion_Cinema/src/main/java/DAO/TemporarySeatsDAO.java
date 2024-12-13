package DAO;

import Db.dbcon;
import model.TicketSummary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class TemporarySeatsDAO {
    public void insertTemporarySeat(int userId, int seatId, double price, int showtimeId, String ticketType) {
        String query = "INSERT INTO temporaryseats (SeatID, UserID, Showtime_ID, TicketType, Price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = dbcon.connect();
            PreparedStatement statement = connection.prepareStatement(query)) {
            
            System.out.println("Inserting Temporary Seat:");
            System.out.println("Seat ID: " + seatId);
            System.out.println("UserID: " + userId);
            System.out.println("Showtime ID: " + showtimeId);
            System.out.println("Ticket Type: " + ticketType);
            System.out.println("Price: " + price);
            
            statement.setInt(1, seatId);
            statement.setInt(2, userId);
            statement.setInt(3, showtimeId);
            statement.setString(4, ticketType);
            statement.setDouble(5, price);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Integer> getReservedSeatIds(int showtimeId) {
        List<Integer> reservedSeats = new ArrayList<>();
        String query = "SELECT SeatID FROM temporaryseats WHERE Showtime_ID = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, showtimeId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                reservedSeats.add(resultSet.getInt("SeatID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservedSeats;
    }
    
    public boolean isSeatReserved(int seatId, int showtimeId) {
        String query = "SELECT COUNT(*) FROM temporaryseats WHERE SeatID = ? AND Showtime_ID = ?";
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, seatId);
            statement.setInt(2, showtimeId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0; // Return true if seat is reserved
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return false if not reserved
    }
    
    public List<TicketSummary> getTicketSummaryByUserId(int userId) {
        List<TicketSummary> ticketSummaries = new ArrayList<>();
        String query = "SELECT TicketType, COUNT(*) AS Quantity, SUM(Price) AS TotalPrice " +
                       "FROM temporaryseats WHERE UserID = ? GROUP BY TicketType";

        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String ticketType = resultSet.getString("TicketType");
                int quantity = resultSet.getInt("Quantity");
                double totalPrice = resultSet.getDouble("TotalPrice");

                ticketSummaries.add(new TicketSummary(ticketType, quantity, totalPrice));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ticketSummaries;
    }
    
    public double getTotalTicketPriceByUserId(int userId) {
        String query = "SELECT SUM(Price) AS TotalPrice FROM temporaryseats WHERE UserID = ?";
        double totalPrice = 0.0;
        try (Connection connection = dbcon.connect();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalPrice = resultSet.getDouble("TotalPrice");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }
}
