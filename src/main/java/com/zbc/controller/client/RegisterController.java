package com.zbc.controller.client;

import com.alibaba.fastjson.JSONObject;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.UserInfoService;
import com.zbc.util.EmailUtils;
import com.zbc.util.MsgDigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.zbc.util.ParamsUtils;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Controller
public class RegisterController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private Producer captchaProducer;

    @RequestMapping(value = "/register")
    public String register_page(){
        return "/client/register";
    }

    @RequestMapping(value = "/captcha")
    // 验证码图片流
    public ModelAndView genCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        HttpSession session = request.getSession();
//        String code = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
//        System.out.println("******************验证码是: " + code + "******************");

        response.setDateHeader("Expires", 0);

        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");

        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");

        // return a jpeg
        response.setContentType("image/jpeg");

        // create the text for the image
        String capText = captchaProducer.createText();

        // store the text in the session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();

        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

    @RequestMapping(value = "/registerValidate",method = RequestMethod.POST,produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String registerValidate(HttpServletRequest request) throws UnsupportedEncodingException, MessagingException, NoSuchAlgorithmException {
        // 参数
        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");
        String userNickname = request.getParameter("userNickname");
        String captchaCode = request.getParameter("captchaCode");
        String captchaTxt = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        // 返回用JSON对象
        JSONObject res = new JSONObject();
        if (!captchaCode.equals(captchaTxt)){
            return packErrorDes(res,"验证码错误","captchaCode").toJSONString();
        }
        if (!ParamsUtils.isMailAddress(userEmail)){
            return packErrorDes(res,"邮箱格式不正确","userEmail").toJSONString();
        }
        if (ParamsUtils.greaterThanZero(userInfoService.selectByEmail(userEmail).getId())){
            return packErrorDes(res,"邮箱已经被注册了","userEmail").toJSONString();
        }
        if (!ParamsUtils.isRightPwd(userPwd)){
            return packErrorDes(res,"密码长度不能小于8或大于30且不能包含中文","userPwd").toJSONString();
        }
        if (userNickname.length() > 15){
            return packErrorDes(res,"昵称长度不能大于15","userNickname").toJSONString();
        }
        // 新建数据表对象
        UserInfoPO reg_po = new UserInfoPO();
        reg_po.setUserEmail(userEmail);
        reg_po.setUserPwd(MsgDigestUtils.getDigest(userPwd,"sha-1"));
        reg_po.setUserNickname(userNickname);
        // uuid
        String uuid = getUUIDStr();
        reg_po.setRegisterCode(uuid);
        // 发送一封验证邮件
        EmailUtils.sendEmail(userEmail,userNickname,"感谢您的注册","<p>请点击链接完成注册，<a href='http://localhost:8080/registerCodeValidate?code=" + uuid + "&email=" +userEmail + "'>验证</a></p>");
        // 将信息插入到数据库
        // userInfoService.insertSelective(reg_po);
        res.put("des","注册成功");
        return res.toJSONString();
    }

    @RequestMapping(value = "/registerCodeValidate",method = RequestMethod.GET)
    @ResponseBody
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
        int update_res = userInfoService.updateByPrimaryKeySelective(temp);
        if (update_res > 0){
            return "success";
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
