package model;

public class MovieDetail {
    private int movieId;
    private String poster;
    private String banner;
    private String name;
    private String description;
    private String duration;
    private String trailer;
    private String status;

    public MovieDetail(int movieId,String poster, String banner, String name, String description, String duration, String trailer, String status) {
        this.movieId = movieId;
        this.poster = poster;
        this.banner = banner;
        this.name = name;
        this.description = description;
        this.duration = duration;
        this.trailer = trailer;
        this.status = status;
    }
    public int getMovieId() { return movieId; } 
    public String getPoster() { return poster; }
    public String getBanner() { return banner; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public String getDuration() { return duration; }
    public String getTrailer() { return trailer; }
    public String getStatus() { return status; }
}