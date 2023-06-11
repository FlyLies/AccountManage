package net.ltr.dao;

import net.ltr.entity.User;

import java.util.List;

public interface UserDao {

    /*查询单个用户*/
    User getOneUser(User user);

    User getOneUserById(Integer id);

    /*查询用户*/
    List<User> getUser(User user);

    /*修改用户密码*/
    int modifyPassword(User user);

    /*修改用户信息*/
    int modifyUser(User user);

    /*注册*/
    int register(User user);

    /*查询密钥是否存在*/
    int checkKey(String des_key);

    /*删除用户*/
    int deleteUser(Integer id);
}