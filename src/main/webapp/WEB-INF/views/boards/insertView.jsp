<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	@font-face {
		font-family: "BBTreeGR";
		src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff")
		format("woff");
		font-weight: normal;
		font-style: normal;
	}
	.insertwrap{
		text-align: center;
		width: 35%;
		margin: auto auto;
	}
	.insert{
		font-size: 15px;
		width: 375px;
		margin: auto;
		text-align: left;
	}

</style>
<body>
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
	<div>
		<label>작성자</label>
		<input type ="hidden" name="mem_id" value="${user.mem_id}"> ${user.mem_id}
		<label>별점</label>
		<input type ="checkbox" name="board_rate" value="1" onclick="oneCheck(this);">☆☆☆☆★
		<input type ="checkbox" name="board_rate" value="2" onclick="oneCheck(this);">☆☆☆★★
		<input type ="checkbox" name="board_rate" value="3" onclick="oneCheck(this);">☆☆★★★
		<input type ="checkbox" name="board_rate" value="4" onclick="oneCheck(this);">☆★★★★
		<input type ="checkbox" name="board_rate" value="5" onclick="oneCheck(this);">★★★★★
		<br>
		<label>제목</label>
		<input type ="text" name="board_title">
		<br>
		<label>내용</label>
		<input type ="text" name="board_content">
		<input multiple="multiple" type ="file" name="file_name2">
		<input type ="hidden" name="board_type" value="review">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</div>

<button type="button" >취소</button>
<button type="submit" >등록</button>
</form>
</div>
</body>
</html>