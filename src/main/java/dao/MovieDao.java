package dao;

import entity.Movie;

import java.util.List;

public class MovieDao {
    public List<Movie> getMovies(String sql){
        return jdbc2.selectList(Movie.class, sql);
    }
    public Movie getMovieById(String sql,String id){
        try {
            return jdbc2.selectOne(Movie.class,sql,id);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
}
