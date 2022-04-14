<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<link rel="stylesheet" href="/resources/static/css/admin/nofragment/couponList.css" type="text/css">
	<title>Insert title here</title>
</head>
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
	.delete_btn {
		padding: 8px 15px;
		border: 2px solid #0071e3;
		border-radius: 20px;
		background-color: white;
		color: #0071e3;
		font-size: 14px;
		font-weight: bold;
		cursor: pointer;
	}

</style>
<body>
<c:set var="name" value="${param.name }"></c:set>
<div style="text-align: center">
	<h1>쿠폰목록</h1>
</div>
<c:set var="size" value="${couponList.size() }"></c:set>
<c:choose>
	<c:when test="${size > 0 }">
		<c:set var="loop_flag" value="false" />
		<c:forEach var="coupon" items="${couponList}">

			<div class="coupon-context">
				<div class="coupon-card">
					<div class="memName">
						<div>
							쿠폰 이름 : ${coupon.coupon_desc }
						</div>
					</div>
					<div class="memId">
						<div>
							할인율(%) : ${coupon.coupon_pct }
						</div>
					</div>
					<div class="memAddress">
						할인가(원) : ${coupon.coupon_price}
					</div>
					<div class="memEmail">
						유효기간(개월) : ${coupon.coupon_valid_date}
					</div>
				</div>
				<div class="coupon-btn" style="width: 60%;">
					<div style="text-align: center;">
						<c:choose>
							<c:when test="${param.name eq 'delete' }">
								<button onclick="deleteCoupon('${coupon.coupon_id}')" class="delete_btn">쿠폰삭제</button><br>
							</c:when>
							<c:otherwise>
								<button onclick="giveCoupon('${param.query_id}', '${couponList.get(i).getCoupon_desc() }',
										'${couponList.get(i).getCoupon_pct() }', '${couponList.get(i).getCoupon_price() }',
										'${couponList.get(i).getCoupon_valid_date() }')" class="delete_btn">지급
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div style="padding-top: 10px"></div>
		</c:forEach>

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



		<%--			<div class="div-pagingBtn">
                        <div style="display: flex; padding-left: auto; padding-right: auto;">
                        <%--페이징 --%>
		<c:set var="doneLoop" value="false"/>
		<c:forEach var="i" begin="1" end="${totalPage }" varStatus="status">
			<c:if test="${not doneLoop}">
				<div>
					<button type="button" class="pagingBtn" onclick="sendPage('${i}')">${i }</button>
				</div>
				<c:if test="${i eq newArrival.pbNum}">
					<c:set var="doneLoop" value="true" />
				</c:if>
			</c:if>
		</c:forEach>
		</div>
		</div>

	</c:when>
	<c:otherwise>
		<h1>쿠폰이 없습니다.</h1>
	</c:otherwise>
</c:choose>

<script type="text/javascript">

	function closeCouponList() {
		$(".context").load("/admin/nofragment/memberList?page=${param.return_page}");
	}
	function paging(page){
		$(".context").load("/admin/nofragment/couponList?name=delete&page="+page);
	}
	//쿠폰삭제
	function deleteCoupon(coupon_id) {

		if(confirm("쿠폰 ( " + "이름 : " + coupon_id  + " )를 " + "정말로 삭제 하시겠습까?") == true){

			jQuery.ajax({
				"url": "/admin/coupons/deleteCoupon",
				"type": "POST",
				"contentType": "application/json; charset=utf-8;",
				"data": JSON.stringify({
					"coupon_id": coupon_id,
				}),
				beforeSend : function(xhr)
				{   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				"dataType": "json"
			}).done(function(data) {
				data = JSON.stringify(data);
				jsonData = JSON.parse(data);

				//console.log(jsonData);

				if (jsonData.success) {
					alert(jsonData.success);
					$(".context").load("/admin/nofragment/couponList?name=delete&page=${param.page}");
				}
				else {
					alert("에러");
				}

			});

		}else{
			return;
		}

	}

	//쿠폰지급
	function giveCoupon(mem_id, coupon_desc, coupon_pct, coupon_price, coupon_valid_date) {

		if(confirm(mem_id + "님에게 쿠폰 (" + coupon_desc  +  ")(을)를 정말로 지급 하시겠습까?") == true){

			jQuery.ajax({
				"url": "/admin/coupons/giveCoupon",
				"type": "POST",
				"contentType": "application/json; charset=utf-8;",
				"data": JSON.stringify({
					"mem_id": mem_id,
					"coupon_desc": coupon_desc,
					"coupon_pct": coupon_pct,
					"coupon_price": coupon_price,
					"coupon_valid_date": coupon_valid_date,
				}),
				beforeSend : function(xhr)
				{   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				"dataType": "json"
			}).done(function(data) {
				data = JSON.stringify(data);
				jsonData = JSON.parse(data);

				//console.log(jsonData);

				if (jsonData.success) {
					alert(jsonData.success);
					$(".context").load("/admin/nofragment/memberList?page=1");
				}
				else {
					alert("에러");
				}

			});

		}else{
			return;
		}

	}
</script>
</body>
</html>