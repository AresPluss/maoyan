package service;

import dao.RoomDao;
import entity.Room;
import entity.ShowTime;

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
    public List<List<Map<String, Object>>> getShowingList2(String sql, String cinema_id, String movie_id){
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
    public List<Room> getShowingList3(String sql, String room_id, String movie_id){
        String sqlForRoomId = "select * from room where cinemaId=?";
        List<Room> roomList = roomDao.getRoomsId(sqlForRoomId, room_id);
        Iterator<Room> iterator = roomList.listIterator();
        while(iterator.hasNext()){
            Room room = iterator.next();
            List<ShowTime> showTimeList = roomDao.getShowingListById(sql, room.getId(), movie_id);
            if(showTimeList.size() == 0){
                iterator.remove();
            } else {
                showTimeList.sort(Comparator.comparing(ShowTime::getStartTime));
                room.setPlayingList(showTimeList);
            }
        }
        return roomList;
    }
}
