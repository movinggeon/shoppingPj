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