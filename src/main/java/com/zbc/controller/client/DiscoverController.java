package com.zbc.controller.client;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceLocationPO;
import com.zbc.service.SubstanceLocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DiscoverController {

    @Autowired
    private SubstanceLocationService substanceLocationService;

    @RequestMapping(value = "/discover")
    public String discover(HttpServletRequest request){
        return "client/discover";
    }

    /**
     * 根据得到的经纬度，找出20000米以内的30个内容
     * @param request
     * @return
     */
    @RequestMapping(value = "/loadNearby",produces = {"text/html;charset=UTF-8;"})
    @ResponseBody
    public String loadNearby(HttpServletRequest request){
        double lng = Double.parseDouble(request.getParameter("lng"));
        double lat = Double.parseDouble(request.getParameter("lat"));
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setOffset(0);
        pagingInfo.setRows(24);
        pagingInfo.setLongitude(lng);
        pagingInfo.setLatitude(lat);
        List<SubstanceLocationPO> lists = substanceLocationService.listByDistance(pagingInfo);
        JSONArray res = new JSONArray();
        for (SubstanceLocationPO list : lists){
            JSONObject object = new JSONObject();
            object.put("id",list.getBelongSubstanceId());
            object.put("subject",list.getSubstanceInfoPO().getSubject());
            object.put("summary",list.getSubstanceInfoPO().getSummary());
            object.put("cover",list.getSubstanceInfoPO().getCover());
            object.put("lng",list.getLongitude());
            object.put("lat",list.getLatitude());
            object.put("distance",list.getDistance());
            res.add(object);
        }
        return res.toJSONString();
    }

}
