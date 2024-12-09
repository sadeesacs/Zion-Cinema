package Controller;
import DAO.FoodMenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FoodMenu;
import java.io.IOException;

@WebServlet("/viewfood")
public class FoodView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Input validation and food retrieval
        String foodIDParam = request.getParameter("foodID");

        // Default error handling
        if (foodIDParam == null || foodIDParam.trim().isEmpty()) {
            handleError(request, response, "Food ID is missing");
            return;
        }

        try {
            // Parse food ID
            int foodID = Integer.parseInt(foodIDParam);

            // Retrieve food item from database
            FoodMenu food = FoodMenuDAO.viewFood(foodID);

            // Check if food item exists
            if (food == null) {
                handleError(request, response, "No food item found with ID: " + foodID);
                return;
            }

            // Set food item as request attribute
            request.setAttribute("food", food);

            // Forward to JSP
            request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid food ID format");
        } catch (Exception e) {
            handleError(request, response, "An unexpected error occurred: " + e.getMessage());
        }
    }

    // Overload doPost to handle potential form submissions
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Centralized error handling method
    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage) throws ServletException, IOException {
        // Log error for server-side tracking
        System.err.println("FoodView Error: " + errorMessage);

        // Set error attribute
        request.setAttribute("error", errorMessage);

        // Forward to error page or original page with error message
        request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
    }
}