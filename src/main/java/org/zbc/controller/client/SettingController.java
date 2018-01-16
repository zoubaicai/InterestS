package org.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {
    @RequestMapping(value = "/client/setting")
    public String client_content(){
        return "client/setting";
    }
}
