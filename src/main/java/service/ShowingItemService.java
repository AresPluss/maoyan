package service;

import dao.ShowingItemDao;
import dao.jdbc2;
import entity.ShowingItem;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ShowingItemService {
    ShowingItemDao showingItemDao = new ShowingItemDao();
    public List<ShowingItem> getShowingListById(String sql, String cinema_id, String movie_id){
        List<ShowingItem> list = new ArrayList<>();
        for(int i = 1; i < 5; i++){
            int cinemaId = Integer.parseInt(cinema_id);
            int movieId = Integer.parseInt(movie_id);
            List<ShowingItem> listTemp = showingItemDao.getShowingListById(sql, cinemaId, i, movieId);
            for(int j = 0; j < listTemp.size(); j++){
                listTemp.get(j).setRoomId(i);
            }
            list.addAll(listTemp);
        }
        list.sort(Comparator.comparing(ShowingItem::getStartTime));
        return list;
    }
}
