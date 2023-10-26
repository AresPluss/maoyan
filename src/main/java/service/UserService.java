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
    public boolean addUser(String sql, User user){
        String sqlCheck = "select * from users where userName=?";
        User duplicateUser = userDao.getUserByUserName(sqlCheck, user.getUserName());
        if(duplicateUser != null && duplicateUser.getUserName() != null)
            return false;
        int res = userDao.addUser(sql, user);
        if(res > 0)
            return true;
        else
            return false;
    }
}
