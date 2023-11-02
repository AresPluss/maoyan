package controller;

import entity.Movie;
import service.CinemaService;
import service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/details")
public class DetailController extends BaseServlet{

    MovieService movieService = new MovieService();
    public void getDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String sql = "select * from movies where id=?";
        Movie movie = movieService.getMovieById(sql,id);
        request.setAttribute("movie", movie);

        request.getRequestDispatcher("view/details.jsp").forward(request,response);
    }
}