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


@WebServlet(name = "MovieDetailServlet", urlPatterns = {"/MovieDetailServlet"})
public class MovieDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String selectedDate = request.getParameter("selectedDate"); 

        MovieDetailDAO movieDAO = new MovieDetailDAO();
        
        // Fetch details, genres, showtimes, and top 4 nowshowing movies
        MovieDetail movieDetail = movieDAO.getMovieDetails(movieId);
        List<String> genres = movieDAO.getGenres(movieId);
        List<Showtime> closestDates = movieDAO.getClosestDatesForMovie(movieId);
        List<MovieDetail> topNowShowing = movieDAO.getTopNowShowingMovies(movieId);

        // Default to the first date if no date is selected
        String dateForTimes = selectedDate != null ? selectedDate : 
                (!closestDates.isEmpty() ? closestDates.get(0).getDate() : null);

        List<String> timesForDate = dateForTimes != null ? 
                movieDAO.getTimesForDate(movieId, dateForTimes) : null;

        // Setting attributes to jsp
        request.setAttribute("movieDetail", movieDetail);
        request.setAttribute("genres", genres);
        request.setAttribute("closestDates", closestDates);
        request.setAttribute("topNowShowing", topNowShowing);
        request.setAttribute("timesForDate", timesForDate);
        request.setAttribute("selectedDate", dateForTimes);

        request.getRequestDispatcher("MovieDetail.jsp").forward(request, response);
    }
}