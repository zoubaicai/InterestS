package com.zbc.controller.client;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.SubstanceInfoPO;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.zbc.service.SubstanceInfoService;
import com.zbc.util.ParamsUtils;

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

    @RequestMapping(value = "/client/publish")
    public String client_publish(){
        return "client/publish";
    }

    @RequestMapping(value = "/client/publishInfo",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String publishInfo(HttpServletRequest request){
        String caption = request.getParameter("caption");
        String summary = request.getParameter("summary");
        String cover = request.getParameter("cover");
        String mainContent = request.getParameter("mainContent");
        String locationSwitch = request.getParameter("locationSwitch");
        String location = request.getParameter("location");
        String invitationSwitch = request.getParameter("invitationSwitch");
        String invitationCode = request.getParameter("invitationCode");
        String anonymousSwitch = request.getParameter("anonymousSwitch");
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
        SubstanceInfoPO po = new SubstanceInfoPO();
        po.setSubject(caption);
        po.setSummary(summary);
        long id = Long.parseLong(getAud((String)request.getAttribute("token")));
        po.setBelongUserId(id);
        po.setCover(cover);
        if ("1".equals(locationSwitch)){
            po.setIsRealistic((byte)1);
            po.setLocale(location);
        }
        if ("1".equals(invitationSwitch)){
            po.setIsRestricted((byte)1);
            po.setJoinCode(invitationCode);
        }
        if (!"1".equals(anonymousSwitch)){
            po.setIsAnonymousPermit((byte)0);
        }
        int insert_res = substanceInfoService.insertSelective(po,mainContent);
        if (insert_res > 0){
            return "success";
        } else {
            return "error";
        }
        // TODO 优化没做
    }

    @RequestMapping(value = "/client/publishImgUpload",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    // 用户图片上传
    public String publishImgUpload(HttpServletRequest request) throws IOException {
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Map<String,MultipartFile> files = multipartHttpServletRequest.getFileMap();
        long id = Long.parseLong(getAud((String)request.getAttribute("token")));
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
                res.put("err_des","图片大小限制位2");
                return res.toJSONString();
            }
            if (!Pattern.matches("jpg|jpeg|png|gif|bmp",ext)){
                res.put("err_des","不是正确的图片格式");
                return res.toJSONString();
            }
            String targetName = id + "_" + dateTimeFormatter.format(LocalDateTime.now()) + "." + ext;
            File toFile = new File(targetPath + targetName);
            file.transferTo(toFile);
            Thumbnails.of(toFile).size(800, 600).toFile(toFile);// 强制压缩为140x140
        System.out.println("保存成功 " + toFile.getAbsolutePath());
            res.put("err_des","上传成功");
            res.put("url","/images/user_upload/" + id + "/" + targetName);
            return res.toJSONString();
        }
        res.put("err_des","没有文件被接收");
        return res.toJSONString();
    }

    /**
     * 将token字符串中payload的aud取出来，即用户id
     * note：这里的token已经经过URLDecoder
     * @param token
     * @return
     */
    private String getAud(String token){
        String  base64_pl = token.split("\\.")[1];
        Base64.Decoder base64Decoder = Base64.getDecoder();
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
        o.put("error_des",des);
        o.put("error_id",id);
        return o;
    }
}
