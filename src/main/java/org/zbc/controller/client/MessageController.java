package org.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
    @RequestMapping(value = "/client/message")
    public String client_content(){
        return "client/message";
    }
}
