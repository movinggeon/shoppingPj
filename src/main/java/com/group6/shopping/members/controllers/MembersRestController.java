package com.group6.shopping.members.controllers;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.StringTokenizer;

@RestController
@RequestMapping("/members")
public class MembersRestController {

    @Inject
    private MembersService membersService;

    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;

    @PostMapping(value = "/join/idLookup")
    public HashMap<String, Object> idLookup(@RequestBody HashMap<String, Object> param) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();
        String memId = (String) param.get("memId");
        String lookupResult = membersService.lookupId(memId);

        System.out.println(memId.isEmpty());
        System.out.println(memId.length());

        if (memId.isEmpty()) {

            result.put("error", "아이디를 입력해주세요.");
        } else if (lookupResult == null) {

            result.put("success", "사용 가능한 아이디 입니다.");
            result.put("memId", memId);

        } else {

            result.put("error", "중복된 아이디 입니다.");
        }
        return result;
    }

    @PostMapping(value = "/join/joinProcess")
    public HashMap<String, Object> joinProcess(@RequestBody HashMap<String, Object> param) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();

        String memName = (String) param.get("memName");
        String memId = (String) param.get("memId");
        String memPassword = (String) param.get("memPassword");
        String memEmail = (String) param.get("memEmail");
        String memPhone = (String) param.get("memPhone");
        String memBirth = (String) param.get("memBirth");
        String memPostCode = (String) param.get("memPostCode");
        String memAddress = (String) param.get("memAddress");
        String memAuth = "ROLE_MEMBER";
        int memPoint = 0;

        memPhone = memPhone.trim();
        memPhone = memPhone.substring(0, 3) + "-" + memPhone.substring(3, 7) + "-" + memPhone.substring(7, 11);

        MembersVO membersVO = new MembersVO(memName, memId, memPassword, memEmail, memPhone, memBirth, memPostCode, memAddress, memPoint, memAuth, 1);
        membersService.insertMem(membersVO);

        result.put("success", "회원가입이 완료되었습니다.");

        return result;
    }

    @PostMapping(value = "member/modify/modifyProcess")

    public HashMap<String, Object> modifyProcess(@RequestBody HashMap<String, String> param, HttpSession session) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();

        String memName = (String) param.get("mem_name");
        String memEmail = (String) param.get("mem_email");
        String memPhone = (String) param.get("mem_phone");
        String memPostCode = (String) param.get("mem_post_code");
        String memAddress = (String) param.get("mem_address");


        CustomMemDetails cs = (CustomMemDetails) session.getAttribute("user");

        param.put("mem_id", cs.getMem_id());

        membersService.modifyMem(param);

        result.put("success", "회원정보수정이 완료되었습니다.");
        result.put("modPhone", memPhone);

        cs.setMem_id(memName);
        cs.setMem_email(memEmail);
        cs.setMem_phone(memPhone);
        cs.setMem_post_code(memPostCode);
        cs.setMem_address(memAddress);
        session.setAttribute("user",cs);
        return result;
    }


    @PostMapping(value = "member/modify/modifyPW")
    public HashMap<String, String> modifyPw(@RequestBody HashMap<String, String> param, HttpSession session) throws Exception {

        HashMap<String, String> result = new HashMap<String, String >();
        HashMap<String, String> queryMap = new HashMap<String,String>();

        CustomMemDetails cs = (CustomMemDetails) session.getAttribute("user");

        String memPW = membersService.pwCheck(cs.getMem_id());

        String memPassword = (String) param.get("mem_password");
        String mem_password1 = (String) param.get("mem_password1");
        String mem_password2 = (String) param.get("mem_password2");


        if (bcryptPasswordEncoder.matches(memPassword, memPW)) {

            mem_password1 = bcryptPasswordEncoder.encode(mem_password1);
            queryMap.put("mem_password",mem_password1);
            queryMap.put("mem_id", cs.getMem_id());

            membersService.modifyPw(queryMap);

            result.put("success", "비밀번호 수정이 완료되었습니다.");
        }else{
            System.out.println("x");

            result.put("error", "기존 비밀번호가 일치하지 않습니다.");

        }

        return result;
    }

    @PostMapping(value = "member/delete/DeleteMem")
    public HashMap<String, String> DeleteMem(@RequestBody HashMap<String, String> param, HttpSession session) throws Exception {
        HashMap<String, String> result = new HashMap<String, String >();

        CustomMemDetails cs = (CustomMemDetails) session.getAttribute("user");

        String memPW = membersService.pwCheck(cs.getMem_id());

        String memPassword = (String) param.get("mem_password");
        String passwordReEnter = (String) param.get("passwordReEnter");

        if (bcryptPasswordEncoder.matches(memPassword, memPW)) {
            membersService.deleteMem(cs.getMem_id());
            session.invalidate();
            result.put("success", "회원 탈퇴가 완료되었습니다.");
        }else{
            result.put("error", "기존 비밀번호가 일치하지 않습니다.");
        }

        return result;
    }
}

