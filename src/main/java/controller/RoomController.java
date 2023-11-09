package controller;

import entity.Cinema;
import entity.Movie;
import entity.Room;
import service.CinemaService;
import service.MovieService;
import service.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/showing")
public class RoomController extends BaseServlet {
    RoomService roomService = new RoomService();
    MovieService movieService = new MovieService();
    CinemaService cinemaService = new CinemaService();
    public void getShowingList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = "select r.roomName,s.startTime,s.discount\n" +
                "\tFROM room r,showtime s\n" +
                "\twhere r.id=s.roomId\n" +
                "\t\tand r.id=?\n" +
                "\t\tand s.movieId=?;";
        String cinema_id = request.getParameter("cinema_id");
        String movie_id = request.getParameter("movie_id");
        List<Map<String, Object>> list = roomService.getShowingList(sql, cinema_id, movie_id);
        request.setAttribute("showingList", list);

        String sqlForCinema = "select * from cinemas where id=?";
        Cinema cinema = cinemaService.getCinemaById(sqlForCinema, cinema_id);
        request.setAttribute("cinema", cinema);

        String sqlForMovie = "select * from movies where id=?";
        Movie movie = movieService.getMovieById(sqlForMovie, movie_id);
        request.setAttribute("movie", movie);

        request.getRequestDispatcher("view/showingList.jsp").forward(request,response);
    }
}
