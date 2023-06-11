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

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AddController {
    @Autowired
    UserService userService;
    @Autowired
    AccountService accountService;

    @RequestMapping("/addAccount/{id}/{wname}")
    public String turnAdd(@PathVariable("id") Integer id, @PathVariable("wname") String wname, Model model, Model model1) {
        Account account = new Account();
        account.setWname(wname);
        User user = userService.getOneUserById(id);
        model.addAttribute("user",user);
        model1.addAttribute("account",account);
        return "add_account";
    }

    @RequestMapping("/addWeb/{id}")
    public String turnAddWeb(@PathVariable("id") Integer id, Model model) {
        User user = userService.getOneUserById(id);
        model.addAttribute("user",user);
        return "add";
    }

    @RequestMapping("/webAdd/{id}")
    public String webAdd(@PathVariable("id")Integer id, Account account, Model model, Model model1) {
        account.setUid(id);
        int rows = accountService.addAccount(account);
        User user = userService.getOneUserById(id);
        System.out.println(rows);
        String message;
        if(rows > 0) {
            message = "添加成功";
        }
        else {
            message = "添加失败";
        }
        model.addAttribute("message",message);
        model1.addAttribute("user",user);
        return "add";
    }

    @RequestMapping("/accountAdd/{uid}/{wname}")
    public String accountAdd(@PathVariable("uid") Integer uid, @PathVariable("wname") String wname, Account account, Model model, Model model1) {
        User user = userService.getOneUserById(uid);
        String web = accountService.getWebUrl(uid, wname);
        account.setUid(uid);
        account.setWname(wname);
        account.setWeb(web);
        int rows = accountService.addAccount(account);
        System.out.println(rows);
        String message;
        if(rows > 0) {
            message = "添加成功";
        }
        else {
            message = "添加失败";
        }
        model.addAttribute("message",message);
        model1.addAttribute("user",user);
        return "add_account";
    }
}
