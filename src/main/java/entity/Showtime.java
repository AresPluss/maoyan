package entity;

import java.sql.Timestamp;

public class Showtime {
    private int id;
    private int roomId;
    private int movieId;
    private Timestamp startTime;
    private double discount;
    private String redSeat;

    public String getRedSeat() {
        return redSeat;
    }

    public void setRedSeat(String redSeat) {
        this.redSeat = redSeat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
}
