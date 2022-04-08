<%@page import="com.group6.shopping.security.CustomMemDetails"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Title</title>
	<link rel="stylesheet" href="/resources/static/css/couponList.css" type="text/css">
	<%CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user"); %>
</head>
<body>
	<h1 class="sub_title">MY PAGE</h1>
	
	<div class="sub_menu">
		<div class="menu_header">
			<ul>
				<li>
					<a href="#">좋아요</a>
				</li>
				<li>
					<a href="#">주문관리</a>
				</li>
				<li>
					<a href="#">나의 활동</a>
				</li>
				<li>
					<a href="#">혜택</a>
				</li>
				<li>
					<a href="#">정보관리</a>
				</li>
				<li>
					<a href="#">문의내역</a>
				</li>
			</ul>
		</div>
		
		<div class="menu_list">
			<div class="inner">
				<ul>
					<li>
						<a href="#">Clothes</a>
					</li>
					<li>
						<a href="#">Brands</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="#">주문/배송조회</a>
					</li>
					<li>
						<a href="#">취소/교환/반품 조회</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="#">재입고 알림</a>
					</li>
					<li>
						<a href="#">이벤트 참여내역</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/members/coupons">쿠폰</a>
					</li>
					<li>
						<a href="#">포인트</a>
					</li>
				</ul>
				<ul>
					<li>
					   <c:if test="${URI ne '/members/member/modify'}">
        					<a href="/members/member/modify">회원정보수정</a><br>
    					</c:if>
					</li>
					<li>
						<a href="#">환불계좌 관리</a>
					</li>
					<li>
						<c:if test="${URI ne '/members/member/delete'}">
    						<a href="/members/member/delete">회원탈퇴</a><br>
    					</c:if>
					</li>
				</ul>
				<ul>
					<li>
						<a href="#">상품 Q&A</a>
					</li>
					<li>
						<a href="#">상품평</a>
					</li>
					<li>
						<a href="#">1:1문의</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<h1>쿠폰 리스트</h1>
	
	<c:forEach var="coupon" items="${couponList }" >
		<div class="coupon_card">
			<div class="cupon_date">
				${coupon.coupon_valid_date }
			</div>
			<div class="cupon_name">
				${coupon.coupon_desc }
			</div>
			<div class="cupon_discount">
				${coupon.coupon_pct }
				${coupon.coupon_price }
			</div>
		</div>
	</c:forEach>
	
</body>
</html>