
package model;

public class TicketSummary {
    private String ticketType;
    private int quantity;
    private double totalPrice;

    public TicketSummary(String ticketType, int quantity, double totalPrice) {
        this.ticketType = ticketType;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public String getTicketType() {
        return ticketType;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
}
