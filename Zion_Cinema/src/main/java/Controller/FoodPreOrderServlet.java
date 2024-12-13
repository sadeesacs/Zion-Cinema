
package Controller;

import DAO.FoodItemDAO;
import DAO.TemporaryFoodOrderDAO;
import model.FoodItem;
import model.Showtime;
import DAO.TemporarySeatsDAO;
import model.TicketSummary;


import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "FoodPreOrderServlet", urlPatterns = {"/FoodPreOrderServlet"})
public class FoodPreOrderServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
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

            // Fetch food items grouped by type
            FoodItemDAO foodItemDAO = new FoodItemDAO();
            List<String> foodTypes = foodItemDAO.getAllFoodTypes();
            Map<String, List<FoodItem>> foodItemsByType = new HashMap<>();
            for (String type : foodTypes) {
                foodItemsByType.put(type, foodItemDAO.getFoodItemsByType(type));
            }

            request.setAttribute("foodTypes", foodTypes);
            request.setAttribute("foodItemsByType", foodItemsByType);
            
            TemporarySeatsDAO temporarySeatsDAO = new TemporarySeatsDAO();
            int userId = (int) session.getAttribute("UserID");
            
            List<TicketSummary> ticketSummaries = temporarySeatsDAO.getTicketSummaryByUserId(userId);
            double ticketTotal = temporarySeatsDAO.getTotalTicketPriceByUserId(userId);
            
            request.setAttribute("ticketSummaries", ticketSummaries);
            request.setAttribute("ticketTotal", ticketTotal);
            
            // Forward to JSP
            request.getRequestDispatcher("FoodPre-order.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle saving the food order if any
        HttpSession session = request.getSession();
        // Assuming UserID is stored in session
        Integer userId = (Integer) session.getAttribute("UserID");  
        // Assuming showtime_id can be retrieved from the selectedShowtime object
        Showtime selectedShowtime = (Showtime) session.getAttribute("selectedShowtime");
        int showtimeID = selectedShowtime.getShowtimeID(); // getShowtimeID now returns int
        String showtimeIDStr = String.valueOf(showtimeID);

        String action = request.getParameter("action");
        if ("saveFoodOrder".equals(action)) {
            String cartData = request.getParameter("cartData");
            
            if (cartData != null && !cartData.trim().isEmpty()) {
                JSONArray cartArray = new JSONArray(cartData);
                if (cartArray.length() > 0) {
                    TemporaryFoodOrderDAO tempOrderDAO = new TemporaryFoodOrderDAO();
                    
                    // Insert each item in temporaryfoodorder
                    for (int i = 0; i < cartArray.length(); i++) {
                        JSONObject item = cartArray.getJSONObject(i);
                        int foodId = item.getInt("foodId");
                        int quantity = item.getInt("quantity");
                        double price = item.getDouble("price") * quantity;

                        tempOrderDAO.insertTemporaryFoodOrder(showtimeIDStr, foodId, quantity, price, userId);
                    }
                }
            }
            
            // After saving, redirect to the next step
            response.sendRedirect("Payment.jsp"); // or wherever the next page is
        } else {
            doGet(request, response);
        }
    }
}
