package service;

import dao.UserDao;
import entity.User;

public class UserService {
    UserDao userDao = new UserDao();
    public User checkUser(String sql, User user){
        User userFromDB = userDao.getUserByUserName(sql, user.getUserName());
        if(userFromDB != null)
            if(user.getPassword().equals(userFromDB.getPassword()))
                return userFromDB;
        return null;
    }
}
