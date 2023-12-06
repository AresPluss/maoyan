package controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.alipay.config.AlipayConfig;
import service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
