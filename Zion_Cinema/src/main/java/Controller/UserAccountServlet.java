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

@WebServlet(name = "UserAccountServlet", urlPatterns = {"/UserAccountServlet"})
public class UserAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("UserID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("UserID");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserById(userId);

        TransactionDAO transactionDAO = new TransactionDAO();
        List<Transaction> transactions = transactionDAO.getTransactionsByUserId(userId);

        request.setAttribute("user", user);

        if (transactions.isEmpty()) {
            request.setAttribute("noTransactions", true);
        } else {
            ShowtimeDAO showtimeDAO = new ShowtimeDAO();
            MovieDAO movieDAO = new MovieDAO();
            SeatReservationDAO seatResDAO = new SeatReservationDAO();
            SeatDAO seatDAO = new SeatDAO();
            FoodOrderDAO foodOrderDAO = new FoodOrderDAO();
            FoodItemDAO foodItemDAO = new FoodItemDAO();

            List<TransactionDetail> transactionDetails = new ArrayList<>();

            SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat timeFmt = new SimpleDateFormat("hh:mm a");

            for (Transaction t : transactions) {
                ShowtimeDAO.ShowtimeRaw showRaw = showtimeDAO.getShowtimeById(t.getShowtimeId());
                if (showRaw == null) continue;
                String movieName = movieDAO.getMovieNameById(showRaw.getMovieId());

                String formattedDate = dateFmt.format(showRaw.getDate());
                String formattedTime = timeFmt.format(showRaw.getTime());

                List<Integer> seatIds = seatResDAO.getSeatIdsByUserAndShowtime(userId, t.getShowtimeId());
                List<String> seatNumbers = new ArrayList<>();
                for (int seatId : seatIds) {
                    seatNumbers.add(seatDAO.getSeatNumberById(seatId));
                }

                List<FoodOrderDAO.FoodOrderItem> foods = foodOrderDAO.getFoodOrders(userId, t.getShowtimeId());
                List<FoodDetail> foodDetails = new ArrayList<>();
                for (FoodOrderDAO.FoodOrderItem fi : foods) {
                    String fName = foodItemDAO.getFoodNameById(fi.getFoodId());
                    foodDetails.add(new FoodDetail(fName, fi.getQuantity()));
                }

                transactionDetails.add(new TransactionDetail(
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

        request.getRequestDispatcher("UserAccount.jsp").forward(request, response);
    }

    
    public static class FoodDetail {
        String name;
        int quantity;
        public FoodDetail(String name, int quantity) {
            this.name = name;
            this.quantity = quantity;
        }
        public String getName() { return name; }
        public int getQuantity() { return quantity; }
    }

    public static class TransactionDetail {
        int transactionId;
        String movieName;
        String date;
        String time;
        List<String> seatNumbers;
        List<FoodDetail> foods;
        double totalAmount;

        public TransactionDetail(int transactionId, String movieName, String date, String time,
                                 List<String> seatNumbers, List<FoodDetail> foods, double totalAmount) {
            this.transactionId = transactionId;
            this.movieName = movieName;
            this.date = date;
            this.time = time;
            this.seatNumbers = seatNumbers;
            this.foods = foods;
            this.totalAmount = totalAmount;
        }

        public int getTransactionId() { return transactionId; }
        public String getMovieName() { return movieName; }
        public String getDate() { return date; }
        public String getTime() { return time; }
        public List<String> getSeatNumbers() { return seatNumbers; }
        public List<FoodDetail> getFoods() { return foods; }
        public double getTotalAmount() { return totalAmount; }
    }
}
