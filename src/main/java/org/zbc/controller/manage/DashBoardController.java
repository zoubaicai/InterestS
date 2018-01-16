package org.zbc.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashBoardController {
    @RequestMapping(value = "/manage/dashboard")
    public String client_content(){
        return "manage/dashboard";
    }
}
