package Controller;

import DAO.MovieListingDAO;
import model.MovieListing;
import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MovieListingServlet")
public class MovieListingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            MovieListingDAO movieDAO = new MovieListingDAO();
            List<MovieListing> allMovies = movieDAO.getAllMovies();
            List<MovieListing> nowShowing = new ArrayList<>();
            List<MovieListing> comingSoon = new ArrayList<>();

            for (MovieListing movie : allMovies) {
                if ("Now Showing".equalsIgnoreCase(movie.getStatus())) {
                    nowShowing.add(movie);
                } else if ("Coming Soon".equalsIgnoreCase(movie.getStatus())) {
                    comingSoon.add(movie);
                }
            }
            request.setAttribute("nowShowing", nowShowing);
            request.setAttribute("comingSoon", comingSoon);
            request.getRequestDispatcher("MovieListing.jsp").forward(request, response);
    }
}