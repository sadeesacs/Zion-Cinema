package Controller;
import DAO.FoodMenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FoodMenu;

import java.io.IOException;

public class FoodView extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    int foodID = Integer.parseInt(request.getParameter("foodID"));
    FoodMenu food = FoodMenuDAO.getFoodById(foodID);
    request.setAttribute("food", food);
    request.setAttribute("foodID", foodID);// Set the food object as a request attribute
    request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response); // Forward to the JSP page


    }
}
