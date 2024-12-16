/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import model.BillingMovieDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Db.dbcon;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//purchase summary calculation of billing page
public class BillingHelperDAO {
    public static double[] calculateTotals(int userId) throws Exception {
        double totalFoodPrice = 0;
        double totalTicketPrice = 0;
        String movieName = "";

        try (Connection con = dbcon.connect()) {
            // Fetch total food price
            String foodQuery = "SELECT SUM(tfo.Price * tfo.Quantity) AS TotalFoodPrice FROM temporaryfoodorder tfo WHERE tfo.UserID = ? GROUP BY tfo.UserID";
            try (PreparedStatement ps = con.prepareStatement(foodQuery)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        totalFoodPrice = rs.getDouble("TotalFoodPrice");
                    }
                }
            }

            // Fetch total ticket price
            String ticketQuery = "SELECT SUM(ts.Price) AS TotalTicketPrice FROM temporaryseats ts WHERE ts.UserID = ? GROUP BY ts.UserID";
            try (PreparedStatement ps = con.prepareStatement(ticketQuery)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        totalTicketPrice = rs.getDouble("TotalTicketPrice");
                    }
                }
            }
        }

        double tax = (totalFoodPrice + totalTicketPrice) * 0.03;
        double totalAmount = totalFoodPrice + totalTicketPrice + tax;

        return new double[]{totalFoodPrice, totalTicketPrice, tax, totalAmount};
    }
    
    
}
