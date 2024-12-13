package model;

public class Showtime {
    private int showtimeID;
    private String date;
    private String time;

    public Showtime(int showtimeID, String date, String time) {
        this.showtimeID = showtimeID;
        this.date = date;
        this.time = time;
    }

    public int getShowtimeID() {
        return showtimeID;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }
}