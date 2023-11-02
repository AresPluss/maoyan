package service;

import dao.CinemaDao;
import entity.Cinema;
import entity.Movie;

import java.util.List;

public class CinemaService {
    CinemaDao cinemaDao = new CinemaDao();
    public List<Cinema> getCinemas(String sql){
        return cinemaDao.getCinemas(sql);
    }
}
