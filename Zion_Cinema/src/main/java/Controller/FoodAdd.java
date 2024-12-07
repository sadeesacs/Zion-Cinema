package Controller;
import DAO.FoodMenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet("/AddFood")
public class FoodAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Input validation
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String priceInput = request.getParameter("price");

        if (name == null || name.isEmpty() || type == null || type.isEmpty()) {
            response.getWriter().println("Error: Name and Type cannot be empty.");
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceInput);
            if (price <= 0) {
                response.getWriter().println("Error: Price must be a positive number.");
                return;
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Error: Price must be a valid number.");
            return;
        }

        // Handle file upload
        Part filePart = request.getPart("image");
        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().println("Error: Please upload a valid image.");
            return;
        }

        String imageName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("/images/Food/") + imageName;

        try (FileOutputStream fos = new FileOutputStream(uploadPath);
             InputStream is = filePart.getInputStream()) {
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Failed to upload the image.");
            return;
        }

        // Save to database
        try {
            FoodMenuDAO foodMenuDAO = new FoodMenuDAO();
            boolean success = foodMenuDAO.addFood(name, type, price, imageName);

            if (success) {
                response.sendRedirect("AD-FoodMenu.jsp");
            } else {
                // we have to make handle errors
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: Failed to add food item to the database.");
        }
    }
}
