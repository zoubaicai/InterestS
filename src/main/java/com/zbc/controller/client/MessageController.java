package com.zbc.controller.client;

import com.zbc.pojo.MsgInfoPO;
import com.zbc.pojo.PagingInfo;
import com.zbc.service.JwtService;
import com.zbc.service.MsgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class MessageController {

    @Autowired
    private JwtService jwtService;

    @Autowired
    private MsgInfoService msgInfoService;

    /**
     * 返回消息页,实现分页
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/client/message")
    public ModelAndView client_content(HttpServletRequest request) throws Exception {
        long nowUserId = jwtService.hasUserLogin(request);
        String p = request.getParameter("p");
        if (nowUserId == -1L || null == p || !Pattern.matches("^[1-9]+$",p)){
        return new ModelAndView("404 page");
        }
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setOffset((Integer.parseInt(p) - 1) * 10);
        pagingInfo.setRows(10);
        pagingInfo.setId(nowUserId);
        List<MsgInfoPO> lists = msgInfoService.listByBelongUserId(pagingInfo);
        int sum = msgInfoService.countByBelongUserId(nowUserId);
        ModelAndView modelAndView = new ModelAndView("client/message");
        modelAndView.addObject("lists",lists);
        modelAndView.addObject("sum",sum / 10 + 1);
        return modelAndView;
}

    /**
     * 返回用户未读的消息个数
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/client/remainMsg")
    @ResponseBody
    public String remainMsg(HttpServletRequest request) throws Exception {
        long nowUserId = jwtService.hasUserLogin(request);
        int sum = msgInfoService.countNoRead(nowUserId);
        return String.valueOf(sum);
    }

    /**
     * 更改指定id的记录的 is_read 为 1
     * @param request
     * @return
     */
    @RequestMapping(value = "/client/reverseState")
    @ResponseBody
    public String reverseState(HttpServletRequest request){
        long id = Long.parseLong(request.getParameter("id"));
        int isRead = Integer.parseInt(request.getParameter("isRead"));
        if (isRead == 0){
            MsgInfoPO msgInfoPO = new MsgInfoPO();
            msgInfoPO.setId(id);
            msgInfoPO.setIsRead((byte)1);
            int res = msgInfoService.updateByPrimaryKeySelective(msgInfoPO);
            if (res > 0){
                return "1";
            } else {
                return "-2";
            }
        } else {
            return "1";
        }
    }

    /**
     * 根据id删除指定的消息
     * @param request
     * @return
     */
    @RequestMapping(value = "/client/deleteMsg")
    @ResponseBody
    public String deleteMsg(HttpServletRequest request){
        long id = Long.parseLong(request.getParameter("id"));
        int res = msgInfoService.deleteByPrimaryKey(id);
        if (res > 0){
            return "1";
        } else {
            return "-2";
        }
    }
}
