package Controller;

import DAO.MovieDetailDAO;
import DAO.ShowtimeDAO;
import DAO.SeatDAO;
import DAO.TemporaryMoviesDAO;
import DAO.TemporarySeatsDAO;
import DAO.TicketPriceDAO;
import model.Seat;
import model.MovieDetail;
import model.Showtime;
import java.util.List;
import java.util.Random;
import org.json.JSONArray;

import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONException;


@WebServlet(name = "SeatReservationServlet", urlPatterns = {"/SeatReservationServlet"})
public class SeatReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            Object userIdObj = session.getAttribute("UserID");
            int userId;
            if (userIdObj == null) {
                // Generate a unique ID for guest users
                userId = 100000 + new Random().nextInt(900000);
                session.setAttribute("UserID", userId);
                session.setAttribute("IsGuest", 1);
            } else {
                userId = (int) userIdObj;
            }

            String movieIdParam = request.getParameter("movieId");
            String showtimeIdParam = request.getParameter("showtimeId");

            if (movieIdParam == null || showtimeIdParam == null) {
                throw new IllegalArgumentException("Movie ID and Showtime ID are required.");
            }

            int movieId = Integer.parseInt(movieIdParam);
            int showtimeId = Integer.parseInt(showtimeIdParam);

            MovieDetailDAO movieDAO = new MovieDetailDAO();
            ShowtimeDAO showtimeDAO = new ShowtimeDAO();
            SeatDAO seatDAO = new SeatDAO();
            TicketPriceDAO ticketPriceDAO = new TicketPriceDAO();

            MovieDetail movieDetail = movieDAO.getMovieDetails(movieId);
            Showtime selectedShowtime = showtimeDAO.getShowtimeDetails(showtimeId);
            List<Showtime> closestDates = showtimeDAO.getClosestDatesForMovie(movieId);
            List<String> timesForDate = showtimeDAO.getTimesForDate(movieId, selectedShowtime.getDate());
            List<Seat> seats = seatDAO.getAllSeats();

            double adultPrice = ticketPriceDAO.getTicketPrice(showtimeId, "Adult");
            double childPrice = ticketPriceDAO.getTicketPrice(showtimeId, "Child");

            if (movieDetail == null || selectedShowtime == null) {
                throw new IllegalArgumentException("Invalid Movie or Showtime ID.");
            }

            // Set attributes for JSP
            request.setAttribute("movieId", movieId);
            request.setAttribute("showtimeId", showtimeId);
            request.setAttribute("movieName", movieDetail.getName());
            request.setAttribute("moviePoster", movieDetail.getPoster());
            request.setAttribute("closestDates", closestDates);
            request.setAttribute("timesForDate", timesForDate);
            request.setAttribute("selectedDate", selectedShowtime.getDate());
            request.setAttribute("selectedTime", selectedShowtime.getTime());
            request.setAttribute("seats", seats);
            request.setAttribute("adultPrice", adultPrice);
            request.setAttribute("childPrice", childPrice);

            // Save movie and seat selections to temporary tables
            TemporaryMoviesDAO temporaryMoviesDAO = new TemporaryMoviesDAO();
            temporaryMoviesDAO.insertTemporaryMovie(movieId, showtimeId, userId);

            String selectedSeatsParam = request.getParameter("selectedSeats");
            String ticketTypesParam = request.getParameter("ticketTypes");
            String seatPricesParam = request.getParameter("seatPrices");

            if (selectedSeatsParam != null && ticketTypesParam != null && seatPricesParam != null) {
                JSONArray seatIds = new JSONArray(selectedSeatsParam);
                JSONArray ticketTypes = new JSONArray(ticketTypesParam);
                JSONArray seatPrices = new JSONArray(seatPricesParam);

                TemporarySeatsDAO temporarySeatsDAO = new TemporarySeatsDAO();

                for (int i = 0; i < seatIds.length(); i++) {
                    int seatId = seatIds.getInt(i);
                    String ticketType = ticketTypes.getString(i);
                    double price = seatPrices.getDouble(i);

                    // Insert seat into temporaryseats table
                    temporarySeatsDAO.insertTemporarySeat(userId, seatId, price, showtimeId, ticketType);
                }
            }
            request.getRequestDispatcher("SeatReservation.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric parameter: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (ServletException | IOException | JSONException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred: " + e.getMessage());
        }
    }
}
  
