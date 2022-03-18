package com.group6.shopping.members.controllers;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@RestController
@RequestMapping("/members")
public class MembersRestController {

    @Inject
    private MembersService membersService;

    @PostMapping(value = "/join/idLookup")
    public HashMap<String, Object> idLookup(@RequestBody HashMap<String, Object> param) throws Exception {

        //System.out.println("아이디 (Restcontroller) : " + (String)param.get("memId"));

        HashMap<String, Object> result = new HashMap<String, Object>();
        String memId = (String)param.get("memId");
        String lookupResult= membersService.lookupId(memId);

        System.out.println(memId.isEmpty());
        System.out.println(memId.length());

        if(memId.isEmpty()) {

            result.put("error", "아이디를 입력해주세요.");
        }else if(lookupResult == null) {

            result.put("success", "사용 가능한 아이디 입니다.");
            result.put("memId", memId);

        }else {

            result.put("error", "중복된 아이디 입니다.");
        }
        return result;
    }

    @PostMapping(value = "/join/joinProcess")
    public HashMap<String, Object> joinProcess(@RequestBody HashMap<String, Object>param) throws Exception{

        HashMap<String, Object> result = new HashMap<String, Object>();

        String memName = (String)param.get("memName");
        String memId = (String)param.get("memId");
        String memPassword = (String)param.get("memPassword");
        String memEmail = (String)param.get("memEmail");
        String memPhone = (String)param.get("memPhone");
        String memBirth = (String)param.get("memBirth");
        String memPostCode = (String)param.get("memPostCode");
        String memAddress = (String)param.get("memAddress");
        String memAuth = "ROLE_MEMBER";
        int memPoint = 0;

        memPhone = memPhone.trim();
        memPhone = memPhone.substring(0, 3) + "-" + memPhone.substring(3,7) + "-" + memPhone.substring(7,11);

        MembersVO membersVO = new MembersVO(memName, memId, memPassword, memEmail, memPhone , memBirth, memPostCode, memAddress, memPoint, memAuth, 1);
        membersService.insertMem(membersVO);

        result.put("success", "회원가입이 완료되었습니다.");

        return result;
    }

    @PostMapping(value = "member/modify/modifyProcess")

    public HashMap<String, Object> modifyProcess(@RequestBody HashMap<String, String>param, HttpSession session) throws Exception{

        System.out.println("내가왔다");
        HashMap<String, Object> result = new HashMap<String, Object>();

        String memName = (String)param.get("mem_name");
        String memEmail = (String)param.get("mem_email");
        String memPhone = (String)param.get("mem_phone");
        String memPostCode = (String)param.get("mem_post_code");
        String memAddress = (String)param.get("mem_address");
        System.out.println(memName);
        System.out.println(memAddress);
        System.out.println(memEmail);
        System.out.println(memPostCode);
        System.out.println(memPhone);

        CustomMemDetails cs = (CustomMemDetails) session.getAttribute("user");

        param.put("mem_id",cs.getMem_id());

        membersService.modifyMem(param);

        result.put("success", "회원정보수정이 완료되었습니다.");

        return result;
    }



}
