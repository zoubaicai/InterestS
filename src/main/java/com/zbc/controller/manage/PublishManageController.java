package com.zbc.controller.manage;

import com.zbc.pojo.MsgInfoPO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.service.MsgInfoService;
import com.zbc.service.SubstanceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class PublishManageController {

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @Autowired
    private MsgInfoService msgInfoService;

    /**
     * ！！！代码出现冗余
     * 返回审核通过的内容
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/manage/substance_verified")
    public ModelAndView substance_verified(HttpServletRequest request) throws UnsupportedEncodingException {
        String offsetStr = request.getParameter("p");
        String searchStr = request.getParameter("s");
        if (null == offsetStr || !Pattern.matches("^[0-9]+$",offsetStr)){
            offsetStr = "1";
        }
        int offset = Integer.parseInt(offsetStr);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setRows(20);
        pagingInfo.setOffset((offset - 1) * 20);
        pagingInfo.setVerifyFlag((byte)1);
        if (!"".equals(searchStr) && null != searchStr){
            searchStr = URLDecoder.decode(searchStr,"utf-8");
            pagingInfo.setSearchStr("%" + searchStr + "%");
        }
        List<SubstanceInfoPO> lists = substanceInfoService.listIncludeContent(pagingInfo);
        int sum = substanceInfoService.countAll((byte)0);
        ModelAndView modelAndView = new ModelAndView("manage/substance_verified");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",(sum / 20) % 20 +1);
        return modelAndView;
    }

    /**
     * 返回未审核的数据
     * @param request
     * @return
     */
    @RequestMapping(value = "/manage/substance_no_verify")
    public ModelAndView substance_no_verify(HttpServletRequest request) throws UnsupportedEncodingException {
        String offsetStr = request.getParameter("p");
        String searchStr = request.getParameter("s");
        if (null == offsetStr || !Pattern.matches("^[0-9]+$",offsetStr)){
            offsetStr = "1";
        }
        int offset = Integer.parseInt(offsetStr);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setRows(20);
        pagingInfo.setOffset((offset - 1) * 20);
        pagingInfo.setVerifyFlag((byte)0);
        if (!"".equals(searchStr) && null != searchStr){
            searchStr = URLDecoder.decode(searchStr,"utf-8");
            pagingInfo.setSearchStr("%" + searchStr + "%");
        }
        List<SubstanceInfoPO> lists = substanceInfoService.listIncludeContent(pagingInfo);
        int sum = substanceInfoService.countAll((byte)0);
        ModelAndView modelAndView = new ModelAndView("manage/substance_no_verify");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",(sum / 20) % 20 +1);
        return modelAndView;
    }

    /**
     * 根据id 返回指定内容的详细内容
     * @param request
     * @return
     */
    @RequestMapping(value = "/manage/content_detail")
    public ModelAndView content_detail(HttpServletRequest request){
        String id = request.getParameter("id");
        if (null == id || !Pattern.matches("^[1-9]+$",id)){
            return new ModelAndView("404 page");
        }
        long substanceId = Long.parseLong(id);
        SubstanceInfoPO po = substanceInfoService.selectIncludeContent(substanceId);
        ModelAndView modelAndView = new ModelAndView("manage/content_detail");
        modelAndView.addObject("po",po);
        return modelAndView;
    }

    /**
     * 更改内容的审核结果，并添加审核结果的原因
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/manage/verifyContent",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String verifyContent(HttpServletRequest request) throws UnsupportedEncodingException {
        String state = URLDecoder.decode(request.getParameter("state"),"utf-8");
        String stateStr = URLDecoder.decode(request.getParameter("stateStr"),"utf-8");
        long substanceId = Long.parseLong(request.getParameter("id"));
        SubstanceInfoPO po = new SubstanceInfoPO();
        po.setId(substanceId);
        if ("通过".equals(state)){
            po.setIsVerified((byte)1);
        } else if("不通过".equals(state)){
            po.setIsVerified((byte)2);
        } else {
            po.setIsVerified((byte)0);
        }
        po.setUnverifiedFactor(stateStr);
        int res = substanceInfoService.updateByPrimaryKeySelectiveOnly(po);
        if (res > 0){
            // 审核后发送一条消息给发布人
            po = substanceInfoService.selectIncludeContent(substanceId);
            MsgInfoPO infoPO = new MsgInfoPO();
            infoPO.setBelongUserId(po.getBelongUserId());
            infoPO.setMsgContent("您发布的主题为\"" + po.getSubject() + "\"的内容审核结果为<mark>" + state + "</mark>,可能的原因是<b>" + stateStr + "</b>");
            msgInfoService.insertSelective(infoPO);
            return "1";
        } else {
            return "-2";
        }
    }


    /**
     * ！！！代码出现冗余
     * 返回审核未通过的内容
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/manage/substance_fail_verified")
    public ModelAndView substance_fail_verified(HttpServletRequest request) throws UnsupportedEncodingException {
        String offsetStr = request.getParameter("p");
        String searchStr = request.getParameter("s");
        if (null == offsetStr || !Pattern.matches("^[0-9]+$",offsetStr)){
            offsetStr = "1";
        }
        int offset = Integer.parseInt(offsetStr);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setRows(20);
        pagingInfo.setOffset((offset - 1) * 20);
        pagingInfo.setVerifyFlag((byte)2);
        if (!"".equals(searchStr) && null != searchStr){
            searchStr = URLDecoder.decode(searchStr,"utf-8");
            pagingInfo.setSearchStr("%" + searchStr + "%");
        }
        List<SubstanceInfoPO> lists = substanceInfoService.listIncludeContent(pagingInfo);
        int sum = substanceInfoService.countAll((byte)0);
        ModelAndView modelAndView = new ModelAndView("manage/substance_fail_verified");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",(sum / 20) % 20 +1);
        return modelAndView;
    }
}
