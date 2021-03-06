package com.zbc.controller.manage;

import com.zbc.pojo.MsgInfoPO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.MsgInfoService;
import com.zbc.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class UserManageController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private MsgInfoService msgInfoService;
    /**
     * 分页返回所有用户信息
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/manage/user_detail_info")
    public ModelAndView user_detail_info(HttpServletRequest request) throws UnsupportedEncodingException {
        if (!isLogin(request)){
            return new ModelAndView("/manage/login_m");
        }
        String offsetStr = request.getParameter("p");
        String searchStr = request.getParameter("s");
        if (null == offsetStr || !Pattern.matches("^[0-9]+$",offsetStr)){
            offsetStr = "1";
        }
        int offset = Integer.parseInt(offsetStr);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setRows(20);
        pagingInfo.setOffset((offset - 1) * 20);
        if (!"".equals(searchStr) && null != searchStr){
            searchStr = URLDecoder.decode(searchStr,"utf-8");
            pagingInfo.setSearchStr("%" + searchStr + "%");
        }
        List<UserInfoPO> lists = userInfoService.listUserInfo(pagingInfo);
        int sum = userInfoService.countAll();
        ModelAndView modelAndView = new ModelAndView("manage/user_detail_info");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",(sum / 20) % 20 +1);
        return modelAndView;
    }

    // 分页加载用户上传的头像
    @RequestMapping(value = "/manage/user_portrait_validate")
    public ModelAndView user_portrait_validate(HttpServletRequest request) throws UnsupportedEncodingException {
        if (!isLogin(request)){
            return new ModelAndView("/manage/login_m");
        }
        String offsetStr = request.getParameter("p");
        String searchStr = request.getParameter("s");
        if (null == offsetStr || !Pattern.matches("^[0-9]+$",offsetStr)){
            offsetStr = "1";
        }
        int offset = Integer.parseInt(offsetStr);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setRows(20);
        pagingInfo.setOffset((offset - 1) * 20);
        if (!"".equals(searchStr) && null != searchStr){
            searchStr = URLDecoder.decode(searchStr,"utf-8");
            pagingInfo.setSearchStr("%" + searchStr + "%");
        }
        List<UserInfoPO> lists = userInfoService.listUserInfo(pagingInfo);
        int sum = userInfoService.countAll();
        ModelAndView modelAndView = new ModelAndView("manage/user_portrait_validate");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",(sum / 20) % 20 +1);
        return modelAndView;
    }

    // 删除违规的头像
    @RequestMapping(value = "/manage/deletePortrait")
    @ResponseBody
    public String deletePortrait(HttpServletRequest request){
        long id = Long.parseLong(request.getParameter("id"));
        UserInfoPO po = new UserInfoPO();
        po.setId(id);
        po.setPortrait("");
        int res = userInfoService.updateByPrimaryKeySelective(po);
        if (res > 0){
            // 删除后发送一条消息给用户
            MsgInfoPO infoPO = new MsgInfoPO();
            infoPO.setBelongUserId(id);
            infoPO.setMsgContent("您上传的头像因不符合本网站的规则，对其进行了删除处理o(╥﹏╥)o");
            msgInfoService.insertSelective(infoPO);

            return "1";
        } else {
            return "-2";
        }
    }

    /**
     * 根据session 判断是否已经登录
     * @param request
     * @return
     */
    private boolean isLogin(HttpServletRequest request){
        String flag = String.valueOf(request.getSession().getAttribute("admin"));
        if (null == flag || !"admin".equals(flag)){
            return false;
        } else {
            return true;
        }
    }
}
