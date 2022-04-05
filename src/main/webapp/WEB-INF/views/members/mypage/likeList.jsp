<%@page import="com.group6.shopping.security.CustomMemDetails"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user"); %>
</head>
<body>

<h1>좋아요 리스트</h1>

<c:forEach var="like" items="${likeList }" >
    <div class="like_card">
        <div class="like_id">
                ${like.like_id }
        </div>
        <div class="spec_id">
                ${like.spec_id}
        </div>
        <div class="cupon_discount">
                ${like.mem_id}
        </div>
    </div>
</c:forEach>
</body>
</html>
