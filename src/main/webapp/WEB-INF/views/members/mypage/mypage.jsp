<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>

    <title>Title</title>
</head>
<body>
<sec:authorize access="hasRole('ROLE_MEMBER')">
    <c:if test="${URI ne '/members/modify'}">
    <a href="/members/modify">회원정보수정</a><br>
    </c:if>
</sec:authorize>


</body>
</html>
