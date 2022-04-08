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
<%--<link rel="stylesheet" href="/resources/static/css/admin/nofragment/createCoupon.css" type="text/css">--%>
<title>Insert title here</title>
</head>
<style>
	@font-face {
		font-family: "BBTreeGR";
		src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
		format("woff");
		font-weight: normal;
		font-style: normal;
	}

	.input_coupon{
		width: 200px;
		height: 32px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		text-align: center;
		margin-bottom:10px;
	}

	.couponwrap{
		text-align: center;
		width: 35%;
		margin: auto;
	}
	.make{
		font-size: 15px;
		width: 375px;
		margin: auto;
		text-align: left;
	}
	.createbtn {
		margin-top: 10px;
		width : 100px;
		height : 35px;
		border-radius: 8px;
		background-color: #0071E3;
		color : white;
		border: 1px solid #ddd;
		padding: 5px 5px;
		cursor: pointer;
		font-weight: bold;
	}
</style>
<body>
<div class="couponwrap">
<h1>쿠폰 생성</h1>
<div class="make">

	쿠폰 이름 : &nbsp &nbsp &nbsp <input id="coupon_desc" class="input_coupon" type="text"><br>
	할인율(%) : &nbsp &nbsp &nbsp<input id="coupon_pct" class="input_coupon" type="text" value="0">(%)<br>
	할인가격 :  &nbsp &nbsp &nbsp &nbsp<input id="coupon_price" class="input_coupon" type="text" value="0">원 할인<br>
	유효기간(개월) : <input id="coupon_valid_date" class="input_coupon" type="text" value="0"><br>

	</div>
	<button type="button" class="createbtn" onclick="createCoupon()">등록</button>
</div>

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