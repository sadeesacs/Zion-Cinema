package Controller;

import DAO.ShowTimeDAO;
import DAO.TicketPriceDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "Dashboard", urlPatterns = {"/Dashboard"})
public class Dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String selectedMovie = request.getParameter("selectedMovie");
        if (selectedMovie == null || selectedMovie.trim().isEmpty()) {
            selectedMovie = "1";
        }
        request.setAttribute("selectedMovie", selectedMovie);
        request.getRequestDispatcher("AD-Dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String selectedMovie = request.getParameter("selectedMovie");
        if (selectedMovie == null || selectedMovie.trim().isEmpty() || selectedMovie.equals("-1")) {
            request.setAttribute("error", "Please select a movie");
            doGet(request, response);
            return;
        }

        int movieId = Integer.parseInt(selectedMovie);

        if ("saveShowtimes".equals(action)) {
            saveShowtimes(request, movieId);
            request.setAttribute("error", "");
            doGet(request, response);
        } else if ("updatePrices".equals(action)) {
            String adult = request.getParameter("adult");
            String child = request.getParameter("child");
            if (adult == null || adult.trim().isEmpty() || child == null || child.trim().isEmpty()) {
                request.setAttribute("error", "Please provide both adult and child prices");
                request.setAttribute("adultVal", adult);
                request.setAttribute("childVal", child);
                doGet(request, response);
            } else {
                updatePrices(request, movieId, adult, child);
                request.setAttribute("error", "");
                doGet(request, response);
            }
        } else {
            doGet(request, response);
        }
    }

    private void saveShowtimes(HttpServletRequest request, int movieId) {
        ShowTimeDAO showtimeDAO = new ShowTimeDAO();
        TicketPriceDAO ticketPriceDAO = new TicketPriceDAO();

        String[] formShowtimes = request.getParameterValues("showtime");

        // To easily check if a time is selected in form:
        boolean isSelectedInForm;
        LocalDate startDate = LocalDate.now();
        String[] times = {"10:00:00","13:00:00","18:00:00"};

        for (int i = 0; i < 14; i++) {
            LocalDate current = startDate.plusDays(i);
            String dateStr = current.toString();
            for (String t : times) {
                boolean existsInDB = showtimeDAO.showtimeExists(movieId, dateStr, t);
                // Check if present in form
                isSelectedInForm = false;
                if (formShowtimes != null) {
                    for (String fs : formShowtimes) {
                        if (fs.equals(dateStr+"_"+t)) {
                            isSelectedInForm = true;
                            break;
                        }
                    }
                }

                if (existsInDB && !isSelectedInForm) {
                    // Delete showtime and its prices
                    int stId = showtimeDAO.getShowtimeId(movieId, dateStr, t);
                    if (stId != -1) {
                        ticketPriceDAO.deleteByShowtimeId(stId);
                    }
                    showtimeDAO.deleteShowtime(movieId, dateStr, t);
                } else if (!existsInDB && isSelectedInForm) {
                    // Insert showtime
                    showtimeDAO.insertShowtime(movieId, dateStr, t);
                }
            }
        }
    }

    private void updatePrices(HttpServletRequest request, int movieId, String adult, String child) {
        ShowTimeDAO showtimeDAO = new ShowTimeDAO();
        TicketPriceDAO ticketPriceDAO = new TicketPriceDAO();

        double adultPrice = Double.parseDouble(adult);
        double childPrice = Double.parseDouble(child);

        String[] formShowtimes = request.getParameterValues("showtime");
        if (formShowtimes != null) {
            for (String fs : formShowtimes) {
                String[] parts = fs.split("_");
                String date = parts[0];
                String time = parts[1];
                int stId = showtimeDAO.getShowtimeId(movieId, date, time);
                if (stId != -1) {
                    // Upsert prices
                    ticketPriceDAO.upsertTicketPrice(stId, "Adult", adultPrice);
                    ticketPriceDAO.upsertTicketPrice(stId, "Child", childPrice);
                }
            }
        }
    }
}
