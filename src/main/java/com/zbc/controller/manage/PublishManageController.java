package com.zbc.controller.manage;

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
public class PublishManageController {

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @RequestMapping(value = "/manage/substance_verified")
    public String substance_verified(){
        return "manage/substance_verified";
    }

    /**
     * 返回未审核的数据
     * @param request
     * @return
     */
    @RequestMapping(value = "/manage/substance_no_verify")
    public ModelAndView substance_no_verify(HttpServletRequest request){
        String offsetStr = request.getParameter("p");
        String searchStr = request.getParameter("s");
        if (!Pattern.matches("^[0-9]+$",offsetStr) || null == offsetStr){
            offsetStr = "1";
        }
        int offset = Integer.parseInt(offsetStr);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setRows(20);
        pagingInfo.setOffset((offset - 1) * 20);
        pagingInfo.setVerifyFlag((byte)0);
        if (!"".equals(searchStr) && null != searchStr){
            pagingInfo.setSearchStr(searchStr);
        }
        List<SubstanceInfoPO> lists = substanceInfoService.listIncludeContent(pagingInfo);
        int sum = substanceInfoService.countAll((byte)0);
        ModelAndView modelAndView = new ModelAndView("manage/substance_no_verify");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",sum);
        return modelAndView;
    }
    // TODO 前端还没有完成，新加的数据库查询语句，还没有测试

    @RequestMapping(value = "/manage/substance_fail_verified")
    public String substance_fail_verified(){
        return "manage/substance_fail_verified";
    }
}
