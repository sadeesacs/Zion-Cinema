package model;

public class Showtime {
    private String date;
    private String time;

    public Showtime(String date, String time) {
        this.date = date;
        this.time = time;
    }

    public String getDate() { return date; }
    public String getTime() { return time; }
}