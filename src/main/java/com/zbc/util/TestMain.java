package com.zbc.util;

import java.util.regex.Pattern;

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
       // ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
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
        System.out.println(Pattern.matches(".+(.jpg|.jpeg|.png|.bmp|.gif)$","/images/user_upload/1/1_20180210143217941.jpg"));
    }
}
