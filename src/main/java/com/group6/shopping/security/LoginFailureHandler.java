package com.group6.shopping.security;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String msg = "";
        //System.out.println("login Failed");
        //System.out.println(exception.getClass().getName());
        if(exception instanceof InternalAuthenticationServiceException || exception instanceof BadCredentialsException){
            //System.out.println("username error");
            msg = "아이디/비밀번호가 잘못되었습니다.";
        }
        
        if(exception instanceof LockedException || exception instanceof DisabledException) {
        	msg = "차단된 계정입니다.";
        }
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("/login?error").forward(request, response);
    }
}
