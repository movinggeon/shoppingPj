<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/static/css/admin/nofragment/memberList.css" type="text/css">
<title>Insert title here</title>
</head>
<body>

<h1>회원목록</h1>

페이지 번호 -> ${param.page }

<c:forEach var="member" items="${memberList }">
<div class="member-context">
	<div class="member-card">
		<div class="memName">
			<div>
				이름 : ${member.mem_name }
			</div>
		</div>
		<div class="memId">
			<div>
				아이디 : ${member.mem_id }
			</div>
		</div>
		<div class="memAddress">
			주소 : ${member.mem_address }
		</div>
		<div class="memEmail">
			이메일 : ${member.mem_email }
		</div>
	</div>
	<div class="mem-btn" style="width: 60%;">
 		<c:set var="auth" value="${member.mem_auth }"/>
 		<c:choose>
			<c:when test="${auth eq 'ROLE_MEMBER' }">
				<div style="text-align: center;">
					<button onclick="deleteMem('${member.mem_id}', '${member.mem_auth }')">계정삭제</button><br>
				</div>
				<div style="text-align: center; padding-top: 10px;">
					<button onclick="deleteMem('${member.mem_id}', '${member.mem_auth }')">계정차단</button>
				</div>
			</c:when>
			<c:otherwise>
					<p style="text-align: center;">관리자 계정</p>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</c:forEach>

<script type="text/javascript">

	//csrf 토큰값 받기
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	//계정삭제
    function deleteMem(mem_id, mem_auth) {
    	
    	var mem_auth = mem_auth.substr(5);
    	var mem_id = mem_id;
    	
    	if(confirm(mem_auth + " ( " + "아이디 : " + mem_id  + " ) " + "계정입니다. 정말로 삭제 하시겠습까?") == true){
    		
           jQuery.ajax({
               "url": "/admin/delete/deleteMem",
               "type": "POST",
               "contentType": "application/json; charset=utf-8;",
               "data": JSON.stringify({
                   "mem_id": mem_id,
               }),
               beforeSend : function(xhr)
               {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                   xhr.setRequestHeader(header, token);
               },
               "dataType": "json"
           }).done(function(data) {
               data = JSON.stringify(data);
               jsonData = JSON.parse(data);

               //console.log(jsonData);

               if (jsonData.success) {
                   alert(jsonData.success);
               }
               else {
                   alert(jsonData.error);
               }

           });
           
    	}else{
    		return;
    	}
            
    }
</script>
</body>
</html>