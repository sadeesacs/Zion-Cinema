package Controller;

import DAO.MovieDetailDAO;
import model.MovieDetail;
import model.Showtime;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "MovieDetailServlet", urlPatterns = {"/MovieDetailServlet"})
public class MovieDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer userId = (Integer) (session != null ? session.getAttribute("UserID") : null);
        // If userId is null, user is guest and no error occurs.

        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String selectedDate = request.getParameter("selectedDate"); 

        MovieDetailDAO movieDAO = new MovieDetailDAO();
        
        MovieDetail movieDetail = movieDAO.getMovieDetails(movieId);
        List<String> genres = movieDAO.getGenres(movieId);
        List<Showtime> closestDates = movieDAO.getClosestDatesForMovie(movieId);
        List<MovieDetail> topNowShowing = movieDAO.getTopNowShowingMovies(movieId);

        String dateForTimes = selectedDate != null ? selectedDate : 
                (!closestDates.isEmpty() ? closestDates.get(0).getDate() : null);

        List<String> timesForDate = dateForTimes != null ? 
                movieDAO.getTimesForDate(movieId, dateForTimes) : null;

        request.setAttribute("movieDetail", movieDetail);
        request.setAttribute("genres", genres);
        request.setAttribute("closestDates", closestDates);
        request.setAttribute("topNowShowing", topNowShowing);
        request.setAttribute("timesForDate", timesForDate);
        request.setAttribute("selectedDate", dateForTimes);
        
        request.setAttribute("movieDAO", movieDAO);

        request.getRequestDispatcher("MovieDetail.jsp").forward(request, response);
    }
}