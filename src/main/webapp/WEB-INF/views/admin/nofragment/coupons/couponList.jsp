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
<body>
<h1>쿠폰목록</h1>

페이지 번호 -> ${param.page }<br>
<fmt:parseNumber var="totalPage" value="${ ( couponCount / 6 ) +(1-(( couponCount / 6 )%1))%1}" integerOnly="true"/>
총 페이지 번호 -> ${totalPage }<br>
쿠폰 수 -> ${couponCount }<br>

<c:set var="loop_flag" value="false" />
<c:forEach var="i" begin="${ (param.page - 1) * 6 }" end="${ (6 * param.page) - 1 }" varStatus="status">
    <c:if test="${not loop_flag }">	
		<div class="coupon-context">
			<div class="coupon-card">
				<div class="memName">
					<div>
						쿠폰 이름 : ${couponList.get(i).getCoupon_desc() }
					</div>
				</div>
				<div class="memId">
					<div>
						할인율(%) : ${couponList.get(i).getCoupon_pct() }
					</div>
				</div>
				<div class="memAddress">
					할인가(원) : ${couponList.get(i).getCoupon_price() }
				</div>
				<div class="memEmail">
					유효기간(개월) : ${couponList.get(i).getCoupon_valid_date() }
				</div>
			</div>
			<div class="coupon-btn" style="width: 60%;">
		 		<c:set var="auth" value="${param.name }"/>
		 		<c:choose>
					<c:when test="${auth eq 'delete' }">
						<div style="text-align: center;">
							<button onclick="">쿠폰삭제</button><br>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align: center;">
							<button onclick="deleteCoupon('${${couponList.get(i).getCoupon_desc()}')">쿠폰지급</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${i eq ( couponCount -1 ) }">
			<c:set var="loop_flag" value="true" />
		</c:if>
        <c:if test="${status.count eq 6 }">
            <c:set var="loop_flag" value="true" />
        </c:if>
    </c:if>
</c:forEach>

<div class="div-pagingBtn">
	<div style="display: flex; padding-left: auto; padding-right: auto;">
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

<script type="text/javascript">
//계정차단
function blockMem(coupon_desc) {
	
	if(confirm("쿠폰 ( " + "이름 : " + coupon_desc  + " )를 " + "정말로 삭제 하시겠습까?") == true){
		
       jQuery.ajax({
           "url": "/admin/block/blockMem",
           "type": "POST",
           "contentType": "application/json; charset=utf-8;",
           "data": JSON.stringify({
               "mem_id": mem_id,
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