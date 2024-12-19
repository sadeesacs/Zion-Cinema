package model;

public class Transaction {
    private int transactionId;
    private int userId;
    private int showtimeId;
    private double totalAmount;

    public Transaction(int transactionId, int userId, int showtimeId, double totalAmount) {
        this.transactionId = transactionId;
        this.userId = userId;
        this.showtimeId = showtimeId;
        this.totalAmount = totalAmount;
    }

    public int getTransactionId() { return transactionId; }
    public int getUserId() { return userId; }
    public int getShowtimeId() { return showtimeId; }
    public double getTotalAmount() { return totalAmount; }
}
