<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Title</title>
    
     <!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>

<style>
    .m_box {
        width: 100%;
    }
    .m_content {
        margin: 0 auto;
        max-width: 1110px;
        height: auto;
    }

    .box {
        width: 400px;
        height: 100px;
        border: solid 1px #d2d2d7;
        border-radius: 10px;
        text-align : center;
        padding : 10px 0;
        margin-top:30px;
        margin-bottom: 10px;
    }

    .box:hover {
        border: 1px solid #86868b;
    }
    .check {
        border: 1px solid #306fdb;
    }

    .join_details{
        display: none;
    }

    .btn_addressCheck {
        display: inline-block;
        width: 100px;
        height: 30px;
        border-radius: 20px;
        background-color: #ebebeb;
        border: 1px solid #ddd;

        padding: 5px 5px;
        cursor: pointer;
    }

    .btn_b {
        color: white;
        display: inline-block;
        width: 200px;
        height: 60px;
        border-radius: 20px;
        background-color: #0071ef;
        border: 1px solid #0071ef;
        font-size: 23px;
        font-weight: bold;
        padding: 5px 5px;
        cursor: pointer;
    }

    .join_addressNum_input{
        width : 300px;
        height: 30px;
        border-right: 0px;
        border-left: 0px;
        border-top:0px;
        border-bottop:0px;
        border-radius: 8px;
    }
    .join_address_input{
        width : 400px;
        height: 30px;
        border-right: 0px;
        border-left: 0px;
        border-top:0px;
        border-bottop:0px;
        border-radius: 8px;
    }

    .phone_input{
        width : 200px;
        height: 20px;
        border: solid 1px #d2d2d7;
        border-radius: 8px;
    }
    .coupon_card {
        border : 1px solid #171717;
        width : 30%;
        margin : auto;
    }
    .coupon_box{
        width : 50%;
        margin : auto;
    }
    .coupon_box_title{
        width: 100%;
        height: 100px;
        /*border-top : 2px solid #171717;
        border-left: 2px solid #171717;
        border-right: 2px solid #171717;*/
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 22px;
    }
    .couponNum {
        width: 100%;
        height: 50px;
        vertical-align: bottom;
        display: flex;
        align-items: center;
        justify-content: right;
    }
    .coupon_card_box {
        margin-top: 10px;
        width :100%;
        border-top : 2px solid #171717;
    }
    .coupon_table {
        width :100%;
        border-bottom : 1px solid #171717;
        border-collapse: collapse;
    }
    .coupon_table td {
        border-bottom : 1px solid #171717;
        text-align: center;
        vertical-align: middle;
        height: 30px;

    }
    .coupon_table th {
        border-bottom : 1px solid #171717;
        height : 40px;
    }
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<div class="m_box">
    <div class="m_content">
        <h1>주소 전화번호 정보</h1>

        <div class="box" id="mem_addres" onclick="hide_New_address('new_address' ,this.id, 'new_mem_addres')">
            <h3>기존 주소 사용</h3>
            ${tmpAddr}
            ${user.mem_post_code}
        </div>

        <div class="box" id="new_mem_addres" onclick="show_New_Address('new_address', this.id, 'mem_addres')" style="height: 70px;">
            <h3>새주소 사용</h3>
        </div>

        <div class="join_details" id="new_address">
            <input type="text" id="postcode" class="join_addressNum_input" placeholder="우편번호" disabled="disabled">
            <input type="button" class="btn_addressCheck" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="address" class="join_address_input" placeholder="주소" disabled="disabled"><br>
            <input type="text" id="detailAddress" class="join_address_input" placeholder="상세주소" value="aa"><br>
            <input type="text" id="extraAddress" class="join_address_input" placeholder="참고항목" disabled="disabled"><br>
        </div>

        <h1 style="margin-top: 30px">연락처를 알려주세요</h1>

        <div class="box" id="mem_phone" onclick="hide_New_address('new_phone', this.id, 'new_mem_phone')" style="height: 70px;">
            <h3>기존 번호 사용</h3>
            ${user.mem_phone}
        </div>

        <div class="box" id="new_mem_phone" onclick="show_New_Address('new_phone', this.id, 'mem_phone')" style="height: 70px;">
            <h3>새번호 사용</h3>
            <div id="new_phone" style="display: none">
                <input class="phone_input" type="number" name="phone" id ="phone">
            </div>
        </div> 입력하시는 전화번호는 주문 후 변경할 수 없으므로 맞는 번호인지 확인해 주십시오.

        <form action="payment" method="post">
            <input type="hidden" name="cart_address" id="cart_address" value="${user.mem_address}!${user.mem_post_code}">
            <input type="hidden" name="cart_phone" id="cart_phone" value="${user.mem_phone}">
            <input type="hidden" name="coupon_price" id="coupon_price">
            <input type="hidden" name="coupon_pct" id="coupon_pct">
        </form>

        <h1 style="margin-top: 30px">포인트 & 쿠폰 사용하세요</h1>

        <div class="box" id="point" >
            <div style="text-align: left; margin-left: 50px;">
                <h2>${user.mem_point}원</h2>
            </div>
            <div>
                <input class="phone_input" type="number" id="mem_point" value="">
                <button type="button" class="btn_addressCheck" onclick="usePoint()">사용</button>
            </div>
        </div>

        <button type="button" class="btn_addressCheck" onclick="delCoupon()">쿠폰 취소</button>
        <div class="coupon_card_box">
            <table class="coupon_table">
                <thead>
                <tr>
                    <th>쿠폰번호</th>
                    <th>쿠폰명</th>
                    <th>혜택</th>
                    <th>적용대상</th>
                    <th>사용기간</th>
                </tr>
                </thead>

                <tbody>
                    <c:forEach var="list" items="${coupons}">
                        <tr  id = "cop${list.coupon_id}" onclick="addCoupon(this.id)">
                            <td>${list.coupon_id}</td>
                            <td>${list.coupon_desc}</td>

                            <c:choose>
                                <c:when test="${list.coupon_pct eq 0}">
                                    <td>${list.coupon_price}원</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${list.coupon_pct}%</td>
                                </c:otherwise>
                            </c:choose>
                            <td>전체대상</td>
                            <td>~${list.coupon_valid_date}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <div id="originalPrice">
            <h1>가격  : ${totalPrice}원</h1>
        </div>

        <div style="font-size: 15px; color: gray">
        사용된 포인트:
        <span id = "pointUsed">

        </span><br>

        사용된 쿠폰 :
        <span id="couponUsed">
        </span>


        </div>

        <div id ="price">
            <h1>총 가격:${totalPrice}원</h1>
        </div>


        <button class="btn_b" type="button" onclick="payment()">Pay</button>
    </div>
</div>

<script>
    var totalPrice = Number("${totalPrice}");

    var Addr = "";
    var Addr2 = "";

    var detailAddr = document.getElementById("detailAddress");
    detailAddr.onblur = function (e){
        if(document.getElementById("cart_address").value == ""){
            alert("주소를 전부 입력해주세요");
            return;
        }
        document.getElementById("cart_address").value += document.getElementById("detailAddress").value;
    };

    var phone = document.getElementById("phone");
    phone.onblur = function(e){
        document.getElementById("cart_phone").value = phone.value;
    };

    var mem_point= 0;
    var point = document.getElementById("mem_point");
    function usePoint(){
        if(point.value == ""){
            alert("포인트를 입력해주세요");
            return;
        }

        if(Number("${user.mem_point}") < Number(point.value)){
            alert("가진것보다 못씀");
            point.value = "";
            mem_point = 0;
            return;
        }

        if(Number(point.value) > Number(totalPrice) +Number(mem_point)) {
            alert("가격보다 더 못씀!");
            point.value = "";
            mem_point = 0;
            return;
        }

        if(mem_point != 0){
            totalPrice += Number(mem_point);
        }
        mem_point = point.value;
        totalPrice -= Number(mem_point);

        document.getElementById("pointUsed").innerHTML = point.value + "원";
        point.value = "";

        document.getElementById("price").innerHTML = "<h1> 총가격: "+totalPrice+"원 </h1>"

    }


    var couponId= 0;
    var couponDiscount = 0;
    function delCoupon(){
        if(couponId == 0){
            alert("등록된 쿠폰이 없습니다");
            return;
        }
        couponId = 0;
        totalPrice += Number(couponDiscount);
        couponDiscount = 0;
        document.getElementById("couponUsed").innerHTML = "";
        document.getElementById("price").innerHTML = "<h1> 총가격: "+totalPrice+"원 </h1>"
    }

    function addCoupon(id){
        if(mem_point != 0){
            alert("포인트를 사용 하시려면 쿠폰을 먼저 등록해주세요");
            totalPrice += Number(mem_point);
            mem_point = 0
            point.value = "";
            document.getElementById("pointUsed").innerHTML = "";
            document.getElementById("price").innerHTML = "<h1> 총가격: "+totalPrice+"원 </h1>"
            return;
        }
        var id = id.substring(3);
        if(couponId != 0){
            if(id == couponId){
                alert("중복사용 불가");
                return;
            }
            totalPrice += Number(couponDiscount);
        }
        couponId = id;

        $.ajax({
            url: "/coupons/member/getCoupon",
            type:"post",
            data:{
                coupon_id:couponId
                //totalPrice:totalPrice
            },
            dataType: "json",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                if(data.fail == ""){
                    couponDiscount = totalPrice - Number(data.success);
                    totalPrice = Number(data.success);
                    document.getElementById("couponUsed").innerHTML = couponDiscount + "원";
                    document.getElementById("price").innerHTML = "<h1> 총가격: "+data.success+"원 </h1>";
                }else{
                    alert(data.fail);
                    totalPrice = Number(data.success);
                }
            },
            error: function() {
                alert("error");
            }
        });
    }

    function show_New_Address(id, id2, id3){
        document.getElementById(id).style.display = "block";

        document.getElementById(id2).className = 'box check';
        document.getElementById(id3).className = 'box';

        if(id == 'new_phone'){
            document.getElementById("cart_phone").value = "";
        }else{
            document.getElementById("cart_address").value = "";
            document.getElementById("detailAddress").value = "";
        }

    }

   function hide_New_address(id, id2, id3){
        document.getElementById(id).style.display = "none";

       document.getElementById(id2).className = 'box check';
       document.getElementById(id3).className ='box';
        if(id == 'new_phone'){
            document.getElementById("cart_phone").value = "${user.mem_phone}";
            document.getElementById("phone").value = "";
        }else{
            var address = "${user.mem_address}";
            var post = "${user.mem_post_code}";
            document.getElementById("cart_address").value = address + "/" + post;
            document.getElementById('postcode').value = "";
            document.getElementById("address").value = "";
            document.getElementById("detailAddress").value = "aa";
        }
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("cart_address").value = addr + "/" + data.zonecode + "/";
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

    function payment(){
        var mem_phone = document.getElementById("cart_phone").value;
        var mem_address = document.getElementById("cart_address").value;


        if(mem_address == ""){
            alert("주소 입력해주세요");
            return;
        }else if(detailAddr.value == ""){
            alert("상세 주소를 전부 입력해주세요");
            return;
        }else if (mem_phone == ""){
            alert("번호 입력해주세요");
            return;
        } else{
        	
            //결제API 구현
            
            //console.log(totalPrice);
            
            var address = mem_address.split('!');
            var postCode = address[2];          
        	var today = new Date();
        	var uuid = uuidv4();
        	var discount = Number("${totalPrice}") - totalPrice;
            console.log("쿠폰 번호: " + couponId);
            	
    	    IMP.init("imp12077457"); // 예: imp00000000
    		  // IMP.request_pay(param, callback) 결제창 호출
    		  
    	    IMP.request_pay({
    	        pg : 'html5_inicis',
    	        pay_method : 'kakaopay', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
    	        merchant_uid : uuid, //상점에서 관리하시는 고유 주문번호를 전달
    	        name : 'SMARTDC 온라인 샵',
    	        amount : totalPrice,
    	        buyer_email : '${user.mem_email}',
    	        buyer_name : '${user.mem_name}',
    	        buyer_tel : mem_phone,
    	        buyer_addr : address[0] + " " + address[1],
    	        buyer_postcode : postCode,
    	    }, function(rsp) {
    	        if ( rsp.success ) {
    	        	console.log(rsp);
    	        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	        	jQuery.ajax({
    	        		url: "/carts/member/payment", //cross-domain error가 발생하지 않도록 주의해주세요
    	        		type: 'POST',
    	        		contentType: 'application/json',
    	        		dataType: 'json',
    					beforeSend : function(xhr)
    					{   
    						xhr.setRequestHeader(header, token);
    					},
    	        		data: JSON.stringify({
    	        			
    	    	    		imp_uid : rsp.imp_uid,
    	    	    		merchant_uid : rsp.merchant_uid,
    	    	    		totalPrice : rsp.paid_amount,
    	    	    		
    	    	    		//기타 필요한 데이터가 있으면 추가 전달
    	    	    		buyer_id : '${user.mem_id}',
    	        	        buyer_tel : mem_phone,
    	        	        buyer_addr : address[0] + " " + address[1],
    	        	        buyer_tel : mem_phone,
    	        	        buyer_postcode : postCode,
    	        	        buyer_discount : discount,
    	        	        buyer_point : mem_point,
    	        	        buyer_coupon_id : couponId,
    	        		})
    	        	}).done(function(data) {
    	        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    					data = JSON.stringify(data);
    					jsonData = JSON.parse(data);

    					//console.log(jsonData);
                        alert("결재가 완료되었습니다. 마이페이지에서 내역을 확인하세요.");
                        location.href="/";
    					if(jsonData.success){
    						console.log(jsonData.success);
    						
    	        		} else {
    	        			//[3] 아직 제대로 결제가 되지 않았습니다.
    	        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    	        		}
    	        	});
    	        } else {
    	            var msg = '결제에 실패하였습니다.';
    	            msg += '에러내용 : ' + rsp.error_msg;
    	            
    	            alert(msg);
    	        }
    	    });
  
        }


    }

    function uuidv4() {
    	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    	    return v.toString(16);
    	  });
    	}
</script>

</body>
</html>
