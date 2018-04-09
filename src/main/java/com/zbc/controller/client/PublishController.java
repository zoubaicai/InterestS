package com.zbc.controller.client;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.JwtService;
import com.zbc.service.UserInfoService;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.zbc.service.SubstanceInfoService;
import com.zbc.util.ParamsUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
public class PublishController {

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private JwtService jwtService;

    /**
     * 没有登录返回404，如果携带id参数则进一步判断
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/client/publish")
    public ModelAndView client_publish(HttpServletRequest request) throws Exception {
        long substanceId = -1;
        try {
            String temp = request.getParameter("id");
            substanceId = !"".equals(temp) ? Long.parseLong(temp) : -1;
        } catch (NumberFormatException e){
            substanceId = -1;
        }
        long userId = jwtService.hasUserLogin(request);
        if (userId == -1){
            return new ModelAndView("404 page");
        } else {
            UserInfoPO userInfoPO = userInfoService.selectByPrimaryKey(userId);
            if (userInfoPO.getIsVerified() == (byte)0){
                return new ModelAndView("/client/email_no_verify");
            }
        }
        ModelAndView modelAndView = new ModelAndView("client/publish");
        if (substanceId == -1){
            modelAndView.addObject("substanceInfo",new SubstanceInfoPO());
            modelAndView.addObject("isUpdate","0");
            return modelAndView;
        } else {
            SubstanceInfoPO po = substanceInfoService.selectIncludeContent(substanceId);
            if (null == po.getId()){
                return new ModelAndView("404 page");
            }
            if (userId != po.getBelongUserId()){
                return new ModelAndView("404 page");
            }
            modelAndView.addObject("substanceInfo",po);
            modelAndView.addObject("isUpdate","1");
            return modelAndView;
        }
    }

    // TODO 提交成功后发一条消息给用户
    /**
     * 添加用户提交的新内容到 substance_info
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/client/publishInfo",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String publishInfo(HttpServletRequest request) throws Exception {
        String caption = request.getParameter("caption").trim();
        String summary = request.getParameter("summary").trim();
        String cover = request.getParameter("cover").trim();
        String mainContent = request.getParameter("mainContent").trim();
        String locationSwitch = request.getParameter("locationSwitch").trim();
        String location = request.getParameter("location").trim();
        String invitationSwitch = request.getParameter("invitationSwitch").trim();
        String invitationCode = request.getParameter("invitationCode").trim();
        String anonymousSwitch = request.getParameter("anonymousSwitch").trim();
        String isUpdate = request.getParameter("isUpdate").trim();
        String substanceId = request.getParameter("substanceId").trim();
        JSONObject res = new JSONObject();
        if (caption.length() < 2 || caption.length() > 20){
            return packErrorDes(res,"标题长度不能小于2或大于20","").toJSONString();
        }
        if (mainContent.length() < 10 || mainContent.length() > 2000){
            return packErrorDes(res,"主要内容长度不能小于2或大于2000","").toJSONString();
        }
        if ("1".equals(locationSwitch) && !Pattern.matches("^.+,.+,.+$",location)){
            return packErrorDes(res,"定位信息不合法，请刷新页面重试","").toJSONString();
        }
        if ("1".equals(invitationSwitch) && !Pattern.matches("[0-9a-zA-Z]{8}",invitationCode)){
            return packErrorDes(res,"请输入正确的邀请码","").toJSONString();
        }
        if (!Pattern.matches(".+(.jpg|.jpeg|.png|.bmp|.gif)$",cover)){
            cover = ""; // 如果不是合法的图片地址，直接赋值为空
        }
        long id = jwtService.hasUserLogin(request);
        if (id == -1){
            return packErrorDes(res,"无效的登录信息！","").toJSONString();
        }
        SubstanceInfoPO po = new SubstanceInfoPO();
        po.setSubject(caption);
        po.setSummary(summary);
        po.setBelongUserId(id);
        po.setCover(cover);
        if ("1".equals(locationSwitch)){
            po.setIsRealistic((byte)1);
            po.setLocale(location);
        } else {
            po.setIsRealistic((byte)0);
            po.setLocale("");
        }
        if ("1".equals(invitationSwitch)){
            po.setIsRestricted((byte)1);
            po.setJoinCode(invitationCode);
        } else {
            po.setIsRestricted((byte)0);
            po.setJoinCode("");
        }
        if (!"1".equals(anonymousSwitch)){
            po.setIsAnonymousPermit((byte)0);
        } else {
            po.setIsAnonymousPermit((byte)1);
        }
        int int_res = -1;
        if ("0".equals(isUpdate)){
            int_res = substanceInfoService.insertSelective(po,mainContent);
        } else if ("1".equals(isUpdate)){
            long temp_id = Long.parseLong(substanceId);
            po.setId(temp_id);
            int_res = substanceInfoService.updateByPrimaryKeySelective(po,mainContent);
        }
        if (int_res > 0){
            return packErrorDes(res,"操作成功！请等待审核。","1").toJSONString();
        } else {
            return packErrorDes(res,"系统错误！","").toJSONString();
        }
    }

    /**
     * 图片上传
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/client/publishImgUpload",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String publishImgUpload(HttpServletRequest request) throws Exception {
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Map<String,MultipartFile> files = multipartHttpServletRequest.getFileMap();
        long id = jwtService.hasUserLogin(request);
        if (id == -1){
            return packErrorDes(new JSONObject(),"无效的登录信息！","").toJSONString();
        }
        String targetPath = request.getSession().getServletContext().getRealPath("/") + "WEB-INF\\statics\\images\\user_upload\\" + id + "\\";
    //System.out.println(targetPath);
        File temp = new File(targetPath);
        if (!temp.isDirectory()){
            temp.mkdirs();
        }
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        JSONObject res = new JSONObject();
        for (MultipartFile file : files.values()){
            String originName = file.getOriginalFilename();
            String ext = originName.substring(originName.lastIndexOf(".") + 1);
            if (file.getSize() > 1024 * 1024 * 2){
                res.put("des","图片大小限制位2M");
                return res.toJSONString();
            }
            if (!Pattern.matches("jpg|jpeg|png|gif|bmp",ext)){
                res.put("des","不是正确的图片格式");
                return res.toJSONString();
            }
            String targetName = id + "_" + dateTimeFormatter.format(LocalDateTime.now()) + "." + ext;
            File toFile = new File(targetPath + targetName);
            file.transferTo(toFile);
            Thumbnails.of(toFile).size(800, 600).toFile(toFile);// 强制压缩为800x600
        //System.out.println("保存成功 " + toFile.getAbsolutePath());
            res.put("des","上传成功");
            res.put("url","/images/user_upload/" + id + "/" + targetName);
            return res.toJSONString();
        }
        res.put("des","没有文件被接收");
        return res.toJSONString();
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
