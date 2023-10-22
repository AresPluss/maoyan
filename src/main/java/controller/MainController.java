package controller;

import entity.Movie;
import service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/")
public class MainController extends HttpServlet {
    MovieService movieService = new MovieService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sqlForFirstHalf = "select * from movies limit 4";
        request.setAttribute("movieList1", movieService.getMovies(sqlForFirstHalf));
        String sqlForSecondHalf = "select * from movies limit 4 offset 4";
        request.setAttribute("movieList2", movieService.getMovies(sqlForSecondHalf));

        request.getRequestDispatcher("view/maoyan.jsp").forward(request,response);
    }
}
