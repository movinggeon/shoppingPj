<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<script src="https://code.iconify.design/2/2.2.0/iconify.min.js"></script>
<h2>${specDisplayVO.product_name} ${specDisplayVO.model_name}</h2>
<div id = "price">
<c:choose>
    <c:when test="${specDisplayVO.spec_price[0] == specDisplayVO.spec_price[1]}">
        <h3>₩${specDisplayVO.spec_price[0]}</h3>
    </c:when>
    <c:otherwise>
        <h3>₩${specDisplayVO.spec_price[0]} ~ ₩${specDisplayVO.spec_price[1]}</h3>
    </c:otherwise>
</c:choose>
</div>
<hr>

<h4>Color</h4>
<div id="color">
    <c:forEach items="${specDisplayVO.spec_color}" var="color">
        <span id = "${color}" onclick="clickEvent(this.id, 'colorInput')">${color}</span> &nbsp
    </c:forEach>
</div>

<h4>Processor</h4>
<div id="prcoessor">
    <c:forEach items="${specDisplayVO.spec_processor}" var="processor">
        <span id = "${processor}"  onclick="clickEvent(this.id, 'processorInput')">${processor}</span> &nbsp
    </c:forEach>
</div>

<h4>Memory</h4>
<div id="memory">
    <c:forEach items="${specDisplayVO.spec_memory}" var="memory">
        <span id = "${memory}" onclick="clickEvent(this.id, 'memoryInput')">${memory}</span> &nbsp
    </c:forEach>
</div>

<h4>Network</h4>
<div id="network">
    <c:forEach items="${specDisplayVO.spec_network}" var="network">
        <span id="${network}" onclick="clickEvent(this.id, 'networkInput')">${network}</span> &nbsp
    </c:forEach>
</div>

<div id="isCare">
    <div id="-1" onclick="clickEvent(this.id, 'careInput')">예</div>
    <div id="-2" onclick="clickEvent(this.id, 'careInput')">아니요</div>
</div>

<div id="qty">
</div>


<div id = "addCart">
    <button type="button" id="show" onclick="addCart()">장바구니 추가</button>
</div>



<!-- https://icon-sets.iconify.design/ion/add/ -->
<div id="review">
    <h1>후기</h1>
    <hr>
    <a name="reviewPoint"/>
    후기글 갯수
    <h3>${numOfBoards}</h3>
    평균 평점<br><br>
    <c:forEach var="i" begin="1" end="${roundRate}">
        <span class="iconify" data-icon="ion:heart-sharp" style="color: #0071ef;" data-width="25"></span>
    </c:forEach>
    <c:forEach var="j" begin="${roundRate+1}" end="5">
        <span class="iconify" data-icon="ion:heart-outline" style="color: #0071ef;" data-width="25"></span>
    </c:forEach>
    <h3>${avgRate} / 5</h3>
    <div id ="category">
        <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=new&currPage=${1}#reviewPoint">최신순</a> |
        <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=old&currPage=${1}#reviewPoint">오래된순</a>|
        <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=high&currPage=${1}#reviewPoint">높은 별점순</a> |
        <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=low&currPage=${1}#reviewPoint">낮은 별점순</a>
    </div>
    <%--후기글--%>
    <c:forEach var="rate" items="${rateList}">
        ${rate.key} : <progress value="${(rate.value / numOfBoards) * 100}" min="0" max="100" style="color:#0071ef;"></progress> (${rate.value})<br>
    </c:forEach>
    <c:forEach var="board" items="${boardList}">
        ${board.board_id} ${board.board_title} ${board.board_rate} <br>
    </c:forEach>
</div>

<div id="paging">
<c:choose>
    <c:when test="${pageError ne null}">
        ${pageError}
    </c:when>
    <c:otherwise>
        <%-- 일번 페이지가 아닐 경우 --%>
        <c:if test="${page.currPage ne 1}">
            <%--맨앞 일페이지로 가기 && 현재의 이전 페이지로 이동--%>
            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${1}#reviewPoint"> << </a>
            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${page.currPage-1}#reviewPoint"> < </a>
        </c:if>
        <c:forEach var="i" begin="${page.minPage}" end="${page.maxPage}">
            <%--만약 현재 페이지일 경우 이동 링크를 제공하지 않음--%>
            <c:choose>
                <c:when test="${i eq page.currPage}">
                    ${i}
                </c:when>
                <c:otherwise>
                    <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${i}#reviewPoint">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <%--현재 페이지가 마지막 페이지가 아닐 경우--%>
        <c:if test="${page.currPage ne page.totalPage}">
            <%--현재 페이지의 앞 페이지로 이동 && 맨마지막 페이지로 이동--%>
            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${page.currPage+1}#reviewPoint"> > </a>
            <a href="/spec/chooseModel?model_id=${specDisplayVO.model_id}&category=${category}&currPage=${page.totalPage}#reviewPoint"> >> </a>
        </c:if>
    </c:otherwise>
</c:choose>
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



<script>
    function clickEvent(id, specInput){
        var currentChoice = document.getElementById(id);
        //do thing to put id value into input value
        document.getElementById(specInput).value = id;
        //do something to show click design
        currentChoice.style.fontWeight = "bold";

        var parent = currentChoice.parentElement.children;

        if(parent.length > 1){
            for(var i = 0; i < parent.length; i++){
                if (parent[i] != currentChoice){
                    //do something to un-click design
                    parent[i].style.fontWeight = "normal";
                }
            }
        }
        //check whether user choose all of the options
        let userInput = $("#userPhone").serializeArray();
        for(i=3; i < userInput.length; i++){
            console.log(userInput[i].value);
            if(userInput[i].value.length == 0){
                return;
            }
        }
        //if user made all the choices then show the remaining qty and chosen model's value
        specCheck();
    }
    var userPhone = {};
    function specCheck(){
        //bring the record of spec (qty, price)
        //form userPhone to json

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
                document.getElementById("price").innerHTML = "<h3>₩"+ specVO.spec_price +"</h3>";
                document.getElementById("qty").innerHTML = specVO.spec_qty +"개 남았습니다.";
            },
            error:function(){
                alert("error");
            }
        });
    }
    function addCart(){
        //Object.keys(userPhone).length == 0
        //toCart == 0
        console.log(userPhone.spec_id);
        if(userPhone.spec_qty <= 0){
            alert("수량이 부족합니다.");
            return;
        }
        if(Object.keys(userPhone).length == 0){
            alert("옵션을 선택헤주세요");
            //document.getElementById("modal-pop").innerText = "옵션을 선택헤주세요";
        }else{
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
                    //alert("장바구니로 이동 하시겠습니까?")
                    alert("장바구니로 이동");
                    location.href="/carts/member/cart";
                    //document.getElementById("modal-pop").innerText = "장바구니로 이동 하시 겠습니까?";
                },
                error:function(request){
                    if(request.status == 403) {
                        alert("로그인 해주세요")
                        //document.getElementById("modal-pop").innerText = "로그인해주세요";
                    }else{
                        alert(request.status);
                    }
                }
            });
        }
    }

</script>

</body>
</html>
