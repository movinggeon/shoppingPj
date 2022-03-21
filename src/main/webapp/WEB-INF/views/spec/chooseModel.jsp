<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 1000;

            /* 숨기기 */
            z-index: -1;
            opacity: 0;
        }
        .show {
            opacity: 1;
            z-index: 1000;
            transition: all 0.5s;
        }
        .window {
            position: relative;
            width: 100%;
            height: 100%;
        }
        .popup {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);

            /* 임시 지정 */
            width: 500px;
            height: 500px;

            /* 초기에 약간 아래에 배치 */
            transform: translate(-50%, -40%);
        }

        .show .popup {
            transform: translate(-50%, -50%);
            transition: all 0.5s;
        }
    </style>
</head>
<body>

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



<form id="userPhone">
    <input type="hidden" name="model_id" id="modelIdInput" value="${specDisplayVO.model_id}">
    <input type="hidden" name="spec_display" id="displayInput" value="${specDisplayVO.spec_display[0]}">
    <input type="hidden" name="spec_weight" id="weigthInput" value="${specDisplayVO.spec_weight[0]}">

    <input type="hidden" name="spec_color" id="colorInput"> <!--input from user-->
    <input type="hidden" name="spec_processor" id="processorInput"> <!--input from user-->
    <input type="hidden" name="spec_memory" id="memoryInput">  <!--input from user-->
    <input type="hidden" name="spec_network" id="networkInput">  <!--input from user-->
</form>

<div id = "addCart">
    <button type="button" id="show" onclick="addCart()">장바구니 추가</button>
</div>
<div class="background" >
    <div class="window">
        <button id="close">팝업닫기</button>
        <div class="popup" id="modal-pop">
        </div>
        <div>
            <div></div>
        </div>
    </div>
</div>


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
        let userInput = $("#userPhone").serializeArray();
        for(i=3; i < userInput.length; i++){
            if(userInput[i].value.length == 0){
                return;
            }
        }
        specCheck();
    }
    var userPhone = {};
    //var toCart = 0;
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
                //setting the input values
                userPhone = _.cloneDeep(specVO);
                //toCart = 1;
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
        if(Object.keys(userPhone).length == 0){
            document.getElementById("modal-pop").innerText = "옵션을 선택헤주세요";
        }else{
            //modal work if user says yes to cart no then stays
            $.ajax({
                url: "/carts/member/addCart",
                type:"post",
                data:{spec_id:userPhone.spec_id},
                dataType: "text",
                beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader(header, token);
                },
                success: function(data) {
                    //alert("장바구니로 이동 하시겠습니까?")
                    document.getElementById("modal-pop").innerText = "장바구니로 이동 하시 겠습니까?";
                },
                error:function(request){
                    if(request.status) {
                        document.getElementById("modal-pop").innerText = "로그인해주세요";
                    }else{
                        alert(request.status);
                    }
                }
            });
        }
    }

    function show() {
        document.querySelector(".background").className = "background show";
    }

    function close() {
        document.querySelector(".background").className = "background";
    }
    document.querySelector("#show").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);

</script>

</body>
</html>
