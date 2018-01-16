package org.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
    @RequestMapping(value = "/client/search")
    public String client_content(){
        return "client/search";
    }
    @RequestMapping(value = "/client/demo")
    public String demo(){
        return "client/demo";
    }
}
