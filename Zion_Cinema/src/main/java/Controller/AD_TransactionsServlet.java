
package Controller;

import DAO.*;
import model.User;
import model.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@WebServlet(name = "AD_TransactionsServlet", urlPatterns = {"/AD_TransactionsServlet"})
public class AD_TransactionsServlet extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TransactionDAO transactionDAO = new TransactionDAO();
        List<Transaction> transactions = transactionDAO.getAllTransactions();

        if (transactions.isEmpty()) {
            request.setAttribute("noTransactions", true);
        } else {
            // DAO instances
            ShowtimeDAO showtimeDAO = new ShowtimeDAO();
            MovieDAO movieDAO = new MovieDAO();
            SeatReservationDAO seatResDAO = new SeatReservationDAO();
            SeatDAO seatDAO = new SeatDAO();
            FoodOrderDAO foodOrderDAO = new FoodOrderDAO();
            FoodItemDAO foodItemDAO = new FoodItemDAO();
            UserDAO userDAO = new UserDAO();

            List<UserAccountServlet.TransactionDetail> transactionDetails = new ArrayList<>();

            SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat timeFmt = new SimpleDateFormat("hh:mm a");

            for (Transaction t : transactions) {
                ShowtimeDAO.ShowtimeRaw showRaw = showtimeDAO.getShowtimeById(t.getShowtimeId());
                if (showRaw == null) continue;

                String movieName = movieDAO.getMovieNameById(showRaw.getMovieId());
                String formattedDate = dateFmt.format(showRaw.getDate());
                String formattedTime = timeFmt.format(showRaw.getTime());

                // Now we use t.getUserId() directly
                List<Integer> seatIds = seatResDAO.getSeatIdsByUserAndShowtime(t.getUserId(), t.getShowtimeId());
                List<String> seatNumbers = new ArrayList<>();
                for (int seatId : seatIds) {
                    seatNumbers.add(seatDAO.getSeatNumberById(seatId));
                }

                List<FoodOrderDAO.FoodOrderItem> foods = foodOrderDAO.getFoodOrders(t.getUserId(), t.getShowtimeId());
                List<UserAccountServlet.FoodDetail> foodDetails = new ArrayList<>();
                for (FoodOrderDAO.FoodOrderItem fi : foods) {
                    String fName = foodItemDAO.getFoodNameById(fi.getFoodId());
                    foodDetails.add(new UserAccountServlet.FoodDetail(fName, fi.getQuantity()));
                }

                transactionDetails.add(new UserAccountServlet.TransactionDetail(
                    t.getTransactionId(),
                    movieName,
                    formattedDate,
                    formattedTime,
                    seatNumbers,
                    foodDetails,
                    t.getTotalAmount()
                ));
            }

            request.setAttribute("transactionDetails", transactionDetails);
        }

        request.getRequestDispatcher("AD-Transactions.jsp").forward(request, response);
    }
}
