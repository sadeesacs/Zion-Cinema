package Controller;

import DAO.FoodMenuDAO;
import model.FoodMenu;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@MultipartConfig
@WebServlet("/viewfood")
public class FoodView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the foodID from the request parameter
        String foodIDParam = request.getParameter("foodID");
        System.out.println(foodIDParam);
        int foodID = 0;
        if (foodIDParam != null) {
            try {
                foodID = Integer.parseInt(foodIDParam);

                // Fetch food details using DAO
                FoodMenu food = FoodMenuDAO.viewFood(foodID);

                if (food != null) {
                    // Set the food object as a request attribute
                    request.setAttribute("food", food);
                } else {
                    request.setAttribute("error", "No food item found with ID: " + foodID);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid food ID format.");
            }
        } else {
            request.setAttribute("error", "Food ID is missing.");
        }

        FoodMenu food = FoodMenuDAO.viewFood(foodID);
        request.setAttribute("food", food);
        request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);

    }
}
