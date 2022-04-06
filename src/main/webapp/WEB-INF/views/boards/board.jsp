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
</head>
<body>
제목: ${boardsVO.board_title} <br>
내용: ${boardsVO.board_content}

<hr>

파일들:
<c:forEach var="file" items="${boardsVO.filesVOList}">
    ${file.file_name} <br>
</c:forEach>


<hr>

댓글<br>
<c:forEach var="reply" items="${boardsVO.repliesVOList}">
    <div id = "rep${reply.reply_id}">
        <span>${reply.mem_id}</span>
        <span>${reply.reply_date}</span>
        <span id="${reply.reply_id}" onclick="showEditReply(this.id)">수정</span>
        <span id="${reply.reply_id}" onclick="delReply(this.id)">삭제</span><br>
        <span id="repContent${reply.reply_id}">
        ${reply.reply_content}
        </span>

        <span id="editContainer${reply.reply_id}" style="display: none">
            <input type="text" id="editInput${reply.reply_id}">
            <span onclick="hideEditReply('${reply.reply_id}')">x</span>
            <button type="button" onclick="editReply('${reply.reply_id}')">수정</button>
        </span>
    </div>
</c:forEach>
<div id="repSpace">
</div>
<input type="text" id ="reply">
<input type="button" value="댓글 입력" onclick="enterReply()">

<script>
    var rep_id = Number("${rep_id + 1}");
    var mem_id = "${user.mem_id}";
    function enterReply() {
        console.log(rep_id);
        console.log(mem_id);

        //현재 시간 값 받아오기
        var date = 'yyyy-mm-dd hh:mm:ss';

        var reply = "<span id='repContent"+rep_id+"'>" + document.getElementById("reply").value + "</span>";
        const repSpace = document.getElementById("repSpace");

        //const userPic;
        const userId = '<span>' + mem_id + '</span>';
        const repDate = '<span>' + date + '</span>';
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

        //ajax success
        rep_id++;

    }
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

        //ajax success
        document.getElementById("editContainer"+id).style.display = 'none';
        document.getElementById("editInput"+id).value = "";
    }
    function delReply(id){
        console.log(id);

        document.getElementById("rep"+id).remove();

        //ajax work to delete reply
    }
</script>


</body>
</html>
