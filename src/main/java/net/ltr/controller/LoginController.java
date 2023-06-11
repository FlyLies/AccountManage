package net.ltr.controller;

import net.ltr.entity.User;
import net.ltr.service.AccountService;
import net.ltr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserService userService;
    @Autowired
    AccountService accountService;

    @RequestMapping ("/loginCheck")
    public String loginCheck(User user, Model model, HttpSession session) {
        System.out.println(user);
        User userCheck = userService.getOneUser(user);
        System.out.println(userCheck);
        if(userCheck == null) {
            String message = "账号不存在";
            model.addAttribute("message",message);
            return "login";
        }
        else if(userCheck.getUpassword().equals(user.getUpassword())) {
            session.setAttribute("loginUser",user);
            if(userCheck.getIdentity().equals("admin")) {
                System.out.println("admin");
                return "forward:/admin/user/page/1";
            }
            else {
                System.out.println("user");
                return "forward:/key/"+userCheck.getId();
            }
        }
        else {
            String message = "密码错误";
            model.addAttribute("message",message);
            return "login";
        }
    }

    @RequestMapping("/toLogin")
    public String exit(HttpSession session) {
        session.invalidate();
        return "login";
    }
}
