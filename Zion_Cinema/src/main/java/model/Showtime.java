package model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Showtime {
    private int showtimeID;
    private int movieID;
    private LocalDate date;
    private LocalTime time;

    public Showtime(int showtimeID, int movieID, LocalDate date, LocalTime time) {
        this.showtimeID = showtimeID;
        this.movieID = movieID;
        this.date = date;
        this.time = time;
    }

    public int getShowtimeID() {return showtimeID;}
    public int getMovieID() {return movieID;}
    public LocalDate getDate() {return date;}
    public LocalTime getTime() {return time;}
}
