package org.zbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentController {

    @RequestMapping(value = "/client/content")
    public String client_content(){
        return "client/content";
    }

}
