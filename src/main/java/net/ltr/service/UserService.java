package net.ltr.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.ltr.dao.UserDao;
import net.ltr.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    /*从容器中获取UserDao*/
    @Autowired
    UserDao userDao;

    /*查询一个用户信息*/
    public User getOneUser(User user) {
        return userDao.getOneUser(user);
    }

    public User getOneUserById(Integer id) {
        return userDao.getOneUserById(id);
    }

    /*查询用户信息*/
    public PageInfo<User> getUser(User user, Integer pageNum) {
        /*开启分页功能*/
        PageHelper.startPage(pageNum,10);
        List<User> userList = userDao.getUser(user);
        return new PageInfo<>(userList,5);
    }

    /*修改用户密码*/
    public int modifyPassword(User user) {
        return userDao.modifyPassword(user);
    }

    /*修改用户信息*/
    public int modifyUser(User user) {
        return userDao.modifyUser(user);
    }

    /*注册*/
    public int register(User user) {
        String des_key = "";
        do {
            des_key = "";
            for (int i = 0; i < 8; i++) {
                String randChar = String.valueOf(Math.round(Math.random() * 9));
                des_key = des_key.concat(randChar);
            }
        }while (userDao.checkKey(des_key) == 1);
        user.setDes_key(des_key);
        return userDao.register(user);
    }

    /*删除用户*/
    public int deleteUser (Integer id) {
        return userDao.deleteUser(id);
    }
}
