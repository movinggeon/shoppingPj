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
<body>
비밀번호 수정
<div class="modifyPassword">

        <table class="table">
            <thead>
            <tr>
                <th scope="col" class="form-control form-control-inline text-center">변경하실 비밀번호를 입력해주세요.<br>
                    비밀번호(영문자,숫자,특수문자 조합 최소 8자)
                </th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td><input type="password" id="memPassword"class="form-control form-control-inline text-center" placeholder="현재 비밀번호">
                </td>
            </tr>
            <tr>
                <td><input type="password" id="memPassword1"class="form-control form-control-inline text-center" placeholder="새 비밀번호"></td>
            </tr>
            <tr>
                <td><input type="password" id="memPassword2"class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인"></td>
            </tr>
            <tr>
                <td><p id="passwordCheck"></p></td>
            </tr>
            </tbody>
        </table>
    <button type="button" id="pwUpdate" onclick="sendPwmodify()" class="btn btn-primary" >비밀번호 변경</button>
    <a href="/members/member/modify" class="btn btn-default">취소</a>

</div>

<!-- javascript -->
<script type="text/javascript">

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //비밀번호
    var memPassword = document.querySelector('#memPassword');
    var memPassword1 = document.querySelector('#memPassword1');
    var memPassword2 = document.querySelector('#memPassword2');

    var regPassword =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/; //.test(password)


    //비밀번호 정보 확인
    memPassword1.onblur = function (e) {

        //console.log(regPassword.test(password));

        if(!regPassword.test(memPassword1.value)){

            passwordCheck.innerHTML = "잘못된 비밀번호 형식입니다.(특수문자는 @$!%*#? 중 선택)";

        }else{

            passwordCheck.innerHTML = null;

        }
    }
    //정보수정
    function sendPwmodify() {

        var wrongPassword = !regPassword.test(memPassword1.value);

        if (wrongPassword){
            alert('잘못된 비밀번호 형식입니다.(특수문자는 @$!%*#? 중 선택)');
        }
        else if (memPassword1.value === memPassword2.value) {

            jQuery.ajax({
                "url": "/members/member/modify/modifyPW",
                "type": "POST",
                "contentType": "application/json; charset=utf-8;",
                "data": JSON.stringify({
                    "mem_password": memPassword.value,
                    "mem_password1": memPassword1.value,
                    "mem_password2": memPassword2.value
                }),
                beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                "dataType": "json"
            }).done(function (data) {
                data = JSON.stringify(data);
                jsonData = JSON.parse(data);

                if (jsonData.success) {
                    alert(jsonData.success);
                }
                else {
                    alert(jsonData.error);
                }
            });
        }else if(memPassword1.value == null || memPassword1.value.length == 0){
            alert('변경할 비밀번호를 입력해주세요.');
        }else if(memPassword2.value == null || memPassword2.value.length == 0){
            alert('변경할 비밀번호를 재입력 해주세요.');
        }else {
            alert('변경 비밀번호가 일치하지 않습니다.');
        }
    }
</script>

</body>
</html>
