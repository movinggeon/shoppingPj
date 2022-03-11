<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--현재 경로-->
<c:set var="URI" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<a href="/">HOME</a><br>
<c:choose>
    <c:when test="${not empty user}">
        ${user.mem_id}님 반갑습니다.
        <form action="/everyone/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit">LOGOUT</button>
        </form>
    </c:when>
    <c:otherwise>
        <c:if test="${URI ne '/everyone/join'}">
            <a href="/everyone/join">회원가입</a><br>
        </c:if>

        <c:if test="${URI ne '/everyone/login'}">
            <a href="/everyone/login">로그인</a><br>
        </c:if>
    </c:otherwise>
</c:choose>
</body>
</html>