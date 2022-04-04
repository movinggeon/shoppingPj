package com.group6.shopping.security;

<<<<<<< HEAD
import java.io.IOException;
=======
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
>>>>>>> 32feb2bff50dcec39d042566e7c7477c0c32d463

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
<<<<<<< HEAD

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
=======
import java.io.IOException;
>>>>>>> 32feb2bff50dcec39d042566e7c7477c0c32d463

public class LogoutHandler implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        System.out.println("logout handler");

        HttpSession session = request.getSession();
        String defaultUrl = "/";

        //로그인 정보가 있을 경우
        if (auth != null) {
        	System.out.println("LogoutHandler -> 회원정보 있음");
            session.removeAttribute("user");
            //new SecurityContextLogoutHandler().logout(request,response,auth);
<<<<<<< HEAD

        }
=======
        }

>>>>>>> 32feb2bff50dcec39d042566e7c7477c0c32d463
        response.sendRedirect(defaultUrl);
    }
}
