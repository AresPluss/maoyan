package dao;

import entity.ShowingItem;

import java.util.ArrayList;
import java.util.List;

public class ShowingItemDao {
    public List<ShowingItem> getShowingListById(String sql, int cinemaId, int i, int movieId){
        return jdbc2.selectList(ShowingItem.class, sql, cinemaId, i, movieId);
    }
}
