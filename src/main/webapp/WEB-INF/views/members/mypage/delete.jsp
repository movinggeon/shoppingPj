<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- jQuery -->
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script><!-- jQuery CDN --->

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>Title</title>
</head>

<h2>회원탈퇴</h2>
<div class = "delete">
<table class="table">
    <thead>
    <tr>
        <th scope="col" class="form-control form-control-inline text-center">탈퇴하시려면 현재 비밀번호를 입력해주세요</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><input type="password" id="memPassword"class="form-control form-control-inline text-center" placeholder="현재 비밀번호">
        </td>
    </tr>
    <tr>
        <td><input type="password" id="passwordReEnter"class="form-control form-control-inline text-center" placeholder="비밀번호 확인">
        </td>
    </tr>
    </tbody>
</table>
<button type="button" id="pwUpdate" onclick="DeleteMem()" class="btn btn-primary" >비밀번호 변경</button>
<a href="/members/member/modify" class="btn btn-default">취소</a>
</div>

<!-- javascript -->
<script type="text/javascript">

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //비밀번호
    var memPassword = document.querySelector('#memPassword');
    var passwordReEnter = document.querySelector('#passwordReEnter');


    function DeleteMem() {

        if(memPassword.value === passwordReEnter.value){

            jQuery.ajax({
                "url": "/members/member/delete/DeleteMem",
                "type": "POST",
                "contentType": "application/json; charset=utf-8;",
                "data": JSON.stringify({
                    "mem_password": memPassword.value,
                    "passwordReEnter":passwordReEnter.value
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
                    location.href = "/";
                }
                else {
                    alert(jsonData.error);
                }

            });
        }else if(memPassword.value == null || memPassword.value.length == 0){
            alert('현재 비밀번호를 입력해주세요.');
        }else if(passwordReEnter.value == null || passwordReEnter.value.length == 0){
            alert('현재 비밀번호를 다시 한번 입력세요.');
        }else {
            alert('입력된 비밀번호가 서로 일치하지 않습니다.');
        }
    }
</script>


</body>
</html>
