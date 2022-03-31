
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>장바구니</h1>
<hr>

${qtyError}<br>
${qtyZero}<br>
<c:forEach items="${carts}" var="items">
    <div id =${items.cart_id}>
        ${items.productsVO.product_name} ${items.modelsVO.model_name}${items.specVO.spec_color} <br>
        ${items.cart_id}
        <span id ="pri${items.cart_id}">${items.cart_price * items.cart_qty}</span>

        <select id="qty${items.cart_id}" onchange="updateQty(this.id, this.value)">
            <c:forEach var="i" begin="1" end="${items.specVO.spec_qty}">
                <c:choose>
                    <c:when test="${i eq items.cart_qty}">
                        <option value="${i}" selected>${i}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${i}">${i}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        <div id="del${items.cart_id}" onclick="delCart(this.id)">
            삭제
        </div>
        <hr>
    </div>
</c:forEach>



<span id="totalPrice">
    <h1 style="display: inline">${totalPrice}</h1>
</span><h1 style="display: inline">원</h1><br>
<c:if test="${totalPrice ne 0}">
    <a href="/carts/member/mailinginformation">주소지 설정</a>
</c:if>


<script>
    function updateQty(id ,value){
        var cartId = id.substring(3);
        var qty = value;

        //ajax work to remove from carts db
        $.ajax({
            url: "/carts/member/updateQty",
            type:"post",
            data:{
                cart_id:cartId,
                cart_qty:qty
            },
            dataType: "json",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                document.getElementById("totalPrice").innerHTML = "<h1 style='display: inline'>" + data.total + "</h1>";
                document.getElementById("pri"+cartId).innerHTML = data.itemPrice;
            },
            error: function() {
                alert("error");
            }
        });

    }
    function delCart(id){
        var cartId = id.substring(3);
        document.getElementById(cartId).remove();

        //ajax work to remove from carts db
        $.ajax({
            url: "/carts/member/deleteCart",
            type:"post",
            data:{cart_id:cartId},
            dataType: "json",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                document.getElementById("totalPrice").innerHTML = "<h1 style='display: inline'>" + data.total + "</h1>";
            },
            error: function() {
                alert("error");
            }
        });
    }
</script>

</body>
</html>
