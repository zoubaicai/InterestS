package com.zbc.controller.client;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.SubstanceContentPO;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.*;
import com.zbc.util.ParamsUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Base64;

@Controller
public class ContentController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @Autowired
    private GroupInfoService groupInfoService;

    @Autowired
    private UserCollectionService userCollectionService;

    @Autowired
    private JwtService jwtService; // jwt 生成和验证

    @RequestMapping(value = "/content")
    public ModelAndView client_content(HttpServletRequest request){
        String id = request.getParameter("id");
        if (null != id && !ParamsUtils.isPositiveInteger(id) || null == id){
            return new ModelAndView("nonexistent page");
        }
        long substanceId = Long.parseLong(id);
        // TODO 根据id获得substancePO对象，并且利用所属用户id得到该内容所有者的信息
        SubstanceInfoPO infoPO = substanceInfoService.selectIncludeContent(substanceId);
        // 取得组长信息
        long userId = infoPO.getBelongUserId();
        UserInfoPO userInfoPO = userInfoService.selectByPrimaryKey(userId);
        int joinCount = groupInfoService.countByUserId(userId);
        int collectCount = userCollectionService.countByUserId(userId);
        int publishCount = substanceInfoService.countByUserId(userId);
        // TODO 根据token判断是否有用户登录
        // TODO 查看该用户是否已经加入
        // TODO 评论内容另起一个ajax加载
        // TODO 根据上面的判断返回指定的内容
        return new ModelAndView("/client/content");
    }

    // TODO 登录用户添加评论

    // TODO 评论内容分页

}
