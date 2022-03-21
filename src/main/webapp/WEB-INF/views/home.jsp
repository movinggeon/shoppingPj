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


<div id="parent-div">
    <div id="div-no-1">하나</div>
    <div id="div-no-2">둘</div>
    <div id="div-no-3">셋</div>
    <div id="div-no-4">야</div>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<button type="button" onclick="something()">ajax</button>

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


/*    function something(){
        $.ajax({
            url: "/boards/something",
            type:"post",
            data:{id:'id'},
            dataType: "text",
            beforeSend : function(xhr)
            {   /!*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*!/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                console.log(data);
            },
            error: function() {
                alert("error");
            }
        });*/
    }

</script>

</body>
</html>