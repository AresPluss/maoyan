package dao;

import entity.Room;

import java.util.List;
import java.util.Map;

public class RoomDao {
    public List<Map<String, Object>> getShowingList(String sql, String room_id, String movie_id){
        return jdbc2.selectList(sql,room_id,movie_id);
    }

    public List<Room> getRoomsId(String sql, String cinema_id){
        return jdbc2.selectList(Room.class, sql, cinema_id);
    }
}
