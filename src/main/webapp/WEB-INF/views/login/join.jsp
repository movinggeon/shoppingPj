<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- daum 우편주소 api-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
</head>
<body>
	이름<br>
	<input type="text" id="memName" placeholder="이름">
	<p id="nameCheck"></p><br>
	
	아이디 <br>
	<input type="text" id="memId" maxlength="11" placeholder="아이디 입력(5~11자)"><button onclick="checkId()">중복확인</button>
	<p id="idCheck"></p><br>
	
	비밀번호 <br>
	<input type="password" id="memPassword" placeholder="비밀번호(영문자,숫자,특수문자 조합 최소8)"><br><br>
	<input type="password" id="passwordReEnter" placeholder="비밀번호 확인">
	<p id="passwordCheck"></p><br>
	
	이메일<br>
	<input type="text" id="memEmail" placeholder="이메일 입력">
	<p id="emailCheck"></p><br>
	
	생년월일<br>
	<select name="year">
 		<c:forEach var="i" begin="0" end="105" step="1">
			<option value="${ year - i }">${ year - i}</option>
		</c:forEach>
	</select>
	<select name="month">
		<c:forEach var="i" begin="1" end="12" step="1">
			<option value="${ i }"> ${ i }</option>
		</c:forEach>
	</select>
	<select>
		<c:forEach var="i" begin="1" end="31" step="1">
			<option value="${ i }"> ${ i }</option>
		</c:forEach>
	</select><br><br>
	휴대폰번호<br>
	<input type="text" id="memPhone" placeholder="휴대폰번호입력(01012341234)"><br><br>
	
	주소<br>
	<input type="text" id="postcode" placeholder="우편번호" disabled="disabled">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="address" placeholder="주소" disabled="disabled"><br>
	<input type="text" id="detailAddress" placeholder="상세주소">
	<input type="text" id="extraAddress" placeholder="참고항목" disabled="disabled">
	<p id="addressCheck"></p><br>
	
	<button onclick="sendInfo()">회원가입</button>

	<!-- javascript -->
	<script type="text/javascript">

		//회원이름
		var memName = document.querySelector('#memName');
		var nameCheck = document.querySelector('#nameCheck');
		
		//아이디
		var memId = document.querySelector('#memId');
		var idCheck = document.querySelector('#idCheck');
		
		//비밀번호
		var memPassword = document.querySelector('#memPassword');
		var passwordReEnter = document.querySelector('#passwordReEnter');
		var passwordCheck = document.querySelector('#passwordCheck');
		
		//이메일
		var memEmail = document.querySelector('#memEmail');
		var emailCheck = document.querySelector('#emailCheck');
		
		//주소
		
		
		//회원이름 정보 확인
		memName.onblur = function (e) {
			if(memName.value.length == 0){
				nameCheck.innerHTML = "이름을 입력해주세요";
			}else{
				nameCheck.innerHTML = null;
			}
		}
		
		//회원아이디 정보 확인
		memId.onblur = function (e) {
			if(memId.value.length == 0){
				idCheck.innerHTML = "아이디를 입력해주세요";
			}else{
				idCheck.innerHTML = null;
			}
		}
		
		//비밀번호 정보 확인
		memPassword.onblur = function (e) {
			if(memPassword.value.length == 0){
				passwordCheck.innerHTML = "비밀번호을 입력해주세요";
			}else{
				passwordCheck.innerHTML = null;
			}
		}
		
		//이메일 정보 확인
		memEmail.onblur = function (e) {
			if(memEmail.value.length == 0){
				emailCheck.innerHTML = "이메일을 입력해주세요";
			}else{
				emailCheck.innerHTML = null;
			}
		}
		
		//주소 정보 확인

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
	</script>
</body>
</html>