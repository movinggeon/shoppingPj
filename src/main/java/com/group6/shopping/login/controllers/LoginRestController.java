package com.group6.shopping.login.controllers;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.shopping.login.service.LoginService;

@RestController
public class LoginRestController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
    
    @Autowired
    private JavaMailSender mailSender;
    
    @PostMapping(value = "/findId/sendFindId")
    public HashMap<String, Object> sendFindId(@RequestBody HashMap<String, Object> param) throws Exception {

        HashMap<String, Object> result = new HashMap<String, Object>();
        /*System.out.println("아이디찾기에 왔나");*/
        String mem_email = (String) param.get("mem_email");

     /*   System.out.println(mem_email);*/

        int a= loginService.findIdCheck(mem_email);
       /* System.out.println(a);*/


        if(loginService.findIdCheck(mem_email)==0){
            result.put("error", "입력하신 이메일로 가입된 아이디가 없습니다");
        }else {
            result.put("success",loginService.findId(mem_email));
        }

        return result;
    }
    
    @PostMapping(value = "/findPw/sendFindPw")
    public HashMap<String, String> sendFindPw(@RequestBody HashMap<String, String> param) throws Exception {
        HashMap<String, String> result = new HashMap<String, String>();
       /* System.out.println("비밀번호 찾기에 왔나");*/

        String mem_id = (String) param.get("mem_id");
        String mem_email = (String) param.get("mem_email");

        int a = loginService.findPwCheck(param);
        /*System.out.println(a);*/

        String memPassword = getRandomPassword(10);
       /* System.out.println(memPassword);*/
        String mem_password = bcryptPasswordEncoder.encode(memPassword);
        param.put("mem_password", mem_password);

        if(loginService.findPwCheck(param)==0){
            result.put("error","입력하신 정보의 회원이 존재하지 않습니다");
        }else {
            /*System.out.println("임시비밀번호 :" + memPassword);*/
            loginService.findPw(param);
            /*System.out.println("임시비밀번호 :" + memPassword);*/
            result.put("success","입력하신 email로 임시 비밀번호가 발송되었습니다");
            /*이메일 인증*/
            String setFrom="clothes.test.teamsix@gmail.com";
            String toMail=mem_email;
            String title="[SIX STORE 임시 비밀번호 입니다.]";
            String content=
                    "<h1>임시비밀번호 발급</h1>" +
                    "<br><br>" +
                    "비밀번호 찾기를 통한 임시 비밀번호 입니다." +
                    "<br> 임시비밀번호 : <h2>"+memPassword+"</h2>"+
                    "<br> 로그인 후 비밀번호 변경을 해주세요.";
            try{
                MimeMessage message=mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                helper.setFrom(setFrom);
                helper.setTo(toMail);
                helper.setSubject(title);
                helper.setText(content, true);
                mailSender.send(message);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public String getRandomPassword(int size) {
        int index =0;
        char [] charSet = new char[]{
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
                'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                'y', 'z', '!', '@', '#', '$', '%', '^', '&'
        };
        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int len = charSet.length;
        for (int i=0; i<size; i++) {
            index=sr.nextInt(len);
            sb.append(charSet[index]);
        }
        return sb.toString();
    }
}
