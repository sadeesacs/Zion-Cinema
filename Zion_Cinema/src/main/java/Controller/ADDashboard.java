package Controller;

import DAO.ADShowTimeDAO;
import DAO.ADTicketPriceDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "ADDashboard", urlPatterns = {"/ADDashboard"})
public class ADDashboard extends HttpServlet {
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
        ADShowTimeDAO showtimeDAOAD = new ADShowTimeDAO();
        ADTicketPriceDAO ADTicketPriceDAO = new ADTicketPriceDAO();

        String[] formShowtimes = request.getParameterValues("showtime");

        // To easily check if a time is selected in form:
        boolean isSelectedInForm;
        LocalDate startDate = LocalDate.now();
        String[] times = {"10:00:00","13:00:00","18:00:00"};

        for (int i = 0; i < 14; i++) {
            LocalDate current = startDate.plusDays(i);
            String dateStr = current.toString();
            for (String t : times) {
                boolean existsInDB = showtimeDAOAD.showtimeExists(movieId, dateStr, t);
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
                    int stId = showtimeDAOAD.getShowtimeId(movieId, dateStr, t);
                    if (stId != -1) {
                        ADTicketPriceDAO.deleteByShowtimeId(stId);
                    }
                    showtimeDAOAD.deleteShowtime(movieId, dateStr, t);
                } else if (!existsInDB && isSelectedInForm) {
                    // Insert showtime
                    showtimeDAOAD.insertShowtime(movieId, dateStr, t);
                }
            }
        }
    }

    private void updatePrices(HttpServletRequest request, int movieId, String adult, String child) {
        ADShowTimeDAO showtimeDAOAD = new ADShowTimeDAO();
        ADTicketPriceDAO ADTicketPriceDAO = new ADTicketPriceDAO();

        double adultPrice = Double.parseDouble(adult);
        double childPrice = Double.parseDouble(child);

        String[] formShowtimes = request.getParameterValues("showtime");
        if (formShowtimes != null) {
            for (String fs : formShowtimes) {
                String[] parts = fs.split("_");
                String date = parts[0];
                String time = parts[1];
                int stId = showtimeDAOAD.getShowtimeId(movieId, date, time);
                if (stId != -1) {
                    // Upsert prices
                    ADTicketPriceDAO.upsertTicketPrice(stId, "Adult", adultPrice);
                    ADTicketPriceDAO.upsertTicketPrice(stId, "Child", childPrice);
                }
            }
        }
    }
}
