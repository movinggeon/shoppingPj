package com.group6.shopping.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutHandler implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        System.out.println("logout handler");

        HttpSession session = request.getSession();
        String defaultUrl = "/";

        //로그인 정보가 있을 경우
        if (auth != null) {
        	System.out.println("LogoutHandler -> 회원정보 있음" + session.getAttribute("user"));
            session.removeAttribute("user");
            //new SecurityContextLogoutHandler().logout(request,response,auth);
        }

        response.sendRedirect(defaultUrl);
    }
}
