package dao;

import entity.User;

public class UserDao {
    public User getUserByUserName(String sql, String userName){
        try {
            return jdbc2.selectOne(User.class, sql, userName);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
    public int addUser(String sql, User user){
        return jdbc2.doInsert(jdbc2.connection,sql,user.getUserName(),user.getPassword());
    }
}
