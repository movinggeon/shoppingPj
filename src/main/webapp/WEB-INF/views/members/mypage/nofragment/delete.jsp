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
    }.deleteMem_form {
         width: 50%;
         border-collapse: collapse;
         text-align: center;
         margin : auto;
     }
    .deleteMem_form tbody th {
        width: 120px;
        font-weight: bold;
        vertical-align: middle;
        /*border-bottom: 1px solid #ccc ;*/

    }
    .deleteMem_form td {
        width: 350px;
        height: 45px;
        vertical-align: middle;
        /*border-bottom: 1px solid #ccc ;*/
    }
    .deleteMem_form tbody {
        font-weight: bold;
        vertical-align: top;
        border-top: 2px solid #000000;
        border-bottom: 1px solid #ccc;
    }.input_deleteMem {
         width: 500px;
         height: 32px;
         font-size: 15px;
         border: 0;
         border-radius: 15px;
         outline: none;
         padding-left: 10px;
         background-color: rgb(233, 233, 233);
         text-align: center;
     }.btn_box{
        width: 50%;
        margin :auto;
     }.margin_top{
          height: 100px;

      }.margin_bottom{
           height: 200px;

       }.btn_deleteMem {
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
<%--<h2>????????????</h2>--%>
<div class = "delete">
    <div class="margin_top">
    </div>
<table class="deleteMem_form">
    <thead>
    <tr>
        <th scope="col" >?????????????????? ?????? ??????????????? ??????????????????</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><input type="password" class="input_deleteMem" id="memPassword" placeholder="?????? ????????????">
        </td>
    </tr>
    <tr>
        <td><input type="password" class="input_deleteMem" id="passwordReEnter" placeholder="???????????? ??????">
        </td>
    </tr>
    </tbody>
</table>
    <div class="btn_box">
        <button type="button" class="btn_cancel" onclick="location.href='/members/member/modify'">??????</button>
        <button type="button" class="btn_deleteMem" id="pwUpdate" onclick="DeleteMem()" >????????????</button>
    </div>
    <div class="margin_bottom">
    </div>
        </div>
    </div>
</div>

<!-- javascript -->
<script type="text/javascript">

    //csrf ????????? ??????
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    //????????????
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
                {   /*???????????? ???????????? ?????? ????????? csrf?????? ????????????*/
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
            alert('?????? ??????????????? ??????????????????.');
        }else if(passwordReEnter.value == null || passwordReEnter.value.length == 0){
            alert('?????? ??????????????? ?????? ?????? ????????????.');
        }else {
            alert('????????? ??????????????? ?????? ???????????? ????????????.');
        }
    }
</script>


</body>
</html>