package Controller;
import DAO.MovieListDAO;
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
@WebServlet("/AddMovie")
public class MovieAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Input validation
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        String year = request.getParameter("year");
        String rating = request.getParameter("rating");
        String genre1 = request.getParameter("genre1");
        String genre2 = request.getParameter("genre2");
        String genre3 = request.getParameter("genre3");
        String genre4 = request.getParameter("genre4");
        String status = request.getParameter("status");
        String trailer = request.getParameter("trailer");


        //Fetch image by using name attribute of HTML
        Part filePartbanner = request.getPart("banner");


        if (filePartbanner == null || filePartbanner.getSize() == 0) {
            response.getWriter().println("Error: Please upload a valid image.");
            return;
        }


        //Get image file name
        String imagebanner = filePartbanner.getSubmittedFileName();
        System.out.println("Selected image is " + imagebanner);

        //Getting path to Re Upload image into image folder
        // change file path on yor pc
        String uploadpathbanner = "/Users/venurakaranasinghe/Library/CloudStorage/OneDrive-NSBM/2 nd year/1st semester/java/Project/JavaProject_Group-U/Zion_Cinema/src/main/webapp/images/banner/" + imagebanner;
        System.out.println("file path is" + uploadpathbanner);


        try {
            //Uploading image to image folder
            FileOutputStream fos = new FileOutputStream(uploadpathbanner);
            InputStream is = filePartbanner.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        //Fetch image by using name attribute of HTML
        Part filePartposter = request.getPart("poster");


        if (filePartposter == null || filePartposter.getSize() == 0) {
            response.getWriter().println("Error: Please upload a valid image.");
            return;
        }


        //Get image file name
        String imageposter = filePartposter.getSubmittedFileName();
        System.out.println("Selected image is " + imageposter);

        //Getting path to Re Upload image into image folder
        // change file path on yor pc
        String uploadpathposter = "/Users/venurakaranasinghe/Library/CloudStorage/OneDrive-NSBM/2 nd year/1st semester/java/Project/JavaProject_Group-U/Zion_Cinema/src/main/webapp/images/poster/" + imageposter;
        System.out.println("file path is" + uploadpathposter);


        try {
            //Uploading image to image folder
            FileOutputStream fos = new FileOutputStream(uploadpathposter);
            InputStream is = filePartposter.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        //Fetch image by using name attribute of HTML
        Part filePartcarousal = request.getPart("carousal");


        if (filePartcarousal == null || filePartcarousal.getSize() == 0) {
            response.getWriter().println("Error: Please upload a valid image.");
            return;
        }


        //Get image file name
        String imagecarousal = filePartcarousal.getSubmittedFileName();
        System.out.println("Selected image is " + imagecarousal);

        //Getting path to Re Upload image into image folder
        // change file path on yor pc
        String uploadpathcarousal = "/Users/venurakaranasinghe/Library/CloudStorage/OneDrive-NSBM/2 nd year/1st semester/java/Project/JavaProject_Group-U/Zion_Cinema/src/main/webapp/images/Carousal/" + imagecarousal;
        System.out.println("file path is" + uploadpathcarousal);


        try {
            //Uploading image to image folder
            FileOutputStream fos = new FileOutputStream(uploadpathcarousal);
            InputStream is = filePartcarousal.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Save to database
        try {
            MovieListDAO movielist = new MovieListDAO();
            boolean success = movielist.addmoviedata(name, description, duration, year,rating,status,trailer,imagebanner,imageposter,imagecarousal,genre1,genre2,genre3,genre4);

            if (success) {
                response.sendRedirect("AD-Movies.jsp");
            } else {
                // we have to make handle errors
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: Failed to add Movie to the database.");
        }
    }
}
