<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/static/css/receiptList.css" type="text/css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>Insert title here</title>

</head>
<body>
<div class="receipt_box_title">
	주문 내역
</div>

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
  <c:if test="${receiptList.size() > 0}">
  <c:forEach var="i" begin="0" end="${receiptList.size() - 1 }">
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
	    	<div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixPhone.png" alt="" /> -->
	    	
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
		    <div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixPhone.png" alt="" /> -->
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
		    <div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixPhone.png" alt="" /> -->
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
		    <div class="detail-table"> <!-- <img src="${pageContext.request.contextPath}/resources/static/img/sixPhone.png" alt="" /> -->
	      		<c:forEach var="k" begin="0" end="${cartList.get(i) .size()- 1 }">		
		      		<div class="detail-table-row">
		      			<div class="detail-table-cell">
		      				<c:if test="${cartList.get(i).get(k).getCart_refund() == 0 }">
								<button class="all_btn"  onclick="location.href='/boards/insertView?spec_id=${cartList.get(i).get(k).spec_id}&model_id=${cartList.get(i).get(k).modelsVO.model_id}' ">리뷰 쓰기</button>
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
</div>
</c:if>
	<div class="rev_paging" style="width: 100%; text-align: center; margin-top: 30px">
		<c:choose>
			<c:when test="${pageError ne null}">
				${pageError}
			</c:when>
			<c:otherwise>
				<%-- 일번 페이지가 아닐 경우 --%>
				<c:if test="${page.currPage ne 1}">
					<%--맨앞 일페이지로 가기 && 현재의 이전 페이지로 이동--%>
					<button class="btn_a" onclick="paging(1)">  << </button>
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

<script type="text/javascript">

	function paging(page){
		$(".page_loader").load("/receipts/member/receiptList?page="+page);
	}


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
				location.href="/members/member/mypage";
			}
		});
	}
</script>
</body>
</html>