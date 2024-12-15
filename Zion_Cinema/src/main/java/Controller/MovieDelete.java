package Controller;
import DAO.ADMovieListDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
@WebServlet("/DeleteMovie")
public class MovieDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String MovieId = request.getParameter("MovieID");
        // Debug: print MovieId to the console
        System.out.println("Received MovieId: " + MovieId);
        if (MovieId != null) {
            try {

                int MovieIdInt = Integer.parseInt(MovieId);

                //call to DAO layer to delete food
                ADMovieListDAO ADMovieListDAO = new ADMovieListDAO();
                Boolean isDeleted = ADMovieListDAO.deleteMovieById(MovieIdInt);
                // Redirect based on the result of the deletion
                if (isDeleted) {
                    response.sendRedirect("AD-Movies.jsp");
                } else {
                    response.sendRedirect("AD-Movies.jsp");
                    System.out.println("Deletion failed");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid food ID");
            }
        } else {
            response.getWriter().write("ADMovie ID is missing");
        }
    }
}
