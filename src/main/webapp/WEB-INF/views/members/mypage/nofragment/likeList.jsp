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
<style>
    .container2{
        display: grid;
        grid-template-columns:repeat(auto-fill, minmax(300px, 1fr));
        margin:30px auto 50px auto;
        max-width: 1110px;
    }
    .product_list{
        margin:10px;
        padding: 0 8px;
        min-width: 200px;height: 450px;border:1px solid #b9b9b9;
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
        height: 1px;border-style: solid;border-width: 1px 0 0 0;border-color: #b9b9b9;width: 80%;
    }
    h1{
        text-align: center;
    }
</style>
<body>

<div style="margin-top:17px"></div>

<h1>MY♡ITEM  ALL</h1><br>

    <div class="container2">

        <c:forEach items="${likeList}" var="like">
            <div class="product_list">
                <img src="${pageContext.request.contextPath}/resources/static/img/${like.productsVO.product_name}.png" alt="">
                <div class="info_x">
                    <h2> ${like.productsVO.product_name}  ${like.modelsVO.model_name}</h2>
                    <br>
                    <a href="/spec/chooseModel?model_id=${like.modelsVO.model_id}&category=new&currPage=1"><button>구입하기</button></a>
                    <br>
                    <hr class="info_hr">
                    <br>
                </div>
            </div>
        </c:forEach>
    </div>


</body>
</html>