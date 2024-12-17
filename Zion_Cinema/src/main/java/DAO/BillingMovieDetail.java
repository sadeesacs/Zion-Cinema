package model;

import java.util.List;

public class BillingMovieDetail {
    private String movieName = "spiderman";
    private String showDate;
    private String showTime;
    private List<String> seatDetails;
    

    // Getters and Setters
    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getShowDate() {
        return showDate;
    }

    public void setShowDate(String showDate) {
        this.showDate = showDate;
    }

    public String getShowTime() {
        return showTime;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public List<String> getSeatDetails() {
        return seatDetails;
    }

    public void setSeatDetails(List<String> seatDetails) {
        this.seatDetails = seatDetails;
    }
}
