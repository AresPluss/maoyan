package service;

import dao.RoomDao;
import entity.Room;

import java.sql.Timestamp;
import java.util.*;

public class RoomService {
    RoomDao roomDao = new RoomDao();
    public List<Map<String, Object>> getShowingList(String sql, String cinema_id, String movie_id){
        String sqlForRoomId = "select * from room where cinemaId=?";
        List<Room> roomList = roomDao.getRoomsId(sqlForRoomId, cinema_id);
        List<Map<String, Object>> list = new ArrayList<>();
        for(Room room : roomList){
            List<Map<String, Object>> tempList = new ArrayList<>
                    (roomDao.getShowingList(sql, room.getId() + "", movie_id));
            list.addAll(tempList);
        }
        list.sort(Comparator.comparing(e -> (Timestamp)e.get("startTime")));
        return list;
    }
}
