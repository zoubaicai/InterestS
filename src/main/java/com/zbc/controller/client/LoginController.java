package com.zbc.controller.client;

import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zbc.service.UserInfoService;
import com.zbc.util.MsgDigestUtils;
import com.zbc.util.ParamsUtils;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private UserInfoService userInfoService; // 自动注入用户表service bean

    @Autowired
    private JwtService jwtService; // jwt 生成和验证

    @RequestMapping(value = "/login")
    public String client_content(){
        return "client/login";
    }

    @RequestMapping(value = "/loginValidate",method = RequestMethod.POST,produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String loginValidate(HttpServletRequest request) throws Exception {
        // 参数
        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");
        JSONObject res = new JSONObject();
        if (!ParamsUtils.isMailAddress(userEmail.trim())){
            res.put("error_des","邮箱格式不正确");
            res.put("error_id","userEmail");
            return res.toJSONString();
        }
        if (!ParamsUtils.isRightPwd(userPwd.trim())){
            res.put("error_des","密码不正确");
            res.put("error_id","userPwd");
            return res.toJSONString();
        }
        // 新建临时用户信息对象
        UserInfoPO temp = new UserInfoPO();
        temp.setUserPwd(MsgDigestUtils.getDigest(userPwd,"sha-1"));
        temp.setUserEmail(userEmail);
        UserInfoPO req_po = userInfoService.selectByUserInfo(temp);
        if (!ParamsUtils.greaterThanZero(req_po.getId())){
            res.put("error_des","帐号或密码错误！");
            return res.toJSONString();
        }
        // 生成token
        // ...
        jwtService.genHeader();
        jwtService.putHeaderProp("type","JWT");
        jwtService.putHeaderProp("alg","HS256");
        jwtService.genPayload();
        jwtService.putPayloadProp("exp","25h");
        jwtService.putPayloadProp("aud",req_po.getId().toString());
        res.put("token",jwtService.getJwt());
        res.put("nickname",req_po.getUserNickname());
        String portrait = null == req_po.getPortrait() ? "/images/user.png" : req_po.getPortrait();
        res.put("portrait",portrait);
        res.put("des","登录成功");
        return res.toJSONString();
    }
}
