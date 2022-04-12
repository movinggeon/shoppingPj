<%@page import="com.group6.shopping.security.CustomMemDetails"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Title</title>
	<link rel="stylesheet" href="/resources/static/css/couponList.css" type="text/css">
	<%CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user"); %>
	<style>
		.btn_a {
			display: inline-block;
			width: 40px;
			border-radius: 20px;
			background-color: #ebebeb;
			border: 1px solid #ddd;
			padding: 5px 5px;
			cursor: pointer;
		}

		.btn_b {
			color: white;
			display: inline-block;
			width: 40px;
			height: 35px;
			border-radius: 20px;
			background-color: #0071ef;
			border: 1px solid #0071ef;
			padding: 5px 5px;
			cursor: pointer;
		}
	</style>
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

	<div class="rev_paging" style="text-align: center; margin-top: 30px">
		<c:choose>
			<c:when test="${pageError ne null}">
				${pageError}
			</c:when>
			<c:otherwise>
				<%-- 일번 페이지가 아닐 경우 --%>
				<c:if test="${page.currPage ne 1}">
					<%--맨앞 일페이지로 가기 && 현재의 이전 페이지로 이동--%>
					<button class="btn_a" onclick="paging(1)"> << </button>
					<button class="btn_a" onclick="paging('${page.currPage-1}')"> < </button>
				</c:if>
				<c:forEach var="i" begin="${page.minPage}" end="${page.maxPage}">
					<%--만약 현재 페이지일 경우 이동 링크를 제공하지 않음--%>
					<c:choose>
						<c:when test="${i eq page.currPage}">
							<button class="btn_b">${i}</button>
						</c:when>
						<c:otherwise>
							<button class="btn_a" onclick="paging('${i}')">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<%--현재 페이지가 마지막 페이지가 아닐 경우--%>
				<c:if test="${page.currPage ne page.totalPage}">
					<%--현재 페이지의 앞 페이지로 이동 && 맨마지막 페이지로 이동--%>
					<button class="btn_a" onclick="paging('${page.currPage+1}')"> > </button>
					<button class="btn_a" onclick="paging('${page.totalPage}')"> >> </button>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
<script>
	function paging(page){
		$(".page_loader").load("/members/coupons?page="+page);
	}
</script>
</body>
</html>