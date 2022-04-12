<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>리뷰 작성하기</h1>

<form action="/boards/reviewinsert" method="post" enctype="multipart/form-data">
	<div>
		<label>작성자</label>
		<input type ="hidden" name="mem_id" value="${user.mem_id}"> ${user.mem_id}
		<br>
		<label>스펙</label>
		<input type ="text" name="spec_id" value="${boardsVO.spec_id }">
		<br>
		<label>모델</label>
		<input type ="text" name="model_id" value="${boardsVO.model_id }">
		<br>
		<label>별점</label>
		<input type ="checkbox" name="board_rate" value="1" onclick="oneCheck(this);">☆☆☆☆★
		<input type ="checkbox" name="board_rate" value="2" onclick="oneCheck(this);">☆☆☆★★
		<input type ="checkbox" name="board_rate" value="3" onclick="oneCheck(this);">☆☆★★★
		<input type ="checkbox" name="board_rate" value="4" onclick="oneCheck(this);">☆★★★★
		<input type ="checkbox" name="board_rate" value="5" onclick="oneCheck(this);">★★★★★
		<br>
		<label>제목</label>
		<input type ="text" name="board_title" value="${param.title }">
		<br>
		<label>내용</label>
			<input type ="text" name="board_content" value="${param.content }">
		<input multiple="multiple" type ="file" name="file_name2">
		<input type ="hidden" name="board_type" value="review">
		<c:if test="${param.board_id > 0 }">
			<input type="hidden" id="board_id" name="board_id" value="${param.board_id}">
		</c:if>
		<c:if test="${param.board_id == null}">
			<input type="hidden" id="board_id" name="board_id" value="0">
		</c:if>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</div>

<button type="button" >취소</button>
<button type="submit" >등록</button>

<script >
	function oneCheck(chk){
	    var obj = document.getElementsByName("board_rate");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
</script>
</form>
</body>
</html>