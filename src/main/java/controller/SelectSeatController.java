package controller;

import com.alibaba.fastjson.JSON;
import entity.Cinema;
import entity.Movie;
import entity.Room;
import entity.Showtime;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = "/selectSeat")
public class SelectSeatController extends BaseServlet{
    RoomService roomService = new RoomService();
    ShowtimeService showtimeService = new ShowtimeService();
    MovieService movieService = new MovieService();
    CinemaService cinemaService = new CinemaService();
    public void getRoomDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sqlForShowtime = "select * from showtime where id=?";
        String showtimeId = request.getParameter("showtime_id");
        Showtime showtime = showtimeService.getShowtimeById(sqlForShowtime, showtimeId);
        request.setAttribute("showtime",showtime);

        String sqlForRoom = "select * from room where id=?";
        Room room = roomService.getRoomById(sqlForRoom, ""+showtime.getRoomId());
        request.setAttribute("room", room);

        int[][] seatGraph = showtimeService.getSeatGraph(room, showtime);
//        for(int[] row : seatGraph){
//            System.out.println(Arrays.toString(row));
//        }

        request.setAttribute("graph", seatGraph);
        request.setAttribute("showtimeId", showtimeId);

        String sqlForMovie = "select * from movies where id=?";
        Movie movie = movieService.getMovieById(sqlForMovie, ""+showtime.getMovieId());
        request.setAttribute("movie", movie);

        String sqlForCinema = "select * from cinemas where id=?";
        Cinema cinema = cinemaService.getCinemaById(sqlForCinema, ""+room.getCinemaId());
        request.setAttribute("cinema",cinema);

        request.getRequestDispatcher("view/selectSeat.jsp").forward(request,response);
    }

    public void submitSelect(List<Integer> seats, String showtimeId) throws IOException {
        String sql = "update showtime set redSeat=? where id=?";
        boolean updateResult = showtimeService.addSeats(sql, seats, showtimeId);
//        if(updateResult)
//            System.out.println("座位添加成功！");
//        else
//            System.out.println("座位添加失败！");
    }
}
