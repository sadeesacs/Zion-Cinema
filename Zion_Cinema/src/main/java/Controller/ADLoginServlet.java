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

@WebServlet("/ADLoginServlet")
public class ADLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = dbcon.connect();
            String query = "SELECT Password, FirstName FROM user WHERE Email = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
            String hashedPassword = rs.getString("Password");
    
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(3600);
    // Verify password
    if (BCrypt.checkpw(password, hashedPassword)) {
        session.setAttribute("email", email);
        response.sendRedirect("HomePage.jsp");
    } else {
        request.setAttribute("error", "Invalid email or password.");
        request.getRequestDispatcher("userlogin.jsp").forward(request, response);
    }
} else {
    request.setAttribute("error", "Invalid email or password.");
    request.getRequestDispatcher("userlogin.jsp").forward(request, response);
}

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
