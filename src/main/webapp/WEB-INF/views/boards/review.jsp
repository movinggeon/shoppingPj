<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
element.style {
	
}

.review_board {
	width: 100%;
	float: left;
}

* {
	margin: 0;
	padding: 0;
	list-style: none;
	border: 0;
	text-decoration: none;
	font-family: "NanumBarunGothic", "Malgun Gothic", sans-serif;
	letter-spacing: -0.03em;
}

div {
	display: block;
}

.review_board ul {
	width: 955px;
	float: left;
	margin-top: 30px;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.review_board ul li {
	width: 292px;
	height: 237px;
	float: left;
	border: 1px solid #e3e3e3;
	margin-right: 24px;
	margin-bottom: 30px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.review_list_wrap {
	width: 285px;
	height: 231px;
	margin: 3px auto;
}

dl {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.review_list_wrap dl dt {
	width: 100%;
	float: left;
	height: 120px;
	position: relative;
	overflow: hidden;
}

.review_list_wrap dl dd {
	width: 100%;
	float: left;
}
</style>
</head>
<body>
	리뷰게시판ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	<div class="review_board">
		<ul style="margin-top: 276px">
			<c:forEach items="${reviewboardlist}" var="review" begin="0" end="5">
				<li>

					<div class="review_list_wrap">

						<dl>
							<dt>
								<a href="/boards/readView?board_id=${review.board_id}"><c:out value="${review.board_content}" /></a>
							</dt>
							<dd>
								<a href="#"><c:out value="${review.board_title}" /> </a>
							</dd>
							<dd>
								<c:out value="${review.spec_id}" />
								~
								<c:out value="${review.board_rate}" />
							</dd>
						</dl>

					</div>

				</li>
			</c:forEach>

		</ul>
	</div>
	<c:set var="memid" value="${user.mem_id}"/>
	<c:if test="${not empty memid}">
	<a href="/boards/insertView">리뷰글쓰기</a>
	</c:if> 

</body>
</html>