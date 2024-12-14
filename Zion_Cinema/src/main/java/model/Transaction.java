package model;

public class Transaction {

    private int TransactionID;
    private int ShowtimeID;
    private int MovieID;
    private String MovieName;
    private String Date;
    private String Time;
    private int SeatID;
    private String SeatNumber;
    private int FoodID;
    private String FoodName;
    private int Quantity;
    private float TotalPrice;

    public Transaction() {

    }

    public int getTransactionID() {
        return TransactionID;
    }
    public void setTransactionID(int transactionID) {
        TransactionID = transactionID;
    }
    public int getShowtimeID(){
        return ShowtimeID;
    }
    public void setShowtimeID(int showtimeID){
        ShowtimeID=showtimeID;
    }
    public int getMovieID() {
        return MovieID;
    }
    public void setMovieID(int movieID) {
        MovieID = movieID;
    }
    public String getMovieName() {
        return MovieName;
    }
    public void setMovieName(String movieName) {
        MovieName = movieName;
    }
    public String getDate() {
        return Date;
    }
    public void setDate(String date) {
        Date = date;
    }
    public String getTime() {
        return Time;
    }
    public void setTime(String time) {
        Time = time;
    }
    public int getSeatID() {
        return SeatID;
    }
    public void setSeatID(int seatID) {
        SeatID = seatID;
    }
    public String getSeatNumber() {
        return SeatNumber;
    }
    public void setSeatNumber(String seatNumber) {
        SeatNumber = seatNumber;
    }
    public int getFoodID() {
        return FoodID;
    }
    public void setFoodID(int foodID) {
        FoodID = foodID;
    }
    public String getFoodName() {
        return FoodName;
    }
    public void setFoodName(String foodName) {
        FoodName = foodName;
    }
    public int getQuantity() {
        return Quantity;
    }
    public void setQuantity(int quantity) {
        Quantity = quantity;
    }
    public float getTotalPrice() {
        return TotalPrice;
    }
    public void setTotalPrice(float totalPrice) {
        TotalPrice = totalPrice;
    }


}
