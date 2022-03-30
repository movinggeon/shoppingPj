<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이벤트 글 작성하기</h1>

<form action="/boards/reviewinsert" method="get">
	<div>
		<label>작성자</label>
		<input type ="hidden" name="mem_id" value="${user.mem_id}"> ${user.mem_id}
		 <label>스펙</label>
		<input type ="text" name="spec_id"> 
			<label>모델</label>
		<input type ="text" name="model_id">
		<label>rate</label>
		<input type ="text" name="board_rate">
			<label>제목</label>
		<input type ="text" name="board_title">
		<label>내용</label>
		<input type ="text" name="board_content">
		<input type ="hidden" name="board_type" value="review">
		
	</div>

<button type="button" >취소</button>
<button type="submit" >등록</button>
</form>
</body>
</html>