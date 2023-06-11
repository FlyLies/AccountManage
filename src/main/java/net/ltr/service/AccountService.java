package net.ltr.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.ltr.dao.AccountDao;
import net.ltr.dao.UserDao;
import net.ltr.entity.Account;
import net.ltr.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    AccountDao accountDao;
    @Autowired
    UserDao userDao;

    /*查询个人账号*/
    public PageInfo<Account> getAccount (Account account, Integer pageNum) {
        User user = userDao.getOneUserById(account.getUid());
        /*开启分页功能*/
        PageHelper.startPage(pageNum,10);
        /*查询所有账号*/
        List<Account> accountList = accountDao.getAccount(account);
        for(Account a:accountList) {
            try {
                a.decrypt(user.getDes_key());
            } catch (Exception e) {
                System.out.println("解密失败!!!");
            }
        }
        return new PageInfo<>(accountList,5);
    }

    /*查询一个账号*/
    public Account getOneAccount (Integer aid) {
        Account account = accountDao.getOneAccount(aid);
        User user = userDao.getOneUserById(account.getUid());
        try {
            account.decrypt(user.getDes_key());
        } catch (Exception e) {
            System.out.println("解密失败!!!");
        }
        return account;
    }

    /*查询个人网站*/
    public PageInfo<Account> getWeb (Account account, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Account> accountList = accountDao.getWeb(account);
        return new PageInfo<>(accountList,5);
    }

    public Account getOneWeb (Integer uid, String wmane) {
        return accountDao.getOneWeb(uid,wmane);
    }

    public String getWebUrl (Integer uid, String wname) {
        return accountDao.getWebUrl(uid, wname);
    }

    /*修改网站*/
    public int modifyWeb (String wname, String web, Integer uid, String oldwname){
        return accountDao.modifyWeb(wname, web, uid, oldwname);
    }

    /*删除账号*/
    public int deleteAccount (Integer aid) {
        return accountDao.deleteAccount(aid);
    }

    public int deleteWeb (Integer uid, String wname) {
        return accountDao.deleteWeb(uid,wname);
    }

    /*添加账号*/
    public int addAccount (Account account) {
        User user = userDao.getOneUserById(account.getUid());
        try {
            account.encrypt(user.getDes_key());
        } catch (Exception e) {
            System.out.println("加密失败!!!");
        }
        return accountDao.addAccount(account);
    }

    /*修改账号*/
    public int modifyAccount (Account account) {
        User user = userDao.getOneUserById(account.getUid());
        try {
            account.encrypt(user.getDes_key());
        } catch (Exception e) {
            System.out.println("加密失败!!!");
        }
        return accountDao.modifyAccount(account);
    }
}
