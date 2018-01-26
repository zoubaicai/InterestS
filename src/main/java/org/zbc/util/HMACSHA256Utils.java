package org.zbc.util;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.Base64;

public final class HMACSHA256Utils {
    /** 算法名称 */
    private static final String ALGORITHM =  "HmacSHA256";
    /** Base64 编码/解码器 JDK1.8 */
    private static Base64.Encoder base64Encoder = Base64.getEncoder();
    /** key 缓存 **/
    private static SecretKey secretKeyBuffer = null;

    /**
     * 使用HmacSHA256加密数据
     * @param data 待加密数据
     * @return base64编码后加密数据
     */
    public static String encrypt(byte[] data) throws NoSuchAlgorithmException, InvalidKeyException {
        LocalDateTime time = LocalDateTime.now();
        if ("MONDAY".equals(time.getDayOfWeek()) && time.getHour() == 3 && time.getMinute() == 1 || null == secretKeyBuffer){
            generateKey();
        }
        Mac mac = Mac.getInstance(ALGORITHM);
        mac.init(secretKeyBuffer);
        return base64Encoder.encodeToString(mac.doFinal(data));
    }
    /**
     *生成HmacSHA256密钥并保存
     * 名称#hmacSHA256Key#保存到#hmacSHA256.properties#
     */
    private static synchronized void generateKey() throws NoSuchAlgorithmException {
        secretKeyBuffer = null;
        KeyGenerator keyGenerator = KeyGenerator.getInstance(ALGORITHM);
        SecretKey secretKey = keyGenerator.generateKey();
        secretKeyBuffer = secretKey;
    }
    /**
     * 防止被实例化
     */
    private HMACSHA256Utils(){
        throw new AssertionError();
    }
}
