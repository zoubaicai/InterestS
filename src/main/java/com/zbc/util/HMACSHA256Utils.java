package com.zbc.util;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Properties;

public final class HMACSHA256Utils {
    /** 算法名称 */
    private static final String ALGORITHM =  "HmacSHA256";
    private static final String HMACSHA256_KEY_NAME = "hmacSHA256Key";
    private static final String HMACSHA256_FILENAME = "hmacSHA256.properties";
    /** Base64 编码/解码器 JDK1.8 */
    private static Base64.Decoder base64Decoder = Base64.getDecoder();
    private static Base64.Encoder base64Encoder = Base64.getEncoder();
    /** key 缓存 **/
    private static SecretKey secretKeyBuffer = null;
    private static boolean generateFlag = true;

    /**
     * 使用HmacSHA256加密数据
     * @param data 待加密数据
     * @return base64编码后加密数据
     */
    public static String encrypt(byte[] data) throws NoSuchAlgorithmException, InvalidKeyException, IOException {
        if ("MONDAY".equals(LocalDate.now().getDayOfWeek()) && generateFlag == true){
            generateKey();
            generateFlag = false;
        } else {
            generateFlag = true;
        }
        SecretKey secretKey = null;
        if (secretKeyBuffer != null && secretKeyBuffer instanceof SecretKey){
            secretKey = new SecretKeySpec(secretKeyBuffer.getEncoded(),ALGORITHM);
        } else {
            secretKey = new SecretKeySpec(base64Decoder.decode(getKeyString(HMACSHA256_KEY_NAME,HMACSHA256_FILENAME)),ALGORITHM);
        }
        //secretKey = new SecretKeySpec(base64Decoder.decode(getKeyString(HMACSHA256_KEY_NAME,HMACSHA256_FILENAME)),ALGORITHM);
        Mac mac = Mac.getInstance(ALGORITHM);
        mac.init(secretKey);
        return base64Encoder.encodeToString(mac.doFinal(data));
    }

    /**
     * 获取密钥字符串
     * @param keyName 需要获取的密钥名
     * @param fileName 密钥所在文件
     * @return Base64编码的密钥字符串
     */
    public static String getKeyString(String keyName,String fileName) throws IOException, NoSuchAlgorithmException {
        if(HMACSHA256Utils.class.getClassLoader().getResource(fileName) == null){
            generateKey();
        }
        try (InputStream in = HMACSHA256Utils.class.getClassLoader().getResource(fileName).openStream()){
            Properties properties = new Properties();
            properties.load(in);
            return properties.getProperty(keyName);
        } catch (IOException e) {
            throw new IOException(e);
        }
    }
    /**
     *生成HmacSHA256密钥并保存
     * 名称#hmacSHA256Key#保存到#hmacSHA256.properties#
     */
    private static synchronized void generateKey() throws NoSuchAlgorithmException, IOException {
        String keyString = null;
        secretKeyBuffer = null; // 每次生成新密钥前，清理缓存密钥
        KeyGenerator keyGenerator = KeyGenerator.getInstance(ALGORITHM);
        SecretKey secretKey = keyGenerator.generateKey();
        secretKeyBuffer = secretKey;
        keyString = base64Encoder.encodeToString(secretKey.getEncoded());
        storeKey(keyString,HMACSHA256_KEY_NAME,HMACSHA256_FILENAME);
    }

    /**
     * 将指定的密钥字符串保存到文件中,如果找不到文件，就创建
     * @param keyString 密钥的Base64编码字符串（值）
     * @param keyName  保存在文件中的名称（键）
     * @param fileName 目标文件名
     */
    private static void storeKey(String keyString,String keyName,String fileName) throws IOException {
        Properties properties = new Properties();
        //存放密钥的绝对地址
        String path = null;
        try{
            path = HMACSHA256Utils.class.getClassLoader().getResource(fileName).toString();
            path = path.substring(path.indexOf(":") + 1);
        } catch (NullPointerException e){
            //如果不存#fileName#就创建
            String classPath = HMACSHA256Utils.class.getClassLoader().getResource("").toString();
            String prefix = classPath.substring(classPath.indexOf(":") + 1);
            String suffix = fileName;
            File file = new File(prefix + suffix);
            try {
                file.createNewFile();
                path = file.getAbsolutePath();
            } catch (IOException e1) {
                throw new IOException(e1);
            }
        }
        try (OutputStream out = new FileOutputStream(path)){
            properties.setProperty(keyName,keyString);
            properties.store(out,"There is " + keyName);
        } catch (FileNotFoundException e) {
            throw new FileNotFoundException();
        } catch (IOException e) {
            throw new IOException(e);
        }
    }
    /**
     * 防止被实例化
     */
    private HMACSHA256Utils(){
        throw new AssertionError();
    }
}
