package org.zbc.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import org.zbc.service.JwtService;
import org.zbc.util.HMACSHA256Utils;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.regex.Pattern;

@Service("jwtService")
public class JwtServiceImpl implements JwtService {

    private Base64.Decoder base64Decoder = Base64.getDecoder();
    private Base64.Encoder base64Encoder = Base64.getEncoder();
    private JSONObject headerBuff;
    private JSONObject payloadBuff;

    /**
     * 在使用之前,必须先生成header{@code genHeader}和payload{@code genPayload}
     * @return token字符串
     * @throws InvalidKeyException
     * @throws NoSuchAlgorithmException
     */
    @Override
    public String getJwt() throws InvalidKeyException, NoSuchAlgorithmException {
        if (null == headerBuff || null == payloadBuff){
            throw new IllegalStateException("必须先调用genHeader和genPayload生成header和payload");
        }
        StringBuilder resultBuf = new StringBuilder();
        String header = base64Encoder.encodeToString(headerBuff.toJSONString().getBytes());
        String payload = base64Encoder.encodeToString(payloadBuff.toJSONString().getBytes());
        resultBuf.append(header).append(".").append(payload);
        String signature = HMACSHA256Utils.encrypt(resultBuf.toString().getBytes());
        resultBuf.append(".").append(signature);
        return resultBuf.toString();
    }
    /**
     * 验证token是否有效
     * @param jwtStr token字符串
     * @return boolean
     */
    @Override
    public boolean validateJwt(String jwtStr) throws InvalidKeyException, NoSuchAlgorithmException {
        if (!Pattern.matches("^[A-Za-z0-9./=+]+$",jwtStr)){
            return false;
        }
        String[] token = jwtStr.split("\\.");
        if (!HMACSHA256Utils.encrypt((token[0] + "." + token[1]).getBytes()).equals(token[2])){
            return false;
        }
        LocalDateTime timeNow = LocalDateTime.now();
        System.out.println(timeNow);
        Long nowMillisecond = Timestamp.valueOf(timeNow).getTime();
        JSONObject jsonObject = JSON.parseObject(new String(base64Decoder.decode(token[1])));
        Long expirationTime = Long.parseLong(jsonObject.getString("exp"));
        return expirationTime > nowMillisecond;
    }

    /**
     * 生成header,在使用{@code putProperty}之前调用
     */
    @Override
    public void genHeader(){
        if (null == headerBuff){
            headerBuff = new JSONObject();
        } else {
            headerBuff.clear();
        }
    }

    /**
     * 生成payload,在使用{@code putProperty,buildPayload}之前调用
     */
    @Override
    public void genPayload(){
        if (null == payloadBuff){
            payloadBuff = new JSONObject();
        } else {
            payloadBuff.clear();
        }
    }

    /**
     * 添加键值对到payloadBuff中
     * @param k 键
     * @param v 值
     */
    @Override
    public void putPayloadProp(String k,String v){
        if ("".equals(k) || null == k || "".equals(v) || null == v){
            throw new IllegalArgumentException();
        }
        if (k.contains("exp")){
            LocalDateTime time = LocalDateTime.now();
            String type = v.substring(v.length() - 1);
            Long expiry = Long.parseLong(v.substring(0,v.length()-1));
            if ("h".equals(type.toLowerCase())){
                time = time.plusHours(expiry);
            }
            if ("d".equals(type.toLowerCase())){
                time = time.plusDays(expiry);
            }
            Timestamp timestamp = Timestamp.valueOf(time);
            payloadBuff.put(k,"" + timestamp.getTime());
            return;
        }
        payloadBuff.put(k,v);
    }
    /**
     * 添加键值对到headerBuff中
     * @param k 键
     * @param v 值
     */
    @Override
    public void putHeaderProp(String k,String v){
        if ("".equals(k) || null == k || "".equals(v) || null == v){
            throw new IllegalArgumentException();
        }
        headerBuff.put(k,v);
    }
}
