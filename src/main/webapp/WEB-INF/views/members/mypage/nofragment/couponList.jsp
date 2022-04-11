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
<%-- 
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
	 --%>
		<div class="coupon_box">
			<div class="coupon_box_title">
			사용가능 쿠폰
			</div>
			<div class="couponNum">
				총 ${couponEA}개
			</div>
			<div class="coupon_card_box">
				<table class="coupon_table">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰명</th>
							<th>혜택</th>
							<th>적용대상</th>
							<th>사용기간</th>
						</tr>
					</thead>

					<tbody>
					<c:forEach var="coupon" items="${couponList }" >
						<tr>
							<td>${coupon.coupon_id }</td>
							<td>${coupon.coupon_desc }</td>

							<c:set var="couponPrice" value="${coupon.coupon_pct}"></c:set>
							<c:choose>
							<c:when test="${couponPrice == 0}">
								<td>${coupon.coupon_price }원</td>
							</c:when>
							<c:otherwise>
								<td>${coupon.coupon_pct }% 할인</td>
							</c:otherwise>
							</c:choose>
							<td>전체대상</td>
							<td>~${coupon.coupon_valid_date}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>



	
</body>
</html>