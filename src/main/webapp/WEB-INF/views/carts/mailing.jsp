<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>

<h1>주소 전화번호 정보</h1>
<hr>




<div id="mem_addres" onclick="hide_New_address('new_address')">
    <h3>기존 주소 사용</h3>
    ${user.mem_address}
    ${user.mem_post_code}
    기본값
</div>

<br>

<div id="click_new_address" onclick="show_New_Address('new_address')">
    <h3>새주소 사용</h3>
</div>

<div id="new_address" style="display: none">
    주소<br>
    <input type="text" id="postcode" placeholder="우편번호" disabled="disabled">
    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="address" placeholder="주소" disabled="disabled"><br>
    <input type="text" id="detailAddress" maxlength="80" placeholder="상세주소">
    <input type="text" id="extraAddress" placeholder="참고항목" disabled="disabled">
    <p id="addressCheck"></p><br>
</div>

<hr>


<div id="mem_phone" onclick="hide_New_address('new_phone')">
    <h3>기존 번호 사용</h3>
    ${user.mem_phone}
</div>

<div onclick="show_New_Address('new_phone')">
    <h3>새번호 사용</h3>
</div>

<div id="new_phone" style="display: none">
    <input type="text" name="phone">
</div>

<form action="payment" method="post">
    <input type="hidden" name="cart_address" id="cart_address" value="${user.mem_address}/${user.mem_post_code}">
    <input type="hidden" name="cart_phone" id="phone" value="${user.mem_phone}">
    <input type="submit" value="제출">
</form>

${user.mem_point}점
<div id="point">
    사용하고 싶은 점수: <input type="text" id="mem_point">
</div>

현재 가지고 있는 쿠폰 리스트
<div id="mem_coupon_list">
    <c:forEach var="list" items="${coupons}">
        ${list.coupon_id} ${list.coupon_desc}
        <c:choose>
            <c:when test="${list.coupon_pct eq 0}">
                ${list.coupon_price}
            </c:when>
            <c:otherwise>
                ${list.coupon_pct}
            </c:otherwise>
        </c:choose>
        ${list.coupon_valid_date} <br>
    </c:forEach>
</div>

<h1>총 가격: ${totalPrice}원</h1>


<script>
    function show_New_Address(id){
        document.getElementById(id).style.display = "block";

    }

   function hide_New_address(id){
        document.getElementById(id).style.display = "none";
        if(id == 'new_phone'){
            document.getElementById("cart_phone").value = ${user.mem_phone};
        }else{
            var address = "${user.mem_address}";
            var post = ${user.mem_post_code};
            document.getElementById("cart_address").value = address + "/" + post;
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

    var detailAddr = document.getElementById("detailAddress");
    detailAddr.onblur = function (e){
        document.getElementById("cart_address").value += detailAddr.value;
    };

</script>

</body>
</html>
