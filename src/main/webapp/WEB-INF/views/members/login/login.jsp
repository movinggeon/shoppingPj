<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/static/css/login.css" type="text/css">
	<link rel="stylesheet" href="/resources/static/css/cart.css" type="text/css">
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
		background-color: lightgrey;
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
		/*display: inline-block;*/
		margin-top: 20px;
		width: 100px;
		height: 40px;
		border-radius: 10px;
		/*background:linear-gradient(to left,lightgrey,grey);*/
		background-color: #0071E3;
		font-size: 13px;
		color:white;
		border: 1px solid #ddd;
		padding: 5px 5px;
		cursor: pointer;
	}
	a{
		font-size: 14px;
		margin-right:10px;
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
		</form> <br>
		</div>
		<a href="/join" >회원가입</a>
		<a href="/findId" >아이디찾기</a>
		<a href="/findPw" >비밀번호찾기</a>
	</div>
</div>
</div>
</body>
</html>