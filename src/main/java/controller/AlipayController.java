package controller;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import entity.Cinema;
import entity.Movie;
import entity.Room;
import entity.Showtime;
import service.CinemaService;
import service.MovieService;
import service.RoomService;
import service.ShowtimeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/payPage")
public class AlipayController extends BaseServlet{
    public static List<Integer> seats;
    public static String showtimeId;
    public static String url;
    RoomService roomService = new RoomService();
    ShowtimeService showtimeService = new ShowtimeService();
    MovieService movieService = new MovieService();
    CinemaService cinemaService = new CinemaService();

    public void doPay(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, ServletException, IOException {
        seats = JSON.parseArray(request.getParameter("seats"), Integer.class);
        showtimeId = request.getParameter("showtimeId");

        int id = Integer.parseInt(request.getParameter("movieId"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String subject = request.getParameter("subject");
        String form = AlipayApplication.pay(id, totalPrice, subject);
        System.out.println(form);
        request.setAttribute("form",form);
        request.getRequestDispatcher("view/payPage.jsp").forward(request,response);
    }

    public void returnSelectSeatsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sqlForShowtime = "select * from showtime where id=?";
        Showtime showtime = showtimeService.getShowtimeById(sqlForShowtime, showtimeId);
        request.setAttribute("showtime",showtime);

        String sqlForRoom = "select * from room where id=?";
        Room room = roomService.getRoomById(sqlForRoom, ""+showtime.getRoomId());
        request.setAttribute("room", room);

        int[][] seatGraph = showtimeService.getSeatGraph(room, showtime);

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

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("异步通知");
//        SelectSeatController selectSeatController = new SelectSeatController();
//        selectSeatController.submitSelect(seats, showtimeId);
//    }
}
