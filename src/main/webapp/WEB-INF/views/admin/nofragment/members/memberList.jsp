<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div>
		<button onclick="deleteMem('${member.mem_id}')">계정삭제</button>
		<button>관리자권한으로 변경</button>
	</div>
</div>
</c:forEach>

<script type="text/javascript">

	//csrf 토큰값 받기
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

    function deleteMem(param) {
    	
    	var mem_id =param;
    	console.log(mem_id);
    	
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
            
    }
</script>
</body>
</html>