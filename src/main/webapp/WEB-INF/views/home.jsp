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
<%-- 	<!-- Chat button -->
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
		<ul class="m2">
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/user.png"><h4 class="left">로그인</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/truck.png"><h4 class="left">주문/배송조회</h4></a></li>
		</ul>
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
				<a href="#" class="logo">SMARTDC</a>
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
						<li><a href="#">Event</a></li>
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
				<li class="user user_menu">
					<a href="#"><i class="fa-solid fa-user"></i></a>
				</li>
			</ol>

			<a href="#" class="menu_find">
				<i class="fa-solid fa-magnifying-glass"></i>
			</a>
			<a href="#" class="menu_btn">
				<i class="fa-solid fa-bars"></i>
			</a>

		</nav>
	</header> --%>
	<div class="main-content">

		<!-- banner -->
		<div class="slider">
			<div>
				<img class="banner" src="${pageContext.request.contextPath}/resources/static/img/BGMAIN.png" alt="" />
			</div>
			<div><img class="banner" src="${pageContext.request.contextPath}/resources/static/img/BGMAIN.png" alt="" /></div>
			<div><img class="banner" src="${pageContext.request.contextPath}/resources/static/img/BGMAIN.png" alt="" /></div>
			<div><img class="banner" src="${pageContext.request.contextPath}/resources/static/img/BGMAIN.png" alt="" /></div>
		</div>

		<div class="controls">
			<button class="play"><i class="fa-solid fa-circle-play"></i></button>
			<button class="pause"><i class="fa-solid fa-circle-stop"></i></button>
		</div>


		<!--section-->
		<div class="tab_content" style="text-align: center;">

			<input type="radio" name="tabmenu" id="tab01" checked>
			<label for="tab01">새로운제품</label>
			<input type="radio" name="tabmenu" id="tab02">
			<label for="tab02">케어플러스</label>
			<input type="radio" name="tabmenu" id="tab03">
			<label for="tab03">특별한혜택</label>

			<div class="conbox con1">
				<section class="subImg1">
					<div class="sub_wrap1">
						<a href="">
							<div class="item1 item1_1"></div>
							<h3>6G Phone</h3>
						</a>
						<a href="">
							<div class="item1 item1_2"></div>
							<h3>Tablet GT</h3>
						</a>
					</div>
					<a href="">
						<div class="item1 item1_3"></div>
						<h3>SNotebook 출시</h3>
					</a>
					<div class="sub_wrap1">
						<a href="">
							<div class="item1 item1_4"></div>
							<h3>Watch XD</h3>
						</a>
						<a href="">
							<div class="item1 item1_5"></div>
							<h3>NoteSix</h3>
						</a>
					</div>
				</section>
			</div>

			<div class="conbox con2">
				<section class="subImg2">
					<a href="">
						<div class="item2 item2_3"></div>
						<h3>전문 케어 서비스를 만나보세요</h3>
					</a>
					<div class="sub_wrap2">
						<a href="">
							<div class="item2 item2_1"></div>
							<h3>안심보증케어1</h3>
						</a>
						<a href="">
							<div class="item2 item2_2"></div>
							<h3>안심보증케어3</h3>
						</a>
					</div>
					<div class="sub_wrap2">
						<a href="">
							<div class="item2 item2_4"></div>
							<h3>안심보증케어2</h3>
						</a>
						<a href="">
							<div class="item2 item2_5"></div>
							<h3>안심보증케어4</h3>
						</a>
					</div>
				</section>
			</div>

			<div class="conbox con3">
				<section class="subImg3">
					<div class="sub_wrap3">
						<a href="">
							<div class="item3 item3_1"></div>
							<h3>영화관 무료티켓 1+1</h3>
						</a>
						<a href="">
							<div class="item3 item3_2"></div>
							<h3>1000 Point 받아가세요</h3>
						</a>
					</div>
					<div class="sub_wrap3">
						<a href="">
							<div class="item3 item3_4"></div>
							<h3>모두의 혜택</h3>
						</a>
						<a href="">
							<div class="item3 item3_5"></div>
							<h3>특별한 날 공모전</h3>
						</a>
					</div>
					<a href="">
						<div class="item3 item3_3"></div>
						<h3>스마트폰 런칭 기념 이어폰 증정</h3>
					</a>
				</section>
			</div>
		</div>
<%-- 		<a href="${pageContext.request.contextPath}/everyone/join">회원가입</a>
		<a href="${pageContext.request.contextPath}/everyone/login">로그인</a> --%>
<!-- 		<footer>
			<div class="f_tab">
				SMARTDC 주식회사 대표 : 6조 | 사업자등록번호 : 000-00-00000 | 통신판매업
				신고 : 000-서울경기-0000 <br />
				사업장 주소 : 서울특별시 종로구 돈화문로 26, 3~5층(묘동, 단성사)
				<br />
				본 사이트에서 판매되는 상품 중에는 등록된 개별 판매자가 판매하는 상품이
				포함되어 있습니다. <br />개별 판매자 판매 상품의 경우 SMARTDC(주)는
				통신판매중개업자로서 통신판매의 당사자가 아니므로, 개별 판매자가 등록한
				상품, 거래정보 및 거래 등에 대해 책임을 지지 않습니다. <br />본 사이트의
				컨텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.
				<br />
				Copyright © 2000-2023 SMARTDC. All Rights Reserved.
			</div>
		</footer>
	</div> -->
</body>
</html>