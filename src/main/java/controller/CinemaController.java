package controller;

import entity.Cinema;
import service.CinemaService;
import service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/cinema")
public class CinemaController extends BaseServlet {
    public static final int PAGE_LIMIT = 2;
    CinemaService cinemaService = new CinemaService();
    MovieService movieService = new MovieService();
    public void getCinemas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sqlForMovie = "select * from movies where id=?";
        request.setAttribute("movie",movieService.getMovieById(sqlForMovie, request.getParameter("id")));

        String sqlForCinemaTotal = "select count(*) from cinemas";
        request.setAttribute("cinemaTotal", cinemaService.getCinemaTotal(sqlForCinemaTotal));
        request.setAttribute("pageLimit", PAGE_LIMIT);

        String sql = "select * from cinemas limit ?,?";
        request.setAttribute("cinemaList",cinemaService.getCinemas(sql, request.getParameter("curr"), String.valueOf(PAGE_LIMIT)));

        request.getRequestDispatcher("view/cinema.jsp").forward(request,response);
    }
}
