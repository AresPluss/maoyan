package dao;

import entity.Showtime;

import java.util.List;
import java.util.Map;

public class ShowtimeDao {
    public Showtime getShowtimeById(String sql, String id){
        try {
            return jdbc2.selectOne(Showtime.class, sql, id);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean addSeats(String sql, List<Integer> seats, String showtimeId){
        // 获取旧座位数据
        String sqlForOldSeats = "select redSeat from showtime where id=?";
        Map<String, Object> oldData = jdbc2.selectOne(sqlForOldSeats, showtimeId);
        String oldRedSeats = (String) oldData.get("redSeat");
        // 构建新座位数据
        StringBuilder newRedSeats = new StringBuilder();
        for(int i = 0; i < seats.size(); i+=2){
            newRedSeats.append(seats.get(i));
            newRedSeats.append(",");
            newRedSeats.append(seats.get(i+1));
            newRedSeats.append(";");
        }
        // 新旧座位数据合并，update到数据库
        newRedSeats.append(oldRedSeats);
        int updateRows = jdbc2.doUpdate(jdbc2.connection, sql, newRedSeats.toString(), showtimeId);
        return updateRows != 0;
    }
}
