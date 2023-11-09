package dao;

import entity.Cinema;
import entity.Movie;

import java.util.List;

public class CinemaDao {
    public List<Cinema> getCinemas(String sql){
        return jdbc2.selectList(Cinema.class, sql);
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
}
