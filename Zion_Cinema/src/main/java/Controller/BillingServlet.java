package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "BillingServlet", urlPatterns = {"/BillingServlet"})
public class BillingServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

            // Get attributes from the session
            Object movieObj = session.getAttribute("selectedMovie");
            Object showtimeObj = session.getAttribute("selectedShowtime");
            Object seatsObj = session.getAttribute("selectedSeats");

            if (movieObj == null || showtimeObj == null || seatsObj == null) {
                response.sendRedirect("SeatReservation.jsp");
                return;
            }

            // Set attributes for FoodPre-order.jsp
            request.setAttribute("selectedMovie", movieObj);
            request.setAttribute("selectedShowtime", showtimeObj);
            request.setAttribute("selectedSeats", seatsObj);
            
            request.getRequestDispatcher("Billing.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
