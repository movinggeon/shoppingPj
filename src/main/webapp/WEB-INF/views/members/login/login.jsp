<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/static/css/login.css" type="text/css">
</head>
<body>
<div>
<c:if test="${not empty msg}">
    ${msg}
</c:if>
	<h1>로그인 페이지 ㅎㅎ</h1>
	<h1>Login Page</h1> 
	<h2>${error}</h2> 
	<h2>${logout}</h2> 
	<form action="/login" method="post">
		<div> <input type="text" name="username" /> </div> 
		<div> <input type="password" name="password" /> </div> 
		<div> <input type="submit"/> </div> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	</form>
	<a href="/join">회원가입</a>
	<a href="/findId">아이디찾기</a>
	<a href="/findPw">비밀번호찾기</a>
</div>
<a href="/members/join">회원가입</a>
<a href="/members/findId">아이디찾기</a>
<a href="/members/findPw">비밀번호찾기</a>
</body>
</html>