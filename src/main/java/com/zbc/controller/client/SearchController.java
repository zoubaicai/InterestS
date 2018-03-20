package com.zbc.controller.client;

import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.service.SubstanceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class SearchController {

    @Autowired
    private SubstanceInfoService substanceInfoService;
    /**
     * 必有取得分页页码参数和查询的字符串
     * @param request
     * @return
     */
    @RequestMapping(value = "/search",produces = {"text/html;charset=UTF-8;"})
    public ModelAndView client_content(HttpServletRequest request) throws UnsupportedEncodingException {
        String offsetStr = request.getParameter("p");
        String searchStr = URLDecoder.decode(request.getParameter("s"),"utf-8");
        if (!Pattern.matches("^[0-9]+$",offsetStr) || "".equals(searchStr)){
            return new ModelAndView("404 page");
        }
        int offset = Integer.parseInt(offsetStr);
        offset = offset > 0 ? offset - 1 : offset;
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setSearchStr("%" + searchStr + "%");
        pagingInfo.setOffset(offset * 10);
        pagingInfo.setRows(10);
        List<SubstanceInfoPO> lists = substanceInfoService.listBySearchStr(pagingInfo);
        int sum = substanceInfoService.countBySearchStr("%" + searchStr + "%");
        sum = (sum / 10 + 1) % 10;
        ModelAndView modelAndView = new ModelAndView("client/search");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",sum);
        modelAndView.addObject("searchStr",searchStr);
        return modelAndView;
    }
    @RequestMapping(value = "/client/demo")
    public String demo(){
        return "client/demo";
    }
}
