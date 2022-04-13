<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
            src="https://kit.fontawesome.com/6da1745729.js"
            crossorigin="anonymous"
    ></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://code.iconify.design/2/2.2.0/iconify.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/footer.css" />
    <script src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/header.js" defer></script>
    <title>SMARTDC</title>
    <% String model_id = request.getParameter("model_id"); %>
    <% List<String> modelIdList = (List)request.getAttribute("modelIdList"); %>
    <% boolean likeState = false; %>
    <% if( modelIdList != null && modelIdList.contains(model_id)){%>
    <% 		likeState = true;%>
    <% }%>
</head>
<body>
<style>
    .container {
        box-sizing: border-box;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(480px, 1fr));
        margin: 30px auto;
        max-width: 1110px;
    }
    .product_item {
        padding: 0 8px;
        padding-left: 9px;
        min-width: 400px;
        height: 600px;
        margin: 0 auto;
    }

    .product_item img {
        padding-top: 8px;
        display: block;
        width: 100%;
        height: 590px;
        margin: 0 auto;
        object-fit: cover;
        border-radius: 10px;
    }

    .product_item p {
        text-align: center;
    }

    .product_item button {
        display: block;
        margin: auto;
        color: white;
        border: 0;
        border-radius: 5px;
        padding: 3px 8px;
        font-size: 12px;
        cursor: pointer;
    }
    .ck_box {
        display: flex;
        width: 430px;
    }
    .ck_v {
        width: 220px;
        height: 100px;
        border: solid 1px #d2d2d7;
        border-radius: 10px;
        line-height: 100px;
        text-align: center;
        margin-bottom: 10px;
    }

    .ck_box .ck_v:nth-child(1) {
        margin-right: 10px;
    }

    .product_item p,
    hr {
        text-align: left;
        padding-left: 2px;
    }
    .product_item_2 {
        padding-left: 35px;
        overflow-y: scroll;
    }
    .product_item_2::-webkit-scrollbar {
        display: none;
    }
    .ck_v:hover {
        border: 1px solid #86868b;
    }
    .check {
        border: 1px solid #306fdb;
    }

    .produc_hr {
        margin-top: 12px;
        width: 430px;
        display: inline-block;
        text-align: left;
        border: solid 1px #ebebeb;
    }
    .basketc_btn {
        width: 370px;
        padding: 10px 0;
        border-radius: 10px;
        background-color: #306fdb;
        font-weight: bold;
        border: 0;
    }
    .bill_box {
        background-color: #fbfbfd;
        padding: 5px;
        box-sizing: border-box;
        width: 420px;
    }
    .bill_ck {
        width: 330px;
        padding-left: 28px;
        font-size: 15px;
    }

    .top_nav {
        background-color: #f3f3f3;
        width: 100%;
    }

    .topp {
        margin: 0 auto;
        max-width: 1110px;
        text-align: left;
        padding-left: 20px;
        height: 48px;
        line-height: 48px;
        font-size: 11px;
        color: gray;
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

    /*자주묻는 질문*/
    .que_box {
        margin: 0 auto;
        max-width: 1085px;
        margin-bottom: 90px;

        padding-right: 1%;
        margin-top: 100px;
    }
    .que_list {
        text-align: left;
        padding-left: 10px;
    }
    .que:first-child {
        border-top: 1px solid black;
    }

    .que {
        position: relative;
        padding: 17px 0;
        cursor: pointer;
        font-size: 14px;
        border-bottom: 1px solid #dddddd;
    }

    .que::before {
        display: inline-block;
        content: "Q";
        font-size: 14px;
        color: #006633;
        margin-right: 5px;
    }

    .que.on > span {
        font-weight: bold;
        color: #006633;
    }

    .anw {
        display: none;
        overflow: hidden;
        font-size: 14px;
        background-color: #f5f5f7;
        padding: 27px 0;
    }

    .anw::before {
        display: inline-block;
        content: "A";
        font-size: 14px;
        font-weight: bold;
        color: #666;
        margin-right: 5px;
        padding-left: 5px;
    }
    @media screen and (max-width: 500px) {
        .product_item_2 {
            padding-left: 2%;
        }
    }
    /*리뷰*/
    .review {
        height: auto;
    }
    .rev_score {
        max-width: 1090px;
        display: flex;
        display: row;
        justify-content: space-evenly;
        background-color: #f5f5f7;
        border-radius: 15px;
    }
    .star {
        color: #f6d054;
        font-size: 17px;
        padding-right: 10px;
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
    .rank00 {
        padding-left: 1%;
        padding-right: 3px;
    }
    .recent00 {
        padding-left: 3px;
    }
    .review_w {
        position: absolute;
        right: 0;
        margin-right: 3px;
        border: 1px solid gray;
        border-radius: 20px;
        padding: 2px 15px;
        line-height: 25px;
        margin-top: 8px;
    }
    .review_w > i {
        padding-right: 5px;
    }
    .info_wr {
        color: #707070;
        margin-top: 10px;
        display: flex;
        justify-content: right;
        max-width: 1070px;
    }

    .btn_wr {
        cursor: pointer;
        text-align: right;
        max-width: 1080px;
        line-height: 0px;
        margin-top: 30px;
        color: #306fdb;
        padding-right: 2px;
    }

    .hr_wr {
        margin: 0 0.6%;
        max-width: 1080px;
        height: 1px;
        border: none;
        color: #333;
        background-color: #d9d9d9;
    }

    .btn_a {
        display: inline-block;
        width: 40px;
        border-radius: 20px;
        background-color: #ebebeb;
        border: 1px solid #ddd;
        padding: 5px 5px;
        cursor: pointer;
    }

    .btn_b {
        color: white;
        display: inline-block;
        width: 40px;
        height: 35px;
        border-radius: 20px;
        background-color: #0071ef;
        border: 1px solid #0071ef;
        padding: 5px 5px;
        cursor: pointer;
    }
    .like-content{
        filter: url('#filter');
        position: relative;
        margin:0 auto;
        /*
        position: relative;

        */
    }
    .like-cnt{
        margin: 0 auto;
        cursor: pointer;
        width: 100px;
        height: 100px;
        padding-top: 50px;
        border-radius: 50%;
        /*margin-top: 12px;*/
        /*margin-bottom: 15px;*/
        /*margin-left: 175px;*/

    }
    .icon_h{
        padding-left: 30px;
    }
    .ck_add{
        margin-right: 20px;
    }

    .animate-like {
        animation-name: likeAnimation;
        animation-iteration-count: 1;
        animation-fill-mode: forwards;
        animation-duration: 0.65s;
    }

    @keyframes likeAnimation {
        0%   { transform: scale(30); }
        100% { transform: scale(1); }
    }
    @media screen and (max-width: 600px){
        .vert {width:60px;}
    }

</style>
    <div class="top_nav">
        <div class="topp">${specDisplayVO.product_name} > ${specDisplayVO.product_name} ${specDisplayVO.model_name}</div>
    </div>

<div class="container">
    <div class="product_item product_item_1">
        <img src="${pageContext.request.contextPath}/resources/static/img/${specDisplayVO.product_name}.png" alt="" />
        <!-- <p>무료배송</p><p>무료반품</p> -->
    </div>
    <div class="product_item product_item_2">
        <p style="color: rgb(251, 41, 41); font-size: 15px">NEW</p>
        <h1>${specDisplayVO.product_name} ${specDisplayVO.model_name} 구입하기</h1>
        <h5>
            <c:choose>
                <c:when test="${specDisplayVO.spec_price[0] == specDisplayVO.spec_price[1]}">
                    <h3>₩${specDisplayVO.spec_price[0]}</h3>
                </c:when>
                <c:otherwise>
                    <h3>₩${specDisplayVO.spec_price[0]} ~ ₩${specDisplayVO.spec_price[1]}</h3>
                </c:otherwise>
            </c:choose>
        </h5>
        <p style="margin-top: 10px; text-align: left">색상을 선택하세요.</p>
        <div id = "price">
            <c:forEach var="i" begin="0" end="${specDisplayVO.spec_color.size()-1}">
            <c:if test="${i%2 eq 0}">
            <div class="ck_box">
                </c:if>
                <div class="ck_v" id="${specDisplayVO.spec_color[i]}" onclick="clickEvent(this.id, 'colorInput')" >
                    <div style="width: 30px; height: 30px; background-color:
                        ${specDisplayVO.spec_color[i]};border-radius: 50%;margin: 20px auto 0 auto;">
                            ${specDisplayVO.spec_color[i]}
                    </div>
                </div>

                <c:choose>
                <c:when test="${i%2 eq 1}">
            </div>
            </c:when>
            <c:when test="${i eq specDisplayVO.spec_color.size()-1}">
        </div>
        </c:when>
        </c:choose>
        </c:forEach>
    </div>
    <hr class="produc_hr" />
    <br />
    <p>원하는 프로세서를 선택하세요.</p>
    <div id="processor">
        <c:forEach var="i" begin="0" end="${specDisplayVO.spec_processor.size()-1}">
        <c:if test="${i%2 eq 0}">
        <div class="ck_box " >
            </c:if>
            <div class="ck_v ck_add" id="${specDisplayVO.spec_processor[i]}" onclick="clickEvent(this.id, 'processorInput')" style="font-size: 20px; font-weight: 500">
                    ${specDisplayVO.spec_processor[i]}
            </div>
            <c:choose>
            <c:when test="${i%2 eq 1}">
        </div>
        </c:when>
        <c:when test="${i eq specDisplayVO.spec_processor.size()-1}">
    </div>
    </c:when>
    </c:choose>
    </c:forEach>
</div>
<hr class="produc_hr" />
<br />
<p>원하는 용량을 선택하세요.</p>
<div id="memory">
    <c:forEach var="i" begin="0" end="${specDisplayVO.spec_memory.size()-1}">
    <c:if test="${i%2 eq 0}">
    <div class="ck_box">
        </c:if>
        <div class="ck_v" id="${specDisplayVO.spec_memory[i]}" onclick="clickEvent(this.id, 'memoryInput')" style="font-size: 20px; font-weight: 500">
                ${specDisplayVO.spec_memory[i]} GB
        </div>
        <c:choose>
        <c:when test="${i%2 eq 1}">
    </div>
    </c:when>
    <c:when test="${i eq specDisplayVO.spec_memory.size()-1}">
</div>
</c:when>
</c:choose>
</c:forEach>
</div>
<hr class="produc_hr" />
<br />
<p>원하시는 네트워크를 선택하세요</p>
<div id="network">
    <c:forEach var="i" begin="0" end="${specDisplayVO.spec_network.size()-1}">
    <c:if test="${i%2 eq 0}">
    <div class="ck_box" >
        </c:if>
        <div class="ck_v ck_add" id="${specDisplayVO.spec_network[i]}" onclick="clickEvent(this.id, 'networkInput')" style="font-size: 20px; font-weight: 500">
                ${specDisplayVO.spec_network[i]}
        </div>
        <c:choose>
        <c:when test="${i%2 eq 1}">
    </div>
    </c:when>
    <c:when test="${i eq specDisplayVO.spec_network.size()-1}">
</div>
</c:when>
</c:choose>
</c:forEach>
</div>
<hr class="produc_hr" />
<br />
<p>보증을 추가하시겠습니까?</p>
<div id="care">
    <div class="ck_box" >
        <div id="-2" onclick="clickEvent(this.id, 'careInput')" class="ck_v">아니오</div>
        <div id="-1" onclick="clickEvent(this.id, 'careInput')" class="ck_v">예</div>
    </div>
</div>
<div class="bill_box">
    <div class="bill_ck">
        <div id="totalPrice">
            <c:choose>
                <c:when test="${specDisplayVO.spec_price[0] == specDisplayVO.spec_price[1]}">
                    <h1>₩${specDisplayVO.spec_price[0]}</h1>
                </c:when>
                <c:otherwise>
                    <h1>₩${specDisplayVO.spec_price[0]} ~ ₩${specDisplayVO.spec_price[1]}</h1>
                </c:otherwise>
            </c:choose>
        </div>
        <div id="totalQty">

        </div>
        <h5>
            VAT 비용포함<br />
            최대 12개월 신용카드 할부
        </h5>
    </div>
    <button class="basketc_btn" onclick="addCart()" style="padding: 10px 0">
        장바구니에  담기
    </button>

    <div class="like-content">
        <div class="like-cnt unchecked" id="like-cnt">
            <c:set var="likeState" value="<%=likeState %>"></c:set>
            <c:choose>
                <c:when test="${likeState }">
                    <span class="iconify icon_h" data-icon="flat-color-icons:like" style="font-size: 40px;" id="like"></span> <!--  onclick="clickLike()" -->
                </c:when>
                <c:otherwise>
                    <span class="iconify icon_h" data-icon="icon-park-outline:like" style="font-size: 40px;" id="dislike"></span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>
</div>
</div>

<div class="review_box" style="margin-bottom: 5px;">
    <div class="review" id ="reviewPoint">
      <%-- <a name="reviewPoint"/>--%>
        <!--Review overall Info -->
        <hr class="hr_wr" style="margin-top: 80px;" />
        <h1 style="text-align: center; margin-top: 30px;">모델 리뷰</h1>
        <div class="revInfo" style="height: 100px;text-align: center; margin-top: 20px; margin-bottom: 60px;">

            <div class="reviewNum" style="float: left; width: 33%;">
                후기글<br>
                <h2>
                    <span class="iconify" data-icon="ion:people-outline" style="color: #dee1e6;" data-width="40"></span>
                </h2>
                <h3>${numOfBoards} 개</h3>
            </div>
            <div class="reviewRate" style="float: left; width: 33%;">
                평균 평점<br>
                <h2>
                    <c:forEach var="i" begin="1" end="${roundRate}">
                        <span class="iconify" data-icon="ion:heart-sharp" style="color: #0071ef;" data-width="25"></span>
                    </c:forEach>
                    <c:forEach var="j" begin="${roundRate+1}" end="5">
                        <span class="iconify" data-icon="ion:heart-outline" style="color: #0071ef;" data-width="25"></span>
                    </c:forEach>
                </h2>
                <h3>${avgRate} / 5</h3>
            </div>
            <div class="reviewAvgRate" style="float: left; width: 33%;">
                <c:forEach var="rate" items="${rateList}">
                    <div style="height: 30px;">
                            ${rate.key}점 <progress class="vert" value="${(rate.value / numOfBoards) * 100}" min="0" max="100" style="color:#0071ef;"></progress> (${rate.value})
                        </div>
                    </c:forEach>
                </div>
            </div>
            <br>
            <!-- Review Category -->
            <div class="rev_score">
                <span><a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=new&currPage=${1}#reviewPoint">최신순</a></span>|
                <span><a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=old&currPage=${1}#reviewPoint">오래된순</a></span>|
                <span><a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=high&currPage=${1}#reviewPoint">높은 별점순</a></span>|
                <span><a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=low&currPage=${1}#reviewPoint">낮은 별점순</a></span>
            </div>
            <!--Reviews-->
            <div class="rev_all">
                <c:forEach var="board" items="${boardList}">
                    <div class="rev_write">
                        <c:forEach var="i" begin="1" end="${board.board_rate}">
                            <span class="iconify" data-icon="ion:star" style="color: #f6d054;" data-width="13"></span>
                        </c:forEach>
                        <c:forEach var="j" begin="${board.board_rate+1}" end="5">
                            <span class="iconify" data-icon="ion:star-outline" style="color: #f6d054;" data-width="13"></span>
                        </c:forEach>
                        <span> ${board.board_rate}</span>
                        <a href="/boards/viewBoard?board_id=${board.board_id}">
                            <h3>${board.board_title}</h3>

                            	<div>
                            		${board.board_content}
                            	</div>
                        </a>
                        <div class="info_wr">
                            <span style="padding-right: 30px">${board.mem_id}</span>
                            <span>${board.board_date}</span>
                        </div>
                    </div>
                    <hr class="hr_wr" />
                </c:forEach>
            </div>
            <!--paging-->
            <div class="rev_paging" style="text-align: center; margin-top: 30px">
                <c:choose>
                    <c:when test="${pageError ne null}">
                        ${pageError}
                    </c:when>
                    <c:otherwise>
                        <%-- 일번 페이지가 아닐 경우 --%>
                        <c:if test="${page.currPage ne 1}">
                            <%--맨앞 일페이지로 가기 && 현재의 이전 페이지로 이동--%>
                            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${1}#reviewPoint"><button class="btn_a"> << </button></a>
                            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${page.currPage-1}#reviewPoint"><button class="btn_a"> < </button></a>
                        </c:if>
                        <c:forEach var="i" begin="${page.minPage}" end="${page.maxPage}">
                            <%--만약 현재 페이지일 경우 이동 링크를 제공하지 않음--%>
                            <c:choose>
                                <c:when test="${i eq page.currPage}">
                                    <button class="btn_b">${i}</button>
                                </c:when>
                                <c:otherwise>
                                    <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${i}#reviewPoint"><button class="btn_a">${i}</button></a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <%--현재 페이지가 마지막 페이지가 아닐 경우--%>
                        <c:if test="${page.currPage ne page.totalPage}">
                            <%--현재 페이지의 앞 페이지로 이동 && 맨마지막 페이지로 이동--%>
                            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${page.currPage+1}#reviewPoint"><button class="btn_a"> > </button></a>
                            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${page.totalPage}#reviewPoint"><button class="btn_a"> >> </button></a>
                        </c:if>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>

<div class="que_box" style="margin-top: 50px">
    <div class="que_list">
        <h3>자주묻는질문</h3>

        <div id="Accordion_wrap">
            <div class="que">
                <span>구입 후 배송은 언제되나요?</span>
            </div>
            <div class="anw">
                    <span>
                      주문하시면 배송날짜를 알려드립니다. 또한, 지역에 따라 지연될
                      경우 알림 문자로 알려드립니다.
                    </span>
            </div>
            <div class="que">
                <span>반품이 가능한가요?</span>
            </div>
            <div class="anw">
                    <span>
                      모든 제품이 양호한 상태여야 하며, 구입 후 1주일 안으로 신청시
                      반품이 가능합니다.
                    </span>
            </div>
            <div class="que">
                <span>제품 구입하는 경우 포인트 혜택을 받을 수 있나요?</span>
            </div>
            <div class="anw">
                    <span>
                        가입 후 구매시 5000P 포인트 혜택을 받으실 수 있습니다.
                    </span>
            </div>
        </div>
    </div>
</div>

<form id="userPhone">
    <input type="hidden" name="model_id" id="modelIdInput" value="${specDisplayVO.model_id}">
    <input type="hidden" name="spec_display" id="displayInput" value="${specDisplayVO.spec_display[0]}">
    <input type="hidden" name="spec_weight" id="weigthInput" value="${specDisplayVO.spec_weight[0]}">

    <input type="hidden" name="isCare" id="careInput">

    <input type="hidden" name="spec_color" id="colorInput"> <!--input from user-->
    <input type="hidden" name="spec_processor" id="processorInput"> <!--input from user-->
    <input type="hidden" name="spec_memory" id="memoryInput">  <!--input from user-->
    <input type="hidden" name="spec_network" id="networkInput">  <!--input from user-->
</form>
<input type="hidden" id="qtyResult" value="">
<script>
    // 상품 체크
    function clickEvent(id, input){
        //console.log("frome id: " + id);
        //console.log("from input: " + input);
        var currentChoice = document.getElementById(id);
        document.getElementById(input).value = id;

        currentChoice.className = 'ck_v check';
        var grandParent = currentChoice.parentElement.parentElement;
        var parents = grandParent.children;

        for(var i=0; i<parents.length;i++){
            var kids = parents[i].children;
            for(var j=0;j<kids.length;j++){
                if(kids[j].id != id) {
                    kids[j].className = 'ck_v';
                }
            }
        }

        let userInput = $("#userPhone").serializeArray();
        for(i=3; i < userInput.length; i++){
            console.log(userInput[i].value);
            if(userInput[i].value.length == 0){
                return;
            }
        }
        specCheck();
    }

    var userPhone = {};
    function specCheck(){
        let userInput = $("#userPhone").serializeArray();
        let phone = {}
        for(i=0; i < userInput.length; i++){
            phone[userInput[i].name] = userInput[i].value;
        }
        $.ajax({
            url:"/spec/findSpec",
            type:"post",
            dataType:"json",
            data: JSON.stringify(phone),
            contentType: "application/json;charset=utf-8",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success:function(specVO){
                userPhone = _.cloneDeep(specVO);

                var care = { cart_isCare : document.getElementById("careInput").value };
                userPhone = Object.assign(userPhone, care);
                document.getElementById("totalPrice").innerHTML = "<h1>₩"+ specVO.spec_price +"</h1>";
                document.getElementById("qtyResult").value = specVO.spec_qty;
                document.getElementById("totalQty").innerHTML = specVO.spec_qty +"개 남았습니다.";
            },
            error:function(){
                alert("error");
            }
        });
    }

    function addCart(){
        var delayStopper = document.getElementById("qtyResult").value;

        if(userPhone.spec_qty <= 0){
            alert("수량이 부족합니다.");
            return;
        }
        if(Object.keys(userPhone).length == 0){
            alert("옵션을 선택헤주세요");
        }else{
            if(delayStopper == "" || Number(delayStopper) != Number(userPhone.spec_qty)){
                alert("잠시만 기다려주세요");
                return;
            }
            //modal work if user says yes to cart no then stays
            $.ajax({
                url: "/carts/member/addCart",
                type:"post",
                data:
                    JSON.stringify(userPhone),
                dataType: "text",
                contentType: "application/json;charset=utf-8",
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                success: function(data) {
                    alert("장바구니로 이동");
                    location.href="/carts/member/cart";
                },
                error:function(request){
                    if(request.status == 403) {
                        alert("로그인 해주세요")
                        location.href ="/login";
                    }else{
                        alert(request.status);
                    }
                }
            });
        }
    }


    // 자주묻는질문
    $(".que").click(function () {
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass("on").siblings().removeClass("on");
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });

    //csrf 토큰값 받기
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");



    var like_parent = $(".like-content");
    var burst = new mojs.Burst({
        parent: like_parent,
        radius:   { 50: 70 },
        count: 15,
        children: {
            delay: 250,
            duration: 700,
            radius:{10: 0},
            fill:   [ '#f4493c' ],
            easing:       mojs.easing.bezier(.08,.69,.39,.97)
        }
    });

    //좋아요
    $(document).on("click","#like", function(){

        var likeState = $(this).attr("id");
        console.log('좋아요 상태 -> ' + likeState);

        if(likeState = 'like'){
            jQuery.ajax({
                "url": "/likes/member/likedelete",
                "type": "POST",
                "contentType": "application/json; charset=utf-8;",
                "data": JSON.stringify({
                    "model_id":${param.model_id},
                }),
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                "dataType": "json"
            }).done(function(data) {
                data = JSON.stringify(data);
                jsonData = JSON.parse(data);

                //console.log(jsonData);

                if (jsonData.success) {
                    console.log(jsonData.success);
                    $('#like').remove();
                    $('#like-cnt').append('<span class="iconify icon_h" data-icon="icon-park-outline:like" style="font-size: 40px;" id="dislike"></span>');
                }
                else {
                    alert("에러");
                }

            });
        }
    });

    //좋아요 취소
    $(document).on("click","#dislike", function(){

        var mem = "${user.mem_id}";
        if(mem == ""){
            alert("로그인 해주세요");
            return;
        }


        var likeState = $(this).attr("id");
        console.log('좋아요 상태 -> ' + likeState);

        if(likeState = 'dislike'){

            jQuery.ajax({
                "url": "/likes/member/likeinsert",
                "type": "POST",
                "contentType": "application/json; charset=utf-8;",
                "data": JSON.stringify({
                    "model_id":${param.model_id},
                }),
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                "dataType": "json"
            }).done(function(data) {
                data = JSON.stringify(data);
                jsonData = JSON.parse(data);

                //console.log(jsonData);

                if (jsonData.success) {
                    console.log(jsonData.success);
                    $('#dislike').remove();
                    $('#like-cnt').append('<span class="iconify icon_h" data-icon="flat-color-icons:like" style="font-size: 40px;" id="like"></span>');
                    burst.replay();
                }
                else {
                    alert("에러");
                }
            });
        }
    });
</script>
</body>
</html>