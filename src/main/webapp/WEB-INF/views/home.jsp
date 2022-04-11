<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 팝업 -->

<jsp:include page="popup/popup.jsp"/>
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
<%--	<div class="wrapper">--%>
		<main class="main-content">

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
			<section class="tab_content" style="text-align: center;">

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
						<a href="/spec/chooseModel?model_id=${recommendList[0].model_id}&category=new&currPage=1">
							<div class="item2 item2_3"></div>
							<h3>${recommendList[0].productsVO.product_name} ${recommendList[0].model_name}</h3>
						</a>
						<div class="sub_wrap2">
							<a href="/spec/chooseModel?model_id=${recommendList[1].model_id}&category=new&currPage=1">
								<div class="item2 item2_1"></div>
								<h3>${recommendList[1].productsVO.product_name} ${recommendList[1].model_name}</h3>
							</a>
							<a href="/spec/chooseModel?model_id=${recommendList[2].model_id}&category=new&currPage=1">
								<div class="item2 item2_2"></div>
								<h3>${recommendList[2].productsVO.product_name} ${recommendList[2].model_name}</h3>
							</a>
						</div>
						<div class="sub_wrap2">
							<a href="/spec/chooseModel?model_id=${recommendList[3].model_id}&category=new&currPage=1">
								<div class="item2 item2_4"></div>
								<h3>${recommendList[3].productsVO.product_name} ${recommendList[3].model_name}</h3>
							</a>
							<a href="/spec/chooseModel?model_id=${recommendList[4].model_id}&category=new&currPage=1">
								<div class="item2 item2_5"></div>
								<h3>${recommendList[4].productsVO.product_name} ${recommendList[4].model_name}</h3>
							</a>
						</div>
					</section>
				</div>

				<div class="conbox con3">
					<div class="subImg3">
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
					</div>
				</div>
			</section>
		</main>
<%--	</div>--%>
</body>
</html>