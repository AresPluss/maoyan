package entity;

import java.util.List;

public class Room {
    private int id;
    private String roomName;
    private int cinemaId;
    private List<ShowTime> playingList;

    public List<ShowTime> getPlayingList() {
        return playingList;
    }

    public void setPlayingList(List<ShowTime> playingList) {
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
