package org.zbc.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserManageController {
    @RequestMapping(value = "/manage/user_detail_info")
    public String user_detail_info(){
        return "manage/user_detail_info";
    }
    @RequestMapping(value = "/manage/user_portrait_validate")
    public String user_portrait_validate(){
        return "manage/user_portrait_validate";
    }
}
