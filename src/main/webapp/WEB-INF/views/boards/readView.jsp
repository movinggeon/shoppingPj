<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/6da1745729.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="/resources/static/css/header.css" />
<link rel="stylesheet" href="/resources/static/css/main.css" />
<link rel="stylesheet" href="/resources/static/css/footer.css" />
<script src="/resources/static/js/main.js"></script>
<script src="/resources/static/js/header.js" defer></script>
<title>SMARTDC</title>
</head>


<body>
<main class="main-content">
<style>
.top_nav {
	background-color: #f3f3f3;
	width: 100%;
}
.topp {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 48px;
	line-height: 48px;
	font-size: 11px;
	color: gray;

}

.title {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 48px;
	line-height: 48px;
	font-size: 24px;
	border-left: 5px solid #0071e3
}	
.day {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 48px;
	line-height: 24px;
	font-size: 11px;
}	
.content {
	margin: 0 auto;
	max-width: 1110px;
	overflwo: hidden;
}	

.content img {
max-width: 100%;
max-height: 100%;
display: block;
}
.delete_btn {
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
<%--		<div style="margin-top: 48px"></div>--%>
		<div class="top_nav">
			<div class="topp">이벤트 > Event</div>
		</div>
	<br>
	
		<c:set var="type" value="${read.board_type}" />
			<div class="title">
			<c:out value="${read.board_title}" />
			<br>
			</div>
			<div class="day">
	이벤트기간 : <c:out value="${read.s_date}" /> ~ <c:out
				value="${read.e_date}" />

			<br>
			</div>
			<div class="content">
			<img src="/resources/static/eventimg/${read.board_content}" alt="" />
		
		<br>
			</div>
			<div>
		<c:set var="memid1" value="${read.mem_id}" />
	<c:set var="memid2" value="${user.mem_id}" />

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<form action="/boards/delete">
			<input type="hidden" name="board_id" value="${read.board_id}">
			<input type="hidden" name="board_type" value="${read.board_type}">
			<div class="delete_btn_box" style="text-align: center; margin-top: 25px">
			<button type="submit" class="delete_btn">삭제</button>
			</div>
		</form>
	</sec:authorize>
	</div>


	
	</main>
</body>
</html>