<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jhkwa
  Date: 2022-04-07
  Time: 오전 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
.aaa{
margin: 0 auto;
	max-width: 1110px;
	}
.member {
	margin: 0 auto;
	max-width: 1110px;
	height: 60px;
	line-height: 48px;
	justify-content: center;
	text-align: left;
}
.date  {
	margin: 0 auto;
	max-width: 1110px;
	height: 60px;
	line-height: 48px;
	justify-content: center;
	text-align: right;
	
}
.title  {
	margin: 0 auto;
	max-width: 1110px;
	height: 60px;
	padding-left: 20px;
	line-height: 48px;
	justify-content: center;
	text-align: left;
	font-size: 30px;
	color: red;
	
}
.content {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 100px;
	line-height: 48px;
	display: flex;
	font-size: 20px;
}
.topp1 {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 320px;
	line-height: 48px;
	display: flex;
}

.top_nav {
	background-color: #f3f3f3;
	max-width: 1110px;
	display: flex;
}

.topp {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 48px;
	line-height: 48px;
	font-size: 11px;
	color: gray;
	display: flex;
}



</style>
</head>
<body>
<div style="margin-top: 48px"></div>

	<div class="aaa">
		<div class="top_nav">
			<div class="member">작성자: ${boardsVO.mem_id}</div>
			<div class="date">${boardsVO.board_date }</div>
		</div>
		<br>
		<div class="title">${boardsVO.board_title }</div>
		<div class="content">${boardsVO.board_content}</div>
		<hr>
		<div class="topp1">
			<c:forEach var="file" items="${boardsVO.filesVOList}">
				<img src="/resources/static/reviewimg/${file.file_name}" alt="" />
				<br>
			</c:forEach>
		</div>

		<hr>

		<br>
		<c:forEach var="reply" items="${boardsVO.repliesVOList}">
			<div id="rep${reply.reply_id}">
				<span>${reply.mem_id}</span> 
				<span>${reply.reply_date}</span> <br>
				<span id="repContent${reply.reply_id}">
					${reply.reply_content} </span> 
					
					
					<c:set var="memid1" value="${reply.mem_id}" />
					<c:set var="memid2" value="${user.mem_id}" />
					<c:if test="${memid1 eq memid2}">
			 		<span id="${reply.reply_id}" onclick="showEditReply(this.id)">수정</span> 
			 		<span id="${reply.reply_id}" onclick="delReply(this.id)">삭제</span>
					
					<span id="editContainer${reply.reply_id}" style="display: none"> 
					<input type="text" id="editInput${reply.reply_id}">
					<span onclick="hideEditReply('${reply.reply_id}')">x</span>
					<button type="button" onclick="editReply('${reply.reply_id}')">수정</button>
					</span>
					</c:if>
				
				
			</div>
		</c:forEach>
		<div id="repSpace"></div>
		<input type="text" id="reply"> 
		<input type="button" value="댓글 입력" onclick="enterReply()">

	</div>

	<script>
    var rep_id = Number("${rep_id + 1}");
    var mem_id = "${user.mem_id}";
    var board_id = "${boardsVO.board_id}";
    function enterReply() {
        console.log(rep_id);
        console.log(mem_id);
		
        //현재 시간 값 받아오기
        if(confirm('댓글을 입력하시겠습니까?')) { 
        var date = new Date();
        var year = date.getFullYear();
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var day = ('0' + date.getDate()).slice(-2);
        var hours = ('0' + date.getHours()).slice(-2); 
        var minutes = ('0' + date.getMinutes()).slice(-2);
        var seconds = ('0' + date.getSeconds()).slice(-2); 
        
        var timeString = year + '-' + month  + '-' + day +' '+ hours + ':' + minutes  + ':' + seconds;

        
        
        
        
        
        var reply = document.getElementById("reply").value;
        const repSpace = document.getElementById("repSpace");
		
        //const userPic;
        const userId = '<span>' + mem_id + '</span>';
        const repDate = '<span> ' + timeString + ' </span>';
        const edit = '<span id="' + rep_id + '"onclick="showEditReply(this.id)">수정</span>';
        const del = '<span id="' + rep_id + '"onclick="delReply(this.id)">삭제</span> <br>';

        const editInput1 = '<span id = editContainer'+ rep_id +' style="display: none;">';
        const editInput2 = '<input type="text" id=editInput'+ rep_id +'>';
        const editInput3 = '<span onclick="hideEditReply('+rep_id+')"> x </span>';
        const editInput4 = '<button type="button" onclick="editReply('+rep_id+')">수정</button>';
        const editInput5 = '</span>';
		

        const div = document.createElement('div');
        div.id = "rep" + rep_id;

        div.innerHTML = userId + repDate + edit + del + reply + editInput1 + editInput2 + editInput3 + editInput4 + editInput5;

        repSpace.append(div);
        document.getElementById("reply").value = '';
		
        

        //ajax work to insert reply
		$.ajax({
            url: "/replies/insertReply",
            type:"post",
            data:
                {reply_id: rep_id, reply_content: reply, board_id: board_id, mem_id: mem_id},
            dataType: "text",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            	
            },
            success: function(data) {
            	alert("댓글 입력성공");
            },
            error:function(request){
                if(request.status == 403) {
                }else{
                    alert(request.status);
                }
            }
        });
        //ajax success
        rep_id++;

    }else 
    	return 
    	false;}
    
    function showEditReply(id){
        document.getElementById("editContainer"+id).style.display = 'block';
    }
    function hideEditReply(id){
        document.getElementById("editContainer"+id).style.display = 'none';
    }
    function editReply(id){
        console.log(id);
        var editContent = document.getElementById("editInput"+id).value;
        document.getElementById("repContent"+id).innerHTML = editContent;
        
       
      //ajax work to update eidt reply
       $.ajax({
            url: "/replies/updateReply",
            type:"post",
            data:
                {reply_id: id, reply_content: editContent},
            dataType: "text",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            	
            },
            success: function(data) {
            	alert("수정 성공");
            },
            error:function(request){
                if(request.status == 403) {
                }else{
                    alert(request.status);
                }
            }
        });
      
      //ajax success
        document.getElementById("editContainer"+id).style.display = 'none';
        document.getElementById("editInput"+id).value = "";
        
    }
    function delReply(id){
        console.log(id);
        if(confirm('댓글을 삭제하시겠습니까?')) { 
        document.getElementById("rep"+id).remove();
        var replyData = {};
        replyData.repid = id;
        
        //ajax work to delete reply]
        $.ajax({
            url: "/replies/deleteReply",
            type:"post",
            data:	
                JSON.stringify(replyData),
            dataType: "text",
            contentType: "application/json;charset=utf-8",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            	
            },
            success: function(data) {
            },
            error:function(request){
                if(request.status == 403) {
                }else{
                    alert(request.status);
                }
            }
        });
    }else 
    	return 
    	false;}
</script>


</body>
</html>
