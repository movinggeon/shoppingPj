<%--
  Created by IntelliJ IDEA.
  User: 3640k
  Date: 2022-03-22
  Time: 오후 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <title>Room</title>
  <style>
    .container{
      width: 500px;
      margin: 0 auto;
      padding: 25px
    }
    .container h1{
        font-family: 'Jua', sans-serif;
      text-align: center;
      padding: 5px 5px 5px 15px;
      color: #C899DB;
      margin-bottom: 20px;
    }
    .roomContainer{
      background-color: white;
      width: 500px;
      height: 500px;
      overflow: auto;
    }
    .roomList{
      border: none;
    }
    .roomList th{
      border: 1px solid #C899DB;
      background-color: #fff;
      color: #C899DB;
    }
    .roomList td{
      border: 1px solid #C899DB;
      background-color: #fff;
      text-align: left;
      color: #C899DB;
    }
    .roomList .num{
        font-family: 'Jua', sans-serif;
      width: 75px;
      text-align: center;
    }
    .roomList .room{
        font-family: 'Jua', sans-serif;
      width: 350px;
        text-align: center;
    }
    .roomList .go{
        font-family: 'Jua', sans-serif;
      width: 71px;
      text-align: center;
    }
    button{
      background-color: #C899DB;
      font-size: 14px;
      color: #000;
      border: 1px solid #000;
      border-radius: 5px;
      padding: 3px;
      margin: 3px;
    }
    .inputte{
        font-family: 'Jua', sans-serif;
        width: 75px;
        text-align: center;
        border:none;
    }
    .inputgo{
        font-family: 'Jua', sans-serif;
        border:none;
        width: 71px;
        text-align: center;
    }

  </style>
</head>

<body>
<div class="container">

<input type="hidden" name="userName" id="userName" readonly value=${user.mem_id}>
<h1>고객 상담 센터</h1>
  <div id="roomContainer" class="roomContainer">
    <table id="roomList" class="roomList">
    <tr><th class='num'>방 번호</th><th class='room'>신청 고객명</th><th class='go'>입장</th></tr>
      <c:forEach var="room" items="${roomList}">


  <form action="/chat/moveChating" method="get">
    <tr>
        <td class='num'>
        <input type="text"  class="inputte" readonly value = "${room.roomNumber}" name = "roomNumber"></td>
        <td class='room'>
          <input type="text" class="inputte" readonly value = "${room.roomName}" name = "roomName"></td>
        <td class='go'>
          <input type="submit" class="inputgo" value=" 입장"></td>
      </tr>
  </form>
</c:forEach>
    </table>
  </div>
</div>



</body>
</html>