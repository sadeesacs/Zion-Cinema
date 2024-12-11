package model;

public class TemporarySeat {
    private int seatId;
    private int userId;
    private int showtimeId;
    private String ticketType;
    private double price;

    public TemporarySeat(int seatId, int userId, int showtimeId, String ticketType, double price) {
        this.seatId = seatId;
        this.userId = userId;
        this.showtimeId = showtimeId;
        this.ticketType = ticketType;
        this.price = price;
    }

    public int getSeatId() {return seatId;}
    public int getUserId() {return userId;}
    public int getShowtimeId() {return showtimeId;}
    public String getTicketType() {return ticketType;}
    public double getPrice() {return price;}
}
