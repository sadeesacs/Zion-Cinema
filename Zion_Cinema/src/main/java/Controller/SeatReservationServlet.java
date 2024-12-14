package Controller;

import DAO.MovieDetailDAO;
import DAO.ShowtimeDAO;
import DAO.SeatDAO;
import DAO.TemporaryMoviesDAO;
import DAO.TemporarySeatsDAO;
import DAO.TicketPriceDAO;
import DAO.SeatReservationDAO;
import DAO.UserDAO;
import model.Seat;
import model.MovieDetail;
import model.Showtime;

import java.util.HashSet;
import java.util.Set;
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
                userId = 100000 + new Random().nextInt(900000);
                session.setAttribute("UserID", userId);
                session.setAttribute("IsGuest", 1);

                // Insert the guest user into the users table
                UserDAO userDAO = new UserDAO();
                userDAO.insertGuestUser(userId);
            } else {
                userId = (int) userIdObj;
            }

            // Get movieId and showtimeId from the request
            String movieIdParam = request.getParameter("movieId");
            String showtimeIdParam = request.getParameter("showtimeId");

            if (movieIdParam == null || showtimeIdParam == null) {
                throw new IllegalArgumentException("Movie ID and Showtime ID are required.");
            }

            int movieId = Integer.parseInt(movieIdParam);
            int showtimeId = Integer.parseInt(showtimeIdParam);

            // Fetch details and set attributes for JSP
            MovieDetailDAO movieDAO = new MovieDetailDAO();
            ShowtimeDAO showtimeDAO = new ShowtimeDAO();
            SeatDAO seatDAO = new SeatDAO();
            TemporarySeatsDAO temporarySeatsDAO = new TemporarySeatsDAO();
            SeatReservationDAO seatReservationDAO = new SeatReservationDAO();
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

            // Get reserved seats from both tables
            Set<Integer> reservedSeatIds = new HashSet<>();
            reservedSeatIds.addAll(temporarySeatsDAO.getReservedSeatIds(showtimeId));
            reservedSeatIds.addAll(seatReservationDAO.getReservedSeatIds(showtimeId));

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

                for (int i = 0; i < seatIds.length(); i++) {
                    int seatId = seatIds.getInt(i);

                    // Check if the seat is already reserved
                    if (reservedSeatIds.contains(seatId)) {
                        response.setContentType("text/html");
                        response.getWriter().write(
                            "<script>alert('The requested seat has been already booked.'); window.history.back();</script>"
                        );
                        return;
                    }
                    String ticketType = ticketTypes.getString(i);
                    double price = seatPrices.getDouble(i);

                    temporarySeatsDAO.insertTemporarySeat(userId, seatId, price, showtimeId, ticketType);
                }
            }

            // Store data in session for FoodPreOrder.jsp
            session.setAttribute("selectedMovie", movieDetail);
            session.setAttribute("selectedShowtime", selectedShowtime);
            session.setAttribute("selectedDate", selectedShowtime.getDate());
            session.setAttribute("selectedTime", selectedShowtime.getTime());
            session.setAttribute("selectedSeats", selectedSeatsParam);

            // Redirect to FoodPreOrderServlet if "continueToFood" is set
            String continueToFood = request.getParameter("continueToFood");
            if ("true".equals(continueToFood)) {
                response.sendRedirect("FoodPreOrderServlet");
                return;
            }

            // Forward the request to the SeatReservation.jsp page
            request.setAttribute("movieId", movieId);
            request.setAttribute("showtimeId", showtimeId);
            request.setAttribute("movieName", movieDetail.getName());
            request.setAttribute("moviePoster", movieDetail.getPoster());
            request.setAttribute("closestDates", closestDates);
            request.setAttribute("timesForDate", timesForDate);
            request.setAttribute("selectedDate", selectedShowtime.getDate());
            request.setAttribute("selectedTime", selectedShowtime.getTime());
            request.setAttribute("seats", seats);
            request.setAttribute("reservedSeatIds", reservedSeatIds);
            request.setAttribute("adultPrice", adultPrice);
            request.setAttribute("childPrice", childPrice);

            request.getRequestDispatcher("SeatReservation.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}
  
