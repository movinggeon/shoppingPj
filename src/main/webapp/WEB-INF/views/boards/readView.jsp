<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	<br>
	<div>
		<c:set var="type" value="${read.board_type}" />
		<c:if test="${type eq 'event'}">
			<c:out value="${read.board_title}" />
			<br>
	이벤트기간 : <c:out value="${read.s_date}" /> ~ <c:out
				value="${read.e_date}" />

			<br>
			<c:out value="${read.board_content }" />
		
		</c:if>


		<c:if test="${type eq 'review'}">
		리뷰제목	<c:out value="${read.board_title}" />
			<br>
	제품모델] <c:out value="${read.spec_id}" />
			<c:out value="${read.board_rate}" />

			<br>
	리뷰내용:	<c:out value="${read.board_content }" />
			
		</c:if>
	</div>


	<c:set var="memid1" value="${read.mem_id}" />
	<c:set var="memid2" value="${user.mem_id}" />
	<c:if test="${memid1 eq memid2}">
		<form action="/boards/delete">
			<input type="hidden" name="board_id" value="${read.board_id}">
			<input type="hidden" name="board_type" value="${read.board_type}">
			<button type="submit">삭제</button>
		</form>
	</c:if>
</body>
</html>