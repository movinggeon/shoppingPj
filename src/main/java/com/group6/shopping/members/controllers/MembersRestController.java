package com.group6.shopping.members.controllers;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.javassist.Loader.Simple;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.members.service.MembersService;
import com.group6.shopping.members.vo.MembersVO;

@RestController
public class MembersRestController {
	
	@Inject
	private MembersService membersService;
	
	@PostMapping(value = "/join/idLookup")
	public HashMap<String, Object> idLookup(@RequestBody HashMap<String, Object> param) throws Exception {
		
		//System.out.println("아이디 (Restcontroller) : " + (String)param.get("memId"));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String memId = (String)param.get("memId");
		String lookupResult= membersService.lookupId(memId);
		
		if(lookupResult == null) {
			
			result.put("success", "사용 가능한 아이디 입니다.");
			result.put("memId", memId);
		}else {
			
			result.put("error", "중복된 아이디 입니다.");
		}
		return result;
	}
	
	@PostMapping(value = "/join/joinProcess")
	public HashMap<String, Object> joinPorcess(@RequestBody HashMap<String, Object>param) throws Exception{
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String memName = (String)param.get("memName");
		String memId = (String)param.get("memId");
		String memPassword = (String)param.get("memPassword");
		String memEmail = (String)param.get("memEmail");
		String memBirth = (String)param.get("memBirth");
		String memPostCode = (String)param.get("memPostCode");
		String memAddress = (String)param.get("memAddress");
		int memPoint = 0;
		
		MembersVO membersVO = new MembersVO(memName, memId, memPassword, memEmail, memBirth, memPostCode, memAddress, memPoint);
		membersService.insertMem(membersVO);
		
		result.put("success", "회원가입이 완료되었습니다.");
		
		return result;
	}
}
