<%@page import="com.group6.shopping.security.CustomMemDetails"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Title</title>
<%--	<link rel="stylesheet" href="/resources/static/css/mypage.css" type="text/css">--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/receiptList.css" type="text/css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<%CustomMemDetails cs = (CustomMemDetails)session.getAttribute("user"); %>

	<script type="text/javascript">
	$(document).ready(function(){
		$("#couponList").click(function(){
		    $(".page_loader").load("/members/coupons?page=1");
		});
		$("#couponDetail").click(function(){
		    $(".page_loader").load("/members/coupons?page=1");
		});
		$("#likeList").click(function(){
		    $(".page_loader").load("/likes/members/likeslist?page=1");
		});
		$("#likeMore").click(function(){
			$(".page_loader").load("/likes/members/likeslist?page=1");
		});
		$("#modifyMem").click(function(){
		    $(".page_loader").load("/members/member/modify");
		});
		$("#modifyPwMem").click(function(){
		    $(".page_loader").load("/members/member/modifyPassword");
		});
		$("#deleteMem").click(function(){
		    $(".page_loader").load("/members/member/delete");
		});
		$("#receiptList").click(function(){
		    $(".page_loader").load("/receipts/member/receiptList?page=1");
		});
	});

	/*function paging(page){
		$(".page_loader").load("/receipts/member/receiptList?page="+page);
	}*/


	function cancelPayment(receipt_id, imp_uid, product_price, product_name) {

		jQuery.ajax({
			"url": "/carts/member/payment/cancel",
			"type": "POST",
			"contentType": "application/json",
			"data": JSON.stringify({
				"imp_uid": imp_uid,
				"cancel_request_amount": product_price, // 환불금액
				"reason": "결제 취소", // 환불사유
				"receipt_id": receipt_id, // 환불사유
				"refund_holder": "가상계좌 예금주", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
				"refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
				"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
			}),
			beforeSend : function(xhr)
			{   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
			},
			"dataType": "json"
		}).done(function(data) {
			data = JSON.stringify(data);
			jsonData = JSON.parse(data);

			console.log(jsonData);

			if ( jsonData.everythings_fine ) {

				alert("환불 성공");
				location.reload();
			}
		});
	}
</script>
</head>
<body>
<style>
	html,
	body {
		width: 100%;
		height: 100%;
		margin: 0px;
	}

	.container {
		width: 100%;
		height: 100%;
	}


	h1.sub_title{

		text-align: center;
		margin-bottom: 0px;
	}

	div.sub_menu{
		width: 100%;
		height: 200px;
	}

	div.menu_header{
		width: 100%;
		background-color: #e5e5e5;
	}

	div.menu_header ul {

		width: 100%;
		height: 100%;
		list-style:none;
		margin-bottom: 0px;
		display: flex;
		justify-content: center;
		text-align: center;

		padding:0px;

		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}

	div.menu_header li {
		float: left;
		width: 15%;
		height: 100%;
		font-size: 17px;
		line-height: 40px;
	}

	div.menu_header li a {

		vertical-align: middle;
	}

	div.menu_list {

		width: 100%;
		height: 150px;
		border-bottom: 1px solid black;
	}

	div.inner {

		width: 100%;
		height: 150px;
		display: flex;
		justify-content: center;
	}

	div.inner ul {

		text-align: center;
		width: 15%;
		list-style: none;
		padding-top: 20px;
		padding-left: 0px;
		margin: 0px;
	}

	div.inner ul:not(:first-of-type) {
		border-left: 1px dashed #b5b5b5;
	}

	div.inner li {

		text-align: center;
		line-height: 30px;
		vertical-align: top;
		padding-bottom: 10px;
		font-size: 13px;

	}

	div.cupon_info  {

		width: 75%;
		height: 200px;
		margin-left:auto;
		margin-right:auto;
		justify-content: center;
		display: flex;
		align-items: center;
		margin-top: 100px;
		text-align: center;
		background-color: #e5e5e5;
	}

	div.cupon_info div.user_name {
		width: 60%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	div.cupon_info div.user_cupon {
		width: 20%;
		height: 50%;
		border-left: 1px dashed #b5b5b5;
	}

	div.cupon_info div.user_point {
		width: 20%;
		height: 50%;
		border-left: 1px dashed #b5b5b5;
	}

	.table_title {
		width: 1240px;
		margin-top: 100px;
		height: 36px;
		margin-left: auto;
		margin-right: auto;
	}
	table.order_list {
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
		border-top: 2px solid #171717;
		border-bottom: 1px solid #171717;
		margin-bottom: 50px;
	}

	table.order_list th {

		height: 68px;
		border-bottom: 1px solid #b5b5b5;
	}

	table.order_list tr td {

		text-align: center;
		vertical-align: middle;
	}
	.like_title_form{
		width: 1240px;
/*		margin-top: 50px;*/
		height: 60px;
		margin-left: auto;
		margin-right: auto;
		border-bottom: 2px solid #171717;
		position: relative;
	}
	.like_title {
		width: 100%;
		position: absolute;
		bottom:0px;
	}
	.like_more{
		width: 100%;
		float:right;
		position: absolute;
		bottom:0px;
		text-align: right;
	}
	.like_list{
		display: grid;
		grid-template-columns:repeat(auto-fill, minmax(300px, 1fr));
		margin:10px auto 50px auto;
		width: 1240px;
		/*border-top: 2px solid #171717;*/
	}
	.like_item img{
		padding-top: 25px;
		display: block;
		width: 90%;
		height: 250px;
		margin:0 auto;
		object-fit: cover;
		border-top-left-radius: 30px;
	}
	.like_item{
		margin:15px;
		padding: 0 8px;
		min-width: 200px;
		height: 420px;
		border : 1px solid #b5b5b5;

	}
	.like_content{
		text-align: center;
		margin-top: 1px;
		padding-bottom: 8px;
	}
	.btn_buy{
		display: block;
		margin:auto;
		background-color: #306fdb;
		color:white;
		border:0;
		border-radius: 20px;
		padding:6px 8px;
		font-size: 12px;
		cursor: pointer;
		width: 70px;
	}

	ul li a:link { color: black; text-decoration: none;}
	ul li a:visited { color: black; text-decoration: none;}
	ul li a:hover { color: black; text-decoration: none;}

</style>


	<a href="/members/member/mypage"><h1 class="sub_title">MY PAGE</h1></a>
	
	<div class="sub_menu">
		<div class="menu_header">
			<ul>
				<li>
					<span>MY♡</span>
				</li>
				<li>
					<span>주문관리</span>
				</li>
				<li>
					<span>혜택</span>
				</li>
				<li>
					<span>정보관리</span>
				</li>
				<li>
					<span>문의내역</span>
				</li>
			</ul>
		</div>
		
		<div class="menu_list">
			<div class="inner">
				<ul>
					<li>
						<span  id="likeList" style="cursor:pointer">MY ♡ ITEM</span>
					</li>
				</ul>
				<ul>
					<li>
						<span style="cursor:pointer" id="receiptList"> 주문/배송/취소 조회 </span>
					</li>
				</ul>
				<ul>
					<li>
						<span id="couponList" style="cursor:pointer">쿠폰</span>
					</li>
				</ul>
				<ul>
					<li>
       					<span  id="modifyMem" style="cursor:pointer">회원정보수정</span>
					</li>
					<li>
       					<span  id="modifyPwMem" style="cursor:pointer" >비밀번호 변경</span>
					</li>
					<li>
   						<span  id="deleteMem" style="cursor:pointer">회원탈퇴</span>
					</li>
				</ul>
				<ul>
					<li>
						<span style="cursor:pointer" >상품평</span>
					</li>
					<li>
						<span style="cursor:pointer" >1:1문의</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="page_loader">
		<div class="cupon_info">
			<div class="user_name">
				<%=cs.getMem_name() %>님 안녕하세요
			</div>
			<div class="user_cupon">
				쿠폰
				<div style="padding-top: 30px">
					<span id="couponDetail"  style="cursor:pointer" >${couponEA }</span>개
				</div>
			</div>
			<div class="user_point">
				포인트
				<div style="padding-top: 30px">
					<%=cs.getMem_point() %>P
				</div>
			</div>
		</div>
		
		<%--<div class="table_title">
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
		</table>--%>
		<div class="table_title2">
		<div class="receipt_box_title">
			<h3>최근 주문 내역</h3>
		</div></div>

		<div class="table">
			<div class="table-row">
				<div class="table-title">
					<p>주문일</p>
				</div>
				<div class="table-title">
					<p>주문번호</p>
				</div>
				<div class="table-title">
					<p>상품정보</p>
				</div>
				<div class="table-title">
					<p>상품금액</p>
				</div>
				<div class="table-title">
					<p>진행상황</p>
				</div>
				<div class="table-title">
					<p>리뷰쓰기</p>
				</div>
			</div>
			<c:if test="${fn:length(receiptList) > 0 }">
			<c:forEach var="i" begin="0" end="${fn:length(receiptList) -1 }">
				<div class="table-row">
					<div class="table-cell middle">
						<p>${receiptList.get(i).getReceipt_date() }</p>
					</div>
					<div class="table-cell middle">
						<p>${receiptList.get(i).getReceipt_merchant_uid().substring(0,8) }</p>
						<div style="text-align: center;">
							<c:choose>
								<c:when test="${cartList.get(i).get(0).getCart_refund() == 0 and receiptList.get(i).couponsVO.coupon_id eq 0 and receiptList.get(i).receipt_point eq 0}">
									<button class="all_btn" onclick="cancelPayment('${cartList.get(i).get(k).getReceipt_id()}',
											'${receiptList.get(i).getReceipt_imp_uid() }',
											'${receiptList.get(i).getReceipt_price()}',
											'${cartList.get(i).get(k).getProductsVO().getProduct_name() } ${cartList.get(i).get(k).getModelsVO().getModel_name() }')">주문 취소</button>
								</c:when>
								<c:when test="${(receiptList.get(i).couponsVO.coupon_id ne 0) or (receiptList.get(i).receipt_point ne 0)}">
									포인트 쿠폰 사용시 환불이 불가능 합니다.
								</c:when>
							</c:choose>
						</div>

					</div>
					<div class="table-cell middle">
						<div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixphone.png" alt="" /> -->

							<c:forEach var="k" begin="0" end="${cartList.get(i).size() - 1 }">
								<div class="detail-table-row">
									<div class="detail-table-cell">
										<img src="${pageContext.request.contextPath}/resources/static/img/${cartList.get(i).get(k).getProductsVO().getProduct_name() }.png" width="50%" height="50%" alt="" />
									</div>
									<div class="detail-table-cell">
										<p>${cartList.get(i).get(k).getProductsVO().getProduct_name() } ${cartList.get(i).get(k).getModelsVO().getModel_name() }</p>
										<p>${cartList.get(i).get(k).getSpecVO().getSpec_color() }</p>
										<p>${cartList.get(i).get(k).getSpecVO().getSpec_memory() }G, ${cartList.get(i).get(k).getSpecVO().getSpec_network() }</p>
										<c:set var="enableCare" value="${cartList.get(i).get(k).getCart_isCare() }"></c:set>
										<c:choose>
											<c:when test="${enableCare eq -1 }">
												<p> Care 선택됨 </p>
											</c:when>
											<c:otherwise>
												<p> Care 선택안됨 </p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="table-cell middle">
						<div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixphone.png" alt="" /> -->
							<c:forEach var="k" begin="0" end="${cartList.get(i) .size()- 1 }">
								<div class="detail-table-row">
									<div class="detail-table-cell">
										<p>${cartList.get(i).get(k).getSpecVO().getSpec_price() }원</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="table-cell middle">
						<div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixphone.png" alt="" /> -->
							<c:forEach var="k" begin="0" end="${cartList.get(i) .size()- 1 }">
								<div class="detail-table-row">
									<div class="detail-table-cell">
										<c:if test="${cartList.get(i).get(k).getCart_refund() == 0 }">
											<p>결제 완료</p>
										</c:if>
										<c:if test="${cartList.get(i).get(k).getCart_refund() == 1 }">
											<p style="color: #D75689">결제취소 완료</p>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="table-cell middle">
						<div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixphone.png" alt="" /> -->
							<c:forEach var="k" begin="0" end="${cartList.get(i) .size()- 1 }">
								<div class="detail-table-row">
									<div class="detail-table-cell">
										<c:if test="${cartList.get(i).get(k).getCart_refund() == 0 }">
											<button class="all_btn"  onclick="location.href='/boards/insertView?spec_id=${cartList.get(i).get(k).spec_id}&model_id=${cartList.get(i).get(k).modelsVO.model_id}' ">리뷰쓰기</button>
										</c:if>
										<c:if test="${cartList.get(i).get(k).getCart_refund() == 1 }">

										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>



		<div class="like_title_form">
			<div class="like_title">
				<h3>좋아요</h3>
			</div>
			<div class="like_more" style="cursor: pointer;">
				<span id="likeMore">more+</span>
			</div>
		</div>
		<c:if test="${fn:length(likeList) > 0 }">
		<div class="like_list">
			<c:forEach items="${likeList}" var="like" begin="0" end="${fn:length(likeList) -1 }">
					<div class="like_item">
						<img src="${pageContext.request.contextPath}/resources/static/img/${like.productsVO.product_name}.png" alt="">
						<div class="like_content">
							<h3>${like.productsVO.product_name}  ${like.modelsVO.model_name}</h3>
							<br>
							<a href="/spec/chooseModel?model_id=${like.modelsVO.model_id}&category=new&currPage=1">
								<button class="btn_buy">구입하기</button></a>
						</div>
					</div>
			</c:forEach>
		</div>
		</c:if>
	</div>
</body>
</html>
