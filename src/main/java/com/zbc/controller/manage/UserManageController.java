package com.zbc.controller.manage;

import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.UserInfoPO;
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

    /**
     * 分页返回所有用户信息
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/manage/user_detail_info")
    public ModelAndView user_detail_info(HttpServletRequest request) throws UnsupportedEncodingException {
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

    @RequestMapping(value = "/manage/user_portrait_validate")
    public ModelAndView user_portrait_validate(HttpServletRequest request) throws UnsupportedEncodingException {
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

    @RequestMapping(value = "/manage/deletePortrait")
    @ResponseBody
    public String deletePortrait(HttpServletRequest request){
        long id = Long.parseLong(request.getParameter("id"));
        UserInfoPO po = new UserInfoPO();
        po.setId(id);
        po.setPortrait("");
        int res = userInfoService.updateByPrimaryKeySelective(po);
        if (res > 0){
            return "1";
        } else {
            return "-2";
        }
    }
}
