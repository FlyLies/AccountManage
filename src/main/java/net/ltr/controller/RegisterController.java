package net.ltr.controller;

import net.ltr.entity.User;
import net.ltr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
    @Autowired
    UserService userService;

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/registerCheck")
    public String registerCheck(User user, Model model, Model key) {
        User check = userService.getOneUser(user);
        user.setIdentity("user");
        String message;
        if(check == null) {
            int row = userService.register(user);
            check = userService.getOneUser(user);
            if(row > 0) {
                message = "注册成功";
                model.addAttribute("message",message);
                key.addAttribute("key", check.getDes_key());
                return "login";
            }
            else {
                message = "注册失败";
                model.addAttribute("message",message);
                return "register";
            }
        }
        else {
            message = "该账号已注册";
            model.addAttribute("message",message);
            return "register";
        }
    }
}
