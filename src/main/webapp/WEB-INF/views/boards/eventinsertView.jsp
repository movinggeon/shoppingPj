<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1,#datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
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
.top_nav {
	background-color: #f3f3f3;
	width: 100%;
}
.container {
	display: grid;
	grid-auto-rows: minmax(10%, auto);
	grid-template-columns: 1fr 6fr;
	border-left: 1px solid #ebebeb;
	border-top: 1px solid #ebebeb;
}


.input_st {
	max-width: 233px;
	min-width: 230px;
	padding: 5px;
	border: 1px solid rgb(206, 204, 204);
}
.input_date {
	width: 200px;
	padding: 5px;
	border: 1px solid rgb(206, 204, 204);
}
.container input:focus {
	outline: 2px solid #0071e3;
}

.container button {
	padding: 5px 7px;
	border: 0;
	border-radius: 10px;
	background-color: #0071e3;
	color: white;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
}

.join_btn {
	padding: 8px 15px;
	border: 2px solid #0071e3;
	border-radius: 20px;
	background-color: white;
	color: #0071e3;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}

.item {
	min-height: 60px;
	border-bottom: 1px solid #ebebeb;
	border-right: 1px solid #ebebeb;
}

.item:nth-child(odd) {
	background-color: #f8f8f8;
	min-width: 90px;
	vertical-align: middle;
	line-height: 60px;
	padding-left: 15px;
	font-size: 14px;
	font-weight: bold;
}
.item:nth-child(even) {
	background-color: white;
	vertical-align: middle;
	line-height: 60px;
	padding-left: 20px;
}
/*.item > select {
	margin-right: 8px;
}*/
.item-1 {
	min-height: 40px;
	border-bottom: 1px solid #ebebeb;
	border-right: 1px solid #ebebeb;
}
.item-1:nth-child(odd) {
	background-color: #f8f8f8;
	min-width: 90px;
	vertical-align: middle;
	line-height: 60px;
	padding-left: 15px;
	font-size: 14px;
	font-weight: bold;
}
.item-1:nth-child(even) {
	background-color: white;
	vertical-align: middle;
	line-height: 60px;
	padding-left: 20px;
}

.m_box {
	width: 100%;
}
.m_content {
	margin: 50px auto;
	max-width: 1110px;
	padding:0 1.6%;
}
.m_box hr {
	height: 10px;
	border: 0;
	box-shadow: 0 5px 5px -5px #bbb inset;
}

</style>


<%--<div style="margin-top: 48px"></div>--%>
		<div class="top_nav">
			<div class="topp">이벤트 > Event</div>
		</div>

<form action="/boards/eventinsert" method="post" enctype="multipart/form-data">


		<input type ="hidden" name="mem_id" value="${user.mem_id}">
		<div class="m_box">
			<div class="m_content">
				<h3>이벤트 글 작성하기</h3>
		<div class="container">
			<div class="item" style="padding-top:5px;">제목</div>
			<div class="item" style="display: flex; flex-direction: column; justify-content: center;padding-top:10px;">
		<%--<label>제목</label>--%>
				<input type ="text" class="input_st" name="board_title" placeholder="제목"></div>

			<div class="item">메인사진</div>
			<div class="item" style="display: flex; flex-direction: column;justify-content: center;height:70px;">
			<input type ="file" name="board_titleimg2">
			</div>

			<div class="item">내용사진</div>
			<div class="item" style="display: flex; flex-direction: column;justify-content: center;height:70px;">
			<input type ="file" name="board_content2">
			</div>

		<input type ="hidden" name="board_type" value="event">

		<div class="item-1" style="background-color: #f8f8f8">시작날짜</div>
		<div class="item-1" style="line-height: 40px; background-color: white">

		<input type="text" class="input_date" id="datepicker1" name="s_date" readonly></div>

		<div class="item-1" style="background-color: #f8f8f8">종료날짜</div>
		<div class="item-1" style="line-height: 40px; background-color: white">

        <input type="text"  class="input_date"id="datepicker2" name="e_date" readonly> </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	</div>
		</div>
			</div>



	<div class="join_btn_box" style="text-align: center; margin-top: 25px">
<button type="button" class="join_btn" >취소</button>
<button type="submit" class="join_btn" >등록</button>
	</div>
</form>
</div>
</body>
</html>