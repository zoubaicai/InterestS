package org.zbc.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublishManageController {

    @RequestMapping(value = "/manage/substance_verified")
    public String substance_verified(){
        return "manage/substance_verified";
    }

    @RequestMapping(value = "/manage/substance_no_verify")
    public String substance_no_verify(){
        return "manage/substance_no_verify";
    }

    @RequestMapping(value = "/manage/substance_fail_verified")
    public String substance_fail_verified(){
        return "manage/substance_fail_verified";
    }
}
