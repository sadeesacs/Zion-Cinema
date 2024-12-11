package model;

public class TemporaryMovie {
    private int movieId;
    private int showtimeId;
    private int userId;

    public TemporaryMovie(int movieId, int showtimeId, int userId) {
        this.movieId = movieId;
        this.showtimeId = showtimeId;
        this.userId = userId;
    }

    public int getMovieId() {return movieId;}
    public void setMovieId(int movieId) {this.movieId = movieId;}
    public int getShowtimeId() {return showtimeId;}
    public void setShowtimeId(int showtimeId) {this.showtimeId = showtimeId;}
    public int getUserId() {return userId;}
    public void setUserId(int userId) {this.userId = userId;}
}
