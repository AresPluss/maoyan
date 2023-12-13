package service;

import dao.CinemaDao;
import entity.Cinema;
import entity.Movie;

import java.util.List;

public class CinemaService {
    CinemaDao cinemaDao = new CinemaDao();
    public List<Cinema> getCinemas(String sql, String curr, String limit){
        return cinemaDao.getCinemas(sql, curr, limit);
    }
    public Cinema getCinemaById(String sql, String id){
        return cinemaDao.getCinemaById(sql, id);
    }

    public String getCinemaTotal(String sql){
        return cinemaDao.getCinemaTotal(sql);
    }
}
