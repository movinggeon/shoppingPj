<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
    <!-- jQuery -->
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script><!-- jQuery CDN --->

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Title</title>
</head>
<body>

<style>
    .findId_Box{
        width : 70%;
        margin: 7% auto auto;


    }
    .findId_Title{
        width: 80%;
        margin : auto;
        text-align: center;
        font-size : 30px;
    }
    .findId_subTitle{
        width: 50%;
        margin: auto;
        text-align: center;
        font-size : 23px;
        height: 70px;
        line-height: 70px;
        border-bottom : 2px solid #171717;
    }
    .findId_form{
        width: 50%;
        text-align: center;
        margin: 4% auto auto;
        height: 120px;
        border-bottom: 1px solid #ccc;
    }
    .email_input{
        width: 80%;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: #E8F0FE;
        text-align: center;
    }
    .btn_findId{
        width : 100px;
        height : 35px;
        border-radius: 8px;
        background-color: #0071E3;
        color : white;
        border: 1px solid #ddd;
        padding: 5px 5px;
        cursor: pointer;
        float : right;
    }
    .btn_box{
        width:50%;
        margin: auto;
    }
</style>
<div class="findId_Box">
    <div class="findId_Title">
        비밀번호 찾기
    </div>
    <div class="findId_subTitle">
        회원의 아이디와 이메일을 입력해주세요
    </div>
    <div class="findId_form">
        <input type="text" id="memId" class="email_input" placeholder="Enter ID...">
        <br><br>
        <input type="email" id="memEmail" class="email_input" placeholder="Enter Email Address...">
    </div>
    <div class="btn_box">
        <button type="button" class="btn_findId" onclick="sendFindPw()">비밀번호 찾기</button>
    </div>
</div>

<script type="text/javascript">

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //아이디
    var memId = document.querySelector('#memId');
    //이메일
    var memEmail = document.querySelector('#memEmail');

    function sendFindPw(){
        jQuery.ajax({
            "url": "/findPw/sendFindPw",
            "type": "POST",
            "contentType": "application/json; charset=utf-8;",
            "data": JSON.stringify({
                "mem_id" : memId.value,
                "mem_email" : memEmail.value
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
                location.href = "/login";
            }
            else {
                alert(jsonData.error);
            }

        });

    }
</script>
</body>
</html>