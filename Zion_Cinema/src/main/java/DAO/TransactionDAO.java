package DAO;

import Db.dbcon;
import model.Transaction;
import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    public List<Transaction> getTransactionsByUserId(int userId) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT Transaction_ID, UserID, ShowtimeID, TotalAmount FROM transaction WHERE UserID=? ORDER BY Transaction_ID ASC";
        try (Connection conn = dbcon.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Transaction(
                    rs.getInt("Transaction_ID"),
                    rs.getInt("UserID"),
                    rs.getInt("ShowtimeID"),
                    rs.getDouble("TotalAmount")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}
