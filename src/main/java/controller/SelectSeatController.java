package controller;

import com.alibaba.fastjson.JSON;
import entity.Room;
import entity.Showtime;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/selectSeat")
public class SelectSeatController extends BaseServlet{
    RoomService roomService = new RoomService();
    ShowtimeService showtimeService = new ShowtimeService();
    public void getRoomDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sqlForShowtime = "select * from showtime where id=?";
        String showtimeId = request.getParameter("showtime_id");
        Showtime showtime = showtimeService.getShowtimeById(sqlForShowtime, showtimeId);

        String sqlForRoom = "select * from room where id=?";
        Room room = roomService.getRoomById(sqlForRoom, ""+showtime.getRoomId());

        int[][] seatGraph = showtimeService.getSeatGraph(room, showtime);

        request.setAttribute("graph", seatGraph);
        request.setAttribute("showtimeId", showtimeId);

        request.getRequestDispatcher("view/selectSeat.jsp").forward(request,response);
    }

    public void submitSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Integer> seats = JSON.parseArray(request.getParameter("seats"), Integer.class);
        String showtimeId = request.getParameter("showtimeId");
        String sql = "update showtime set redSeat=? where id=?";
        boolean updateResult = showtimeService.addSeats(sql, seats, showtimeId);
        response.getWriter().write(String.valueOf(updateResult));
    }
}
