<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<c:set var="path" value="${pageContext.request.contextPath}"/>--%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/chat.css" />
    <meta charset="UTF-8">
    <title>Chating</title>
</head>

<body>
<div id="container" class="container">
    <h1>${roomName}의 채팅방</h1>
    <input type="hidden" id="sessionId" value="">
    <input type="hidden" id="roomNumber" value="${roomNumber}">
    <input type="hidden" name="userName" id="userName" readonly value=${user.mem_id}>

    <div id="chating" class="chating">
    </div>

    <div id="yourMsg">
        <table>
              <tr>
                <th><input id="chatting"class="inputmessage"  placeholder="보내실 메시지를 입력하세요." value = ""></th>
                <th><button onclick="senChat()" id="sendBtn" class="sendBtn"></button></th>
              </tr>
        </table>
    </div>
    <br>
    <div class="file_input">
        <table>
        <tr>
        <th><input type="text" readonly="readonly" id="file_route"></th>
        <th><label>
            <input type="file" id="fileUpload" class="fileUpload"  onchange="javascript:document.getElementById('file_route').value=this.value">
        </label></th>
        </tr>
        </table>
    </div>
</div>
    </div>

<script>
    ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
    wsEvt();
    console.log(sessionStorage.getItem("mem_id"));
    var fileSessionId = -1;
    function wsEvt() {

        ws.onopen = function(data){
            chatName();
        }

        ws.onmessage = function(data) {
            //메시지를 받으면 동작
            var msg = data.data;

            if(msg != null && msg.type != ''){
                //파일 업로드가 아닌 경우 메시지를 뿌려준다.
                var d = JSON.parse(msg);
                /*console.log(typeof (msg));*/
                canchat= d.canchat;
                if(canchat == 1){
                    $("#chating").append("<div class='wait'>=====상담사가 연결되었습니다=====</div>")
                }
                if(d.type == "getId"){
                    var si = d.sessionId != null ? d.sessionId : "";
                    if(si != ''){
                        $("#sessionId").val(si);
                        SettingSessionId(si);
                    }
                }else if(d.type == "message"){
                    	
                    	var resultMsg = "";
                    	var count = 0;
                    	
                    	if(d.msg.length > 14){
                    		for(var i = 0; i < d.msg.length; i+=13){
                    			var length = 13;
                    			resultMsg += '<p style="margin:7px;">' + d.msg.substr(i,length) + "</p>";
                    			count++;
                    		}
                    		d.msg = resultMsg;
                    	}
                    	
                    if(d.sessionId == $("#sessionId").val()){
                        $("#chating").append("<div class='chat_box' style='height:"+ 30 * count + "px;'><div class='me'>" + d.msg + " </div></div>");
                        
                    }else{
                        $("#chating").append("<div class='chat_box' style='height:"+ 30 * count + "px; min-height: 40px;'><div class='others'>" + d.msg + "</div></div>");
                    }
                }else if(d.type == "file"){
                    fileSessionId = d.sessionId;
                }else{
                    console.warn("unknown type!")
                }
            }else{
                //파일 업로드한 경우 업로드한 파일을 채팅방에 뿌려준다.
                var url = URL.createObjectURL(new Blob([msg]));
				
                if(fileSessionId == $("#sessionId").val()){
                    $("#chating").append("<div class='myimg'><img class='msgImg' src="+url+"></div><div class='clearBoth'></div>");
                }else{
                	console.log(fileSessionId);
                    $("#chating").append("<div class='yourimg'><img class='msgImg' src="+url+"></div><div class='clearBoth'></div>");
                }
                fileSessionId = -1;

            }
        }

        document.addEventListener("keypress", function(e){
            if(e.keyCode == 13){ //enter press
                senChat();
            }
        });
    }

    function SettingSessionId(sId){
        $.ajax({
            url: "updateRoom",
            type:"post",
            data:{
                sId:sId
            },
            dataType: "text",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                //alert("성공");
            },
            error: function() {
                alert("error");
            }
        });
    }

    function chatName(){
        var userName = $("#userName").val();

        if(userName == null || userName.trim() == ""){
            alert("로그인후사용.");
            $("#userName").focus();
        }else{
            $("#chating").append("<div class='wait'>=====연결될때까지 잠시만 기다려 주세요=====</div>");
        }
    }
    function SettingSessionId(sId){
        $.ajax({
            url:"/chat/updateroom",
            type:"post",
            data:{
                sId:sId
            },
            dataType:"text",
            beforeSend :function(xhr)
            {
                xhr.setRequestHeader(header,token);
            },
            success: function(data){
            },
            error:function(){
                alert("error");
            }
        });
    }

    function senChat(){
        var file =  $('#fileUpload').val();
        var msg = $("#chatting").val();

        if(msg == "" && file == ""){
            alert("값을 입력해주세요");
            return;
        }

        if ((file != "" && msg != "")){
            console.log("두개 같이");
            send();
            fileSend();
        }else if ((file == "" && msg != "")){
            console.log("문자만");
            send();
        }else if((file != "" && msg == "")){
            console.log("파일만");
            fileSend();
        }
    }

    function send() {

        if (canchat == 0) {
            $("#chating").append("<div class='wait'>=====아직 연결되지 않았습니다. 잠시만 기다려주세요=====</div>");
        } else {
            var option = {
                type: "message",
                roomNumber: $("#roomNumber").val(),
                sessionId: $("#sessionId").val(),
                userName: $("#userName").val(),
                roomName: $("#roomName").val(),
                msg: $("#chatting").val()
            }
            ws.send(JSON.stringify(option))
            $('#chatting').val("");
        }
    }
    function fileSend() {

        if(canchat == 0){
            $("#chating").append("<div class='wait'>=====아직 연결되지 않았습니다. 잠시만 기다려주세요=====</div>");
        }else{
            var file =  document.querySelector("#fileUpload").files[0];
            var fileReader = new FileReader();
            fileReader.onload = function () {
                var param = {
                    type: "fileUpload",
                    file: file,
                    roomNumber: $("#roomNumber").val(),
                    sessionId: $("#sessionId").val(),
                    msg: $("#chatting").val(),
                    roomName: $("#roomName").val(),
                    userName: $("#userName").val()
                }

                ws.send(JSON.stringify(param)); //파일 보내기전 메시지를 보내서 파일을 보냄을 명시한다.

                arrayBuffer = this.result;
                ws.send(arrayBuffer); //파일 소켓 전송
            };
            fileReader.readAsArrayBuffer(file);
        }
        $('#fileUpload').val("");
        $('#file_route').val("");
    }


</script>

</body>
</html>