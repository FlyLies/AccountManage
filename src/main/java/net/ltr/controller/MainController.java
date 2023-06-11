package net.ltr.controller;

import com.github.pagehelper.PageInfo;
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
public class MainController {

    @Autowired
    UserService userService;
    @Autowired
    AccountService accountService;

    @RequestMapping("/key/{id}")
    public String key(@PathVariable("id") Integer id, User user, Model model) {
        user = userService.getOneUserById(id);
        System.out.println(user);
        model.addAttribute("user",user);
        return "main_key";
    }

    @RequestMapping("/keyCheck/{id}")
    public String keyCheck(@PathVariable("id") Integer id,User user,Model model) {
        User userCheck = userService.getOneUserById(id);
        System.out.println(user);
        if(user.getDes_key().equals(userCheck.getDes_key())) {
            return "forward:/web/"+user.getId()+"/page/1";
        }
        else {
            String message = "密钥错误";
            model.addAttribute("message",message);
            return "main_key";
        }
    }

    @RequestMapping("/web/{id}/page/{pageNum}")
    public String webShare(@PathVariable("id") Integer id, @PathVariable("pageNum") Integer pageNum, Account account, Model model, Model model1, Model model2, Model model3, String message) {
        User user = userService.getOneUserById(id);
        account.setUid(id);
        PageInfo<Account> accountPageInfo = accountService.getWeb(account,pageNum);
        model.addAttribute("accountPageInfo", accountPageInfo);
        model1.addAttribute("user", user);
        model2.addAttribute("account", account);
        model3.addAttribute("message", message);
        return "main_web";
    }

    @RequestMapping("/account/{id}/{wname}/page/{pageNum}")
    public String accountShare(@PathVariable("id") Integer id, @PathVariable("pageNum") Integer pageNum, @PathVariable String wname, Account account, Model model, Model model1, Model model2) {
        User user = userService.getOneUserById(id);
        account.setUid(user.getId());
        account.setWname(wname);
        PageInfo<Account> accountPageInfo = accountService.getAccount(account,pageNum);
        System.out.println(user);
        System.out.println(account);
        System.out.println(accountPageInfo.getList());
        model.addAttribute("accountPageInfo", accountPageInfo);
        model1.addAttribute("user", user);
        model2.addAttribute("account", account);
        return "main";
    }

    @RequestMapping("deleteWeb/{uid}/{wname}")
    public String webDelete(@PathVariable("uid") Integer uid, @PathVariable("wname") String wname) {
        int rows = accountService.deleteWeb(uid,wname);
        String message;
        if(rows > 0) {
            message = "删除成功";
        }
        else {
            message = "删除失败";
        }
        return "forward:/web/"+uid+"/page/1?message="+message;
    }

    @RequestMapping("/deleteAccount/{uid}/{aid}")
    public String accountDelete(@PathVariable("uid") Integer uid, @PathVariable("aid") Integer aid, Model model, Model model1, Model model2) {
        int row = accountService.deleteAccount(aid);
        User user = userService.getOneUserById(uid);
        Account account = new Account();
        account.setUid(uid);
        PageInfo<Account> accountPageInfo = accountService.getAccount(account,1);
        String message;
        if(row > 0) {
            message = "删除成功";
        }
        else {
            message = "删除失败";
        }
        model.addAttribute("user",user);
        model1.addAttribute("accountPageInfo",accountPageInfo);
        model2.addAttribute("message",message);
        return "main";
    }
}
