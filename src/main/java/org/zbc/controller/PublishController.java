package org.zbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublishController {
    @RequestMapping(value = "/client/publish")
    public String client_publish(){
        return "client/publish";
    }
    @RequestMapping(value = "/client/demo")
    public String demo(){
        return "client/demo";
    }
}
