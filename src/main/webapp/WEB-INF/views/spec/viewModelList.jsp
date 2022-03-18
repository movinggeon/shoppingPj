
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


    <c:forEach items="${specDisplayVOList}" var="list">
        <form action="/spec/chooseModel" method="post">
            <input type = "hidden" value="${list.product_id}" name="product_id">
            <input type = "hidden" value="${list.product_name}" name="product_name">
            <input type = "hidden" value="${list.model_id}" name="model_id">
            <input type = "hidden" value="${list.model_name}" name="model_name">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="submit" value="보러가기">
        </form>
        ${list.product_id}
        ${list.product_name}
        ${list.model_id}
        ${list.model_name}
        processor:
        <c:forEach items="${list.spec_processor}" var="processor">
             ${processor}
        </c:forEach>
        memory:
        <c:forEach items="${list.spec_memory}" var="memory">
            ${memory}
        </c:forEach>
        display:
        <c:forEach items="${list.spec_display}" var="display">
            ${display}
        </c:forEach>
        network:
        <c:forEach items="${list.spec_network}" var="network">
            ${network}
        </c:forEach>
        color:
        <c:forEach items="${list.spec_color}" var="color">
            ${color}
        </c:forEach>
        weight:
        <c:forEach items="${list.spec_weight}" var="weight">
            ${weight}
        </c:forEach>
        <br>
    </c:forEach>


<script>
    function chooseModel(){

    }


</script>
</body>
</html>
