package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Db.dbcon;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = dbcon.connect();
            String query = "SELECT UserID, Password, FirstName, LastName, PhoneNumber FROM user WHERE Email = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("Password");

                if (BCrypt.checkpw(password, hashedPassword)) {
                    HttpSession session = request.getSession();
                    session.setMaxInactiveInterval(3600);

                    // Store UserID in session
                    session.setAttribute("UserID", rs.getInt("UserID"));
                    session.setAttribute("firstName", rs.getString("FirstName"));
                    session.setAttribute("lastName", rs.getString("LastName"));
                    session.setAttribute("phoneNumber", rs.getString("PhoneNumber"));

                    response.sendRedirect("HomePageServlet");
                } else {
                    request.setAttribute("error", "Invalid email or password.");
                    request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
            }

            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

