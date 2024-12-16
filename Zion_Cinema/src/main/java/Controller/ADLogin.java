package Controller;

import DAO.ADLoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/adlogin")
public class ADLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        ADLoginDAO login = new ADLoginDAO();
        if (login.adlogin(username, password, request)) {

            response.sendRedirect("AD-Dashboard.jsp");

        }
        else
        {
            request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
            request.getRequestDispatcher("AD-Login.jsp").forward(request, response);
        }
    }

}
