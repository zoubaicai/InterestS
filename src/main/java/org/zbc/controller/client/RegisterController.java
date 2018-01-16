package org.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
    @RequestMapping(value = "/client/register")
    public String client_content(){
        return "client/register";
    }
}
