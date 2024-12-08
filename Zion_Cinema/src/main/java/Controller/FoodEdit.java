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
@WebServlet("/EditFood")
public class FoodEdit  extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Input validation
        String foodID = request.getParameter("foodID");
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

        //Fetch image by using name attribute of HTML
        Part filePart = request.getPart("image");


        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().println("Error: Please upload a valid image.");
            return;
        }


        //Get image file name
        String imageName = filePart.getSubmittedFileName();
        System.out.println("Selected image is " + imageName);

        //Getting path to Re Upload image into image folder
        // change file path on yor pc
        String uploadpath = "/Users/venurakaranasinghe/Library/CloudStorage/OneDrive-NSBM/2 nd year/1st semester/java/Project/JavaProject_Group-U/Zion_Cinema/src/main/webapp/images/Food/"+imageName;
        System.out.println("file path is"+uploadpath);



        try {
            //Uploading image to image folder
            FileOutputStream fos = new FileOutputStream(uploadpath);
            InputStream is = filePart.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        // Save to database
        try {
            FoodMenuDAO foodMenuDAO = new FoodMenuDAO();
            boolean success = foodMenuDAO.editFood(foodID,name, type, price, imageName);

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
