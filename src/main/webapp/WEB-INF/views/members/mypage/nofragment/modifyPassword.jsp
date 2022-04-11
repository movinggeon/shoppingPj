<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
    <%--<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
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
    @font-face {
        font-family: "BBTreeGR";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
        format("woff");
        font-weight: normal;
        font-style: normal;
    }
    .m_box {
        width: 100%;
    }

    .m_content {
        margin: 0 auto;
        max-width: 1110px;
        text-align: left;
        padding-left: 20px;
        height: auto;
        /*line-height: 48px;*/
        font-size: 14px;
    }

    .modify_password_form {
        width: 50%;
        border-collapse: collapse;
        text-align: center;
        margin : auto;
    }
    .modify_password_form tbody th {
        width: 120px;
        font-weight: bold;
        vertical-align: middle;
        /*border-bottom: 1px solid #ccc ;*/

    }
    .modify_password_form td {
        width: 350px;
        height: 45px;
        vertical-align: middle;
        /*border-bottom: 1px solid #ccc ;*/
    }
    .modify_password_form tbody {
        font-weight: bold;
        vertical-align: top;
        border-top: 2px solid #000000;
        border-bottom: 1px solid #ccc;
    }
    .input_modify_password {
        width: 500px;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
        text-align: center;
    }
    .button_box{
        width: 50%;
        margin: auto;
    }
    .margin_top{
        height: 100px;

    }.margin_bottom{
        height: 200px;

     }.btn_password_modify {
         width : 100px;
         height : 35px;
         border-radius: 8px;
         background-color: #0071E3;
         color : white;
         border: 1px solid #ddd;
         padding: 5px 5px;
         cursor: pointer;
         float: right;
     }.btn_cancel {
          width: 70px;
          height : 35px;
          border-radius: 8px;
          background-color: #ababab;
          border: 1px solid #ddd;
          color : white;
          padding: 5px 5px;
          cursor: pointer;
          float: right;
      }
</style>
<div class="m_box">
    <div class="m_content">
        <%--<h2>비밀번호 수정</h2>--%>
        <div class="margin_top">

        </div>
        <div class="modifyPassword">

            <table class="modify_password_form">
                <thead>
                <tr>
                    <th scope="col">변경하실 비밀번호를 입력해주세요.<br>
                        비밀번호(영문자,숫자,특수문자 조합 최소 8자)
                    </th>
                </tr>
                </thead>
                <tbody>
        <tr>
            <td><p></p></td>
        </tr>

        <tr>
            <td><input type="password" id="memPassword" class="input_modify_password" placeholder="현재 비밀번호">
            </td>
        </tr>
        <tr>
            <td><input type="password" id="memPassword1" class="input_modify_password" placeholder="새 비밀번호"></td>
        </tr>
        <tr>
            <td><input type="password" id="memPassword2" class="input_modify_password" placeholder="새 비밀번호 확인">

        </tr>
        <tr>
            <td><p id="passwordCheck"></p></td>
        </tr>
        </tbody>
    </table>
    <div class="button_box">
        <button type="button" id="pwUpdate" class="btn_password_modify" onclick="sendPwmodify()" class="btn btn-primary" >비밀번호 변경</button>
    </div>
            <div class="margin_bottom">

            </div>
</div>
</div>
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
        if (memPassword.value.length == 0){
            alert('현재 비밀번호를 입력해주세요');
        }
        else if (wrongPassword){
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