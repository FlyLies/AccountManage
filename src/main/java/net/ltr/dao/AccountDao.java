package net.ltr.dao;

import net.ltr.entity.Account;

import java.util.List;

public interface AccountDao {
    /*查询个人一个账号*/
    Account getOneAccount(Integer aid);

    /*查询个人账号*/
    List<Account> getAccount(Account account);

    /*查询个人网站*/
    List<Account> getWeb(Account account);

    Account getOneWeb(Integer uid, String wname);

    String getWebUrl(Integer uid, String wname);

    /*删除网站*/
    int deleteWeb(Integer uid, String wname);

    /*修改网站*/
    int modifyWeb(String wname, String web, Integer uid, String oldwname);

    /*删除账号*/
    int deleteAccount(Integer aid);

    /*添加账号*/
    int addAccount(Account account);

    /*修改账号*/
    int modifyAccount(Account account);
}
