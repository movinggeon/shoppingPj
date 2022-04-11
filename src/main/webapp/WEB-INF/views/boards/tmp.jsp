<%--
  Created by IntelliJ IDEA.
  User: jhkwa
  Date: 2022-04-09
  Time: 오후 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .like-container{
            filter: url('#filter');
            position: absolute;
            left: 50%;
            top: 50%;
        }
        .like-cnt{
            cursor: pointer;
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }
        /* ::-moz-selection { background: transparent;}
         ::selection {background: transparent;}*/
    </style>
</head>
<body>
<div class="like-container">
    <div class="like-cnt unchecked" id="like-cnt">
        <span class="iconify" data-icon="ion:heart-outline" style="color: black;" data-width="60" data-height="60"></span>
    </div>
</div>

<script>
    var check_status = false;
    //var like_cnt = $("#like-cnt");
    var like_parent = $(".like-container");
    console.log(like_parent);


    const burst = new mojs.Burst({
        parent: like_parent,
        radius:   { 50: 70 },
        count: 15,
        children: {
            delay: 250,
            duration: 700,
            radius: {10: 0},
            fill: ['#f4493c'],
            easing:	mojs.easing.bezier(.08,.69,.39,.97)
        }
    });
    console.log(burst + " mojo");

    $("#like-cnt").click(function(){
        if(!check_status){
            document.getElementById("like-cnt").innerHTML = '<span class="iconify" data-icon="ion:heart-sharp" style="color: #f4493c;" data-width="60" data-height="60"></span>';
            check_status=true;
            burst.replay();
        }
        else{
            document.getElementById("like-cnt").innerHTML = '<span class="iconify" data-icon="ion:heart-outline" style="color: black;" data-width="60" data-height="60"></span>';
            check_status=false;
        }

    })
</script>

</body>
</html>
