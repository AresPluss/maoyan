package service;

import dao.RoomDao;
import entity.Room;

import java.sql.Timestamp;
import java.util.*;

public class RoomService2 {
    RoomDao roomDao = new RoomDao();
    public List<List<Map<String, Object>>> getShowingList(String sql, String cinema_id, String movie_id){
        String sqlForRoomId = "select * from room where cinemaId=?";
        List<Room> roomList = roomDao.getRoomsId(sqlForRoomId, cinema_id);
        List<List<Map<String, Object>>> list = new ArrayList<>();
        for(Room room : roomList){
            List<Map<String, Object>> tempList = new ArrayList<>
                    (roomDao.getShowingList(sql, room.getId() + "", movie_id));
            if(tempList.size() > 0){
                tempList.sort(Comparator.comparing(e -> (Timestamp)e.get("startTime")));
                list.add(tempList);
            }
        }
        return list;
    }
}
