<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Title</title>
	<link rel="stylesheet" href="/resources/static/css/mypage.css" type="text/css">
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
						<a href="#">쿠폰</a>
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
	
	<div class="cupon_info">
		<div class="user_name">
			ㅁㅁㅁ님 안녕하세요
		</div>
		<div class="user_cupon">
			<span>쿠폰</span> <br><br> X 개
		</div>
		<div class="user_point">
			<span>포인트</span> <br><br> XXXX P
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
</body>
</html>
