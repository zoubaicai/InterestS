package com.zbc.util;

import com.zbc.pojo.*;
import com.zbc.service.GroupInfoService;
import com.zbc.service.SubstanceCommentService;
import com.zbc.service.SubstanceInfoService;
import com.zbc.service.UserCollectionService;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

public class TestMain {
    public static void main(String[] args) throws Exception {
        //File fromPic = new File("F:/images/braid.jpg");
        //File toPic = new File("F:/images/to.jpg");
//        File waterPic = new File("F:/images/apple.jpg");
//        // 按指定大小把图片进行缩和放（会遵循原图高宽比例）
//        // 此处把图片压成400×500的缩略图
        //Thumbnails.of(fromPic).size(140,140).toFile(fromPic);
//        // //不按比例，就按指定的大小进行缩放
        //Thumbnails.of(fromPic).size(140, 140).keepAspectRatio(false).toFile(fromPic);
//        // 旋转图片，rotate(角度),正数则为顺时针，负数则为逆时针
//        //Thumbnails.of(fromPic).size(200,200).rotate(90).toFile(toPic);
//        // 图片尺寸不变，压缩图片文件大小outputQuality实现,参数1为最高质量
//        //Thumbnails.of(fromPic).scale(1f).outputQuality(0.25f).toFile(toPic);
//        // 给图片加水印，watermark(位置，水印图，透明度)Positions.CENTER表示加在中间
//        Thumbnails.of(fromPic).size(400,400)
//                .watermark(Positions.BOTTOM_LEFT, Thumbnails.of(waterPic).scale(0.1f).outputQuality(0.1f).asBufferedImage(),0.5f)
//                .outputQuality(0.8f).toFile(toPic);
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        UserCollectionService userCollectionService = (UserCollectionService)context.getBean("userCollectionService");
        PagingInfo pagingInfo = new PagingInfo();
        pagingInfo.setId(1L);
        pagingInfo.setOffset(0);
        pagingInfo.setRows(10);
        List<UserCollectionPO> infoPOS = userCollectionService.listByBelongUserId(pagingInfo);
        for (UserCollectionPO po : infoPOS){
            System.out.println(po.getBelongUserId());
            System.out.println(po.getSubstanceInfoPO().getSummary());
        }
//        UserInfoService userInfoService = (UserInfoService) context.getBean("userInfoService");
//        UserInfoPO temp = new UserInfoPO();
//        temp.setId(2L);
//        temp.setIsVerified((byte)1);
//        temp.setRegisterCode("");
//        temp.setGmtModified(new Timestamp(1));
//        System.out.println(userInfoService.updateByPrimaryKeySelective(temp));
       // SubstanceInfoService substanceInfoService = (SubstanceInfoService)context.getBean("substanceInfoService");
       // SubstanceInfoPO po = substanceInfoService.selectIncludeContent(2L);
       // System.out.println(po.getId() + "|" + po.getSubstanceContentPO().getContent());
    }
}
