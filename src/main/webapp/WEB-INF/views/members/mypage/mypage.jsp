<%@page import="com.group6.shopping.security.CustomMemDetails"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Title</title>
<%--	<link rel="stylesheet" href="/resources/static/css/mypage.css" type="text/css">--%>
	<%CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user"); %>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#couponList").click(function(){
		    $(".page_loader").load("/members/coupons");
		});
		$("#couponDetail").click(function(){
		    $(".page_loader").load("/members/coupons");
		});
		$("#likeList").click(function(){
		    $(".page_loader").load("/likes/members/likeslist");
		});
		$("#likeMore").click(function(){
			$(".page_loader").load("/likes/members/likeslist");
		});
		$("#modifyMem").click(function(){
		    $(".page_loader").load("/members/member/modify");
		});
		$("#modifyPwMem").click(function(){
		    $(".page_loader").load("/members/member/modifyPassword");
		});
		$("#deleteMem").click(function(){
		    $(".page_loader").load("/members/member/delete");
		});
		$("#receiptList").click(function(){
		    $(".page_loader").load("/receipts/member/receiptList");
		});
	});
</script>
</head>
<body>
<style>
	html,
	body {
		width: 100%;
		height: 100%;
		margin: 0px;
	}

	.container {
		width: 100%;
		height: 100%;
	}


	h1.sub_title{

		text-align: center;
		margin-bottom: 0px;
	}

	div.sub_menu{
		width: 100%;
		height: 200px;
	}

	div.menu_header{
		width: 100%;
		background-color: #e5e5e5;
	}

	div.menu_header ul {

		width: 100%;
		height: 100%;
		list-style:none;
		margin-bottom: 0px;
		display: flex;
		justify-content: center;
		text-align: center;

		padding:0px;

		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}

	div.menu_header li {
		float: left;
		width: 15%;
		height: 100%;
		font-size: 17px;
		line-height: 40px;
	}

	div.menu_header li a {

		vertical-align: middle;
	}

	div.menu_list {

		width: 100%;
		height: 150px;
		border-bottom: 1px solid black;
	}

	div.inner {

		width: 100%;
		height: 150px;
		display: flex;
		justify-content: center;
	}

	div.inner ul {

		text-align: center;
		width: 15%;
		list-style: none;
		padding-top: 20px;
		padding-left: 0px;
		margin: 0px;
	}

	div.inner ul:not(:first-of-type) {
		border-left: 1px dashed #b5b5b5;
	}

	div.inner li {

		text-align: center;
		line-height: 30px;
		vertical-align: top;
		padding-bottom: 10px;
		font-size: 13px;

	}

	div.cupon_info  {

		width: 75%;
		height: 200px;
		margin-left:auto;
		margin-right:auto;
		justify-content: center;
		display: flex;
		align-items: center;
		margin-top: 100px;
		text-align: center;
		background-color: #e5e5e5;
	}

	div.cupon_info div.user_name {
		width: 60%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	div.cupon_info div.user_cupon {
		width: 20%;
		height: 50%;
		border-left: 1px dashed #b5b5b5;
	}

	div.cupon_info div.user_point {
		width: 20%;
		height: 50%;
		border-left: 1px dashed #b5b5b5;
	}

	.table_title {
		width: 1240px;
		margin-top: 100px;
		height: 36px;
		margin-left: auto;
		margin-right: auto;
	}
	table.order_list {
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
		border-top: 2px solid #171717;
		border-bottom: 1px solid #171717;
		margin-bottom: 50px;
	}

	table.order_list th {

		height: 68px;
		border-bottom: 1px solid #b5b5b5;
	}

	table.order_list tr td {

		text-align: center;
		vertical-align: middle;
	}
	.like_title_form{
		width: 1240px;
/*		margin-top: 50px;*/
		height: 60px;
		margin-left: auto;
		margin-right: auto;
		border-bottom: 2px solid #171717;
		position: relative;
	}
	.like_title {
		width: 100%;
		position: absolute;
		bottom:0px;
	}
	.like_more{
		width: 100%;
		float:right;
		position: absolute;
		bottom:0px;
		text-align: right;
	}
	.like_list{
		display: grid;
		grid-template-columns:repeat(auto-fill, minmax(300px, 1fr));
		margin:10px auto 50px auto;
		width: 1240px;
		/*border-top: 2px solid #171717;*/
	}
	.like_item img{
		padding-top: 25px;
		display: block;
		width: 90%;
		height: 250px;
		margin:0 auto;
		object-fit: cover;
		border-top-left-radius: 30px;
	}
	.like_item{
		margin:15px;
		padding: 0 8px;
		min-width: 200px;
		height: 420px;
		border : 1px solid #b5b5b5;

	}
	.like_content{
		text-align: center;
		margin-top: 1px;
		padding-bottom: 8px;
	}
	.btn_buy{
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

	ul li a:link { color: black; text-decoration: none;}
	ul li a:visited { color: black; text-decoration: none;}
	ul li a:hover { color: black; text-decoration: none;}

</style>


	<h1 class="sub_title">MY PAGE</h1>
	
	<div class="sub_menu">
		<div class="menu_header">
			<ul>
				<li>
					<span>MY♡</span>
				</li>
				<li>
					<span>주문관리</span>
				</li>
				<li>
					<span>혜택</span>
				</li>
				<li>
					<span>정보관리</span>
				</li>
				<li>
					<span>문의내역</span>
				</li>
			</ul>
		</div>
		
		<div class="menu_list">
			<div class="inner">
				<ul>
					<li>
						<span  id="likeList" style="cursor:pointer">MY ♡ ITEM</span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="span-hover" id="receiptList"> 주문/배송/취소 조회 </span>
					</li>
				</ul>
				<ul>
					<li>
						<span id="couponList" style="cursor:pointer">쿠폰</span>
					</li>
				</ul>
				<ul>
					<li>
       					<span  id="modifyMem" style="cursor:pointer">회원정보수정</span>
					</li>
					<li>
       					<span  id="modifyPwMem" style="cursor:pointer" >비밀번호 변경</span>
					</li>
					<li>
   						<span  id="deleteMem" style="cursor:pointer">회원탈퇴</span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="span-hover" >상품평</span>
					</li>
					<li>
						<span class="span-hover" >1:1문의</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="page_loader">
		<div class="cupon_info">
			<div class="user_name">
				<%=cs.getMem_name() %>님 안녕하세요
			</div>
			<div class="user_cupon">
				쿠폰
				<div style="padding-top: 30px">
					<span id="couponDetail">${couponEA }</span>개
				</div>
			</div>
			<div class="user_point">
				포인트
				<div style="padding-top: 30px">
					<%=cs.getMem_point() %>P
				</div>
			</div>
		</div>
		
		<div class="table_title">
			<h3>최근주문 내역</h3>
		</div>
		
		<table class="order_list">
			<colgroup>
				<col style="width:135px">
				<col style="width:155px">
				<col style="width:400px">
				<col style="width:150px">
				<col style="width:125px">
				<col style="width:145px">
				<col style="width:130px">
			</colgroup>
			<tr>
				<th>주문일</th>
				<th>주문번호</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>진행상황</th>
				<th>상품평</th>
			</tr>
			<tr>
				<td colspan="7">주문하신 내역이 없습니다.</td>
			</tr>
		</table>
		<div class="like_title_form">
			<div class="like_title">
				<h3>좋아요</h3>
			</div>
			<div class="like_more">
				<span id="likeMore">more+</span>
			</div>
		</div>

		<div class="like_list">
			<c:forEach items="${likeList}" var="like" begin="0" end="3">
					<div class="like_item">
						<img src="${pageContext.request.contextPath}/resources/static/img/sixphone.png" alt="">
						<div class="like_content">
							<h3>${like.productsVO.product_name}  ${like.modelsVO.model_name}</h3>
							<br>
							<a href="/spec/chooseModel?model_id=${like.modelsVO.model_id}&category=new&currPage=1">
								<button class="btn_buy">구입하기</button></a>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
