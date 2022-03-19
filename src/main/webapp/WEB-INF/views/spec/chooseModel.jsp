
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>${specDisplayVO.product_name} ${specDisplayVO.model_name}</h2>

<c:choose>
    <c:when test="${specDisplayVO.spec_price[0] == specDisplayVO.spec_price[1]}">
        <h3>₩${specDisplayVO.spec_price[0]}</h3>
    </c:when>
    <c:otherwise>
        <h3>₩${specDisplayVO.spec_price[0]} ~ ₩${specDisplayVO.spec_price[1]}</h3>
    </c:otherwise>
</c:choose>

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
    <input type="hidden" name="model_id" id="modelIdInput">
    <input type="hidden" name="spec_display" id="displayInput">
    <input type="hidden" name="spec_color" id="colorInput"> //
    <input type="hidden" name="spec_processor" id="processorInput"> //
    <input type="hidden" name="spec_memory" id="memoryInput">  //
    <input type="hidden" name="spec_network" id="networkInput">  //
</form>

<script>
    function clickEvent(id){
        var currentChoice = document.getElementById(id);
        //do thing to put id value into input value
        //do something to show click design

        var parent = currentChoice.parentElement.children;

        if(parent.length > 1){
            for(var i = 0; i < parent.length; i++){
                if (parent[i] != currentChoice){
                    //do something to un-click design
                    console.log(parent[i]);
                }
            }
        }
        specCheck();
    }
    function specCheck(){
        //bring the record of spec (qty, price)
        //form userPhone to json
    }
</script>

</body>
</html>
