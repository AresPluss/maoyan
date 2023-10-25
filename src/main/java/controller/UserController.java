package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import entity.User;
import jdk.nashorn.internal.ir.debug.JSONWriter;
import service.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/user")
public class UserController extends BaseServlet {
    UserService userService = new UserService();
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        String sql = "select * from users where userName=?";
        User userFromDB = userService.checkUser(sql, user);

        HttpSession session = request.getSession();
        session.setAttribute("user",user);

        PrintWriter printWriter = response.getWriter();
        printWriter.write(JSONObject.toJSONString(userFromDB));
    }
    public void loginOut(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        boolean result = false;
        PrintWriter printWriter = null;
        try{
            session.removeAttribute("user");
            result = true;
            printWriter = response.getWriter();
        }catch (Exception e){
            e.printStackTrace();
        }
        printWriter.write(JSON.toJSONString(result));
    }
}
