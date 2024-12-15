package model;

public class ADMovie {
    private int movieId;
    private String name;
    public ADMovie(int movieId, String name) {
        this.movieId = movieId;
        this.name = name;
    }
    public int getMovieId() {return movieId;}
    public String getName() {return name;}
}
