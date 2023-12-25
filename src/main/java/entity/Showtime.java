package entity;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Showtime {
    private int id;
    private int roomId;
    private int movieId;
    private LocalDateTime startTime;
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

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
}
