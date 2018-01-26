package org.zbc.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class MsgDigestUtils {
    /**
     * 使用指定哈希算法计算摘要信息
     * @param content 内容
     * @param algorithm 哈希算法
     * @return 内容摘要
     * @throws NoSuchAlgorithmException,UnsupportedEncodingException
     */
    public static String getDigest(String content,String algorithm) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
        messageDigest.update(content.getBytes("utf-8"));
        return bytesToHexString(messageDigest.digest());
    }
    /**
     * 将字节数组转换成16进制字符串
     * @param bytes 即将转换的数据
     * @return 16进制字符串
     */
    private static String bytesToHexString(byte[] bytes){
        StringBuffer sb = new StringBuffer(bytes.length);
        String temp = null;
        for (int i = 0;i< bytes.length;i++){
            temp = Integer.toHexString(0xFF & bytes[i]);
            if (temp.length() <2){
                sb.append(0);
            }
            sb.append(temp);
        }
        return sb.toString();
    }

    /**
     * 防止被实例化
     */
    private MsgDigestUtils(){
        throw new AssertionError("This class is not allowed instantiation.");
    }

}
