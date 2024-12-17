package Controller;

import DAO.MovieListingDAO;
import model.MovieListing;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "HomePageServlet", urlPatterns = {"/HomePageServlet"})
public class HomePageServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Integer userId = (Integer) (session != null ? session.getAttribute("UserID") : null);
        // If userId is null, user not logged in, just proceed without error.

        MovieListingDAO dao = new MovieListingDAO();

        // Get all carousal movies
        List<MovieListing> carousalMovies = dao.getCarousalMovies();

        // Get top 4 now showing
        List<MovieListing> nowShowing = dao.getMoviesByStatus("Now Showing", 4);

        // Get top 4 coming soon
        List<MovieListing> comingSoon = dao.getMoviesByStatus("Coming Soon", 4);

        request.setAttribute("carousalMovies", carousalMovies);
        request.setAttribute("nowShowingMovies", nowShowing);
        request.setAttribute("comingSoonMovies", comingSoon);
        
        request.getRequestDispatcher("HomePage.jsp").forward(request, response);
    }
    
}
