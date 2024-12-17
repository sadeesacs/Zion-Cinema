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
import jakarta.servlet.http.HttpSession;

import com.paypal.base.rest.PayPalRESTException;

import Db.dbcon;
import model.OrderDetail;
import model.PaymentServices;

@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AuthorizePaymentServlet() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object userIdObj = session.getAttribute("UserID");

        if (userIdObj == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        int userId = Integer.parseInt(userIdObj.toString());
        double totalFoodPrice = 0;
        double totalTicketPrice = 0;
        String movieName = "";

        // Fetch totals from the database
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
            
            // Fetch movie name
           
        String movieQuery = "SELECT m.Movie_Name FROM movies m " +
                            "JOIN temporarymovies tm ON m.Movie_ID = tm.Movie_ID " +
                            "WHERE tm.UserID = ?";
        try (PreparedStatement ps = con.prepareStatement(movieQuery)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    movieName = rs.getString("Movie_Name");
                }
            }
        }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Calculate tax and total amount
        double tax = (totalFoodPrice + totalTicketPrice) * 0.03;
        double totalAmount = totalFoodPrice + totalTicketPrice + tax;

        // Log the calculated values
        System.out.println("Total Food Price: " + totalFoodPrice);
        System.out.println("Total Ticket Price: " + totalTicketPrice);
        System.out.println("Tax: " + tax);
        System.out.println("Total Amount: " + totalAmount);
        System.out.println("Movie Name: " + movieName);
        session.setAttribute("movieName", movieName);

        // Store totals in session
        session.setAttribute("totalFoodPrice", totalFoodPrice);
        session.setAttribute("totalTicketPrice", totalTicketPrice);
        session.setAttribute("tax", tax);
        session.setAttribute("totalAmount", totalAmount);
        request.setAttribute("movieName", movieName);

        // Prepare the order details
        OrderDetail orderDetail = new OrderDetail(totalFoodPrice, totalTicketPrice, tax, totalAmount,movieName);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);

            // Redirect to PayPal approval link
            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object userIdObj = session.getAttribute("UserID");

        if (userIdObj == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }

        int userId = Integer.parseInt(userIdObj.toString());
        double totalFoodPrice = 0;
        double totalTicketPrice = 0;
        String movieName = "";

        // Fetch totals from the database
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
            
            // Fetch the movie name
    String movieQuery = "SELECT m.Movie_Name FROM movies m " +
                        "JOIN temporarymovies tm ON m.Movie_ID = tm.Movie_ID " +
                        "WHERE tm.UserID = ? LIMIT 1";
    try (PreparedStatement ps = con.prepareStatement(movieQuery)) {
        ps.setInt(1, userId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                movieName = rs.getString("Movie_Name");
            }
        }
    }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        double tax = (totalFoodPrice + totalTicketPrice) * 0.03;
        double totalAmount = totalFoodPrice + totalTicketPrice + tax;

        // Store totals in session and forward to checkout
        session.setAttribute("totalFoodPrice", totalFoodPrice);
        session.setAttribute("totalTicketPrice", totalTicketPrice);
        session.setAttribute("tax", tax);
        session.setAttribute("totalAmount", totalAmount);
        session.setAttribute("movieName", movieName);

        request.setAttribute("totalFoodPrice", totalFoodPrice);
        request.setAttribute("totalTicketPrice", totalTicketPrice);
        request.setAttribute("tax", tax);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("movieName", movieName);

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
}
