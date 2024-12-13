
package Controller;

import DAO.MovieListDAO;
import DAO.ShowTimeDAO;
import DAO.TicketPriceDAO;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/AdminDashboardServlet"})
public class AdminDashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String action = request.getParameter("action");
        System.out.println("AdminDashboardServlet: Received GET request with action = " + action);
        
        if ("fetchMovies".equals(action)) {
            List<Map<String, Object>> movies = MovieListDAO.getNowShowingMovies();
            System.out.println("Movies fetched: " + movies.size());
            request.setAttribute("movies", movies);
            request.getRequestDispatcher("AD-Dashboard.jsp").forward(request, response);
        } else if ("fetchScheduleAndPrices".equals(action)) {
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            List<Map<String, Object>> schedule = ShowTimeDAO.getScheduleByMovieId(movieId);
            request.setAttribute("scheduleData", schedule);
            request.setAttribute("movies", MovieListDAO.getNowShowingMovies());
            request.getRequestDispatcher("AD-Dashboard.jsp").forward(request, response);
        }
        
        System.out.println("Hello");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new Gson();
        Map<String, Object> requestData = gson.fromJson(request.getReader(), Map.class);

        int movieId = ((Double) requestData.get("movieId")).intValue();
        List<Map<String, String>> showtimes = (List<Map<String, String>>) requestData.get("showtimes");
        double adultPrice = ((Double) requestData.get("adultPrice"));
        double childPrice = ((Double) requestData.get("childPrice"));

        ShowTimeDAO.updateShowtimes(movieId, showtimes);
        TicketPriceDAO.saveTicketPrices(movieId, adultPrice, childPrice);

        response.setStatus(HttpServletResponse.SC_OK);
        
    }
}
