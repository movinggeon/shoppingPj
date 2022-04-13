<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/insertView.css" type="text/css">
	<script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
	<title>Insert title here</title>
</head>
<style>

</style>
<body>
<div style="margin-top: 70px"></div>
<div class="insertwrap">
<h1>리뷰 작성하기</h1>
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
<form action="/boards/reviewinsert" method="post" enctype="multipart/form-data">
	<div class="insertview">
		<label>작성자</label>
		<input type ="text" name="mem_id" class="input_review" value="${user.mem_id}" readonly>
		<br>
		<label>별점</label>

		<input type ="checkbox" name="board_rate"  id="board_rate1" value="1" onclick="oneCheck(this);"><label for="board_rate1"></label>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>

		<input type ="checkbox" name="board_rate" id="board_rate2" value="2" onclick="oneCheck(this);"><label for="board_rate2"></label>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>

		<input type ="checkbox" name="board_rate" id="board_rate3" value="3" onclick="oneCheck(this);"><label for="board_rate3"></label>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>

		<input type ="checkbox" name="board_rate" id="board_rate4" value="4" onclick="oneCheck(this);"><label for="board_rate4"></label>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>

		<input type ="checkbox" name="board_rate" id="board_rate5" value="5" onclick="oneCheck(this);"><label for="board_rate5"></label>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<span class="iconify" data-icon="ant-design:star-filled" ></span>
		<br>
		<label>제목</label>
		<input type ="text" name="board_title"  class="input_review" value="${param.title }" autocomplete="false">
		<br>
		<label>내용</label>
		<input type ="text" name="board_content" style="height: 300px" class="input_review" value="${param.content }" autocomplete="false">
		<br>
		<br>
		<br>
		<div class="file_input">
			<input type="text" readonly="readonly" id="file_route">
			<label>
			<input multiple="multiple" type="file" name="file_name2" id="fileUpload" class="fileUpload"  onchange="javascript:document.getElementById('file_route').value=this.value"> </label>
			<%--<input multiple="multiple" type ="file" >--%></div>
		<input type ="hidden" name="board_type"  class="input_review" value="review">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<input type ="hidden" name="spec_id" value="${specVO.spec_id}">
		<input type ="hidden" name="model_id" value="${specVO.model_id}">

		<c:if test="${param.board_id > 0 }">
			<input type="hidden" id="board_id" name="board_id" value="${param.board_id}">
		</c:if>
		<c:if test="${param.board_id == null}">
			<input type="hidden" id="board_id" name="board_id" value="0">
		</c:if>




	</div>
		<br>
		<br>
	<button type="button" class="choose_btn" >취소</button>
	<button type="submit" class="choose_btn">등록</button>

</form>
</div>
</body>
</html>