package DAO;

import Db.dbcon;
import model.ContactInquiry;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactUsDAO {
    private Connection connection;

    public ContactUsDAO() {
        this.connection = dbcon.connect();
    }

    public boolean insertInquiry(ContactInquiry inquiry) {
        String query = "INSERT INTO customerinquiries (Name, Email, Message) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, inquiry.getName());
            statement.setString(2, inquiry.getEmail());
            statement.setString(3, inquiry.getMessage());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
