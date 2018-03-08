package com.zbc.controller.client;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.*;
import com.zbc.service.*;
import com.zbc.util.ParamsUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ContentController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @Autowired
    private SubstanceCommentService substanceCommentService;

    @Autowired
    private GroupInfoService groupInfoService;

    @Autowired
    private UserCollectionService userCollectionService;

    @Autowired
    private JwtService jwtService; // jwt 生成和验证

    @RequestMapping(value = "/content")
    public ModelAndView client_content(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        if (null != id && !ParamsUtils.isPositiveInteger(id) || null == id){
            // 如果没有id参数，转到一个不存在的页面
            return new ModelAndView("nonexistent page");
        }
        long substanceId = Long.parseLong(id);
        // 根据id获得substancePO对象，并且利用所属用户id得到该内容所有者的信息
        SubstanceInfoPO infoPO = substanceInfoService.selectIncludeContent(substanceId);
        // 取得组长信息
        long userId = infoPO.getBelongUserId();
        UserInfoPO userInfoPO = userInfoService.selectByPrimaryKey(userId);
        int joinCount = groupInfoService.countByUserId(userId);
        int collectCount = userCollectionService.countByUserId(userId);
        int publishCount = substanceInfoService.countByUserId(userId);
        ArrayList<GroupInfoPO> listGroupInfo = (ArrayList)groupInfoService.listBySubstanceId(substanceId);
        // 根据token判断是否有用户登录
        String token = (String)request.getAttribute("token");
        long loginId = -1;
        if (null == token || !jwtService.validateJwt(token)){
            // token验证失败，没有用户登录
            System.out.println("no user login");
        } else {
            loginId = Long.parseLong(jwtService.getSpecificPayload(token,"aud"));
            // TODO 判断该substance是否属于该登录用户
        }
        // 地图在前台加载
        // 根据上面的判断返回指定的内容
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/client/content");
        modelAndView.addObject("substanceInfo",infoPO);
        modelAndView.addObject("userInfo",userInfoPO);
        modelAndView.addObject("joinCount",joinCount);
        modelAndView.addObject("collectCount",collectCount);
        modelAndView.addObject("publishCount",publishCount);
        modelAndView.addObject("listGroupInfo",listGroupInfo);
        return modelAndView;
    }

    // 登录用户添加评论
    @RequestMapping(value = "/content/addComment")
    @ResponseBody
    public String addComment(HttpServletRequest request) throws Exception {
        long userId = hasUserLogin(request);
        if (userId == -1L){ // 没有用户登录，返回-1
            return "-1";
        }
        String commentTxt = request.getParameter("commentContent");
        // TODO 还没有对评论内容进行过滤
        String substanceId = request.getParameter("substanceId");
        SubstanceCommentPO po = new SubstanceCommentPO();
        po.setBelongSubstanceId(Long.parseLong(substanceId));
        po.setBelongUserId(userId);
        po.setCommentContent(commentTxt);
        int insert_res = substanceCommentService.insertSelective(po);
        if (insert_res > 0){
            return "1";
        } else {
            return "-2";
        }
    }

    // 评论内容分页
    @RequestMapping(value = "/content/loadComments",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String loadComment(HttpServletRequest request){
        String offset = request.getParameter("offset");
        String rows = request.getParameter("rows");
        Long substanceId = Long.parseLong(request.getParameter("substanceId"));
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setId(substanceId);
        pagingInfo.setOffset(Integer.parseInt(offset));
        pagingInfo.setRows(Integer.parseInt(rows));
        List<SubstanceCommentPO> commentPOS = substanceCommentService.listBySubstanceId(pagingInfo);
        int sumPage = substanceCommentService.countByPrimaryKey(substanceId);
        JSONObject res = new JSONObject();
        res.put("sumPage",String.valueOf(sumPage));
        JSONArray jsonArray = new JSONArray();
        for (SubstanceCommentPO po : commentPOS){
            JSONObject object = new JSONObject();
            object.put("portrait",po.getUserInfoPO().getPortrait());
            object.put("gmtCreate",po.getGmtCreate().toString());
            object.put("content",po.getCommentContent());
            jsonArray.add(object);
        }
        res.put("items",jsonArray);
        return res.toJSONString();
    }

    // TODO 加入和收藏
    @RequestMapping(value = "personJoin")
    @ResponseBody
    public String personJoin(HttpServletRequest request) throws Exception {
        long userId = hasUserLogin(request);
        if (userId == -1L){
            return "-1";
        }
        long substanceId = Long.parseLong(request.getParameter("substanceId"));
        GroupInfoPO po = new GroupInfoPO();
        po.setBelongSubstanceId(substanceId);
        po.setBelongUserId(userId);
        GroupInfoPO po1 = groupInfoService.selectByBothId(po);
        if (po1.getId() > 0){
            return "-2";
        }
        int res_insert = groupInfoService.insertSelective(po);
        if (res_insert > 0){
            return "1";
        } else {
            return "-3";
        }
    }

    @RequestMapping(value = "personCollect")
    @ResponseBody
    public String personCollect(HttpServletRequest request) throws Exception {
        long userId = hasUserLogin(request);
        if (userId == -1L){
            return "-1";
        }
        long substanceId = Long.parseLong(request.getParameter("substanceId"));
        UserCollectionPO po = new UserCollectionPO();
        po.setBelongUserId(userId);
        po.setTargetSubstanceId(substanceId);
        UserCollectionPO po1 = userCollectionService.selectByBothId(po);
        if (po1.getId() > 0){
            return "-2";
        }
        int res_insert = userCollectionService.insertSelective(po);
        if (res_insert > 0){
            return "1";
        } else {
            return "-3";
        }
    }
    /**
     * 根据request中是否携带token，判断是否有用户登录，是则返回用户id
     * @param request
     * @return
     * @throws Exception
     */
    private long hasUserLogin(HttpServletRequest request) throws Exception {
        // 根据token判断是否有用户登录
        String token = URLDecoder.decode(getTokenByCookie(request),"utf-8");
        long loginId = -1L;
        if (null == token || !jwtService.validateJwt(token)){
            // token验证失败，没有用户登录
            return loginId;
        } else {
            loginId = Long.parseLong(jwtService.getSpecificPayload(token,"aud"));
            return loginId;
        }
    }

    /**
     * 从cookie中取出token
     * @param request
     * @return
     */
    private String getTokenByCookie(HttpServletRequest request){
        String token = null;
        Cookie[] cookies = request.getCookies();
        for (int i = 0;i < cookies.length;i++){
            if ("token".equals(cookies[i].getName())){
                token = cookies[i].getValue();
                break;
            }
        }
        return token;
    }

}
