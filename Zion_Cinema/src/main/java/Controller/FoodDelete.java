package Controller;
import DAO.FoodMenuDAO;
import jakarta.faces.application.ProtectedViewException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@MultipartConfig
@WebServlet("/DeleteFood")

public class FoodDelete extends HttpServlet {
    @Override
    protected  void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        deleteFood(request, response);
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int foodId = Integer.parseInt(request.getParameter("foodId"));
            System.out.println("Deleting food with ID: " + foodId); // Debug log

            FoodMenuDAO foodMenuDAO = new FoodMenuDAO();
            boolean success = foodMenuDAO.deleteFood(foodId);

            if (success) {
                request.setAttribute("message", "Food item deleted successfully");
            } else {
                request.setAttribute("error", "Failed to delete food item");
            }

            request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println("Invalid food ID provided."); // Debug log
            request.setAttribute("error", "Invalid food ID");
            request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while deleting the food item");
            request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
        }
    }
}
