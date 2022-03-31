<%--
  Created by IntelliJ IDEA.
  User: jhkwa
  Date: 2022-03-29
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>검색 결과: ${resultNum} 개</h1>
${searchFail}

<c:forEach var="model" items="${result}">
    <a href="/spec/chooseModel?model_id=${model.model_id}&category=new&currPage=1">${model.productsVO.product_name} ${model.model_name}</a> <br>
</c:forEach>


</body>
</html>
