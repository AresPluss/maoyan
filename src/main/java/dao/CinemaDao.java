package dao;

import entity.Cinema;
import entity.Movie;

import java.util.List;

public class CinemaDao {
    public List<Cinema> getCinemas(String sql, String curr, String limit){
        return jdbc2.selectList(Cinema.class, sql, Integer.parseInt(curr)-1, Integer.parseInt(limit));
    }
    public Cinema getCinemaById(String sql, String id){
        try {
            return jdbc2.selectOne(Cinema.class, sql, id);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getCinemaTotal(String sql){
        return String.valueOf(jdbc2.selectList(sql).get(0).values().toArray()[0]);
    }
}
