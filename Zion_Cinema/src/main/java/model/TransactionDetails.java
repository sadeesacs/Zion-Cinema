package model;

import java.util.List;

public class TransactionDetails {
    private int receiptNo;
    private String movieName;
    private String showTime;
    private List<String> seats;
    private List<FoodOrder> foodOrders;
    private double total;

    // Constructor
    public TransactionDetails(int receiptNo, String movieName, String showTime, List<String> seats, List<FoodOrder> foodOrders, double total) {
        this.receiptNo = receiptNo;
        this.movieName = movieName;
        this.showTime = showTime;
        this.seats = seats;
        this.foodOrders = foodOrders;
        this.total = total;
    }

    // Getters and Setters
    public int getReceiptNo() {
        return receiptNo;
    }

    public void setReceiptNo(int receiptNo) {
        this.receiptNo = receiptNo;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getShowTime() {
        return showTime;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public List<String> getSeats() {
        return seats;
    }

    public void setSeats(List<String> seats) {
        this.seats = seats;
    }

    public List<FoodOrder> getFoodOrders() {
        return foodOrders;
    }

    public void setFoodOrders(List<FoodOrder> foodOrders) {
        this.foodOrders = foodOrders;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
