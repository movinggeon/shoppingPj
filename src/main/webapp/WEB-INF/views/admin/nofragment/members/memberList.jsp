<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/static/css/admin/nofragment/memberList.css" type="text/css">
<title>Insert title here</title>
</head>
<style>

	.all_btn {
		padding: 8px 15px;
		border: 2px solid #0071e3;
		border-radius: 20px;
		background-color: white;
		color: #0071e3;
		font-size: 14px;
		font-weight: bold;
		cursor: pointer;
	}
</style>
<body>
<div style="text-align: center">
<h1>회원목록</h1>
</div>
<div style="color: white">
페이지 번호 -> ${param.page }<br>
<fmt:parseNumber var="totalPage" value="${ ( memberCount / 6 ) +(1-(( memberCount / 6 )%1))%1}" integerOnly="true"/>
총 페이지 번호 -> ${totalPage }<br>
멤버 수 -> ${memberCount }<br>
</div>
<c:set var="loop_flag" value="false" />
<c:forEach var="i" begin="${ (param.page - 1) * 6 }" end="${ (6 * param.page) - 1 }" varStatus="status">
    <c:if test="${not loop_flag }">	
		<div class="member-context">
			<div class="member-card">
				<div class="memName">
					<div>
						이름 : ${memberList.get(i).getMem_name() }
					</div>
				</div>
				<div class="memId">
					<div>
						아이디 : ${memberList.get(i).getMem_id() }
					</div>
				</div>
				<div class="memAddress">
					주소 : ${memberList.get(i).getMem_address() }
				</div>
				<div class="memEmail">
					이메일 : ${memberList.get(i).getMem_email() }
				</div>
			</div>
			<div class="mem-btn" style="width: 60%;">
		 		<c:set var="auth" value="${memberList.get(i).getMem_auth() }"/>
		 		<c:choose>
					<c:when test="${auth eq 'ROLE_MEMBER' }">
						<div style="text-align: center;">
							<button onclick="openCoupon('${memberList.get(i).getMem_id()}')" class="all_btn">쿠폰지급</button><br>
						</div>
						<div style="text-align: center; padding-top: 10px;">
							<c:set var="enableState" value="${memberList.get(i).getMem_enable() }"></c:set>
							<c:choose>
								<c:when test="${enableState eq 1}">
									<button onclick="blockMem('${memberList.get(i).getMem_id() }', '${memberList.get(i).getMem_auth()}')" class="all_btn">계정차단</button>
								</c:when>
								<c:otherwise>
									<button onclick="unblockMem('${memberList.get(i).getMem_id() }', '${memberList.get(i).getMem_auth()}')" class="all_btn">계정차단 해제</button>
								</c:otherwise>
							</c:choose>
						</div>
						<div style="text-align: center; padding-top: 10px;">
							<button onclick="deleteMem('${ memberList.get(i).getMem_id() }', '${ memberList.get(i).getMem_auth()}')" class="all_btn">계정삭제</button>
						</div>
					</c:when>
					<c:otherwise>
							<p style="text-align: center;">관리자 계정</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="context-coupon" id="${memberList.get(i).getMem_id() }" style="margin-bottom: 15px;">
		
		</div>
		<c:if test="${i eq ( memberCount -1 ) }">
			<c:set var="loop_flag" value="true" />
		</c:if>
        <c:if test="${status.count eq 6 }">
            <c:set var="loop_flag" value="true" />
        </c:if>
    </c:if>
</c:forEach>

<div class="div-pagingBtn">
	<%--<div style="display: flex;">--%>
		<%--페이징 --%>
		<c:set var="doneLoop" value="false"/>
		<c:forEach var="i" begin="1" end="${totalPage }" varStatus="status">
			<c:if test="${not doneLoop}">
				<div>
					<button type="button" class="pagingBtn" onclick="sendPage('${i}')">${i }</button>
				</div>
				<c:if test="${i eq newArrival.pbNum}">
					<c:set var="doneLoop" value="true" />
				</c:if>
			</c:if>
		</c:forEach>
	<%--</div>--%>
</div>
   
<script type="text/javascript">

	function openCoupon(mem_id) {
		$("#" + mem_id ).load("/admin/nofragment/couponList?name=give&page=1" + "&query_id=" + mem_id + "&return_page=${param.page}");
	}
	function sendPage(pageNum) {
		$(".context").load("/admin/nofragment/memberList?page=" + pageNum);
	}
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
                   $(".context").load("/admin/nofragment/memberList?page=1");
               }
               else {
                   alert("에러");
               }

           });
           
    	}else{
    		return;
    	}
        
    }
	
	//계정차단
    function blockMem(mem_id, mem_auth) {
    	
    	var mem_auth = mem_auth.substr(5);
    	var mem_id = mem_id;
    	
    	if(confirm(mem_auth + " ( " + "아이디 : " + mem_id  + " ) " + "계정입니다. 정말로 차단 하시겠습까?") == true){
    		
           jQuery.ajax({
               "url": "/admin/block/blockMem",
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
                   $(".context").load("/admin/nofragment/memberList?page=1");
               }
               else {
                   alert("에러");
               }

           });
           
    	}else{
    		return;
    	}
        
    }
	
	//계정차단 해제
    function unblockMem(mem_id, mem_auth) {
    	
    	var mem_auth = mem_auth.substr(5);
    	var mem_id = mem_id;
    	
    	if(confirm(mem_auth + " ( " + "아이디 : " + mem_id  + " ) " + "계정입니다. 정말로 차단해제 하시겠습까?") == true){
    		
           jQuery.ajax({
               "url": "/admin/block/unblockMem",
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
                   $(".context").load("/admin/nofragment/memberList?page=${param.page}");
               }
               else {
                   alert("에러");
               }

           });
           
    	}else{
    		return;
    	}
        
    }
</script>
</body>
</html>