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

    <link rel="stylesheet" href="header.css" />
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="footer.css" />
    <script src="main.js"></script>
    <script src="header.js" defer></script>
    <title>SMARTDC</title>
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

    .md_v {
        box-sizing: border-box;
        width: 430px;
        height: 82px;
        border: 1px solid #d2d2d7;
        border-radius: 10px;
        line-height: 82px;
        font-size: 15px;
        padding-left: 18px;
        margin-bottom: 10px;
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

    .md_v:hover,
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
            padding-left: 0;
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
</style>

<main class="main-content">

    <div style="margin-top: 60px"></div>
    <div class="top_nav">
        <div class="topp">${specDisplayVO.product_name} > ${specDisplayVO.product_name} ${specDisplayVO.model_name}</div>
    </div>

    <div class="container">
        <div class="product_item product_item_1">
            <img src="../img/img9.jpg" alt="" />
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
                <c:forEach var="i" begin="0" end="${specDisplayVO.spec_color.size()-1}">
                    <c:if test="${i%2 eq 0}">
                    <div class="ck_box">
                    </c:if>
                        <div class="ck_v">
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
            <hr class="produc_hr" />
            <br />
            <p>원하는 프로세서를 선택하세요.</p>
                <c:forEach var="i" begin="0" end="${specDisplayVO.spec_processor.size()-1}">
                    <c:if test="${i%2 eq 0}">
                        <div class="ck_box">
                    </c:if>
                            <div class="ck_v" style="font-size: 20px; font-weight: 500">
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
            <hr class="produc_hr" />
            <br />
            <p>원하는 용량을 선택하세요.</p>
            <div class="ck_box">
                <div class="ck_v" style="font-size: 20px; font-weight: 500">
                    128GB
                </div>
                <div class="ck_v" style="font-size: 20px; font-weight: 500">
                    256GB
                </div>
            </div>
            <hr class="produc_hr" />
            <br />
            <p>보상 판매할 xPhone이 있으신가요?</p>
            <div class="ck_box">
                <div class="ck_v" style="font-size: 20px; font-weight: 500">
                    WiFi
                </div>
                <div class="ck_v" style="font-size: 20px; font-weight: 500">
                    5G
                </div>
            </div>
            <hr class="produc_hr" />
            <br />
            <p>보증을 추가하시겠습니까?</p>
            <div class="ck_box">
                <div class="ck_v">아니오</div>
                <div class="ck_v">예</div>
            </div>
            <div class="bill_box">
                <div class="bill_ck">
                    <h1>\1,200,000</h1>
                    <h5>
                        VAT 비용포함<br />
                        최대 12개월 신용카드 할부
                    </h5>
                </div>
                <button class="basketc_btn" style="padding: 10px 0">
                    장바구니에 담기
                </button>
            </div>
        </div>
    </div>



    <div class="review_box">
        <div class="review">
            <div class="revInfo" style="height: 100px;text-align: center; margin-top: 120px">
                <div class="reviewNum" style="float: left; width: 33%;">
                    후기글<br>
                    <h3>후기글 갯수:개</h3>
                </div>
                <div class="reviewRate" style="float: left; width: 33%;">
                    평균 평점<br>
                    하트 하트
                </div>
                <div class="reviewAvgRate" style="float: left; width: 33%;">
                    progressBar
                </div>
            </div>
            <br>
            <!-- <hr style="margin-top: -5px" /> -->
            <div class="rev_score">
          <span><a href="">최신순</a></span
          >|<span><a href="">오래된순</a></span
            >|<span><a href="">높은 별점순</a></span
            >|<span><a href="">낮은 별점순</a></span
            >
            </div>
            <div class="rev_all">
                <div class="rev_write">
                    <span class="star">★★★★★</span><span>5</span>
                    <h3>퀵 배송</h3>
                    <div>배송도 빠르고 제품도 만족합니다 :)</div>
                    <div class="info_wr">
              <span style="padding-right: 30px">pje8****</span
              ><span>2022.03.29</span>
                    </div>
                </div>
                <hr class="hr_wr" />
                <div class="rev_write">
                    <span class="star">★★★★★</span><span>5</span>
                    <h3>잘 받았습니다~</h3>
                    <div>색상이 너무 예쁘네요~!!!</div>
                    <div class="info_wr">
              <span style="padding-right: 30px">bnt0****</span
              ><span>2022.03.22</span>
                    </div>
                </div>
                <hr class="hr_wr" />
                <div class="rev_write">
                    <span class="star">★★★★★</span><span>5</span>
                    <h3>아이들이 좋아합니다</h3>
                    <div>많이 파세요~~</div>
                    <div class="info_wr">
              <span style="padding-right: 30px">sky****</span
              ><span>2022.03.20</span>
                    </div>
                </div>
                <hr class="hr_wr" />

                <div id="rev_wr" style="display: none">
                    <div>
                        <div class="rev_write">
                            <span class="star">★★★★★</span><span>5</span>
                            <h3>리뷰타이틀</h3>
                            <div>배송도 빠르고 제품도 만족합니다 :)</div>
                            <div class="info_wr">
                  <span style="padding-right: 30px">good****</span
                  ><span>2022.02.29</span>
                            </div>
                        </div>
                        <hr class="hr_wr" />
                        <div class="rev_write">
                            <span class="star">★★★★★</span><span>5</span>
                            <h3>리뷰타이틀</h3>
                            <div>배송도 빠르고 제품도 만족합니다 :)</div>
                            <div class="info_wr">
                  <span style="padding-right: 30px">bur****</span
                  ><span>2022.02.23</span>
                            </div>
                        </div>
                        <hr class="hr_wr" />
                        <div class="rev_write">
                            <span class="star">★★★★★</span><span>5</span>
                            <h3>리뷰타이틀</h3>
                            <div>배송도 빠르고 제품도 만족합니다 :)</div>
                            <div class="info_wr">
                  <span style="padding-right: 30px">kr****</span
                  ><span>2022.02.10</span>
                            </div>
                        </div>
                        <hr class="hr_wr" />
                    </div>
                </div>
            </div>
            <!--rev_all-->
        </div>
    </div>

    <div class="que_box">
        <div class="que_list">
            <h3>자주묻는질문</h3>

            <div id="Accordion_wrap">
                <div class="que">
                    <span>구입 후 배송은 언제되나요?</span>
                </div>
                <div class="anw">
            <span
            >주문하시면 배송날짜를 알려드립니다. 또한, 지역에 따라 지연될
              경우 알림 문자로 알려드립니다.</span
            >
                </div>
                <div class="que">
                    <span>반품이 가능한가요?</span>
                </div>
                <div class="anw">
            <span
            >모든 제품이 양호한 상태여야 하며, 구입 후 1주일 안으로 신청시
              반품이 가능합니다.</span
            >
                </div>
                <div class="que">
                    <span>제품 구입하는 경우 포인트 혜택을 받을 수 있나요?</span>
                </div>
                <div class="anw">
            <span
            >가입 후 구매시 5000P 포인트 혜택을 받으실 수 있습니다.</span
            >
                </div>
            </div>
        </div>
    </div>
    <script>
        // 상품 체크
        $(".md_v, .ck_v").on("click", function (e) {
            e.preventDefault();
            $(this).toggleClass("check");
        });

        // 자주묻는질문
        $(".que").click(function () {
            $(this).next(".anw").stop().slideToggle(300);
            $(this).toggleClass("on").siblings().removeClass("on");
            $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
        });
    </script>
</body>
</html>