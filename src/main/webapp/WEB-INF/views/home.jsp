<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <c:if test="${URI ne '/members/modify'}">
        <a href="/members/member/mypage">마이페이지</a><br>
    </c:if>
</sec:authorize>
-------------------------------test-------------------<br>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();

    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
<%=name%>님 하이<br>
main.jsp

</body>
</html>