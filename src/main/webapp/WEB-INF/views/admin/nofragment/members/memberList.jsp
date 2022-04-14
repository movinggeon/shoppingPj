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
	<style>
		.btn_a {
			display: inline-block;
			width: 40px;
			border-radius: 20px;
			background-color: #ebebeb;
			border: 1px solid #ddd;
			padding: 5px 5px;
			cursor: pointer;
		}

		.btn_b {
			color: white;
			display: inline-block;
			width: 40px;
			height: 35px;
			border-radius: 20px;
			background-color: #0071ef;
			border: 1px solid #0071ef;
			padding: 5px 5px;
			cursor: pointer;
		}
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
</head>
<body>
<div style="text-align: center">
	<h1>회원목록</h1>

	멤버 수: ${memberCount }<br>

	<c:forEach var="member" items="${memberList}">
	<div class="member-context">
		<div class="member-card">
			<div class="memName">
				<div>
					이름 : ${member.mem_name }
				</div>
			</div>
			<div class="memId">
				<div>
					아이디 : ${member.mem_id}
				</div>
			</div>
			<div class="memAddress">
				주소 : ${member.mem_address}
			</div>
			<div class="memEmail">
				이메일 : ${member.mem_email}
			</div>
		</div>
		<div class="mem-btn" style="width: 60%;">
			<c:set var="auth" value="${member.mem_auth }"/>
			<c:choose>
				<c:when test="${auth eq 'ROLE_MEMBER' }">
					<div style="text-align: center;">
						<button class="all_btn" onclick="openCoupon('${member.mem_id}')">쿠폰지급</button><br>
					</div>
					<div style="text-align: center; padding-top: 10px;">
						<c:set var="enableState" value="${member.mem_enable }"></c:set>
						<c:choose>
							<c:when test="${enableState eq 1}">
								<button class="all_btn" onclick="blockMem('${member.mem_id}', '${member.mem_auth }')">계정차단</button>
							</c:when>
							<c:otherwise>
								<button class="all_btn" onclick="unblockMem('${member.mem_id}', '${member.mem_auth }')">계정차단 해제</button>
							</c:otherwise>
						</c:choose>
					</div>
					<div style="text-align: center; padding-top: 10px;">
						<button class="all_btn" onclick="deleteMem('${member.mem_id}', '${member.mem_auth }')">계정삭제</button>
					</div>
				</c:when>
				<c:otherwise>
					<p style="text-align: center;">관리자 계정</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="context-coupon" id="${member.mem_id}" style="margin-bottom: 15px;">
	</div>
	</c:forEach>

	<div class="rev_paging" style="text-align: center; margin-top: 30px">
		<c:choose>
			<c:when test="${pageError ne null}">
				${pageError}
			</c:when>
			<c:otherwise>
				<%-- 일번 페이지가 아닐 경우 --%>
				<c:if test="${page.currPage ne 1}">
					<%--맨앞 일페이지로 가기 && 현재의 이전 페이지로 이동--%>
					<button class="btn_a" onclick="paging(1)"> << </button>
					<button class="btn_a" onclick="paging('${page.currPage-1}')"> < </button>
				</c:if>
				<c:forEach var="i" begin="${page.minPage}" end="${page.maxPage}">
					<%--만약 현재 페이지일 경우 이동 링크를 제공하지 않음--%>
					<c:choose>
						<c:when test="${i eq page.currPage}">
							<button class="btn_b">${i}</button>
						</c:when>
						<c:otherwise>
							<button class="btn_a" onclick="paging('${i}')">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<%--현재 페이지가 마지막 페이지가 아닐 경우--%>
				<c:if test="${page.currPage ne page.totalPage}">
					<%--현재 페이지의 앞 페이지로 이동 && 맨마지막 페이지로 이동--%>
					<button class="btn_a" onclick="paging('${page.currPage+1}')"> > </button>
					<button class="btn_a" onclick="paging('${page.totalPage}')"> >> </button>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
	<script type="text/javascript">
		function openCoupon(mem_id) {
			$("#" + mem_id ).load("/admin/nofragment/couponList?name=give&page=1" + "&query_id=" + mem_id + "&return_page=${param.page}");
		}
		function paging(pageNum) {
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