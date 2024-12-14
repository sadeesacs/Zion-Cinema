package model;

public class MovieListing {
    private int movieId;
    private String poster;
    private String name;
    private String duration;
    private String year;
    private String rating;
    private String genre;
    private String status;
    private String trailer; 

    public MovieListing(int movieId, String poster, String name, String duration, String year, String rating, String genre, String status, String trailer) {
        this.movieId = movieId;
        this.poster = poster;
        this.name = name;
        this.duration = duration;
        this.year = year;
        this.rating = rating;
        this.genre = genre;
        this.status = status;
        this.trailer = trailer; 
    }
    
    public int getMovieId() {return movieId;}
    public String getPoster() {return poster;}
    public String getName() {return name;}
    public String getDuration() {return duration;}
    public String getYear() {return year;}
    public String getRating() {return rating;}
    public String getGenre() {return genre;}
    public String getStatus() {return status;}
    public String getTrailer() {return trailer;}
}