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
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("SeatReservation.jsp");
                return;
            }

            Integer userId = (Integer) session.getAttribute("UserID");
            if (userId == null) {
                // If userId is null here, that means they tried accessing this page without going through SeatReservation
                response.sendRedirect("SeatReservation.jsp");
                return;
            }

            Object movieObj = session.getAttribute("selectedMovie");
            Object showtimeObj = session.getAttribute("selectedShowtime");
            Object seatsObj = session.getAttribute("selectedSeats");
            

            if (movieObj == null || showtimeObj == null || seatsObj == null) {
                response.sendRedirect("SeatReservation.jsp");
                return;
            }

            request.setAttribute("selectedMovie", movieObj);
            request.setAttribute("selectedShowtime", showtimeObj);
            request.setAttribute("selectedSeats", seatsObj);
            

            FoodItemDAO foodItemDAO = new FoodItemDAO();
            List<String> foodTypes = foodItemDAO.getAllFoodTypes();
            Map<String, List<FoodItem>> foodItemsByType = new HashMap<>();
            for (String type : foodTypes) {
                foodItemsByType.put(type, foodItemDAO.getFoodItemsByType(type));
            }

            request.setAttribute("foodTypes", foodTypes);
            request.setAttribute("foodItemsByType", foodItemsByType);
            
            TemporarySeatsDAO temporarySeatsDAO = new TemporarySeatsDAO();
            List<TicketSummary> ticketSummaries = temporarySeatsDAO.getTicketSummaryByUserId(userId);
            double ticketTotal = temporarySeatsDAO.getTotalTicketPriceByUserId(userId);
            
            request.setAttribute("ticketSummaries", ticketSummaries);
            request.setAttribute("ticketTotal", ticketTotal);
            
          
            request.getRequestDispatcher("FoodPre-order.jsp").forward(request, response);

        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("SeatReservation.jsp");
            return;
        }

        Integer userId = (Integer) session.getAttribute("UserID");
        if (userId == null) {
            response.sendRedirect("SeatReservation.jsp");
            return;
        }

        Showtime selectedShowtime = (Showtime) session.getAttribute("selectedShowtime");
        if (selectedShowtime == null) {
            response.sendRedirect("SeatReservation.jsp");
            return;
        }

        int showtimeID = selectedShowtime.getShowtimeID();
        String showtimeIDStr = String.valueOf(showtimeID);

        String action = request.getParameter("action");
        if ("saveFoodOrder".equals(action)) {
            String cartData = request.getParameter("cartData");
            
            if (cartData != null && !cartData.trim().isEmpty()) {
                JSONArray cartArray = new JSONArray(cartData);
                if (cartArray.length() > 0) {
                    TemporaryFoodOrderDAO tempOrderDAO = new TemporaryFoodOrderDAO();
                    
                    for (int i = 0; i < cartArray.length(); i++) {
                        JSONObject item = cartArray.getJSONObject(i);
                        int foodId = item.getInt("foodId");
                        int quantity = item.getInt("quantity");
                        double price = item.getDouble("price") * quantity;

                        tempOrderDAO.insertTemporaryFoodOrder(showtimeIDStr, foodId, quantity, price, userId);
                    }
                }
            }
            
            response.sendRedirect("BillingServlet");
        } else {
            doGet(request, response);
        }
    }
}
