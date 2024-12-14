package model;

public class Seat {
    private int seatId;
    private String seatNumber;

    public Seat(int seatId, String seatNumber) {
        this.seatId = seatId;
        this.seatNumber = seatNumber;
    }

    public int getSeatId() {return seatId;}
    public void setSeatId(int seatId) {this.seatId = seatId;}
    public String getSeatNumber() {return seatNumber;}
    public void setSeatNumber(String seatNumber) {this.seatNumber = seatNumber;}
}