package dao;

import entity.Cinema;
import entity.Movie;

import java.util.List;

public class CinemaDao {
    public List<Cinema> getCinemas(String sql){
        return jdbc2.selectList(Cinema.class, sql);
    }
}
