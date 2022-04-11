/*banner*/

$(document).ready(function () {
    var slide1 = $(".slider").bxSlider({
        auto: true,
        pause: 5000,
    });
    $(".controls .play").on("click", function () {
        slide1.startAuto();
    });
    $(".controls .pause").on("click", function () {
        slide1.stopAuto();
    });
});
