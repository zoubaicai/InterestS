package com.zbc.controller.client;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.UserInfoService;
import com.zbc.util.EmailUtils;
import com.zbc.util.MsgDigestUtils;
import com.zbc.util.ParamsUtils;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

@Controller
public class SettingController {

    /** Base64 编码/解码器 JDK1.8 */
    private Base64.Decoder base64Decoder = Base64.getDecoder();
    private Base64.Encoder base64Encoder = Base64.getEncoder();

    private static final String EMAIL_CAPTCHA = "EMAIL_CAPTCHA";
    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/client/setting")
    // 个人设置请求
    public ModelAndView client_content(HttpServletRequest request){
        // System.out.println(request.getAttribute("token"));
        // 获得token，并且将payload中的‘aud’取出来
        String token = (String)request.getAttribute("token");
        long id = Long.parseLong(getAud(token));
        // 得到‘aud’对应的用户信息
        UserInfoPO po = userInfoService.selectByPrimaryKey(id);
        if (!ParamsUtils.isMailAddress(po.getUserEmail())){
            throw new IllegalStateException("no user discover");
        }
        po.setPortrait(null == po.getPortrait() ? "/images/user.png" : po.getPortrait());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userInfo",po);
        modelAndView.setViewName("client/setting");

        return modelAndView;
    }

    @RequestMapping(value = "/client/savePersonalInfo",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    // 保存个人资料请求
    public String savePersonalInfo(HttpServletRequest request){
        String userNickname = request.getParameter("userNickname");
        String userCity = request.getParameter("userCity");
        String userSex = request.getParameter("userSex");
        JSONObject res = new JSONObject();
        // 参数验证
        if (null == userNickname || userNickname.length() < 2){
            return packErrorDes(res,"昵称长度不能小于2","").toJSONString();
        }
        if (!Pattern.matches("男|女|保密",userSex)){
            return packErrorDes(res,"性别提交时发生了异常","").toJSONString();
        }
        UserInfoPO po = new UserInfoPO();
        long id = Long.parseLong(getAud((String)request.getAttribute("token")));
        po.setId(id);
        po.setUserNickname(userNickname);
        po.setCity(userCity);
        po.setSex(userSex);
        int update_res = userInfoService.updateByPrimaryKeySelective(po);
        if (update_res > 0){
            res.put("des","修改成功");
            return res.toJSONString();
        } else {
            return packErrorDes(res,"更改时发生异常","").toJSONString();
        }
    }

    @RequestMapping(value = "/client/savePortrait",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    // 保存头像
    public String savePortrait(HttpServletRequest request) throws IOException {
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Map<String,MultipartFile> files = multipartHttpServletRequest.getFileMap();
        String targetPath = request.getSession().getServletContext().getRealPath("/") + "WEB-INF\\statics\\images\\portrait\\";
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        long id = Long.parseLong(getAud((String)request.getAttribute("token")));
        JSONObject res = new JSONObject();
        for (MultipartFile file : files.values()){
            String originName = file.getOriginalFilename();
            String ext = originName.substring(originName.lastIndexOf(".") + 1);
            if (file.getSize() > 1024 * 1024 * 2){
                return packErrorDes(res,"图片大小限制位2M","").toJSONString();
            }
            if (!Pattern.matches("jpg|jpeg|png|gif|bmp",ext)){
                return packErrorDes(res,"不是合法的图片文件","").toJSONString();
            }
            String targetName = id + "_" + dateTimeFormatter.format(LocalDateTime.now()) + "." + ext;
            File toFile = new File(targetPath + targetName);
            file.transferTo(toFile);
            Thumbnails.of(toFile).size(140, 140).keepAspectRatio(false).toFile(toFile);// 强制压缩为140x140
            UserInfoPO po = new UserInfoPO();
            po.setId(id);
            po.setPortrait("/images/portrait/" + targetName);
            int update_res = userInfoService.updateByPrimaryKeySelective(po);
            if (update_res > 0){
                res.put("des","修改成功");
                res.put("src","/images/portrait/" + targetName);
                return res.toJSONString();
            } else {
                return packErrorDes(res,"修改发生了异常","").toJSONString();
            }
        }
        return packErrorDes(res,"上传没有成功","").toJSONString();
    }


    @RequestMapping(value = "/client/sendCaptchaCode",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    // 发送6位验证码到用户邮箱
    public String sendCaptchaCode(HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
        String userEmail = request.getParameter("userEmail");
        JSONObject res = new JSONObject();
        if (!ParamsUtils.isMailAddress(userEmail)){
            return packErrorDes(res,"邮箱不合法，请刷新页面重试","").toJSONString();
        }
        Random random = new Random();
        int captcha = random.nextInt(999999 - 100000 + 1) + 100000;
    //System.out.println(captcha);
        request.getSession().setAttribute(EMAIL_CAPTCHA,captcha + "");
    //System.out.println(request.getSession().getAttribute(EMAIL_CAPTCHA));
        EmailUtils.sendEmail(userEmail,"","邮箱验证码","您本次的验证码是<b>" + captcha + "</b>,在20分钟内有效");
        res.put("des","发送成功");
        return res.toJSONString();
    }

    @RequestMapping(value = "/client/modifyEmail",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    // 确认修改邮箱
    public String modifyEmail(HttpServletRequest request){
        String captchaCode = request.getParameter("captchaCode");
        String newEmail = request.getParameter("newEmail");
        String sessionCode = (String)request.getSession().getAttribute(EMAIL_CAPTCHA);
    System.out.println(captchaCode + "|" + sessionCode + "|" + newEmail);
        JSONObject res = new JSONObject();
        if (!captchaCode.equals(sessionCode)){
            packErrorDes(res,"验证码不正确","").toJSONString();
        }
        if (!ParamsUtils.isMailAddress(newEmail)){
            packErrorDes(res,"不是合法的邮箱","").toJSONString();
        }
        long id = Long.parseLong(getAud((String)request.getAttribute("token")));
        UserInfoPO po = new UserInfoPO();
        po.setId(id);
        po.setUserEmail(newEmail);
        int update_res = userInfoService.updateByPrimaryKeySelective(po);
        if (update_res > 0){
            res.put("des","修改成功");
            return res.toJSONString();
        } else {
            return packErrorDes(res,"修改发生了异常","").toJSONString();
        }
    }

    @RequestMapping(value = "/client/modifyPwd",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    // 修改密码
    public String modifyPassword(HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String nowPwd = request.getParameter("nowPwd");
        String newPwd = request.getParameter("newPwd");
        JSONObject res = new JSONObject();
        if (!ParamsUtils.isRightPwd(nowPwd) || !ParamsUtils.isRightPwd(newPwd)){
            return packErrorDes(res,"不是正确的密码格式","").toJSONString();
        }
        long id = Long.parseLong(getAud((String)request.getAttribute("token")));
        UserInfoPO po = userInfoService.selectByPrimaryKey(id);
        if (!po.getUserPwd().equals(MsgDigestUtils.getDigest(nowPwd,"sha-1"))){
            return packErrorDes(res,"当前密码输入错误","").toJSONString();
        }
        UserInfoPO toPo = new UserInfoPO();
        toPo.setId(id);
        toPo.setUserPwd(MsgDigestUtils.getDigest(newPwd,"sha-1"));
        int update_res = userInfoService.updateByPrimaryKeySelective(po);
        if (update_res > 0){
            res.put("des","修改成功");
            return res.toJSONString();
        } else {
            return packErrorDes(res,"修改发生了异常","").toJSONString();
        }
    }


    /**
     * 将token字符串中payload的aud取出来，即用户id
     * note：这里的token已经经过URLDecoder
     * @param token
     * @return
     */
    private String getAud(String token){
        String  base64_pl = token.split("\\.")[1];
        JSONObject payload = JSON.parseObject(new String(base64Decoder.decode(base64_pl)));
        String aud = payload.getString("aud");
        // 判断‘aud’是否是一个数字
        if (!ParamsUtils.isPositiveInteger(aud)){
            throw new IllegalArgumentException("it is not a legal user_id");
        }
        return aud;
    }

    /**
     * 将出错描述和错误标识打包
     * @param o
     * @param des
     * @param id
     * @return
     */
    private JSONObject packErrorDes(JSONObject o,String des,String id){
        o.put("des",des);
        o.put("id",id);
        return o;
    }
}
