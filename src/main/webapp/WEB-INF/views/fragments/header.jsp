<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script
			src="https://kit.fontawesome.com/6da1745729.js"
			crossorigin="anonymous"
	></script>
	<link
			rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
	/>
	<script src="${pageContext.request.contextPath}/resources/static/js/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/bxslider.js" type="text/javascript"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/footer.css" />
	<script src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/header.js" defer></script>
	<title>SMARTDC</title>
</head>
<body>
	<div class="wrapper">
	<!-- Chat button -->
	<div id="chat"></div>

	<!-- Side menu -->
	<div class="menu_bg"></div>
	<div id="sideMenu">
		<div class="close_btn">
			<i class="xi-close"></i>
		</div>

		<ul class="m1">
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/smartphone.png"><h4 class="left">스마트폰</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/laptop.png"><h4 class="left">노트북</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/tablet.png"><h4 class="left">태블릿</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/watch.png"><h4 class="left">워치</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/event.png"><h4 class="left">이벤트</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/center.png"><h4 class="left">고객센터</h4></a></li>
		</ul>
		<hr color="#ebebeb" size="1px" width="95%" />
		<sec:authorize access="isAnonymous()">
			<ul class="m2">
				<li><a href="/login"><img src="${pageContext.request.contextPath}/resources/static/img/user.png"><h4 class="left">로그인</h4></a></li>
			</ul>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<ul class="m2">
				<li>
				<form action="/members/logout" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					<input type="image" src="${pageContext.request.contextPath}/resources/static/img/user.png">
					<h4 class="left">로그아웃</h4>
				</form>
				</li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/truck.png"><h4 class="left">주문/배송조회</h4></a></li>
			</ul>
		</sec:authorize>
	</div>

	<!-- Search box -->
	<div id="mask"></div>
	<div class="window">
		<div class="win_wrap">
			<input id="h_box" class="holder" type="text" placeholder="Search" value="" />
			<div class="h_box">
				<div class="h1" style="text-align: left;">
					<ul>
						<h4>최근 검색어</h4>
						<li>워치</li>
						<li>Teamsix</li>
						<li></li>
						<li></li>
					</ul>
				</div>
				<div class="h2" style="text-align: left;">
					<ul>
						<h4>인기 검색어</h4>
						<li><span>1</span> 스마트폰</li>
						<li><span>2</span> 태블릿</li>
						<li><span>3</span> 노트북</li>
					</ul>
				</div>

			</div>
			<div style="text-align: center; padding-top: 40px">
				<button class="close" id="btn_close">
					<i class="fa-solid fa-circle-xmark"></i>
				</button>
			</div>

		</div>
	</div>
	<!-- Header -->
	<header class="hd">
		<nav class="navbar nav_list">
			<div class="nav_logo">
				<i class="fa-brands fa-joomla"></i>
				<a href="/" class="logo">SMARTDC</a>
			</div>
			<ul class="nav_menu">
				<li>
					<a href="#">스마트폰</a>
					<ul>
						<li><a href="#">Phone1</a></li>
						<li><a href="#">Phone2</a></li>
						<li><a href="#">Phone3</a></li>
					</ul>
				</li>
				<li>
					<a href="">노트북</a>
					<ul>
						<li><a href="#">Note1</a></li>
						<li><a href="#">Note2</a></li>
						<li><a href="#">Note3</a></li>
					</ul>
				</li>
				<li>
					<a href="#">태블릿</a>
					<ul>
						<li><a href="#">Tablet1</a></li>
						<li><a href="#">Tablet2</a></li>
						<li><a href="#">Tablet3</a></li>
					</ul>
				</li>
				<li>
					<a href="#">워치</a>
					<ul>
						<li><a href="#">Watch1</a></li>
						<li><a href="#">Watch2</a></li>
						<li><a href="#">Watch3</a></li>
					</ul>
				</li>
				<li>
					<a href="#">이벤트</a>
					<ul>
						<li><a href="/boards/event">Event</a></li>
						<li><a href="/boards/review">리뷰</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터</a>
					<ul>
						<li><a href="#">Service</a></li>
					</ul>
				</li>
			</ul>

			<ol class="nav_links">
				<li>
					<a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
				</li>
				<li>
					<a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
				</li>
				<sec:authorize access="isAnonymous()">
					<li class="user user_menu">
						<a href="/login"><i class="fa-solid fa-user"></i></a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li class="user user_menu">
						<a href="/members/member/mypage"><i class="fa-solid fa-user"></i></a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li class="user user_menu">
						<form action="/members/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<input type="image" value="로그아웃">
						</form>
					</li>
				</sec:authorize>
			</ol>

			<a href="#" class="menu_find">
				<i class="fa-solid fa-magnifying-glass"></i>
			</a>
			<a href="#" class="menu_btn">
				<i class="fa-solid fa-bars"></i>
			</a>

		</nav>
	</header>
</div>
</body>
</html>