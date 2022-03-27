<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>홈</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-weight: 300;
            font-family: 'Raleway', sans-serif;
            background: #fff;
            background: radial-gradient(ellipse at center, rgba(0,0,0,0) 0%, rgba(0,0,0,0.05) 80%, rgba(0,0,0,0.15) 100%);
            overflow: hidden;
            transform-style: preserve-3d;
        }
        input[type='radio'],
        .hide {
            display: none;
        }
        input[type='radio']:checked + section {
            top: 0;
        }
        .container {
            width: 100%;
            height: 100vh;
            transition: all 500ms;
            transform-style: preserve-3d;
        }
        .container section {
            position: absolute;
            top: 100vh;
            width: 100%;
            height: 100vh;
            transition: top 500ms;
            transform-style: preserve-3d;
        }
        .container section.home {
            background: #2196f3;
        }
        .container section.about {
            background: #ffc107;
        }
        .container section.work {
            background: #4caf50;
        }
        .container section.contact {
            background: #f44336;
        }
        .container section h1 {
            margin: 0;
            font-size: 64px;
            transform: translate(0, 40vh);
            text-align: center;
            color: rgba(255,255,255,0.85);
            transition: transform 500ms;
            transform-style: preserve-3d;
        }
        .container section label {
            display: block;
            position: absolute;
            top: 0;
            width: 100%;
            height: 100vh;
        }
        .menu {
            display: block;
            position: fixed;
            top: 20px;
            left: 25px;
            z-index: 1000;
            transform: 0deg;
            transition: all 200ms;
            width: 35px;
            height: 4px;
            background: rgba(0,0,0,0.25);
        }
        .menu::before,
        .menu::after {
            content: '';
            display: block;
            position: absolute;
            width: 35px;
            height: 4px;
            background: rgba(0,0,0,0.25);
            transition: all 200ms;
        }
        .menu::before {
            top: 10px;
        }
        .menu::after {
            top: 20px;
        }
        .menu:hover {
            background: #fff;
        }
        .menu:hover::before,
        .menu:hover::after {
            background: #fff;
        }
        .menu div,
        .menu div label:nth-child(1) {
            display: block;
            width: 35px;
            height: 35px;
            position: absolute;
            top: -6px;
        }
        .menu div label:nth-child(2) {
            display: none;
        }
        #menu:checked + .container {
            transform: scale(0.65) translateY(-18%);
            transition: all 500ms;
            transform-style: preserve-3d;
        }
        #menu:checked + .container section {
            cursor: pointer;
            overflow: hidden;
            opacity: 1;
            box-shadow: 0 0 40px rgba(0,0,0,0.25);
            transform-style: preserve-3d;
        }
        #menu:checked + .container section h1 {
            transform: scale(0.5);
            transform-style: preserve-3d;
        }
        #menu:checked + .container + .menu {
            top: 30px;
            left: 20px;
            transform: rotate(225deg);
            transition: all 200ms;
            transform-origin: center center;
            background: #646464;
        }
        #menu:checked + .container + .menu::before,
        #menu:checked + .container + .menu::after {
            background: #646464;
            transition: all 200ms;
        }
        #menu:checked + .container + .menu::before {
            opacity: 0;
            transition: opacity 0s;
        }
        #menu:checked + .container + .menu::after {
            margin-top: -20px;
            transform: rotate(90deg);
        }
        #menu:checked + .container + .menu div label:nth-child(2) {
            display: block;
            width: 35px;
            height: 35px;
            position: absolute;
            top: -6px;
        }
        #menu:checked + .container + .menu div label:nth-child(1) {
            display: none;
        }
        .container section.home {
            z-index: 99;
        }
        .container section.about {
            z-index: 98;
        }
        .container section.work {
            z-index: 97;
        }
        .container section.contact {
            z-index: 96;
        }
        #menu:checked + .container section.home {
            top: 192px;
        }
        #menu:checked + .container section.home:hover {
            top: 188px;
        }
        #menu:checked + .container section.about {
            top: 132px;
        }
        #menu:checked + .container section.about:hover {
            top: 128px;
        }
        #menu:checked + .container section.work {
            top: 72px;
        }
        #menu:checked + .container section.work:hover {
            top: 68px;
        }
        #menu:checked + .container section.contact {
            top: 12px;
        }
        #menu:checked + .container section.contact:hover {
            top: 8px;
        }
    </style>
</head>


<body>
<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<!--
${user.mem_name}님 반갑습니다 main<br>
${user.mem_id}님 반갑습니다 main<br>
${user.mem_password}님 반갑습니다 main<br>
${user.mem_email}님 반갑습니다 main<br>
${user.mem_phone}님 반갑습니다 main<br>
${user.mem_birth}님 반갑습니다 main<br>
${user.mem_post_code}님 반갑습니다 main<br>
${user.mem_address}님 반갑습니다 main<br>
${user.mem_point}님 반갑습니다 main<br>
${user.mem_auth}님 반갑습니다 main<br>
${user.mem_enable}님 반갑습니다 main<br>
-->
main.jsp





<%--<div id="parent-div">
    <div id="div-no-1">하나</div>
    <div id="div-no-2">둘</div>
    <div id="div-no-3">셋</div>
    <div id="div-no-4">야</div>
</div>--%>
<form action = "/boards/somethingform" method="post">
    <input type="text" value="seomthing" name="something">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="submit" value="제출">
</form>


<%--<form>
    <input type="radio" name="tab" id="menu" />
    <div class="container"><input type="radio" name="tab" checked="checked" id="home" />
        <section class="home">
            <h1>Home</h1><label for="home"></label>
        </section><input type="radio" name="tab" id="about" />
        <section class="about">
            <h1>About</h1><label for="about"></label>
        </section><input type="radio" name="tab" id="work" />
        <section class="work">
            <h1>Work</h1><label for="work"></label>
        </section><input type="radio" name="tab" id="contact" />
        <section class="contact">
            <h1>Contact</h1><label for="contact"></label>
        </section>
    </div>
    <div class="menu">
        <div><label for="menu"></label><label for="home"></label></div>
    </div>
</form>--%>

<button type="button" onclick="something()">ajax</button>-

<script>

/*    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");*/


/*    var children = document.getElementById("parent-div").children;
    var parent = document.getElementById("div-no-1").parentNode;
    var parent1 = document.getElementById("div-no-1").parentElement;

    console.log(parent.children[0]);
    console.log(parent.children[1]);
    console.log(parent.children[2]);
    console.log(parent.children[3]);
    console.log(parent1);

    for (var i = 0; i < children.length; i++) {
        console.log(children[i]);
        //console.log(children[i].innerText);
    }*/

    function something(){
        $.ajax({
            url: "/boards/something",
            type:"post",
            data:{id: 'user'},
            dataType: "text",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                console.log(data);
            },
            error: function() {
                alert("error");
            }
        });
    }

</script>

</body>
</html>