<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<style>
	@font-face {
		font-family: "BBTreeGR";
		src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
		format("woff");
		font-weight: normal;
		font-style: normal;
	}
	#mail_check_input_box_false{
		background-color:white;
	}
	/*#mail_check_input_box_true{
		background-color:white;
	}*/
	.mail_check_button{
		width: 65px;
		height : 27px;
		border-radius: 8px;
		background-color: #0071e3;
		border: 1px solid #ddd;
		color : white;
		margin-left: 5px;
		padding: 3px 3px;
		cursor: pointer;
		font-size: 11px;
		text-align: center;
		float: left;
	}
	.correct{
		color : green;
	}
	.incorrect{
		color : red;
	}
	.input_join{
		border-right: 0px;
		border-left: 0px;
		border-top:0px;
		border-bottom: 1px solid rgba(0, 0, 0, 0.3);
		width : 100%
	}
	.join{
		width: 35%;
		margin: auto;
		border: 2px solid rgba(0, 0, 0, 0.3);
		border-radius: 5px;
	}
	.join_form{
		width:80%;
		margin: auto;
	}
	.join_form_box{
		width:90%;
		margin:auto;
	}
	.join_title{
		text-align: center;
		border-bottom: 1px solid rgba(0, 0, 0, 0.3);
		font-size: 14px;
	}
	.join_type{
		width: 15%;
		float:left;
		height: auto;

	}
	.join_details{
		width: 85%;
		height: auto;
		float:left;
	}
	.join_margin{
		width: 30%;
	}
	.join_details_email{
		width: 55%;
		height: auto;
		float:left;
	}
	.join_details_id{
		width: 75%;
		height: auto;
		float:left;
	}
	.join_box{
		width: 100%;
		margin-top :10%;
		height: 10%;
		float:left;

	}
	.join_check{
		width:100%;
		display: table-cell;
		vertical-align: middle;
		color:red;
		font-size: 12px;
	}
	.btn_id_check{
		width: 65px;
		height : 30px;
		border-radius: 8px;
		background-color: #0071e3;
		border: 1px solid #ddd;
		color : white;
		padding: 5px 5px;
		cursor: pointer;
		font-size: 12px;
	}
	.input_check_id{
		border-right: 0px;
		border-left: 0px;
		border-top:0px;
		border-bottom: 1px solid rgba(0, 0, 0, 0.3);
		width : 79%
	}
	.input_check_email{
		border-right: 0px;
		border-left: 0px;
		border-top:0px;
		border-bottom: 1px solid rgba(0, 0, 0, 0.3);
		width : 76%;
		float: left;

	}
	.join_addressNum_input{
		width : 30%;
		height: 25px;
		border-right: 0px;
		border-left: 0px;
		border-top:0px;
		/*border-bottom: 1px solid rgba(0, 0, 0, 0.3);*/
		border-bottop:0px;
		border-radius: 8px;
	}
	.join_address_input{
		width : 100%;
		height: 25px;
		border-right: 0px;
		border-left: 0px;
		border-top:0px;
		/*border-bottom: 1px solid rgba(0, 0, 0, 0.3);*/
		border-bottop:0px;
		border-radius: 8px;
	}
	.btn_addressCheck {
		display: inline-block;
		width: 110px;
		border-radius: 20px;
		background-color: #ebebeb;
		border: 1px solid #ddd;

		padding: 5px 5px;
		cursor: pointer;
	}
	.mail_check_input {
		height: 25px;
		border-right: 0px;
		border-left: 0px;
		border-top:0px;
		/*border-bottom: 1px solid rgba(0, 0, 0, 0.3);*/
		border-bottop:0px;
		border-radius: 8px;
	}
	.btn_join {
		width : 100px;
		height : 35px;
		border-radius: 8px;
		background-color: #0071E3;
		color : white;
		border: 1px solid #ddd;
		padding: 5px 5px;
		cursor: pointer;


	}
	.join_btn_box{
		width : 100%;
		margin-bottom: 5%;
		margin-top : 5%;
		display: table-cell;
		vertical-align: middle;
		text-align: center;
		display: inline-block;
	}
</style>
<head>

	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>



	<title>회원가입</title>
	<!-- jQuery -->
	<script
			src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script><!-- jQuery CDN --->
	<!-- daum 우편주소 api-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<div class="join">
	<div class="join_form">
		<div class="join_title">
			<h2>회원가입</h2>
		</div>
		<div class="join_form_box">
			<div class="join_box">
				<div class="join_type">
					이름
				</div>
				<div class="join_details">
					<input type="text" class="input_join" id="memName" placeholder="이름">
				</div>
				<div class="join_check" id="nameCheck">

				</div>
			</div>
			<div class="join_box">
				<div class="join_type">
					아이디
				</div>
				<div class="join_details">
					<input type="text" id="memId" class="input_check_id" maxlength="11" placeholder="아이디 입력(5~11자)">
					<button type=button id="idLookupBtn" class="btn_id_check" onclick="idLookup()">중복확인</button>
				</div>
				<div class="join_check" id="idCheck">
				</div>
			</div>
			<div class="join_box">
				<div class="join_type">
					비밀번호
				</div>
				<div class="join_details">
					<input type="password" id="memPassword" class="input_join" maxlength="40" placeholder="비밀번호(영문자,숫자,특수문자 조합 최소 8자)"><br><br>
					<input type="password" id="passwordReEnter" class="input_join" maxlength="40" placeholder="비밀번호 확인">
				</div>
				<div class="join_check" id="passwordCheck">
				</div>
			</div>


			<div class="join_box">
				<div class="join_type">
					이메일
				</div>
				<div class="join_details">
					<input type="text" id="memEmail" class="input_check_email" placeholder="이메일 입력">
					<div class="mail_check_button" type="button">
						인증번호<br>전송
					</div>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" id="mail_check_input" disabled="disabled">
						</div>
						<div class="ui-helper-clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>

				</div>
				<div class="join_check" id="emailCheck">
				</div>

			</div>
			<div class="join_box">
				<div class="join_type">
					생년월일
				</div>
				<select name="year" id="year">
					<c:forEach var="i" begin="0" end="105" step="1">
						<option value="${ year - i }">${ year - i}</option>
					</c:forEach>
				</select>
				<select name="month" id="month">
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${ i }"> ${ i }</option>
					</c:forEach>
				</select>
				<select name="day" id="day">
					<c:forEach var="i" begin="1" end="31" step="1">
						<option value="${ i }"> ${ i }</option>
					</c:forEach>
				</select>
			</div>
			<div class="join_box">
				<div class="join_type">
					휴대폰<br>번호
				</div>
				<div class="join_details">
					<input type="text" class="input_join" id="memPhone" placeholder="휴대폰번호입력(01012341234)">
				</div>
				<div class="join_check" id="phoneCheck"></div>
			</div>
			<div class="join_box">
				<div class="join_type">
					주소
				</div>
				<div class="join_details">
					<input type="text" id="postcode" class="join_addressNum_input" placeholder="우편번호" disabled="disabled">
					<input type="button" class="btn_addressCheck" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" class="join_address_input" placeholder="주소" disabled="disabled"><br>
					<input type="text" id="detailAddress" class="join_address_input" placeholder="상세주소"><br>
					<input type="text" id="extraAddress" class="join_address_input" placeholder="참고항목" disabled="disabled">
				</div>
				<p id="addressCheck"></p>
			</div>
			<div class="join_btn_box">
				<button class="btn_join" onclick="sendInfo()">회원가입</button>
			</div>
		</div>

	</div>
</div>

<!-- javascript -->
<script type="text/javascript">
	var code="";
	var mailnumCheck="false";
	//csrf 토큰값 받기
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	//회원이름
	var memName = document.querySelector('#memName');


	//아이디
	var memId = document.querySelector('#memId');
	//var idLookup = document.querySelector('#idLookup');
	var successId;

	//비밀번호
	var memPassword = document.querySelector('#memPassword');
	var passwordReEnter = document.querySelector('#passwordReEnter');

	var regPassword =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/; //.test(password)

	//이메일
	var memEmail = document.querySelector('#memEmail');

	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

	//생년월일
	var documentYear = document.getElementById("year");
	var documentMonth = document.getElementById("month");
	var documentDay = document.getElementById("day");

	//전화번호
	var memPhone = document.querySelector('#memPhone');
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

	//주소
	//var address = document.querySelector('#address');

	//회원이름 정보 확인
	memName.onblur = function (e) {
		if(memName.value.length == 0){
			nameCheck.innerHTML = "이름을 입력해주세요.";
		}else{
			nameCheck.innerHTML = "";
		}
	}

	//회원아이디 정보 확인
	memId.onblur = function (e) {
		if(memId.value.length == 0){
			idCheck.innerHTML = "아이디를 입력해주세요.";
		}else if(memId.value.length < 5){
			idCheck.innerHTML = "5~11자 입력해주세요."
		}else{
			idCheck.innerHTML = null;
		}
	}

	function idLookup() {

		if(memId.value.length >= 5){

			jQuery.ajax({
				"url": "/join/idLookup",
				"type": "POST",
				"contentType": "application/json; charset=utf-8;",
				"data": JSON.stringify({
					"memId": memId.value,
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

				if(jsonData.success){
					idCheck.innerHTML = jsonData.success;


					successId = jsonData.memId;
				}else{
					idCheck.innerHTML = jsonData.error;
				}

			});
		}
	}

	//비밀번호 정보 확인
	memPassword.onblur = function (e) {

		//console.log(regPassword.test(password));

		if(memPassword.value.length == 0){

			passwordCheck.innerHTML = "비밀번호을 입력해주세요";

		}else if(!regPassword.test(memPassword.value)){

			passwordCheck.innerHTML = "잘못된 비밀번호 형식입니다.(특수문자는 @$!%*#? 중 선택)";

		}else{

			passwordCheck.innerHTML = null;

		}
	}

	passwordReEnter.onblur = function (e) {

		if(memPassword.value.length != 0){

			if(memPassword.value == passwordReEnter.value){
				passwordCheck.innerHTML = "비밀번호가 일치 합니다.";
			}else{
				passwordCheck.innerHTML = "비밀번호가 일치하지 않습니다.";
			}

		}
	}

	//이메일 정보 확인
	memEmail.onblur = function (e) {

		if(memEmail.value.length == 0){
			emailCheck.innerHTML = "이메일을 입력해주세요";
		}else if(!regEmail.test(memEmail.value)){
			emailCheck.innerHTML = "잘못된 이메일 형식입니다.";
		}else{
			emailCheck.innerHTML = null;
		}

	}

	//전화번호 정보 확인
	memPhone.onblur = function (e) {

		if(memPhone.value.length == 0){
			phoneCheck.innerHTML = "전화번호을 입력해주세요";
		}else if(!regPhone.test(memPhone.value)){
			phoneCheck.innerHTML = "잘못된 전화번호 형식입니다.";
		}else{
			phoneCheck.innerHTML = null;
		}

	}


	//우편번호 api
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
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	//회원가입
	function sendInfo() {

		var year = documentYear.options[documentYear.selectedIndex].value;
		var month = documentMonth.options[documentMonth.selectedIndex].value;
		if(month.length == 1){
			month = 0 + month;
		}
		var day = documentDay.options[documentDay.selectedIndex].value;
		if(day.length == 1){
			day = 0 + day;
		}
		var birth = year + "-" + month + "-" + day;

		var postCode = document.getElementById('postcode').value; //우편번호
		var address = document.getElementById("address").value + "!" + document.getElementById("detailAddress").value; //주소
		var extraAddress = document.getElementById("extraAddress").value; //참고항목


		var boolName = memName.value.length == 0;
		var boolId = memId.value.length == 0 || memId.value.length < 5;
		var boolPassword = memPassword.value.length == 0 || !regPassword.test(memPassword.value);
		var boolPasswordReEnter = memPassword.value != passwordReEnter.value;
		var boolEmail = memEmail.value.length == 0 || !regEmail.test(memEmail.value);
		var boolPhone = memPhone.value.length == 0 || !regPhone.test(memPhone.value);

		//console.log(document.getElementById("address").value.length);
		//console.log(birth);
		if(document.getElementById("address").value.length == 0){

			alert("주소를 입력해 주세요.");
		}else if(successId != memId.value){

			alert("아이디 중복 확인 해주세요.");
		}else if(boolName){

			alert("이름을 다시 입력해주세요");
		}else if(boolId){

			alert("아이디를 다시 입력해주세요.");
		}else if(boolPassword){

			alert("비밀번호를 다시 입력해주세요.");
		}else if(boolPasswordReEnter){

			alert("비밀번호 확인해주세요.");
		}else if(boolEmail){

			alert("이메일을 다시 입력해주세요.");
		}else if(boolPhone){

			alert("전화번호를 다시 입력해주세요.")
		}else if(mailnumCheck=="false"){
			alert("이메일 인증을 진행해주세요")
		}
		else{

			jQuery.ajax({
				"url": "/join/joinProcess",
				"type": "POST",
				"contentType": "application/json; charset=utf-8;",
				"data": JSON.stringify({
					"memName": memName.value,
					"memId": memId.value,
					"memPassword": memPassword.value,
					"memPhone" : memPhone.value,
					"memEmail": memEmail.value,
					"memBirth": birth,
					"memPostCode": postCode,
					"memAddress": address
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

				if(jsonData.success){
					alert(jsonData.success);
					location.href = "/";
				}else{
					alert('에러. 새로고침 후 다시 회원가입 해주세요.');
				}

			});
		}
	}

	/*인증번호 이메일 전송 */
	$(".mail_check_button").click(function(){
		var email=document.getElementById("memEmail").value; //회원이 입력한 이메일
		var checkbox;
		var boxWrap;

		//console.log(email);

		jQuery.ajax({

			type:"GET",
			url:"mailCheck?email=" + email,
			success:function(data){
				//console.log("data:"+data);

				checkbox= $(".mail_check_input").attr("disabled",false); //인증번호 입력란

				code=data;
			}

		});
	});


	/* 인증번호 비교 */
	$(".mail_check_input").blur(function(){
		var inputCode = $(".mail_check_input").val();        // 입력코드
		var checkResult = $("#mail_check_input_box_warn");    // 비교 결과

		if(inputCode == code){                            // 일치할 경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
			mailnumCheck=false;
		} else {                                            // 일치하지 않을 경우
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
			mailnumCheck=true;
		}
	});

</script>
</body>
</html>