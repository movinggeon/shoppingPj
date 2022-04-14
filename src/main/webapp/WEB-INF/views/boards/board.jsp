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

		.topp1 img1 {
			width: 520px;
		}

		.review_box {
			width: 100%;
		}

		.review {
			margin: 0 auto;
			max-width: 1110px;
			text-align: left;
			padding: 0 2%;
			height: 48px;
			line-height: 48px;
			font-size: 13px;
		}
		.rev_write {
			padding-left: 8px;
			margin: 30px 0 10px 0;
			line-height: 20px;
		}
		.rev_top {
			position: relative;
			max-width: 1090px;
		}
		.all_content{
			width : 55%;
			margin: 5% auto auto;
		}
		.content_top{
			width :100%;
			margin :auto;
			height: 40px;
			line-height: 40px;
			display: flex;
			border-bottom: 1px solid #ccc;
		}
		.member {
			width: 45%;
			margin: auto;
			justify-content: center;
		}
		.date  {
			width: 45%;
			margin:auto;
			text-align: right;
		}
		.button_box{
			width : 10%;
			margin:auto;
			text-align: center;
		}
		.main_content{
			width :100%;
			margin : auto;
			display : flex;
			border-bottom: 2px solid #000000;
		}
		.title  {
			margin: auto;
			width: 100%;
			height: 48px;
			line-height: 48px;
			justify-content: center;
			text-align: left;
			/*border-bottom: 1px solid #ccc;*/
			border-bottom: 2px solid #000000;
		}
		.main_image{
			width: 50%;
			height : 400px;
			margin : auto;
			border-right : 1px solid #ccc;
		}
		.main_image img{
			padding-top: 25px;
			display: block;
			width: 95%;
			height: 350px;
			margin:0 auto;
		}
		.main_content1{
			width:50%;
			height : 400px;
			margin : auto;
		}
		.main_content2{
			width:95%;
			height : 380px;
			margin: 10px auto;
		}
		.review_box{
			width : 100%;
			margin : auto;
			/*border-top : 2px solid #000000;*/
			/*border-bottom : 1px solid #ccc;*/
		}
		.review_title{
			width: 100%;
			margin : auto;
			/*border-bottom : 1px solid #ccc;*/
		}
		.input_reply{
			width: 200px;
			height: 30px;
			border-radius: 15px;
			padding-left: 10px;
			/*background-color: #E8F0FE;*/
			text-align: center;
		}
		.btn_reply{
			width : 80px;
			height : 30px;
			border-radius: 8px;
			background-color: #0071E3;
			color : white;
			border: 1px solid #ddd;
			padding: 5px 5px;
			cursor: pointer;
		}
		.span_reply{
			width : 70px;
			border-radius: 8px;
			border: 1px solid #ddd;
			cursor: pointer;
		}
		.btn_modify{
			width : 50px;
			height : 30px;
			font-size : 12px;
			border-radius: 8px;
			background-color: #ddd;
			border : 0;
			cursor: pointer;

		}
	</style>
</head>
<body>

<div class="all_content">
	<div class="title">
		제목 : ${boardsVO.board_title }
	</div>
	<div class="content_top">
		<div class="member">작성자: ${boardsVO.mem_id}</div>
		<div class="date">${boardsVO.board_date }</div>
		<div class="button_box">
		<c:if test="${boardsVO.mem_id eq user.mem_id}">
			<form action="/boards/insertView" method="post">
				<input type="hidden" id="title" name="title" value="${boardsVO.board_title }">
				<input type="hidden" id="content" name="content" value="${boardsVO.board_content }">
				<input type="hidden" id="board_id" name="board_id" value="${boardsVO.board_id}">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn_modify" type="submit">수정</button>
			</form>
		</c:if>
		</div>
	</div>



	<div class="main_content">
		<c:forEach var="file" items="${boardsVO.filesVOList}">
			<div class="main_image">
				<img src="/resources/static/reviewimg/${file.file_name}" alt="" />
			</div>
		</c:forEach>
		<div class="main_content1">
			<div class="main_content2">
				${boardsVO.board_content}
			</div>
		</div>
	</div>

	<div style="margin-top: 48px"></div>
	<div class="review_box">
		<div class="review_title">
			댓글
		</div>
		<c:forEach var="reply" items="${boardsVO.repliesVOList}">
			<div class="rev_write">
				<div id="rep${reply.reply_id}">
					<span>${reply.mem_id}</span> <span>${reply.reply_date}</span> <br>
					<span id="repContent${reply.reply_id}">
							${reply.reply_content} </span>

					<!-- 처리 -->
					<c:set var="memid1" value="${reply.mem_id}" />
					<c:set var="memid2" value="${user.mem_id}" />
					<c:if test="${memid1 eq memid2}">
						<span class="span_reply" onclick="showEditReply('${reply.reply_id}')">수정</span>
						<span class="span_reply" onclick="delReply('${reply.reply_id}')">삭제</span>
						<span id="editContainer${reply.reply_id}" style="display: none">
                        <input type="text" class="input_reply" id="editInput${reply.reply_id}">
                        <button type="button" class="btn_modify" onclick="editReply('${reply.reply_id}')">수정</button>
                        <span onclick="hideEditReply('${reply.reply_id}')">x</span>
                     </span>
					</c:if>

				</div>
			</div>
		</c:forEach>
	</div>

	<div class="rev_all">
		<div class="rev_write" id="repSpace">
		</div>
	</div>
	<input type="text" id="reply" class="input_reply">
	<input type="button" class="btn_reply" value="댓글 입력" onclick="enterReply()">

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

			div.innerHTML = userId + repDate + edit + del +
					"<span id=repContent" + rep_id  + ">"+ reply + "</span>"  + editInput1 + editInput2 +
					editInput3 + editInput4 + editInput5;

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