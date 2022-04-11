<%@page import="com.group6.shopping.security.CustomMemDetails"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Title</title>
	<link rel="stylesheet" href="/resources/static/css/mypage.css" type="text/css">
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
						<span class="span-hover" id="likeList">MY ♡ ITEM</span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="span-hover" id="receiptList"> 주문/배송/취소 조회 </span>
					</li>
				</ul>
				<ul>
					<li>
						<span class="span-hover" id="couponList">쿠폰</span>
					</li>
				</ul>
				<ul>
					<li>
       					<span class="span-hover" id="modifyMem">회원정보수정</span>
					</li>
					<li>
       					<span class="span-hover" id="modifyPwMem">비밀번호 변경</span>
					</li>
					<li>
   						<span class="span-hover" id="deleteMem">회원탈퇴</span>
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
		
		<div class="like_title">
			<h3>좋아요</h3>
		</div>
	</div>
</body>
</html>
