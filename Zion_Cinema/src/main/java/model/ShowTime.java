package model;

public class ShowTime {
    private String Movie;
    private String Date;
    private String Time;
    private String AdultPrice;
    private String ChildPrice;

    public ShowTime(){

    }

    public String getMovie() {
        return Movie;
    }
    public void setMovie(String movie) {
        Movie = movie;
    }
    public String getDate() {
        return Date;
    }
    public void setDate(String date) {
        Date = date;
    }
    public String getTime() {
        return Time;
    }
    public void setTime(String time) {
        Time = time;
    }
    public String getChildPrice() {
        return ChildPrice;
    }
    public void setChildPrice(String childPrice) {
        ChildPrice = childPrice;
    }
}
