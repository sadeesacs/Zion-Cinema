package model;

public class MovieList {
    private int MovieID;
    private String MovieName;
    private String Description;
    private int Durationhour;
    private int Durationminute;
    private String Trailer;
    private int Year;
    private int Rating;
    private String status;
    private String poster;
    private String banner;
    private String carousal;

    public MovieList() {

    }

    public MovieList(int MovieID, String MovieName, String Description, int Durationhour, int Durationminute, String Trailer, int Year, int Rating, String status, String poster, String banner, String carousal) {
        this.MovieID = MovieID;
        this.MovieName = MovieName;
        this.Description = Description;
        this.Durationhour = Durationhour;
        this.Durationminute = Durationminute;
        this.Trailer = Trailer;
        this.Year = Year;
        this.Rating = Rating;
        this.status = status;
        this.poster = poster;
        this.banner = banner;
        this.carousal = carousal;
    }


    public int getMovieID() {
        return MovieID;
    }
    public void setMovieID(int movieID) {
        MovieID = movieID;
    }
    public String getMovieName() {
        return MovieName;
    }
    public void setMovieName(String movieName) {
        MovieName = movieName;
    }
    public String getDescription() {
        return Description;
    }
    public void setDescription(String description) {
        Description = description;
    }
    public int getDurationhour() {
        return Durationhour;
    }
    public void setDurationhour(int durationhour) {
        Durationhour = durationhour;
    }
    public int getDurationminute() {
        return Durationminute;
    }
    public void setDurationminute(int durationminute) {
        Durationminute = durationminute;
    }
    public String getTrailer() {
        return Trailer;
    }
    public void setTrailer(String trailer) {
        Trailer = trailer;
    }
    public int getYear() {
        return Year;
    }
    public void setYear(int year) {
        Year = year;
    }
    public int getRating() {
        return Rating;
    }
    public void setRating(int rating) {
        Rating = rating;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getPoster() {
        return poster;
    }
    public void setPoster(String poster) {
        this.poster = poster;
    }
    public String getBanner() {
        return banner;
    }
    public void setBanner(String banner) {
        this.banner = banner;
    }
    public String getCarousal() {
        return carousal;
    }
    public void setCarousal(String carousal) {
        this.carousal = carousal;
    }
}
