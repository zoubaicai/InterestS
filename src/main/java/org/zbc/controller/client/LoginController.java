package org.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    @RequestMapping(value = "/client/login")
    public String client_content(){
        return "client/login";
    }
}
