package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/asynchronous")
public class AlipayAsynchronous extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("异步通知");
        SelectSeatController selectSeatController = new SelectSeatController();
        selectSeatController.submitSelect(AlipayController.seats, AlipayController.showtimeId);
    }
}
