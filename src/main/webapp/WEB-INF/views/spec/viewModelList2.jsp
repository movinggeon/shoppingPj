<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>

<style>
    .container{
        display: grid;
        grid-template-columns:repeat(auto-fill, minmax(300px, 1fr));
        margin:30px auto 50px auto;
        max-width: 1110px;
    }
    .product_list{
        margin:10px;
        padding: 0 8px;
        min-width: 200px;
        height: 970px;
        border:1px solid #dcdcdc;
        border-top-left-radius: 30px;
        border-bottom-right-radius: 30px;
    }

    .product_list:hover{
        box-shadow: 1px 1px 20px #ddd;
    }

    .product_list img{
        padding-top: 25px;
        display: block;
        width: 100%;
        height: 250px;
        margin:0 auto;
        object-fit: cover;
        border-top-left-radius: 30px;
    }

    .product_list p{
        text-align: center;
    }

    .product_list button{
        display: block;
        margin:auto;
        background-color: #306fdb;
        color:white;
        border:0;
        border-radius: 20px;
        padding:6px 8px;
        font-size: 12px;
        cursor: pointer;
        width: 70px;
    }

    .top_nav {
        background-color: #f3f3f3;
        width: 100%;
    }

    .topp {
        margin:0 auto;
        max-width: 1110px;
        text-align: left;
        padding-left: 20px;
        height: 48px;
        line-height: 48px;
        font-size: 11px;
        color: gray;
    }

    .info_x{
        text-align: center;
        margin-top: 22px;
        padding-bottom: 8px;
    }

    .info_x > i {
        font-size: 23px;
    }

    .info_x > h3, h4 {
        color:#333;
        font-weight: 500;
    }

    .info_hr{
        height: 1px;border-style: solid;border-width: 1px 0 0 0;border-color: #e0dbdb;width: 80%;
    }

</style>

<body>
<%--<div style="margin-top:17px"></div>--%>
<%--<div class="main-content">--%>

<%--    <div style="margin-top:48px;"></div>--%>
    <div class="top_nav">
        <div class="topp">
            ${specDisplayVOList[0].product_name}
        </div>
    </div>

    <div class="container">
    <c:forEach items="${specDisplayVOList}" var="list">
            <div class="product_list">
                <img src="${pageContext.request.contextPath}/resources/static/img/${list.product_name}.png" alt="">
                <div class="info_x">
                    <h2>${list.product_name} ${list.model_name}</h2>
                    <p>놀라운 성능</p>
                    <br>
                    <h3>
                        <c:choose>
                            <c:when test="${list.spec_price[0] == list.spec_price[1]}">
                                <h3>₩${list.spec_price[0]}</h3>
                            </c:when>
                            <c:otherwise>
                                <h3>₩${list.spec_price[0]} ~ ₩${list.spec_price[1]}</h3>
                            </c:otherwise>
                        </c:choose>
                    </h3>
                    <br>
                    <a href="/spec/chooseModel?model_id=${list.model_id}&category=new&currPage=1"><button>구입하기</button></a>
                    <br>
                    <hr class="info_hr">
                    <br>
                    <i class="fa-solid fa-microchip"></i>
                        <h4>가장 빠른 칩<br>
                        <c:forEach items="${list.spec_processor}" var="processor">
                            <b> ${processor} </b>
                        </c:forEach>
                        </h4> <br>
                    <i class="fa-solid fa-sd-card"></i>
                        <h4>넓은 저장 공간 <br>
                            <c:forEach items="${list.spec_memory}" var="memory">
                                <b> ${memory}GB </b>
                            </c:forEach>
                        </h4><br>
                    <i class="fa-solid fa-display"></i>
                        <h4>잘보이는 디스플레이<br>
                            <c:forEach items="${list.spec_display}" var="display">
                                <b> ${display} inch</b>
                            </c:forEach>
                        </h4><br>
                    <i class="fa-solid fa-wifi"></i>
                        <h4>빠른 네트워크<br>
                            <c:forEach items="${list.spec_network}" var="network">
                                <b> ${network} </b>
                            </c:forEach>
                        </h4><br>
                </div>
            </div>
    </c:forEach>
    </div>
</body>
</html>