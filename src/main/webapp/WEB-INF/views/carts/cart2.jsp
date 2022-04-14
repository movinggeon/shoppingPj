
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <%--<link rel="stylesheet" href="/resources/static/css/cart.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="/resources/static/css/header.css" type="text/css"/>

        <link rel="stylesheet" href="/resources/static/css/footer.css" type="text/css"/>
        <script src="/resources/static/js/header.js" defer></script>--%>
    <style>
        @font-face {
            font-family: "BBTreeGR";
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
            format("woff");
            font-weight: normal;
            font-style: normal;
        }
        h1{
            margin-left: auto;
            margin-right: auto;
            width:80%;
            font-size: 22px;
        }
        /*.wrapper2{
             height: auto;
             min-height: 100%;
             padding-bottom: 60px;
         }*/
        /* footer{
             height:60px;
             position : relative;
             transform : translateY(-100%);
         }*/
        .wrapcart{
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
            border-bottom: 1px solid rgba(0, 0, 0, 0.3);
            background: none;
            width:98%

        }
        .oneitem{
            /*border-top: 30px;*/
            height: 310px;
            background: none;
            /*border: 1px solid darkgray;*/
            border-top: 1px solid rgba(0, 0, 0, 0.3);
            border-collapse: collapse;
            /*-moz-background-clip: padding-box;*/
            /*background-clip: padding-box;*/
        }
        .imagebox{
            float:left;
            margin:30px 0 30px 6px;
            width:27%;
            height: 80%;
            border-radius: 20px;
            background-color: #ebebeb;
            background-size: cover;

        }
    .image1{
        height: 320px;
        width: 230px;
        padding-bottom: 30px;
        padding-top: 30px;
        background-size: cover;

    }
    .image1.img{
        height:300px;
        width: 200px;
        padding-top:10px;
        padding-left: 15px;
    }
        .iteminfobox{
            float: right;
            width:65%;
            height: 50%;
            border-bottom: 1px solid rgba(0, 0, 0, 0.2);
            display:table-cell;
        }
        .iteminfo{
            float:left;
            width:60%;
            padding-top: 70px;
            height:50%;
            font-size: 20px;
            text-align: left;
            display:table-cell;
            vertical-align:middle;

        }
        .price{
            font-size: 20px;
            float: right;
            width:20%;
            padding-top: 70px;
            height:50%;
            text-align: right;

        }
        .count{
            float: left;
            font-size: 20px;
            width:20%;
            padding-top: 65px;
            padding-bottom: 15px;
            height:50%;

        }
        select{
            outline: none;
            width:50px;
            height:40px;
            border:none;
            font-size: 18px;
            font-weight: bold;
            /*background-size:27px;*/
            background: url("/resources/static/img/cartarrow.png") no-repeat 95% 50%;
            box-sizing: border-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance : none;
            cursor:pointer;
        }
        select::-ms-expand {
            display: none;
        }
        .delete{
            font-size: 13px;
            color: steelblue;
            cursor:pointer;
            padding-top: 12px;
            padding-right: 6px;
        }
        .carebox{
            float: right;
            width: 65%;
            height: 40%;
        }
        .carehave{
            float: left;
            font-size: 15px;
            padding-top: 20px;
        }
        .finalblock{
            margin-left: auto;
            margin-right: auto;
            padding-top: 30px;
            text-align: right;
            float: right;
            width:60%;
            height:300px;
        }
        .finaltotal{
            text-align: right;
            float: right;
            width:100%;
            height:100px;
            font-size:22px;
        }
        .addressblock{
            width:100%;
            height: 50%;
            float:right;
            /*  padding-top: 30px;*/
        }
        .goaddressbtn {
            display: inline-block;
            float: right;
            width: 200px;
            height: 35px;
            border-radius: 8px;
            background-color: #0071E3;
            font-size: 15px;
            font-weight: bold;
            color:white;
            border: 1px solid #ddd;
            padding: 5px 5px;
            cursor: pointer;
        }
        .finaltotalname{
            font-size:22px;
            float:left;
        }

        .m_box {
            width: 100%;
        }

        .m_content {
            margin: 60px auto;
            max-width: 1110px;
        }
        .basket_title{
            font-size: 23px;
            font-weight: bold;
            padding-left: 10px;
        }

    </style>
</head>
<body>
<div class="wrapper2">
    <div class="m_box">
        <div class="m_content">
            <span class="basket_title">장바구니</span>

            <div class="wrapcart">
                ${qtyError}<br>
                ${qtyZero}<br>
                <c:if test="${fn:length(carts) < 1 }">
                    <h3>장바구니 내용이 없습니다.</h3>
                </c:if>
                <c:forEach items="${carts}" var="items">
                    <div class="oneitem" id =${items.cart_id} >
                        <div class="imagebox">
                            <div class="image1">
                                <img src="${pageContext.request.contextPath}/resources/static/img/${items.productsVO.product_name}.png">
                            </div>
                        </div>
                        <div class="iteminfobox">

                            <div class="iteminfo">
                                    ${items.productsVO.product_name} ${items.modelsVO.model_name} ${items.specVO.spec_color}
                            </div>
                            <div class="count">
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
                            </div>
                            <div class="price">
                                <span>₩</span>
                                <span id ="pri${items.cart_id}">${items.cart_price * items.cart_qty}</span>

                                <div class= "delete" id="del${items.cart_id}" onclick="delCart(this.id)">
                                    삭제
                                </div>
                            </div>
                        </div>
                        <div class="carebox">
                            <div class="carehave">
                                    ${items.productsVO.product_name} ${items.modelsVO.model_name}
                                <c:choose>
                                    <c:when test="${items.cart_isCare eq -1}">
                                        케어 서비스 선택됨
                                    </c:when>
                                    <c:otherwise>
                                        케어 서비스 선택 안됨
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${totalPrice ne 0}">
                    <div class="finalblock">
                        <div class="finaltotal">
                            <span class="finaltotalname"> 총계</span>
                            ₩<span id="totalPrice" class="totalPrice">
                                ${totalPrice}
                        </span><br>
                        </div>
                        <div class="addressblock">
                            <button class="goaddressbtn" onclick="location.href='/carts/member/mailinginformation' ">주소지 설정</button>
                        </div>
                    </div>
                </c:if>
            </div>
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
        </div>
    </div>
</div>
</body>
</html>