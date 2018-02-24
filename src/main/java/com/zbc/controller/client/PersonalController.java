package com.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalController {
    @RequestMapping(value = "/client/personal")
    public String client_content(){
        return "client/personal";
    }
}
