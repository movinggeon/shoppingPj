<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<!--현재 경로-->
<c:set var="URI" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<a href="/">HOME</a><br>

<a href="/spec/viewModels?product=sixPhone">SixPhone</a>
<a href="/spec/viewModels?product=sixBook">SixBook</a>
<a href="/spec/viewModels?product=sixTablet">SixTablet</a>
<a href="/spec/viewModels?product=sixWatch">SixWatch</a>


<sec:authorize access="isAuthenticated()">
    ${user.mem_id}님 환영합니다.
    <!--<sec:authentication property="principal" var="userName" scope="request"/>-->

    <form action="/members/logout" method="post" id="logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    <a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a>
</sec:authorize>

<sec:authorize access="isAnonymous()">
    <c:if test="${URI ne '/members/join'}">
        <a href="/members/join">회원가입</a>
    </c:if>

    <c:if test="${URI ne '/members/login'}">
        <a href="/members/login">로그인</a><br>
    </c:if>
</sec:authorize>



</body>
</html>