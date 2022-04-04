<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>로그인</title>
<link rel="stylesheet" href="/resources/static/css/login.css" type="text/css">
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- jQuery -->
	<script
			src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script><!-- jQuery CDN --->
<style>
	@font-face {
		font-family: "BBTreeGR";
		src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
		format("woff");
		font-weight: normal;
		font-style: normal;
	}
	html,
	body {
		width: 100%;
		height: 100%;
		margin: 0px;
	}

	.loginwrapper{
		height: auto;
		margin-top: 10%;
		margin-bottom: 10%;
	}
	.loginbox{
		width: 500px;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		border: 2px solid rgba(0, 0, 0, 0.3);
		background: none;

	}
	.loginname{
		padding-top: 20px;
		padding-botton:20px;
		margin-left: auto;
		margin-right: auto;
		text-align:center;
		width: 70%;
		font-size: 30px;
		border-bottom: 1px solid rgba(0, 0, 0, 0.3);
	}
	.sform{
		text-align: center;
	}

	.login_id {
		margin-top: 20px;
		width: 80%;
		margin-left: auto;
		margin-right: auto;
	}


	.login_pw {
		margin-top: 20px;
		width: 80%;
		margin-left: auto;
		margin-right: auto;

	}

	input {
		width: 80%;
		height: 50px;
		background-color: #E8F0FE;
		border-radius: 10px;
		margin-top: 10px;
		padding: 0px 20px;
		border: none;
		outline: none;
		font-size: 15px;
		/*padding-left: 10px;*/

	}
	/*	input:-webkit-autofill {
            !*-webkit-box-shadow: 0 0 0 1000px #000 inset;*!
            -webkit-box-shadow:lightgrey;
        } 자동완성시에도 기존색 유지하고싶으면 이거 해제하면됨*/

	.btnwrap{
		width: 100%;
		height: 100px;
		margin-top: 20px;
		text-align: center;

	}
	.inputbtn{
		display: inline-block;
		margin-top: 20px;
		width: 100px;
		height: 40px;
		border-radius: 5px;
		background-color: #0071E3;
		font-size: 13px;
		font-weight: bold;
		color:white;
		border: 1px solid #ddd;
		padding: 5px 5px;
		cursor: pointer;
	}

	.custom-login-btn{
		height: 45px;
		width: 101px;
	}

</style>
</head>
<body>
<div>
<c:if test="${not empty msg}">
    ${msg}
</c:if>
<div class="loginwrapper">
	<div class="loginbox">
		<div class="loginname">로그인</div>
		<h2>${error}</h2>
		<h2>${logout}</h2>
		<div class="sform">
		<form action="/login" method="post">
			<div class="login_id">
				<h2>Id</h2>
				<input type="text" name="username" />
			</div>
			<div class="login_pw">
				<h2>Password</h2>
				<input type="password" name="password" />
			</div>
			<div class="btnwrap"> <input class="inputbtn" type="submit" value="로그인"/></div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
			<a id="custom-login-btn" class="custom-login-btn" href="javascript:kakaoLogin()">
				<img src="/resources/static/img/kakao_login_medium.png"/>
			</a>
		</div>
		<a href="/join" style="font-size: 14px; margin-right:10px;">회원가입</a>
		<a href="/findId" style="font-size: 14px; margin-right:10px;">아이디찾기</a>
		<a href="/findPw" style="font-size: 14px;">비밀번호찾기</a>
	</div>
<%--	<ul>
		<li onclick="kakaoLogout();">
			<a href="javascript:void(0)">
				<span>카카오 로그아웃</span>
			</a>
		</li>
	</ul>--%>


</div>
</div>
<script>
	// 카카오 초기화
	Kakao.init('4bc559a7fbc2dd50e2a25360f8815a30');
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {

		Kakao.Auth.login({
			success: function(response) {
/*				var accessToken=Kakao.Auth.getAccessToken('4bc559a7fbc2dd50e2a25360f8815a30');
				Kakao.Auth.setAccessToken(accessToken);
				console.log(accessToken);*/

				Kakao.API.request({ // 사용자 정보 가져오기
					url: '/v2/user/me',
					success: (response) => {
						console.log(response);
						var kakaoid = response.id+"KAKAO";

						console.log(kakaoid);
						jQuery.ajax({
							"type" : "post",
							"contentType": "application/json; charset=utf-8;",
							"url" : "/join/kakaoidLookup", // ID중복체크를 통해 회원가입 유무를 결정한다.
							"data" : JSON.stringify({"memId":kakaoid}),
							beforeSend : function(xhr)
							{   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
								xhr.setRequestHeader(header, token);
							},
							"dataType":"json",
							success : function(json){
								if(json.idExists){
									// 존재하는 경우 로그인 처리
									createHiddenLoginForm(kakaoid);

								} else{
									// 회원가입
									console.log("위에 넘어와서 회원가입옴");
									jQuery.ajax({
										"type" : "post",
										"url" : "/join/kakaoProcess",
										"contentType": "application/json; charset=utf-8;",
										"data" : JSON.stringify({"memId":kakaoid,
											"memName":response.properties.nickname,
											"memEmail":response.kakao_account.email}),
										beforeSend : function(xhr)
										{   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
											xhr.setRequestHeader(header, token);
										},
										dataType :"json",
										success : function(json){
											if(json.success){
												createHiddenLoginForm(kakaoid);
											} else {
												alert('카카오 회원가입 실패. 일반계정으로 로그인하시기 바랍니다.');
											}
										},
										error: function(request, status, error){
											alert("회원가입에러, 쇼핑몰 가입을 이용해주세요");
										}
									});
								}
							},
							error: function(request, status, error){
								alert("로그인에러, 카카오 계정을 사용할수 없습니다. ");
							}
						});
					}
				});
				// window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
			},
			fail: function(error) {
				alert(error);
			}
		});
	}

	function createHiddenLoginForm(kakaoid/*,accessToken*/){
		var frm = document.createElement('form');
		frm.setAttribute('method', 'post');
		frm.setAttribute('action', '/login');

		//아이디 넣어주기
		var hiddenInput = document.createElement('input');
		hiddenInput.setAttribute('type','hidden');
		hiddenInput.setAttribute('name','username');
		hiddenInput.setAttribute('value',kakaoid);

		//비번넣어주기
		var hiddenInput2 = document.createElement('input');
		hiddenInput2.setAttribute('type','hidden');
		hiddenInput2.setAttribute('name','password');
		hiddenInput2.setAttribute('value',"kakao");

		//crsf값 넣어주기
		var hiddenInput3 = document.createElement('input');
		hiddenInput3.setAttribute('type','hidden');
		hiddenInput3.setAttribute('name',"${_csrf.parameterName}");
		hiddenInput3.setAttribute('value',"${_csrf.token}");

/*		//토큰
		var hiddenInput4 = document.createElement('input');
		hiddenInput4.setAttribute('type','hidden');
		hiddenInput4.setAttribute('name','accessToken');
		hiddenInput4.setAttribute('value',accessToken);*/


		frm.appendChild(hiddenInput);
		frm.appendChild(hiddenInput2);
		frm.appendChild(hiddenInput3);
/*		frm.appendChild(hiddenInput4);*/

		document.body.appendChild(frm);
		frm.submit();

	}
/*
	function kakaoLogout() {
	/!*	Kakao.init('4bc559a7fbc2dd50e2a25360f8815a30');
		Kakao.isInitialized();*!/
		if (!Kakao.Auth.getAccessToken('4bc559a7fbc2dd50e2a25360f8815a30')){
			console.log('로그인안됨');
			return;
		}
		Kakao.Auth.logout(function(){
			console.log(Kakao.Auth.getAccessToken('4bc559a7fbc2dd50e2a25360f8815a30'));
		});
	}*/

</script>
</body>
</html>