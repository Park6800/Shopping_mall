<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="shopping_mall.Repository.*"%>
<%@page import="shopping_mall.Entity.User_Entity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보 페이지</title>
<link rel="stylesheet" href="/css/Goodsinfo.css">
<%-- 폰트어썸 --%>
<script src="https://kit.fontawesome.com/7bb4972374.js" crossorigin="anonymous"></script>
<%-- 제이쿼리 --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%-- 스와이퍼 cdn --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
	<% User_Entity user = (User_Entity) session.getAttribute("login_result"); %>
<script>
function ajax_Categories(typeName) {
    var categories = typeName;
    $.ajax({
        url: "/Categories",
        type: "POST",
        cache: false,
        dataType: 'json',
        data: { typeName:categories },
        async: false, // AJAX 요청을 비동기적으로 처리합니다.
        success: function (data) {
        var list_container = $(".detail_list");
        list_container.empty();
             for (var i = 0; i < data.length; i++) {
                var content = data[i];
                list_container.append("<li class='z_height'>" + content + "<li>");
             }
             var content = "";
             categories = "";
        },
        error: function (request, status, error) {
            console.log(error); // 에러 메시지를 콘솔에 출력
        }
    });
}

    function Open_Categories() {
       $("#Categories_list").css('display', 'block');
    }
    function Close_Categoires() {
       $("#Categories_list").css('display', 'none');
    }
     $(document).ready(function() {
            $("#plus_btn").click(function() {
                const number = $("#count_number");
                const price = $("#Count_Price");
                const Count = $("#Count_Goods");
                let CountGoods = parseInt(Count.val());
                let CountPrice = price.text();
                let CountNumber = number.text();
                CountGoods = CountGoods + 1;
                CountNumber = parseInt(CountNumber) + 1;
                CountPrice = parseInt(CountPrice) + ${fn:replace(Goods_info.getGoodsPrice(), ',', '')};
                Count.val(CountGoods);
                Count.change();
                number.text(CountNumber);
                price.text(CountPrice);
            });

            $("#minus_btn").click(function() {
                const Count = $("#Count_Goods");
                let CountGoods = Count.val();
                const number = $("#count_number");
                let CountNumber = number.text();
                const price = $("#Count_Price");
                let CountPrice = price.text();
                if (CountNumber != 0) {
                    CountGoods = parseInt(CountGoods) - 1;
                    CountNumber = parseInt(CountNumber) - 1;
                    CountPrice = parseInt(CountPrice) - ${fn:replace(Goods_info.getGoodsPrice(), ',', '')};
                }
                Count.val(CountGoods);
                number.text(CountNumber);
                price.text(CountPrice);
            });
     });
</script>
</head>
<body>
    <div>
        <div id="nav_con">
            <nav>
                <div>
                    즐겨찾기
                </div>
                <div id="right_nav">
                   <c:choose>
                       <c:when test = "${user == null}">
                           <div class="nav_right"><a href="login">로그인</a></div>
                           <div class="nav_right"><a href="signup">회원가입</a></div>
                       </c:when>
                        <c:otherwise>
                           <div class="myInfo"><h4>${user.getUser_name()}님</h4></div>
                       </c:otherwise>
                   </c:choose>
                </div>
            </nav>
        </div>
        <div id="categories_con">
            <div id="categories">
                <div id="categories_btn" onmouseover="Open_Categories()" onmouseout="Close_Categoires()">
                    <div id="re">
                        <div id="position">
                            <div>
                                <i class="fas fa-regular fa-bars" id="Menu_Bar"></i>
                            </div>
                            <div id="category_bar">
                                카테고리
                            </div>
                        </div>
                        <div id="Categories_list" onmouseover="Open_Categories()">
                            <div id="type_list">
                                <div id="List_width">
                                    <ul id="backcolor" onmouseover="Open_Categories()" >
                                        <c:forEach var="category" items="${Categories_List}">
                                            <a href="goods?type=${category.typeName}">
                                                    <li class="li_top" onmouseover="ajax_Categories('${category.typeName}')">
                                                            <input value="${category.typeName}" type="hidden" class="type_Name">
                                                        <div>
                                                            ${category.typeName}
                                                        </div>
                                                    </li>
                                            </a>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div id="Goods_detail">
                                    <ul class="detail_list">
                                        <li></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="search_con">
                    <div id="logo_img">
                        <a href="home">
                            img
                        </a>
                    </div>
                    <div id="search">
                        <select id="select_search">
                            <option value="">전체<option>
                            <c:forEach var="Categories" items="${Categories_List}">
                                <option value="${Categories.typeName}">${Categories.typeName}</option>
                            </c:forEach>
                        </select>
                        <input type="text" id="input_search" placeholder="찾는 상품을 검색해보세요.">
                    </div>
                    <div id="My_page">
                        <a href="mypage?UserId=${user.getUserId()}">
                            <div>
                                <i class="fa-solid fa-user" id="MyPage"></i>
                            </div>
                            <div>
                                마이 페이지
                            </div>
                        </a>
                    </div>
                    <div id="My_basket">
                        <a href="basket?UserId=${user.getUserId()}">
                            <div>
                                <i class="fas fa-light fa-cart-shopping" id="shopping_cart"></i>
                            </div>
                            <div>
                                장바구니
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="Type_container">
            <div id="Type_name_list">
                멈춰!
            </div>
            <div id="img_type">
                <div class="img_display">
                    <div class="TypeName">
                        <div>
                            <img src="${Goods_info.getGoodsUrl()}">
                        </div>
                        <div id="Information">
                            <div>
                                상품명 : ${Goods_info.getGoodsName()}
                            </div>
                            <div>
                                상품 가격 : ${Goods_info.getGoodsPrice()} 원
                            </div>
                            <div>
                                상품 상세 정보 : ${Goods_info.getGoodsExplain()}
                            </div>
                            <div>
                                예상 배송 : ${Goods_info.getGoods_delivery()} 시간
                            </div>
                            <div>
                                원산지 : ${Goods_info.getGoods_country()}
                            </div>
                            <div id="Btn_number">
                                <div>
                                    <button class="Btn_count" id="plus_btn">+</button>
                                </div>
                                <div id="count_number">
                                    0
                                </div>
                                <div>
                                    <button class="Btn_count" id="minus_btn">-</button>
                                </div>
                            </div>
                            <div id="Total_price">
                                <div id="Price">
                                    주문 금액
                                </div>
                                <div id="Count_Price">
                                    0
                                </div>
                            </div>
                            <div id="Btn_Sell">
                                <div>
                                    <form action="Direct_Sell" method="post">
                                        <button class="Sell_Detail_Btn" id="Sell_btn">주문하기</button>
                                    </form>
                                </div>
                                <div>
                                    <form action="MyBasket" method="post">
                                        <input type="hidden" value="${user.getUserId()}" name="User_id">
                                        <input type="hidden" value="${Goods_info.getGoodsId()}" name="Goods_id">
                                        <input type="hidden" value="0" name="Goods_count" id="Count_Goods">
                                        <button class="Sell_Detail_Btn" id="basket_btn">장바구니에 담기</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="bin_con">
                ${user.getUserId()}
            </div>
        </div>
    </div>
</body>
</html>