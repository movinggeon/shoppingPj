package com.group6.shopping;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    @Autowired
    MembersService membersService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) throws Exception {

        List<MembersVO> membersVOList = membersService.getAllMembers();

        for(MembersVO tmp : membersVOList){
            System.out.println(tmp.getMem_name());
        }

		System.out.println("home123 호출");

		return "home";
	}
}
