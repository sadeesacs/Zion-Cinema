package Controller;
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
import Db.dbcon;

@MultipartConfig
@WebServlet("/AddFood")
public class FoodImageAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello venuthum");

        //Fetch image by using name attribute of HTML
        Part filePart = request.getPart("image");

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


    }
}
