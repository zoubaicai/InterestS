package com.zbc.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginManageController {
    @RequestMapping(value = "/manage/login_m")
    public String client_content(){
        return "manage/login_m";
    }
}
