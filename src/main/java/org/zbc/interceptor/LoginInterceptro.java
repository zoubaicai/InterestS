package org.zbc.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.zbc.service.JwtService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;

public class LoginInterceptro extends HandlerInterceptorAdapter {

    @Autowired
    private JwtService jwtService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = null;
        Cookie[] cookies = request.getCookies();
        for (int i = 0;i < cookies.length;i++){
            if ("token".equals(cookies[i].getName())){
                token = cookies[i].getValue();
                break;
            }
        }
        if (!jwtService.validateJwt(URLDecoder.decode(token,"utf-8"))){
            response.sendRedirect("/client/login");
            return false;
        } else {
            return true;
        }
    }
}
