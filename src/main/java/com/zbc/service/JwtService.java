package com.zbc.service;

import javax.servlet.http.HttpServletRequest;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

public interface JwtService {
    String getJwt() throws Exception;
    boolean validateJwt(String jwtStr) throws Exception;
    void genHeader();
    void genPayload();
    void putHeaderProp(String k,String v);
    void putPayloadProp(String k,String v);
    String getSpecificPayload(String token,String name);
    String getTokenByCookie(HttpServletRequest request);
    long hasUserLogin(HttpServletRequest request) throws Exception;
}
