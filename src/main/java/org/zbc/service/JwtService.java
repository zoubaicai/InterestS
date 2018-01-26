package org.zbc.service;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

public interface JwtService {
    String getJwt() throws Exception;
    boolean validateJwt(String jwtStr) throws Exception;
    void genHeader();
    void genPayload();
    void putHeaderProp(String k,String v);
    void putPayloadProp(String k,String v);
}
