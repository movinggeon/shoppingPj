<%--
  Created by IntelliJ IDEA.
  User: jhkwa
  Date: 2022-03-20
  Time: 오후 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>장바구니</h1>
<hr>

<c:forEach items="${carts}" var="items">
    <div id =${items.cart_id} onclick="clickEvent(this.id)">
        ${items.cart_id} ${items.cart_price} ${items.cart_qty}개
        ${items.productsVO.product_name} ${items.modelsVO.model_name}${items.specVO.spec_color}
    </div>
    <hr>
</c:forEach>

<script>
    var list = [];
    function clickEvent(id){

    }

</script>

</body>
</html>
