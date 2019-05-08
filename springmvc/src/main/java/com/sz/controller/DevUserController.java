package com.sz.controller;
import com.sz.pojo.DevUser;
import com.sz.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class DevUserController {

    @Autowired
    private DevUserService devUserService;
    /**
     * 去登录
     * @return
     */
    @GetMapping("/dev/index")
    public String devindex(){

        return "redirect:/toLogin";

    }

    @GetMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @PostMapping("/devuser/login")
    public String login(DevUser devUser, Model model, HttpSession session){
        System.out.println(devUser.getDevCode());
        System.out.println(devUser.getDevPassword());
        devUser = devUserService.login(devUser);
        if (devUser==null){
            model.addAttribute("errorMsg","登录失败");
            return "login";
        }
        session.setAttribute("devUsers",devUser);
        return "main";
    }
    @RequestMapping("/devuser/logout/{id}")
    public String loginout(@PathVariable("id")Integer id , HttpSession session){
        session.removeAttribute("devUser"+id);
        session.invalidate();
        return "redirect:/";
    }

}
