package com.zbc.controller.client;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.service.SubstanceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class AllContentController {

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @RequestMapping(value = "/allcontent")
    public ModelAndView allContent(HttpServletRequest request){
        String c = request.getParameter("c");
        String p = request.getParameter("p");
        if (null == c || "".equals(c) || null == p || !Pattern.matches("^[1-9]+$",p)){
            return new ModelAndView("404 page");
        }
        PagingInfo pagingInfo = new PagingInfo();
        if ("default".equals(c)){
            pagingInfo.setClassFlag(0);
        } else if ("hasLocation".equals(c)){
            pagingInfo.setClassFlag(1);
        } else if ("noRestrict".equals(c)){
            pagingInfo.setClassFlag(2);
        }
        pagingInfo.setOffset((Integer.parseInt(p) - 1) * 24);
        pagingInfo.setRows(24);
        List<SubstanceInfoPO> lists = substanceInfoService.listByClassification(pagingInfo);
        int sum = substanceInfoService.countByClassification(pagingInfo);
        ModelAndView modelAndView = new ModelAndView("client/allcontent");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",(sum / 24) + 1);
        return modelAndView;
    }

}
