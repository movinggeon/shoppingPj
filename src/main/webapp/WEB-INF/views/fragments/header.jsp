<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<script
			src="https://kit.fontawesome.com/6da1745729.js"
			crossorigin="anonymous"
	></script>
	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>
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
	<div id="chat" onclick="enterRoom()"></div>

	<!-- Side menu -->
	<div class="menu_bg"></div>
	<div id="sideMenu">
		<div class="close_btn">
			<i class="xi-close"></i>
		</div>

		<ul class="m1">
			<li><a href="/spec/viewModels?product=sixPhone"><img src="${pageContext.request.contextPath}/resources/static/img/smartphone.png"><h4 class="left">스마트폰</h4></a></li>
			<li><a href="/spec/viewModels?product=sixBook"><img src="${pageContext.request.contextPath}/resources/static/img/laptop.png"><h4 class="left">노트북</h4></a></li>
			<li><a href="/spec/viewModels?product=sixTablet"><img src="${pageContext.request.contextPath}/resources/static/img/tablet.png"><h4 class="left">태블릿</h4></a></li>
			<li><a href="/spec/viewModels?product=sixWatch"><img src="${pageContext.request.contextPath}/resources/static/img/watch.png"><h4 class="left">워치</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/event.png"><h4 class="left">이벤트</h4></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/center.png"><h4 class="left">고객센터</h4></a></li>
		</ul>
		<hr color="#ebebeb" size="1px" width="95%" />
		<sec:authorize access="isAnonymous()">
			<ul class="m2">
				<li><a href="/login"><img src="${pageContext.request.contextPath}/resources/static/img/user.png"><h4 class="left">로그인</h4></a></li>
			</ul>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<ul class="m2">
				<li class="user user_menu">
					<a href="/members/member/mypage"><i class="fa-solid fa-user"></i></a>
				</li>
				<li>
					<a href="/carts/member/cart"><i class="fa-solid fa-cart-shopping"></i></a>
				</li>
				<li>
					<form action="/members/logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="image" src="${pageContext.request.contextPath}/resources/static/img/user.png">
						<h4 class="left">로그아웃</h4>
					</form>
				</li>
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
				<li>
					<a href="/spec/viewModels?product=sixPhone">스마트폰</a>
					<ul>
						<li><a href="/spec/chooseModel?model_id=1&category=new&currPage=1">SixPhone 3</a></li>
						<li><a href="/spec/chooseModel?model_id=2&category=new&currPage=1">SixPhone 2</a></li>
						<li><a href="/spec/chooseModel?model_id=3&category=new&currPage=1">SixPhone 1</a></li>
					</ul>
				</li>
				<li>
					<a href="/spec/viewModels?product=sixBook">노트북</a>
					<ul>
						<li><a href="spec/chooseModel?model_id=4&category=new&currPage=1">PRO</a></li>
						<li><a href="spec/chooseModel?model_id=5&category=new&currPage=1">EXP</a></li>
						<li><a href="spec/chooseModel?model_id=6&category=new&currPage=1">Light</a></li>
					</ul>
				</li>
				<li>
					<a href="/spec/viewModels?product=sixTablet">태블릿</a>
					<ul>
						<li><a href="/spec/chooseModel?model_id=7&category=new&currPage=1">Tablet PRO</a></li>
						<li><a href="/spec/chooseModel?model_id=8&category=new&currPage=1">Tablet EXP</a></li>
						<li><a href="/spec/chooseModel?model_id=9&category=new&currPage=1">Tablet Light</a></li>
					</ul>
				</li>
				<li>
					<a href="/spec/viewModels?product=sixWatch">워치</a>
					<ul>
						<li><a href="/spec/chooseModel?model_id=10&category=new&currPage=1">Watch 3</a></li>
						<li><a href="/spec/chooseModel?model_id=11&category=new&currPage=1">Watch 2</a></li>
						<li><a href="/spec/chooseModel?model_id=12&category=new&currPage=1">Watch 1</a></li>
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
				<sec:authorize access="isAnonymous()">
					<li class="user user_menu">
						<a href="/login"><i class="fa-solid fa-user"></i></a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="user user_menu">
						<a href="/members/member/mypage"><i class="fa-solid fa-user"></i></a>
					</li>
					<li>
						<a href="/carts/member/cart"><i class="fa-solid fa-cart-shopping"></i></a>
					</li>
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

	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		sessionStorage.setItem("mem_id","${user.mem_id}");
		function enterRoom() {
			var user = "${user.mem_id}";
			console.log(user);
			$.ajax({
				//url: '/chat/member/createRoom'.
				url: '/createRoom',
				data: {mem_id : user},
				type: 'post',
				dataType: 'json',
				beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				success: function (res) {
					location.href="/moveChating?roomName="+res.roomName+"&"+"roomNumber="+res.roomNumber;
				},
				error: function (err) {
					console.log(err);
				}
			});
		}

		$(document).ajaxError(function myErrorHandler(event, xhr, ajaxOptions, thrownError) {
			if (xhr.status == 403) {
				window.location.href ="/login";
			}
		});

		function enter(){
			if(documnet.getElementById("h_box") == ""){
				alert("값을 입력해주세요");
				return;
			}
			document.getElementById("search").submit();
		}
	</script>
</div>
</body>
</html>