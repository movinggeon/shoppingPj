<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/static/css/admin/nofragment/createCoupon.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<h1>쿠폰 생성</h1>
<div>
	쿠폰 이름 : <input id="coupon_desc" type="text"><br>
	할인율(%) : <input id="coupon_pct" type="text" value="0">(%)<br>
	할인가격 : <input id="coupon_price" type="text" value="0">원 할인<br>
	유효기간(개월) : <input id="coupon_valid_date" type="text" value="0"><br>
	<button type="button" onclick="createCoupon()">등록</button>
	
	<script type="text/javascript">
	function createCoupon() {

		var coupon_desc = $('#coupon_desc').val();
		var coupon_pct = $('#coupon_pct').val();
		var coupon_price = $('#coupon_price').val();
		var coupon_valid_date = $('#coupon_valid_date').val();
		
		console.log(coupon_desc);
	    jQuery.ajax({
	        "url": "/admin/coupons/createCoupon",
	        "type": "POST",
	        "contentType": "application/json; charset=utf-8;",
	        "data": JSON.stringify({
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
	            location.href="/admin";
	        }
	        else {
	            alert("에러");
	        }
	
	    });
	}
	</script>
</div>
</body>
</html>