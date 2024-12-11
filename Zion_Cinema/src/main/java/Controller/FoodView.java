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
import java.util.Arrays;
import java.util.Map;

@MultipartConfig
@WebServlet("/viewfood")
public class FoodView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Debug: Print all parameters
        Map<String, String[]> paramMap = request.getParameterMap();
        System.out.println("Received Parameters:");
        for (String key : paramMap.keySet()) {
            System.out.println(key + ": " + Arrays.toString(paramMap.get(key)));
        }

        String foodId = request.getParameter("foodID");

        // Debug log for received food ID
        System.out.println("Received foodID: " + foodId);

        if (foodId == null || foodId.trim().isEmpty()) {
            System.err.println("WARNING: No foodID parameter received");
            response.getWriter().write("Food ID is missing");
            return;
        }

        if (foodId == null || foodId.trim().isEmpty()) {
            response.getWriter().write("Food ID is missing");
            return;
        }

        try {
            int foodIDInt = Integer.parseInt(foodId);
            FoodMenuDAO foodMenuDAO = new FoodMenuDAO();
            FoodMenu food = foodMenuDAO.viewFood(foodIDInt);

            if (food != null) {
                // Log the food data for debugging
                System.out.println("Food found: " + food.getName() + " | " + food.getType() + " | " + food.getPrice() + " | " + food.getFood_Image() );

                request.setAttribute("food", food);

                request.getRequestDispatcher("/AD-FoodMenu.jsp").forward(request, response);
            } else {
                System.out.println("No food item found for ID: " + foodId);
                request.setAttribute("errorMessage", "No food item found with ID: " + foodId);
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            System.out.println("Invalid food ID format");
            request.setAttribute("errorMessage", "Invalid food ID format");
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
