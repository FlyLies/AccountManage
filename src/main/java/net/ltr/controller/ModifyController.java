package net.ltr.controller;

import net.ltr.entity.Account;
import net.ltr.entity.User;
import net.ltr.service.AccountService;
import net.ltr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModifyController {
    @Autowired
    UserService userService;
    @Autowired
    AccountService accountService;

    /*修改账号相关*/
    @RequestMapping("/modifyAccount/{aid}")
    public String modifyAccount(@PathVariable("aid") Integer aid, Model model,Model model1) {
        Account account = accountService.getOneAccount(aid);
        User user = userService.getOneUserById(account.getUid());
        model.addAttribute("account",account);
        model1.addAttribute("user",user);
        return "modify";
    }

    @RequestMapping("/accountModify/{aid}")
    public String accountModify(@PathVariable("aid") Integer aid, Account account, Model model, Model model1, Model model2) {
        account.setAid(aid);
        int rows = accountService.modifyAccount(account);
        account = accountService.getOneAccount(aid);
        User user = userService.getOneUserById(account.getUid());
        String message;
        if(rows > 0) {
            message = "修改成功";
        }
        else {
            message = "修改失败";
        }
        model.addAttribute("account",account);
        model1.addAttribute("user",user);
        model2.addAttribute("message",message);
        return "modify";
    }

    /*修改网站相关*/
    @RequestMapping("/modifyWeb/{uid}/{wname}")
    public String modifyWeb(@PathVariable("uid") Integer uid, @PathVariable("wname") String wname, Model model,Model model1) {
        Account account = accountService.getOneWeb(uid,wname);
        System.out.println(account);
        User user = userService.getOneUserById(uid);
        System.out.println(user);
        model.addAttribute("account",account);
        model1.addAttribute("user",user);
        return "modifyWeb";
    }

    @RequestMapping("/webModify/{uid}/{wname}")
    public String webModify(@PathVariable("uid") Integer uid, @PathVariable("wname") String oldwname, Account account, Model model, Model model1, Model model2) {
        int rows = accountService.modifyWeb(account.getWname(), account.getWeb(), uid, oldwname);
        User user = userService.getOneUserById(uid);
        account = accountService.getOneWeb(uid,account.getWname());
        System.out.println(account);
        String message;
        if(rows > 0) {
            message = "修改成功";
        }
        else {
            message = "修改失败";
        }
        model.addAttribute("message",message);
        model1.addAttribute("user",user);
        model2.addAttribute("account",account);
        return "modifyWeb";
    }

    /*个人中心相关*/
    @RequestMapping("/modifyPassword/{id}")
    public String modifyPassword(@PathVariable("id") Integer id, Model model) {
        User user = userService.getOneUserById(id);
        model.addAttribute("user",user);
        return "personalcenter";
    }

    @RequestMapping("/passwordModify/{id}")
    public String passwordModify(@PathVariable("id") Integer id, String oldpassword, String newpassword, String newpassword2, Model model, Model model1) {
        User user = userService.getOneUserById(id);
        String message;
        if(user.getUpassword().equals(oldpassword) & newpassword.equals(newpassword2)) {
            user.setUpassword(newpassword);
            int rows = userService.modifyPassword(user);
            if(rows > 0) {
                message = "修改成功";
                model1.addAttribute("message",message);
                return "redirect:/toLogin";
            }
            else {
                message = "修改失败";
                model.addAttribute("user", user);
                model1.addAttribute("message", message);
                return "personalcenter";
            }
        }
        else if(user.getUpassword().equals(oldpassword)) {
            message = "旧密码错误";
            model.addAttribute("message",message);
            return "personalcenter";
        }
        else {
            message = "新密码与确认密码不相等";
            model.addAttribute("message",message);
            return "personalcenter";
        }
    }

    /*修改用户信息相关*/
    @RequestMapping("/modifyUser/{id}")
    public String modifyUser(@PathVariable("id") Integer id, Model model) {
        User user = userService.getOneUserById(id);
        model.addAttribute("user", user);
        return "modifyUser";
    }

    @RequestMapping("/userModify/{id}")
    public String userModify(@PathVariable("id") Integer id, User user, Model model, Model model1) {
        user.setId(id);
        System.out.println(user);
        int rows = userService.modifyUser(user);
        user = userService.getOneUserById(id);
        System.out.println(user);
        String message;
        if(rows > 0) {
            message = "修改成功";
        }
        else {
            message = "修改失败";
        }
        model.addAttribute("user", user);
        model1.addAttribute("message", message);
        return "modifyUser";
    }
}
