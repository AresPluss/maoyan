package entity;

import java.util.List;

public class Room {
    private int id;
    private String roomName;
    private int cinemaId;
    private int row;
    private int col;
    private String blankSeat;
    private List<Showtime> playingList;

    public String getBlankSeat() {
        return blankSeat;
    }

    public void setBlankSeat(String blankSeat) {
        this.blankSeat = blankSeat;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getCol() {
        return col;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public List<Showtime> getPlayingList() {
        return playingList;
    }

    public void setPlayingList(List<Showtime> playingList) {
        this.playingList = playingList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(int cinemaId) {
        this.cinemaId = cinemaId;
    }
}
