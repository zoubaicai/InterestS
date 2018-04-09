package com.zbc.controller;

import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.RecommendPO;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.service.RecommendService;
import com.zbc.service.SubstanceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @Autowired
    private RecommendService recommendService;

    /**
     * 主页
     * @return
     */
    @RequestMapping(value = "/")
    public ModelAndView client_content(){
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setOffset(0);
        pagingInfo.setRows(12);
        pagingInfo.setVerifyFlag((byte)1);
        List<SubstanceInfoPO> lists = substanceInfoService.listIncludeContent(pagingInfo);
        pagingInfo.setRows(2);
        List<RecommendPO> r_lists = recommendService.listLatestTwoItem(pagingInfo);
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("r_lists",r_lists);
        return modelAndView;
    }

}
