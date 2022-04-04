<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page session="false" %>
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
	<div id="chat">
		<button id="enterRoom" onclick="enterRoom()">asdfasdfasdf</button>
	</div>

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
			<form action="/spec/searchItems" method="get" id="search" autocomplete="off">
				<input id="h_box" class="holder" type="text" placeholder="Search" value="" name="searchInput" onkeyup="enter()"/>
			</form>
			<div class="h_box">
				<div class="h1" id="searchHistory" style="text-align: left;">

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
/*		$(document).ajaxError(function myErrorHandler(event, xhr, ajaxOptions, thrownError) {

			alert("수발");
			if (xhr.status == 403) {
				window.location.href ="/login";
			}
		});*/


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

			//var cookieId = Number(name.substring(name.length-1));
			/*
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + 7);
			if(searchList.length == 3){
				if(cookieId <= 2){
					document.cookie = 'search3=; expires=Thu, 01 Jan 1999 00:00:10 GMT;path=/';
					var split = searchList[2].split('/');
					var value = split[1];
					document.cookie = "search2" + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
				}
				if(cookieId == 1){
					document.cookie = 'search3=; expires=Thu, 01 Jan 1999 00:00:10 GMT;path=/';
					var split = searchList[1].split('/');
					var value = split[1];
					console.log(value);
					document.cookie = "search1" + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
				}
			}
			if(searchList.length == 2){
				if(cookieId == 1){
					var split = searchList[1].split('/');
					document.cookie = 'search2=; expires=Thu, 01 Jan 1999 00:00:10 GMT;path=/';
					var value = split[1];
					console.log(value);
					document.cookie = "search1" + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
				}
			}
			*/
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

	function enter(){
		if(document.getElementById("h_box") == ""){
			alert("값을 입력해주세요");
			return;
		}
		document.getElementById("search").submit();
	}
	</script>
</div>
</body>
</html>