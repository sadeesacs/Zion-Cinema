package model;

public class OrderDetail {
    private double totalFoodPrice;
    private double totalTicketPrice;
    private double tax;
    private double totalAmount;
    private String movieName; // New field

    public OrderDetail(double totalFoodPrice, double totalTicketPrice, double tax, double totalAmount, String movieName) {
        this.totalFoodPrice = totalFoodPrice;
        this.totalTicketPrice = totalTicketPrice;
        this.tax = tax;
        this.totalAmount = totalAmount;
        this.movieName = movieName;
    }

    // Getters and setters
    public double getTotalFoodPrice() { return totalFoodPrice; }
    public void setTotalFoodPrice(double totalFoodPrice) { this.totalFoodPrice = totalFoodPrice; }

    public double getTotalTicketPrice() { return totalTicketPrice; }
    public void setTotalTicketPrice(double totalTicketPrice) { this.totalTicketPrice = totalTicketPrice; }

    public double getTax() { return tax; }
    public void setTax(double tax) { this.tax = tax; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getMovieName() { return movieName; }
    public void setMovieName(String movieName) { this.movieName = movieName; }
}
