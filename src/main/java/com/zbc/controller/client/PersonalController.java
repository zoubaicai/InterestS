package com.zbc.controller.client;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.*;
import com.zbc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PersonalController {

    @Autowired
    private JwtService jwtService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private SubstanceInfoService substanceInfoService;

    @Autowired
    private UserCollectionService userCollectionService;

    @Autowired
    private GroupInfoService groupInfoService;


    @RequestMapping(value = "/personal")
    public ModelAndView client_content(HttpServletRequest request) throws Exception {
        long uid = -1;
        try{
            uid = Long.parseLong(request.getParameter("uid"));
        } catch (NumberFormatException e){
            uid = -1;
        }
        long nowUserId = jwtService.hasUserLogin(request);
        uid = uid != -1 ?uid:nowUserId;
        int isVisitor = -1; // 判断当前用户是否是访问自己的个人主页 -1 为自己，否则为访问其他人的页面
        if (nowUserId == -1 || nowUserId != uid){
            isVisitor = 1;
        }
        if (nowUserId == -1 && uid == -1){
            return new ModelAndView("nonexistent page");
        }
        UserInfoPO userInfoPO = userInfoService.selectByPrimaryKey(uid);
        int publishNum = substanceInfoService.countByUserId(uid);
        int collectNum = userCollectionService.countByUserId(uid);
        int joinNum = groupInfoService.countByUserId(uid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("client/personal");
        modelAndView.addObject("userInfo",userInfoPO);
        modelAndView.addObject("isVisitor",isVisitor);
        modelAndView.addObject("publishNum",publishNum);
        modelAndView.addObject("collectNum",collectNum);
        modelAndView.addObject("joinNum",joinNum);
        return modelAndView;
    }

    // TODO 根据是否登录，判断是否加载个人设置按钮、添加、编辑等按钮

    @RequestMapping(value = "/personal/loadPublish",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String loadPublish(HttpServletRequest request) throws Exception {
        PagingInfo pagingInfo = genPagingInfo(request);
        if (pagingInfo.getId() == -1){
            return "-1";
        }
        List<SubstanceInfoPO> poList = substanceInfoService.listByBelongUserId(pagingInfo);
        JSONArray arrayRes = new JSONArray();
        for (SubstanceInfoPO po : poList){
            JSONObject object = new JSONObject();
            object.put("substanceId",po.getId());
            object.put("cover",po.getCover());
            object.put("subject",po.getSubject());
            object.put("summary",po.getSummary());
            arrayRes.add(object);
        }
        return arrayRes.toJSONString();

    }

    @RequestMapping(value = "/personal/loadJoin",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String loadJoin(HttpServletRequest request) throws Exception {
        PagingInfo pagingInfo = genPagingInfo(request);
        if (pagingInfo.getId() == -1){
            return "-1";
        }
        List<GroupInfoPO> poList = groupInfoService.listByBelongUserId(pagingInfo);
        JSONArray arrayRes = new JSONArray();
        for (GroupInfoPO po : poList){
            JSONObject object = new JSONObject();
            object.put("substanceId",po.getId());
            object.put("cover",po.getSubstanceInfoPO().getCover());
            object.put("subject",po.getSubstanceInfoPO().getSubject());
            object.put("summary",po.getSubstanceInfoPO().getSummary());
            arrayRes.add(object);
        }
        return arrayRes.toJSONString();
    }

    @RequestMapping(value = "/personal/loadCollection",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String loadCollect(HttpServletRequest request) throws Exception {
        PagingInfo pagingInfo = genPagingInfo(request);
        if (pagingInfo.getId() == -1){
            return "-1";
        }
        List<UserCollectionPO> poList = userCollectionService.listByBelongUserId(pagingInfo);
        JSONArray arrayRes = new JSONArray();
        for (UserCollectionPO po : poList){
            JSONObject object = new JSONObject();
            object.put("substanceId",po.getId());
            object.put("cover",po.getSubstanceInfoPO().getCover());
            object.put("subject",po.getSubstanceInfoPO().getSubject());
            object.put("summary",po.getSubstanceInfoPO().getSummary());
            arrayRes.add(object);
        }
        return arrayRes.toJSONString();
    }


    // TODO 加入/收藏内容的删除功能

    // TODO 考虑是否添加发布内容的编辑功能



    private PagingInfo genPagingInfo(HttpServletRequest request) throws Exception {
        int offset = Integer.parseInt(request.getParameter("offset"));
        long uid = getUid(request);
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setId(uid);
        pagingInfo.setOffset(offset * 10);
        pagingInfo.setRows(10);
        return pagingInfo;
    }


    /**
     * 从 request 中获得用户id，如果没有，就查看cookie中是否有，否则就返回-1
     * @param request
     * @return
     * @throws Exception
     */
    private long getUid(HttpServletRequest request) throws Exception {
        long uid = -1;
        try{
            uid = Long.parseLong(request.getParameter("uid"));
        } catch (NumberFormatException e){
            uid = -1;
        }
        long nowUserId = jwtService.hasUserLogin(request);
        uid = uid != -1 ? uid : nowUserId;
        return uid;
    }
}
