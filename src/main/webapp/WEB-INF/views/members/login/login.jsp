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

		.loginwrapper{
			height: auto;
			margin-top: 20px;
			padding-top: 100px;
		}

		.loginbox{
			width: 500px;
			height: auto;
			padding-bottom: 20px;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
			border: 1px solid rgba(0, 0, 0, 0.2);
			background: none;
			border-radius: 20px;
		}

		.loginname{
			letter-spacing: 2px;
			padding-top: 35px;
			padding-bottom:10px;
			margin-left: auto;
			margin-right: auto;
			text-align:center;
			width: 70%;
			font-size: 25px;
			font-weight: bold;
		}

		.sform{
			text-align: center;
		}

		.login_id {
			display: flex;
			margin-top: 20px;
			width: 80%;
			margin-left: auto;
			margin-right: auto;
		}

		.login_pw {
			display: flex;
			margin-top: 15px;
			width: 80%;
			margin-left: auto;
			margin-right: auto;
		}

		.input_v {
			width: 100%;
			height: 50px;
			background-color: #E8F0FE;
			border-radius: 10px;
			margin-top: 10px;
			padding: 0px 20px;
			border: none;
			outline: none;
			font-size: 15px;
		}

		.loginbox hr {
			height: 1px;
			border-style: solid;
			border-width: 1px 0 0 0;
			border-color: #ebebeb;
			width: 80%;
		}
		.bbb{

		}
		.inputbtn{
			width: 100%;
			text-align: center;
			display: inline-block;
			height: 40px;
			border-radius: 5px;
			background-color: #0071E3;
			font-size: 15px;
			font-weight: bold;
			color:white;
			border:0;
			cursor: pointer;
		}

		.inputbtn_kakao{
			width: 100%;
			text-align: center;
			display: inline-block;
			height: 40px;
			border-radius: 5px;
			background-color: #ffe600;
			font-size: 15px;
			font-weight: bold;
			color:#392020;
			border:0;
			cursor: pointer;
			margin-top:15px;
		}

		.login_links{
			padding-top: 10px;font-size: 12px;padding-bottom: 12px;color: gray;
		}
		.login_links a{
			padding:0 10px;
		}
		.login_links a:hover{
			color: #333333;
		}

		@media screen and (max-width: 600px) {
			.loginbox{
				width:450px;
			}
		}

	</style>
</head>
<body>
<div>

	<div class="loginwrapper">
		<div class="loginbox">
			<div class="loginname">LOGIN</div>
			<hr>
			<h2>${error}</h2>
			<h2>${logout}</h2>
			<div class="sform">
				<form action="/login" method="post">

					<div class="login_id">
						<input class="input_v" type="text" name="username" placeholder="아이디"/>
					</div>
					<div class="login_pw">
						<input class="input_v" type="password" name="password" placeholder="비밀번호"/>
					</div>
					<h4 style="color:red;height: 25px;line-height:30px;margin:0;">
						<c:if test="${not empty msg}">
							${msg}
						</c:if>
					</h4>
					<div style="margin:0 auto;width: 80%;padding-top: 10px;padding-bottom: 20px;">
						<input class="inputbtn" type="submit" value="로그인"/>
						<div class="inputbtn_kakao">
							<a id="custom-login-btn" class="custom-login-btn" href="javascript:kakaoLogin()">
								<div style="display: flex;text-align: center;justify-content: center;padding-right: 5%;">
									<img src="/resources/static/img/kakao_btn1.png" style="height: 40px"/>
									<h4 style="color:#392020;line-height: 3px;padding-left: 4px;">카카오로 로그인하기</h4>
								</div>
							</a>
						</div>
					</div>

					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				</form>


			</div>
			<hr>
			<div class="login_links">
				<a href="/join">회원가입</a>
				<a href="/findId">아이디찾기</a>
				<a href="/findPw">비밀번호찾기</a>
			</div>
		</div>


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

	function createHiddenLoginForm(kakaoid){
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


		frm.appendChild(hiddenInput);
		frm.appendChild(hiddenInput2);
		frm.appendChild(hiddenInput3);

		document.body.appendChild(frm);
		frm.submit();

	}

</script>
</body>
</html>