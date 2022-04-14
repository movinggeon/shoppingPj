<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <link rel="stylesheet" href="/resources/static/css/admin/index.css" type="text/css">
  <script src="${pageContext.request.contextPath}/resources/static/js/jquery-3.1.1.min.js"></script>
  <title>Insert title here</title>
  <script type="text/javascript">
    $(document).ready(function(){
      $("#memberList").click(function(){
        $(".context").load("/admin/nofragment/memberList?page=1");
      });
      $("#createCoupon").click(function(){
        $(".context").load("/admin/nofragment/createCoupon");
      });
      $("#deleteCoupon").click(function(){
        $(".context").load("/admin/nofragment/couponList?name=delete&page=1"); // name=delete&
      });
    });
  </script>
</head>
<body>
<div style="margin-top: 50px"></div>
<div class="divTable minimalistBlack">
  <div class="divTableHeading">
    <div class="divTableRow">
      <div class="divTableHead">회원관리</div>
      <div class="divTableHead">결제 및 주문</div>
      <div class="divTableHead">쿠폰 및 이벤트</div>
      <div class="divTableHead">고객 상담</div>
    </div>
  </div>
  <div class="divTableBody">
    <div class="divTableRow">
      <div class="divTableCell" id="memberList"><p>회원목록</p> </div>
      <div class="divTableCell" id="payList"><p>결제목록</p></div>
      <div class="divTableCell" id="createCoupon"><p>쿠폰생성</p></div>
      <div class="divTableCell" id="service" style=" cursor: pointer;" onclick="location.href='/chat/admin/room';" ><p>1:1상담</p></div>
    </div>
    <div class="divTableRow">
      <div class="divTableCell" id="sendCoupon"></div>
      <div class="divTableCell"></div>
      <div class="divTableCell" id="deleteCoupon"><p>쿠폰삭제</p></div>
      <%-- <div class="divTableCell" id="createProduct"><p>제품등록</p></div>--%>
    </div>
    <div class="divTableRow">
      <div class="divTableCell"></div>
      <div class="divTableCell"></div>
      <div class="divTableCell" id="createEvent"><p><a href="/boards/eventinsertView">이벤트생성</a></p></div>
      <div class="divTableCell"></div>
    </div>
  </div>
</div>

<div class="context"></div>
</body>
</html>