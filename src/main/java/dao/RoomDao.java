package dao;

import entity.Room;
import entity.Showtime;

import java.util.List;
import java.util.Map;

public class RoomDao {
    public List<Map<String, Object>> getShowingList(String sql, String room_id, String movie_id){
        return jdbc2.selectList(sql,room_id,movie_id);
    }

    public Room getRoomById(String sql, String id){
        try {
            return jdbc2.selectOne(Room.class, sql, id);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Room> getRoomsId(String sql, String cinema_id){
        return jdbc2.selectList(Room.class, sql, cinema_id);
    }

    public List<Showtime> getShowingListById(String sql, int roomId, String movieId) {
        return jdbc2.selectList(Showtime.class, sql, roomId, movieId);
    }
}
