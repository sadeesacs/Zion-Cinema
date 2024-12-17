
package Controller;

import DAO.FoodItemDAO;
import model.FoodItem;
import java.io.*;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;



import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "ADFoodMenuServlet", urlPatterns = {"/ADFoodMenuServlet"})
@MultipartConfig
public class ADFoodMenuServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        FoodItemDAO dao = new FoodItemDAO();

        switch(action) {
            case "list":
                List<FoodItem> allFoods = dao.getAllFoodItems();
                request.setAttribute("foods", allFoods);
                request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
                break;

            case "view":
                int viewId = Integer.parseInt(request.getParameter("foodId"));
                FoodItem viewItem = dao.getFoodItemById(viewId);
                if (viewItem == null) {
                    response.sendRedirect("ADFoodMenuServlet?action=list");
                    return;
                }
                request.setAttribute("viewItem", viewItem);
                request.setAttribute("view", true);
                List<FoodItem> foodsForView = dao.getAllFoodItems();
                request.setAttribute("foods", foodsForView);
                request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
                break;

            case "editForm":
                int editId = Integer.parseInt(request.getParameter("foodId"));
                FoodItem editItem = dao.getFoodItemById(editId);
                if (editItem == null) {
                    response.sendRedirect("ADFoodMenuServlet?action=list");
                    return;
                }
                request.setAttribute("editItem", editItem);
                request.setAttribute("edit", true);
                List<FoodItem> foodsForEdit = dao.getAllFoodItems();
                request.setAttribute("foods", foodsForEdit);
                request.getRequestDispatcher("AD-FoodMenu.jsp").forward(request, response);
                break;

            case "delete":
                int delId = Integer.parseInt(request.getParameter("foodId"));
                FoodItem delItem = dao.getFoodItemById(delId);
                if (delItem != null) {
                    // Delete record
                    if (dao.deleteFoodItem(delId)) {
                        // Remove image file
                        if (delItem.getFoodImage() != null && !delItem.getFoodImage().isEmpty()) {
                            deleteImage(request, delItem.getFoodImage());
                        }
                    }
                }
                response.sendRedirect("ADFoodMenuServlet?action=list");
                break;

            default:
                response.sendRedirect("ADFoodMenuServlet?action=list");
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        FoodItemDAO dao = new FoodItemDAO();

        request.setCharacterEncoding("UTF-8");

        switch (action) {
            case "add":
                FoodItem newItem = buildFoodItemFromRequest(request, true, null);
                int newId = dao.insertFoodItem(newItem);
                response.sendRedirect("ADFoodMenuServlet?action=list");
                break;

            case "update":
                int foodId = Integer.parseInt(request.getParameter("foodId"));
                FoodItem oldItem = dao.getFoodItemById(foodId);
                if (oldItem == null) {
                    response.sendRedirect("ADFoodMenuServlet?action=list");
                    return;
                }

                FoodItem updatedItem = buildFoodItemFromRequest(request, false, oldItem);
                updatedItem.setFoodId(foodId);
                if (dao.updateFoodItem(updatedItem)) {
                    if (updatedItem.getFoodImage() != null && !updatedItem.getFoodImage().equals(oldItem.getFoodImage())) {
                        if (oldItem.getFoodImage() != null && !oldItem.getFoodImage().isEmpty()) {
                            deleteImage(request, oldItem.getFoodImage());
                        }
                    }
                }
                response.sendRedirect("ADFoodMenuServlet?action=list");
                break;

            default:
                response.sendRedirect("ADFoodMenuServlet?action=list");
        }
    }
    
    private FoodItem buildFoodItemFromRequest(HttpServletRequest request, boolean isAdd, FoodItem oldItem)
        throws IOException, ServletException {

        String name = request.getParameter("foodName");
        String type = request.getParameter("foodType");
        String priceStr = request.getParameter("foodPrice");
        double price = Double.parseDouble(priceStr);

        // Handle image
        Part imagePart = request.getPart("foodImage");
        String imagePath = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = extractFileName(imagePart);
            // Save file in images/Food/
            imagePath = saveImage(request, imagePart, fileName);
        } else {
            if (!isAdd && oldItem != null) {
                // keep old image
                imagePath = oldItem.getFoodImage();
            } else {
                // image mandatory for add
                imagePath = null; 
            }
        }

        FoodItem item = new FoodItem();
        item.setName(name);
        item.setType(type);
        item.setPrice(price);
        item.setFoodImage(imagePath);
        return item;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                String fName = token.substring(token.indexOf('=') + 2, token.length()-1);
                return fName;
            }
        }
        return null;
    }

    private String saveImage(HttpServletRequest request, Part part, String fileName) throws IOException {
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + "images" + File.separator + "Food";
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        File fileToSave = new File(fileSaveDir, fileName);
        part.write(fileToSave.getAbsolutePath());
        return "images/Food/" + fileName;
    }

    private void deleteImage(HttpServletRequest request, String imagePath) {
        String appPath = request.getServletContext().getRealPath("");
        File f = new File(appPath, imagePath);
        if (f.exists()) {
            f.delete();
        }
    }
}
