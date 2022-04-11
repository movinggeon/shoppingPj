const menu_btn = document.querySelector(".menu_btn");
const sfind = document.querySelector(".menu_find");
const menu = document.querySelector(".nav_menu");
const links = document.querySelector(".nav_links");
const navbar = document.querySelector(".navbar");

window.onload = function () {
    menu_btn.addEventListener("click", () => {
        menu.classList.toggle("active");
        links.classList.toggle("active");
        navbar.classList.toggle("active");
    });
    sfind.addEventListener("click", () => {
        $(".window").css("display", "block");
        $(".win_box").css("display", "block");
        $("#mask").css("display", "block");
        $(".holder").focus();
        windowMask();
        $(".window").show();
    });
};

/* Header menu */
$(function () {
    var $Menu = $(".nav_list > ul > li"),
        $header = $(".hd");

    $Menu
        .mouseover(function () {
            $header.stop().animate({ height: "247px" }, 200);
            windowMask();
            $header.show();
        })
        .mouseout(function () {
            $header.stop().animate({ height: "66px" }, 200);
            $("#mask, .window").hide();
        });
});

/* Side menu */
$(".menu_btn>i").on("click", function () {
    var scrollTop_length = 0;
    scrollTop_length = $(window).scrollTop();
    $("body").css("overflow", "hidden");
    $(".menu_bg").show();
    $("#sideMenu").show().animate({
        right: 0,
    });
});
$(".close_btn>i").on("click", function () {
    $("body").css("overflow-y", "auto");
    $(".menu_bg").hide();
    $("#sideMenu").animate(
        {
            right: "-" + 50 + "%",
        },
        function () {
            $("#sideMenu").hide();
        }
    );
});

/* Search */
const find = document.querySelector(".fa-magnifying-glass");
find.addEventListener("click", clicked);

function clicked() {
    $(document).ready(function () {
        $(".holder").focus();
    });
    windowMask();
    $(".window").show();
}

function windowMask() {
    const maskHeight = $(document).height();
    const maskWidth = $(window).width();
    $("#mask").css({ width: maskWidth, height: maskHeight });
    $("#mask").fadeTo("slow", 0.5);
}

$("#btn_close").click(function (e) {
    e.preventDefault();
    $("#mask, .window").hide();
    $(".holder").val("");
});

$("#mask").click(function () {
    $(this).hide();
    $(".window").hide();
    $(".holder").val("");
});

/* chat */
$(window).scroll(function () {
    var scr = $(window).scrollTop();
    if (scr == $(document).height() - $(window).height()) {
        if (matchMedia("screen and (max-width: 550px)").matches) {
            $("#chat").css({ bottom: 270, transition: 0.4 });
        } else {
            $("#chat").css({ bottom: 190, transition: 0.4 });
        }
    } else {
        $("#chat").css("bottom", "30px");
        $("#chat").css("transition", "0.4s");
    }
});
