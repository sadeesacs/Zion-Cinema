
package model;


public class Movie {
    private int movieId;
    private String name;
    private String description;
    private String duration;
    private String year;
    private String rating;
    private String status;
    private String trailer;
    private String banner;
    private String poster;
    private String carousal;

    public Movie(int movieId, String name, String description, String duration, String year, 
                 String rating, String status, String trailer, String banner, String poster, String carousal) {
        this.movieId = movieId;
        this.name = name;
        this.description = description;
        this.duration = duration;
        this.year = year;
        this.rating = rating;
        this.status = status;
        this.trailer = trailer;
        this.banner = banner;
        this.poster = poster;
        this.carousal = carousal;
    }

    public Movie() {} // empty constructor for building manually

    public int getMovieId() { return movieId; }
    public void setMovieId(int movieId) { this.movieId = movieId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }

    public String getRating() { return rating; }
    public void setRating(String rating) { this.rating = rating; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getTrailer() { return trailer; }
    public void setTrailer(String trailer) { this.trailer = trailer; }

    public String getBanner() { return banner; }
    public void setBanner(String banner) { this.banner = banner; }

    public String getPoster() { return poster; }
    public void setPoster(String poster) { this.poster = poster; }

    public String getCarousal() { return carousal; }
    public void setCarousal(String carousal) { this.carousal = carousal; }
}
