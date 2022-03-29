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
아이디찾기

<p>가입 하신 이메일을 입력해주세요</p>

    <input type="email" id="memEmail" placeholder="Enter Email Address...">
    <button type="button" onclick="sendFindId()">Find ID</button>


<script type="text/javascript">

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //이메일
    var memEmail = document.querySelector('#memEmail');

    function sendFindId(){
        jQuery.ajax({
            "url": "/members/findId/sendFindId",
            "type": "POST",
            "contentType": "application/json; charset=utf-8;",
            "data": JSON.stringify({
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
                location.href = "/members/login";
            }
            else {
                alert(jsonData.error);
            }

        });

    }
</script>
</body>
</html>
