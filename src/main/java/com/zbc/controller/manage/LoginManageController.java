package com.zbc.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginManageController {
    @RequestMapping(value = "/manage/login_m")
    public String client_content(){
        return "manage/login_m";
    }

    @RequestMapping(value = "/manage/loginValidation")
    @ResponseBody
    public String login_validation(HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ("admin".equals(username) && "admin".equals(password)){
            request.getSession().setAttribute("admin","admin");
            return "1";
        } else {
            return "-1";
        }
    }
}
