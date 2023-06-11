package net.ltr.controller;

import com.github.pagehelper.PageInfo;
import net.ltr.entity.User;
import net.ltr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/admin/user/page/{pageNum}")
    public String userShare (@PathVariable("pageNum") Integer pageNum, User user, Model model, Model model1, Model model2, String message) {
        PageInfo<User> userPageInfo = userService.getUser(user, pageNum);
        model.addAttribute("userPageInfo", userPageInfo);
        model1.addAttribute("user", user);
        model2.addAttribute("message", message);
        return "user";
    }

    @RequestMapping("/userDelete/{id}")
    public String userDelete (@PathVariable("id") Integer id) {
        int rows = userService.deleteUser(id);
        String message;
        if(rows > 0) {
            message = "删除成功";
        }
        else {
            message = "删除失败";
        }
        return "forward:/admin/user/page/1?message="+message;
    }
}
