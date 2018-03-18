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


    /**
     * 请求个人中心页面，如果既没有uid参数也没有登录信息，返回404
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/personal")
    public ModelAndView client_content(HttpServletRequest request) throws Exception {
        long uid = -1;
        try{
            uid = Long.parseLong(request.getParameter("uid"));
        } catch (NumberFormatException e){
            uid = -1;
        }
        long nowUserId = jwtService.hasUserLogin(request);
        uid = uid != -1 ? uid : nowUserId;
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

    /**
     * 加载指定用户的 发布 信息，如果既没有uid参数也没有登录信息，返回 -1
     * @param request
     * @return
     * @throws Exception
     */
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
            object.put("isVerified",po.getIsVerified()); // 是否审核标志 0：未审核 1：审核通过 2：审核未通过
            arrayRes.add(object);
        }
        return arrayRes.toJSONString();

    }

    /**
     * 加载指定用户的 加入兴趣组 信息，如果既没有uid参数也没有登录信息，返回 -1
     * @param request
     * @return
     * @throws Exception
     */
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
            object.put("substanceId",po.getBelongSubstanceId());
            object.put("cover",po.getSubstanceInfoPO().getCover());
            object.put("subject",po.getSubstanceInfoPO().getSubject());
            object.put("summary",po.getSubstanceInfoPO().getSummary());
            arrayRes.add(object);
        }
        return arrayRes.toJSONString();
    }

    /**
     * 加载指定用户的 收藏 信息，如果既没有uid参数也没有登录信息，返回 -1
     * @param request
     * @return
     * @throws Exception
     */
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
            object.put("substanceId",po.getTargetSubstanceId());
            object.put("cover",po.getSubstanceInfoPO().getCover());
            object.put("subject",po.getSubstanceInfoPO().getSubject());
            object.put("summary",po.getSubstanceInfoPO().getSummary());
            arrayRes.add(object);
        }
        return arrayRes.toJSONString();
    }

    // TODO 退出时发送一条消息给组长
    /**
     * 删除一条 group_info 中用户加入组的记录
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/personal/quitGroup",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String quitGroup(HttpServletRequest request) throws Exception {
        long substanceId = Long.parseLong(request.getParameter("substanceId"));
        long userId = jwtService.hasUserLogin(request);
        if (userId == -1){
            return "-1";  // -1 专门针对登录失效等
        }
        GroupInfoPO temp = new GroupInfoPO();
        temp.setBelongUserId(userId);
        temp.setBelongSubstanceId(substanceId);
        GroupInfoPO po = groupInfoService.selectByBothId(temp);
        if (null == po.getId()){
            return "-5"; // 没有找到该用户加入 id 为 substanceID 的记录
        }
        int res = groupInfoService.deleteByPrimaryKey(po.getId());
        if (res > 0){
            return "1"; // 删除成功
        } else {
            return "-1"; // sql 语句执行错误
        }
    }

    /**
     * 删除一条 user_collection 中用户收藏的记录
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/personal/cancelCollection",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String cancelCollection(HttpServletRequest request) throws Exception {
        long substanceId = Long.parseLong(request.getParameter("substanceId"));
        long userId = jwtService.hasUserLogin(request);
        if (userId == -1){
            return "-1";  // -1 专门针对登录失效等
        }
        UserCollectionPO temp = new UserCollectionPO();
        temp.setTargetSubstanceId(substanceId);
        temp.setBelongUserId(userId);
        UserCollectionPO po = userCollectionService.selectByBothId(temp);
        if (null == po.getId()){
            return "-5"; // 没有找到该用户收藏 id 为 substanceId 的记录
        }
        int res = userCollectionService.deleteByPrimaryKey(po.getId());
        if (res > 0){
            return "1"; // 删除成功
        } else {
            return "-1"; // sql 语句执行错误
        }
    }




    // TODO 考虑是否添加发布内容的编辑功能


    /**
     * 生成分页对象
     * @param request
     * @return
     * @throws Exception
     */
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
