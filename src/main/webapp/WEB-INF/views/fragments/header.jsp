<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@mojs/core"></script>
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
	<div id="chat"  onclick="enterRoom();"></div>

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
		</ul>
		<hr color="#ebebeb" size="1px" width="95%" />
		<sec:authorize access="isAnonymous()">
			<ul class="m2">
				<li><a href="${pageContext.request.contextPath}/login"><img src="${pageContext.request.contextPath}/resources/static/img/user.png"><h4 class="left">로그인</h4></a></li>
			</ul>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<ul class="m2">
				<li class="m2_btn">
					<a href="${pageContext.request.contextPath}/members/member/mypage">
						<img src="${pageContext.request.contextPath}/resources/static/img/user.png">
						<h4 class="left mypage_btn">마이페이지</h4>
					</a>
				</li>
				<li class="m2_btn">
					<a href="${pageContext.request.contextPath}/members/logout">
						<img src="${pageContext.request.contextPath}/resources/static/img/logout.png">
						<h4 class="left">
							<form action="${pageContext.request.contextPath}/members/logout" method="post" class="logout_btn_side">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="submit" value="로그아웃">
							</form>
						</h4>
					</a>
				</li>
			</ul>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="m2">
				<li><a href="/admin"><img src="${pageContext.request.contextPath}/resources/static/img/admin1.png"><h4 class="left">관리자</h4></a></li>
				<li><a href="/chat/admin/room"><img src="${pageContext.request.contextPath}/resources/static/img/center.png"><h4 class="left">1:1 상담</h4></a></li>
			</ul>
		</sec:authorize>

	</div>

	<!-- Search box -->
	<div id="mask"></div>
	<div class="window">
		<div class="win_wrap">
			<form action="/spec/searchItems" method="get" id="search" autocomplete="off">
				<input id="h_box" class="holder" type="text" placeholder="Search" value="" name="searchInput" onkeyup="enter()"/>
			</form>
			<div class="h_box">
				<div class="h1" id="searchHistory" style="text-align: left;">
				</div>
				<div class="h2" style="text-align: left;">
					<ul>
						<h4>인기 검색어</h4>
						<c:if test="${fn:length(likesList) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(likesList)-1}">
								<a href="/spec/chooseModel?model_id=${likesList[i].model_id}&category=new&currPage=1">
									<li>
										<span>${i+1}</span>${likesList[i].productsVO.product_name} ${likesList[i].modelsVO.model_name}
									</li>
								</a>
							</c:forEach>
						</c:if>
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
						<li><a href="/spec/chooseModel?model_id=4&category=new&currPage=1">PRO</a></li>
						<li><a href="/spec/chooseModel?model_id=5&category=new&currPage=1">EXP</a></li>
						<li><a href="/spec/chooseModel?model_id=6&category=new&currPage=1">Light</a></li>
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
					<a href="/boards/event">이벤트</a>
					<ul>
						<li><a href="/boards/event">Event</a></li>
					</ul>
				</li>
			</ul>

			<ul class="nav_links_1">

				<a href="#" class="search_btn">
					<i class="fa-solid fa-magnifying-glass"></i>
				</a>

				<li class="users_cart">
					<a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
					<ul>
						<li>
							<div style="padding-top:20px;">
								<div>
									<a href="${pageContext.request.contextPath}/carts/member/cart">Cart</a>
								</div>
							</div>
						</li>
					</ul>
				</li>
				<li class="users_log">
					<a href="#"><i class="fa-solid fa-user"></i></a>
					<ul>
						<li>
							<div style="padding-top:20px;">
								<div>
									<sec:authorize access="isAnonymous()">
										<a href="${pageContext.request.contextPath}/login">Login</a>
										<a href="${pageContext.request.contextPath}/join">Join</a>
									</sec:authorize>

									<sec:authorize access="hasRole('ROLE_MEMBER')">
										<a href="${pageContext.request.contextPath}/members/member/mypage">Mypage</a>
										<a href="${pageContext.request.contextPath}/members/logout">
											<form action="${pageContext.request.contextPath}/members/logout" method="post" class="logout_btn">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<input type="submit" value="Logout">
											</form>
										</a>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<a href="${pageContext.request.contextPath}/admin">관리자</a>
										<a href="${pageContext.request.contextPath}/chat/admin/room">1:1 상담</a>
										<form action="${pageContext.request.contextPath}/members/logout" method="post" class="logout_btn">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<input type="submit" value="로그아웃">
										</form>
									</sec:authorize>
								</div>
							</div>
						</li>
					</ul>
				</li>
			</ul>
			<a href="#" class="menu_find">
				<i class="fa-solid fa-magnifying-glass"></i>
			</a>
			<a href="#" class="menu_btn">
				<i class="fa-solid fa-bars"></i>
			</a>
		</nav>
	</header>
	<script>
		var search = document.cookie;
		//console.log("original cookie: " + search);
		var searchList = [];
		var jession = search.indexOf("JSESSIONID");
		//jsession 값이 있을경우
		if(jession != -1){
			var first = search.indexOf(';');
			//jsession 값이 맨앞일때
			if(jession == 0){
				//jsession 값 뒤에 search cookie가 있을때
				if(first != -1){
					search = search.substring(first+2);
				}else{//jsession 값만이 cookie에 있을때
					search = "";
				}
				//jsession 값이 중간 혹은 맨뒤
			}else{
				//jsession 값 앞에있는 search cookie 자름
				var search1 = search.substring(0, jession);
				first = search.indexOf(';');
				//jsession 값이 중간에 있을때
				if(first != -1){
					//jsession 부터 끝까지
					search = search.substring(jession);
					//jsession 뒤 ;가져옴
					first = search.indexOf(';');
					//jsession 뒤 search 값
					var search2 = search.substring(first+2);
					//jession 앞 search 와 뒤 search를 합침
					search = search1 + search2;
					//jesssion 값이 맨뒤에 있을떄
				}else{
					search = search1;
				}
			}
		}
		//console.log("after cut: " + search);
		for(var i = 0 ; i < 3; i++){
			var first = search.indexOf('=');
			if(first != -1){
				var second = search.indexOf(';');
				if(second == -1){
					var name = search.substring(first-7,first);
					var result = search.substring(first+1);
					result = result.replaceAll('+', ' ');
					searchList[i] = name + "/" + result;
					break;
				}else{
					var name = search.substring(first-7,first);
					var result = search.substring(first+1, second);
					result = result.replaceAll('+', ' ');
					searchList[i] = name + "/" + result;
					search = search.substring(second+2);
				}
			}
		}
		var listContainer = document.getElementById("searchHistory");
		var list = "<ul id='historyParent'><h4>최근검색어&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span onclick='delAllHistory()'>x</span></h4>";
		if(searchList.length == 0){
			list += "<li>검색기록이 없습니다.</li>";
		}else{
			for(var j = searchList.length -1; j >= 0; j--){
				var split = searchList[j].split('/');
				var name = split[0];
				var result = split[1];
				var input = result.replaceAll(" ", "+")
				if(result.length > 20){
					result = input.substring(0,21) + "...";
				}
				list += "<li id="+searchList[j]+"><a href='/spec/searchItems?searchInput="+input+"'>" +result+
						"</a><span id="+searchList[j]+" onclick='delHistory(this.id)'> x </span></li>";
			}
		}
		list+= "</ul>";
		listContainer.innerHTML = list;

		function removeItem(arr, value) {
			var index = arr.indexOf(value);
			if (index > -1) {
				arr.splice(index, 1);
			}
			return arr;
		}
		function delHistory(id){
			var split = id.split('/');
			var name = split[0];
			document.getElementById(id).remove();
			document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;path=/';
			searchList = removeItem(searchList, id);
			console.log(searchList);
			var ulParent = document.getElementById('historyParent');
			if (ulParent.children.length == 1) {
				ulParent.innerHTML = "<h4>최근검색어</h4><li>검색기록이 없습니다.</li>";
			}
		}
		function delAllHistory() {
			var ulParent = document.getElementById('historyParent');
			for(var i = 0; i < searchList.length; i++){
				var split = searchList[i].split('/');
				var name = split[0];
				document.getElementById(searchList[i]).remove();
				document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;path=/';
			}
			ulParent.innerHTML = "<h4>최근검색어</h4><li>검색기록이 없습니다.</li>";
		}
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		sessionStorage.setItem("mem_id","${user.mem_id}");
		function enterRoom() {
			var user = "${user.mem_id}";
			console.log(user);
			$.ajax({
				url: '/chat/member/createRoom',
				data: {mem_id : user},
				type: 'post',
				dataType: 'json',
				beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				success: function (res) {
					location.href="/chat/moveChating?roomName="+res.roomName+"&"+"roomNumber="+res.roomNumber;
				},
				error: function (err) {
					alert('로그인 후 이용해주세요.');
					console.log(err);
				}
			});

		}
		function enter(){
			if (window.event.keyCode == 13) {
				if(document.getElementById("h_box") == ""){
					alert("값을 입력해주세요");
					return;
				}
				document.getElementById("search").submit();
			}
		}
	</script>
</div>
</body>
</html>