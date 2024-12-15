package Controller;
import DAO.ADFoodMenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@MultipartConfig
@WebServlet("/DeleteFood")
    public class ADFoodDelete extends HttpServlet {
        private static final long serialVersionUID = 1L;
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String foodId = request.getParameter("foodID");
            // Debug: print foodId to the console
            System.out.println("Received foodID: " + foodId);
            if (foodId != null) {
                try {

                    int foodIDInt = Integer.parseInt(foodId);

                    //call to DAO layer to delete food
                    ADFoodMenuDAO ADFoodMenuDAO = new ADFoodMenuDAO();
                    Boolean isDeleted = ADFoodMenuDAO.deleteFoodById(foodIDInt);
                    // Redirect based on the result of the deletion
                    if (isDeleted) {
                        response.sendRedirect("AD-ADFoodMenu.jsp");
                    } else {
                        response.sendRedirect("AD-ADFoodMenu.jsp");
                        System.out.println("Deletion failed");
                    }
                } catch (NumberFormatException e) {
                    response.getWriter().write("Invalid food ID");
                }
            } else {
                response.getWriter().write("Food ID is missing");
            }
        }
}





