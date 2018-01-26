package org.zbc.controller.client;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zbc.pojo.UserInfoPO;
import org.zbc.service.UserInfoService;
import org.zbc.util.EmailUtils;
import org.zbc.util.ParamsUtils;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.UUID;

@Controller
public class RegisterController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/client/register")
    public String register_page(){
        return "client/register";
    }

    public String registerValidate(HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
        // 参数
        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");
        String userNickname = request.getParameter("userNickname");
        // 返回用JSON对象
        JSONObject res = new JSONObject();
        if (!ParamsUtils.isMailAddress(userEmail)){
            return packErrorDes(res,"邮箱格式不正确","").toJSONString();
        }
        if (ParamsUtils.greaterThanZero(userInfoService.selectByEmail(userEmail).getId())){
            return packErrorDes(res,"邮箱已经被注册了","").toJSONString();
        }
        if (!ParamsUtils.isRightPwd(userPwd)){
            return packErrorDes(res,"密码长度不能小于8或大于30且不能包含中文","").toJSONString();
        }
        if (userNickname.length() > 15){
            return packErrorDes(res,"昵称长度不能大于15","").toJSONString();
        }
        // 新建数据表对象
        UserInfoPO reg_po = new UserInfoPO();
        reg_po.setUserEmail(userEmail);
        reg_po.setUserPwd(userPwd);
        reg_po.setUserNickname(userNickname);
        // uuid
        String uuid = getUUIDStr();
        reg_po.setRegisterCode(uuid);
        // 发送一封验证邮件
        EmailUtils.sendEmail(userEmail,userNickname,"XXX网站感谢您的注册","");
        // 将信息插入到数据库
        // userInfoService.insertSelective(reg_po);
        res.put("des","注册成功");
        return res.toJSONString();
    }


    public String register_code(HttpServletRequest request){
        String code = request.getParameter("code");
        String email = request.getParameter("email");
        if (!ParamsUtils.isMailAddress(email)){
            return "email error";
        }
        if (code.length() != 32){
            return "code error";
        }
        UserInfoPO temp = new UserInfoPO();
        temp.setRegisterCode(code);
        temp.setUserEmail(email);
        Long id = userInfoService.selectByCodeAndEmail(temp).getId();
        if (!ParamsUtils.greaterThanZero(id)){
            return "不是正确的邮箱和注册码";
        }
        temp.setId(id);
        temp.setIsVerified((byte)1);
        temp.setUserEmail(null);
        temp.setRegisterCode("");
        temp.setGmtModified(new Timestamp(1));
        int update_res = userInfoService.updateByPrimaryKeySelective(temp);
        if (update_res > 0){
            return "succ";
        } else {
            return "error";
        }
    }
    /**
     * 将出错描述和错误标识打包
     * @param o
     * @param des
     * @param id
     * @return
     */
    private JSONObject packErrorDes(JSONObject o,String des,String id){
        o.put("error_des",des);
        o.put("error_id",id);
        return o;
    }

    /**
     * 得到一个没有‘-’符号的UUID字符串
     * @return
     */
    private String getUUIDStr(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
