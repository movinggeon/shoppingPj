
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<div style="margin-top:17px"></div>--%>
<div class="main-content">
    <style>
        .container{
            display: grid;
            grid-template-columns:repeat(auto-fill, minmax(300px, 1fr));
            margin:30px auto;
            max-width: 1140px;
            min-height: 500px;
            padding: 0 1%;
        }
        .product_list{
            margin:10px;
            padding: 0 8px;
            min-width: 200px;height: 390px;border:1px solid #b9b9b9;
            border-radius: 5px;
        }

        .product_list img{
            padding-top: 8px;
            display: block;
            width: 100%;
            height: 270px;
            margin:0 auto;
            object-fit: cover;
            border-radius: 5px;
        }

        .product_list p{
            text-align: center;
            font-size: 14px;
        }

        .product_list h4{
            text-align: center;
            color: gray;
            font-weight: 500;
        }

        .product_list button{
            display: block;
            margin:auto;
            background-color: green;
            color:white;
            border:0;
            border-radius: 5px;
            padding:3px 8px;
            font-size: 12px;
            cursor: pointer;
        }

        .top_nav {
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

        .search_box {
            background-color: #333;
            width: 100%;
        }

        .search_view {
            margin:0 auto;
            max-width: 1110px;
            text-align: center;
            padding-top:16px;
            height: 60px;
            line-height: 60px;
            font-size: 11px;
            color: gray;
        }

        .search_view input{
            width: 350px;
            height: 38px;
            margin-left: 5px;
            border:0;
            outline: none;
            background-color: white;
        }

        .search_in{
            width: 460px;
            height: 40px;
            margin: 0 auto;
            line-height: 40px;
            background-color: white;
            border-radius: 20px;
            padding:2px;
        }

        .search_vbtn{
            width: 25px;
            height: 25px;
            margin-left: 10px;
            background-color: transparent;
            border:0;
            background-image: url("${pageContext.request.contextPath}/resources/static/img/search.png");
            background-size: 20px;
            background-repeat: no-repeat;
            vertical-align: middle;
            cursor: pointer;
        }

        .search_vclose{
            width: 20px;
            height: 20px;
            background-color: transparent;
            border:0;
            background-image: url("${pageContext.request.contextPath}/resources/static/img/cancel.png");
            background-repeat: no-repeat;
            vertical-align: middle;
            cursor: pointer;
        }

        .search_key_box{
            padding: 0 2%;
            margin-top: 15px;
            margin-bottom: 40px;
        }

        .keyword_info{
            padding-top: 20px;
            margin:0 auto;
            max-width: 1100px;
            text-align: left;
            padding-left: 15px;
            height: 48px;
            line-height: 48px;
            font-size: 20px;
            border-bottom: 2px solid #333;
        }

        .key_total{
            padding-left:15px;
            font-size: 16px;
        }

    </style>
    <script>
        function delVal(){
            $(".search_Val").val("");
        }
    </script>
<%--    <div style="margin-top:38px;"></div>--%>
    <div class="top_nav">
        <div class="topp">
            Home > 검색
        </div>
    </div>

    <div class="search_box">
        <div class="search_view">
            <div class="search_in">
            <form action="/spec/searchItems" method="get" autocomplete="off">
                <input class="search_Val" type="text" name="searchInput" value="${searchInput}">
                <button type="button" class="search_vclose" onclick="delVal()"></button>
                <button type="submit" class="search_vbtn" ></button>
            </form>
            </div>
        </div>
    </div>

    <div class="search_key_box">
        <div class="keyword_info">
            "${searchInput}" <span class="key_total">검색결과 <span style="color:#3062f6">${resultNum}</span>건</span>
        </div>
    </div>


    <div class="container" style="margin-bottom: 60px">
        <c:choose>
            <c:when test="${searchFail ne null}">
                <h3 style="padding-left:25px">${searchFail}</h3>
            </c:when>
            <c:otherwise>
                <c:forEach var="model" items="${result}">
                    <a href="/spec/chooseModel?model_id=${model.model_id}&category=new&currPage=1">
                        <div class="product_list">
                            <img src="${pageContext.request.contextPath}/resources/static/img/${model.productsVO.product_name}.png"  alt="">
                            <p>${model.productsVO.product_name} ${model.model_name}</p>
                        </div>
                    </a>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
