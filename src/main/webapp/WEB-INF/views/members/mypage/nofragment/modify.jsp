<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.group6.shopping.security.CustomMemDetails" %>
<!DOCTYPE html>
<html>
<head>


    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>Title</title>
    <!-- jQuery -->
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script><!-- jQuery CDN --->
    <!-- daum 우편주소 api-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#modifyPw").click(function(){
			    $(".page_loader").load("/members/member/modifyPassword");
			});
		});
	</script>
</head>
<body>

<%
    CustomMemDetails cs =(CustomMemDetails) session.getAttribute("user");
 
	String imsi_address = "";
	String address = "";
	String detailaddress = "";
	int tokenizer;
	
 	if(cs.getMem_address().length() > 0){
		tokenizer = cs.getMem_address().indexOf('!');
		address = cs.getMem_address().substring(0, tokenizer);
		detailaddress = cs.getMem_address().substring(tokenizer + 1);
	}
%>

<style>
    @font-face {
        font-family: "BBTreeGR";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
        format("woff");
        font-weight: normal;
        font-style: normal;
    }
    .m_box {
        width: 100%;
    }

 .m_content {
        margin: 0 auto;
        max-width: 1110px;
        text-align: left;
        padding-left: 20px;
        height: auto;
        /*line-height: 48px;*/
        font-size: 13px;
    }


    table.modify_form {
        width: 80%;
        border-collapse: collapse;
        margin : auto;
    }
    table.modify_form tbody th {
        width: 120px;
        font-weight: bold;
        vertical-align: middle;
        border-bottom: 1px solid #ccc ;
    }
    table.modify_form td {
        width: 350px;
        height: 50px;
        vertical-align: middle;
        border-bottom: 1px solid #ccc ;
    }
    table.modify_form tbody {
        font-weight: bold;
        vertical-align: top;
        border-top: 2px solid #000000;
    }
     .btn_a {
         /*display: inline-block;*/
         width: 100px;
         border-radius: 20px;
         background-color: #ebebeb;
         border: 1px solid #ddd;
         padding: 5px 5px;
         cursor: pointer;
     }
     .btn_b {
         width : 100px;
         border-radius: 4px;
         background-color: #0071E3;
         color : white;
         border: 1px solid #ddd;
         padding: 5px 5px;
         cursor: pointer;
         float: right;
     }
    .btn_c {
        width : 100px;
        border-radius: 4px;
        background-color: #ebebeb;
        border: 1px solid #ddd;
        padding: 5px 5px;
        cursor: pointer;
        float: right;
    }
    .margin{
        height: 200px;
    }
    .margin_a{
        height: 100px;
    }
    .button_box{
        width: 80%;
        margin: auto;
    }
</style>


<div class="m_box">
    <div class="m_content">
        <%--<h2>회원정보수정</h2>--%>
        <div class="margin_a"></div>

        <table class="modify_form">
            <thead>
            <tr>
            <td colspan="3"><h2>기본정보</h2></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">아이디</th>
                <td><input type="text" style="border:0 solid black" id="memId" value=${user.mem_id} readonly></td>
                <td>*ID는 수정이 불가능합니다</td>
            </tr>
            <tr>
                <th scope="row">이름</th>
                <td> <input type="text" id="memName" value=${user.mem_name}></td>
                <td><p id="nameCheck"></p></td>
            </tr>
            <tr>
                <th scope="row">휴대폰번호</th>
                <td><input type="text" id="memPhone" value=${user.mem_phone}></td>
                <td><p id="phoneCheck"></p></td>
            </tr>
            <tr>
                <th scope="row">이메일</th>
                <td><input type="text" id="memEmail" value=${user.mem_email}></td>
                <td><p id="emailCheck"></p></td>
            </tr>
            <tr>
                <th scope="row">생년월일</th>
                <td><input type="text" style="border:0 solid black" id="memBirth" value=${user.mem_birth} readonly></td>
                <td>*생일쿠폰 발송으로 생년월일은 가입 이후 수정이 불가능합니다</td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                <td>
                    <input type="text"  id="postcode" value=${user.mem_post_code} disabled="disabled">
                    <input type="button" class="btn_a" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" size="36" id="address" value="<%=address%>"  disabled="disabled"><br>
                    <input type="text" size="36" id="detailAddress" value="<%=detailaddress%>" > <br>
                    <input type="text" size="36" id="extraAddress" placeholder="참고항목" disabled="disabled">
                </td>
                <td><p id="addressCheck"></p></td>
            </tr>


            </tbody>
        </table>
        <div class="button_box">
	        <button type="button" class="btn_c" id="modifyPw">비밀번호 변경</button>
	        <button type="button" class="btn_b" onclick="sendInfoModify()">정보수정</button>
        </div>
        <div class="margin">

    </div>
</div>




<!-- javascript -->
<script type="text/javascript">

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //회원이름
    var memName = document.querySelector('#memName');

    //이메일
    var memEmail = document.querySelector('#memEmail');

    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    //전화번호
    var memPhone = document.querySelector('#memPhone');
    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;



    //회원이름 정보 확인
    memName.onblur = function (e) {
        if(memName.value.length == 0){
            nameCheck.innerHTML = "이름을 입력해주세요.";
        }else{
            nameCheck.innerHTML = null;
        }
    }

    //이메일 정보 확인
    memEmail.onblur = function (e) {

        if(memEmail.value.length == 0){
            emailCheck.innerHTML = "이메일을 입력해주세요";
        }else if(!regEmail.test(memEmail.value)){
            emailCheck.innerHTML = "잘못된 이메일 형식입니다.";
        }else{
            emailCheck.innerHTML = null;
        }

    }

    //전화번호 정보 확인
    memPhone.onblur = function (e) {

        if(memPhone.value.length == 0){
            phoneCheck.innerHTML = "전화번호을 입력해주세요";
        }else if(!regPhone.test(memPhone.value)){
            phoneCheck.innerHTML = "잘못된 전화번호 형식입니다.";
        }else{
            phoneCheck.innerHTML = null;
        }

    }

    //우편번호 api
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

    //정보수정
    function sendInfoModify() {


        var postCode = document.getElementById('postcode').value; //우편번호
        var address = document.getElementById("address").value + "!" + document.getElementById("detailAddress").value; //주소
        var extraAddress = document.getElementById("extraAddress").value; //참고항목
        var phone = memPhone.value;



        if (phone.indexOf('-')!=-1) {
            phone = phone.replaceAll("-", "");
        }
            phone = phone.trim();
            phone = phone.substring(0, 3) + "-" + phone.substring(3,7) + "-" + phone.substring(7,11);


        var boolName = memName.value.length == 0;
        var boolEmail = memEmail.value.length == 0 || !regEmail.test(memEmail.value);
        var boolPhone = memPhone.value.length == 0 || !regPhone.test(memPhone.value);



        if(document.getElementById("address").value.length == 0){

            alert("주소를 입력해 주세요.");

        }else if(boolName){

            alert("이름을 다시 입력해주세요");


        }else if(boolEmail){

            alert("이메일을 다시 입력해주세요.");
        }else if(boolPhone){

            alert("전화번호를 다시 입력해주세요.")
        }
        else{

            jQuery.ajax({
                "url": "/members/member/modify/modifyProcess",
                "type": "POST",
                "contentType": "application/json; charset=utf-8;",
                "data": JSON.stringify({
                    "mem_name": memName.value,
                    "mem_phone" : phone,
                    "mem_email": memEmail.value,
                    "mem_post_code": postCode,
                    "mem_address": address
                }),
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                "dataType": "json"
            }).done(function(data) {
                data = JSON.stringify(data);
                jsonData = JSON.parse(data);

                if(jsonData.success){

                    alert(jsonData.success);

                    document.getElementById("memPhone").value = jsonData.modPhone;
                }else{
                    alert('에러. 새로고침 후 다시 수정해주세요');
                }

            });
        }
    }

</script>


</body>
</html>