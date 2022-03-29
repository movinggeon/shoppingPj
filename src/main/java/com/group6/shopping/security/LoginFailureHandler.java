package com.group6.shopping.security;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
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
            msg = "Wrong id or password. Please re-enter";
        }
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("/members/login?error").forward(request, response);
    }
}
