
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>${specDisplayVO.product_name} ${specDisplayVO.model_name}</h2>
<hr>

<div id="Color">
    <h4>color</h4>
    <c:forEach items="${specDisplayVO.spec_color}" var="color">
        <span id = "${color}">${color}</span> &nbsp
    </c:forEach>
</div>

<div id="prcoessor">
    <h4>Processor</h4>
    <c:forEach items="${specDisplayVO.spec_processor}" var="processor">
        <span id = "${processor}">${processor}</span> &nbsp
    </c:forEach>
</div>

<div id="memory">
    <h4>Memory</h4>
    <c:forEach items="${specDisplayVO.spec_memory}" var="memory">
        <span id = "${memory}">${memory}</span> &nbsp
    </c:forEach>
</div>

<div id="network">
    <h4>Network</h4>
    <c:forEach items="${specDisplayVO.spec_network}" var="network">
        <span id="${network}">${network}</span> &nbsp
    </c:forEach>
</div>

</body>
</html>
