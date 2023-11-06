package controller;

import entity.Movie;
import entity.ShowingItem;
import service.MovieService;
import service.ShowingItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/showing")
public class ShowingController extends BaseServlet {
    ShowingItemService showingItemService = new ShowingItemService();
    MovieService movieService = new MovieService();
    public void getShowingByMovieId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = "select * from room?_? where movie_id=?";
        String cinema_id = request.getParameter("cinema_id");
        String movie_id = request.getParameter("movie_id");
        List<ShowingItem> list = showingItemService.getShowingListById(sql, cinema_id, movie_id);
        request.setAttribute("showingList", list);

        String sqlForMovie = "select * from movies where id=?";
        Movie movie = movieService.getMovieById(sqlForMovie, movie_id);
        request.setAttribute("movie", movie);

        request.getRequestDispatcher("view/timeList.jsp").forward(request,response);
    }
}
