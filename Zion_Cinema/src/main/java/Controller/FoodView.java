package Controller;

import DAO.FoodMenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FoodMenu;

import java.io.IOException;

@MultipartConfig
@WebServlet("/viewfood")
public class FoodView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodId = request.getParameter("foodID");

        // Debug log for received food ID
        System.out.println("Received foodID: " + foodId);

        // Check if the foodID parameter is provided
        if (foodId == null || foodId.trim().isEmpty()) {
            response.getWriter().write("Food ID is missing");
            return;
        }

        try {
            // Parse food ID to integer
            int foodIDInt = Integer.parseInt(foodId);

            // Call to DAO layer to fetch food details
            FoodMenuDAO foodMenuDAO = new FoodMenuDAO();
            FoodMenu food = foodMenuDAO.viewFood(foodIDInt); // Assume viewFood returns a FoodMenu object

            if (food != null) {
                // Attach the food details to the request attributes
                request.setAttribute("food", food);

                // Forward the request to the JSP page for displaying the food details
                request.getRequestDispatcher("/AD-FoodMenu.jsp").forward(request, response);
            } else {
                // Handle the case where no food item is found
                request.setAttribute("errorMessage", "No food item found with ID: " + foodId);
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Handle invalid ID format
            request.setAttribute("errorMessage", "Invalid food ID format");
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        } catch (Exception e) {
            // General error handling
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
