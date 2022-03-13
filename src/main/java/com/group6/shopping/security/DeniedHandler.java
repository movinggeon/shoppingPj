package com.group6.shopping.security;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        System.out.println("accessDeniedHandler");
        Authentication auth
                = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            //logging code goes here, maybe,,
            System.out.println(auth.getName() + "attempted to enter URL: " + request.getRequestURI());
        }
        request.getRequestDispatcher("/members/accessDenied").forward(request, response);
    }
}
