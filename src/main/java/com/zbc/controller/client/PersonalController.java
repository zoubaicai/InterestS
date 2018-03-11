package com.zbc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalController {
    @RequestMapping(value = "/client/personal")
    public String client_content(){
        return "client/personal";
    }

    // TODO 根据是否登录，判断是否加载个人设置按钮、添加、编辑等按钮

    // TODO 加入/收藏内容的删除功能

    // TODO 考虑是否添加发布内容的编辑功能
}
