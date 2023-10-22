package service;

import dao.MovieDao;
import entity.Movie;

import java.util.List;

public class MovieService {
    MovieDao movieDao = new MovieDao();
    public List<Movie> getMovies(String sql){
        return movieDao.getMovies(sql);
    }
    public Movie getMovieById(String sql, String id){
        return movieDao.getMovieById(sql,id);
    }
}
