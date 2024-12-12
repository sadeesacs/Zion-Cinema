package DAO;

import Db.dbcon;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ADLoginDAO {

    public boolean adlogin(String username, String password, HttpServletRequest request) {
        String query = "SELECT Password FROM admin WHERE Username = ?";
        try (Connection con = dbcon.connect();
             PreparedStatement pst = con.prepareStatement(query)) {

            // Set the query parameter
            pst.setString(1, username);

            // Execute query
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    // Retrieve hashed password
                    String hashedPassword = rs.getString("Password");

                    // Verify the password
                    if (BCrypt.checkpw(password, hashedPassword)) {
                        // Set session if authentication succeeds
                        HttpSession session = request.getSession();
                        session.setMaxInactiveInterval(3600);
                        session.setAttribute("username", username);
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Authentication failed
    }
}
