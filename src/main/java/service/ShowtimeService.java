package service;

import dao.ShowtimeDao;
import entity.Room;
import entity.Showtime;

import java.util.Arrays;
import java.util.List;

public class ShowtimeService {
    ShowtimeDao showtimeDao = new ShowtimeDao();
    public Showtime getShowtimeById(String sql, String id){
        return showtimeDao.getShowtimeById(sql, id);
    }

    public int[][] getSeatGraph(Room room, Showtime showTime){
        // 该方法从数据库中获取各项座位数据信息，计算出座位图，交由前端处理
        // 在数据库中获取影厅座位表的总行数和列数
        int row = room.getRow();
        int col = room.getCol();
        // 根据行数和列数开辟二维int数组，存放座位图
        int[][] graph = new int[row][col];
        for(int[] arr : graph){
            Arrays.fill(arr, 0);
        }
        // 将空缺座位设置为-1
        if(room.getBlankSeat() != null && !room.getBlankSeat().isEmpty()){
            String[] blanks = room.getBlankSeat().split(";");
            for (String blank : blanks) {
                String[] points = blank.split(",");
                int[] coordinate = new int[4];
                for (int j = 0; j < 4; j++) {
                    coordinate[j] = Integer.parseInt(points[j]);
                }
                for (int p = coordinate[0]; p <= coordinate[2]; p++) {
                    for (int q = coordinate[1]; q <= coordinate[3]; q++) {
                        graph[p][q] = -1;
                    }
                }
            }
        }
        // 将已被购买的座位设置为1
        if(showTime.getRedSeat() != null && !showTime.getRedSeat().isEmpty()){
            String[] reds = showTime.getRedSeat().split(";");
            for (String red : reds) {
                String[] points = red.split(",");
                int x = Integer.parseInt(points[0]);
                int y = Integer.parseInt(points[1]);
                graph[x][y] = 1;
            }
        }
        return graph;
    }
    public boolean addSeats(String sql, List<Integer> seats, String showtimeId){
        return showtimeDao.addSeats(sql, seats, showtimeId);
    }
}
