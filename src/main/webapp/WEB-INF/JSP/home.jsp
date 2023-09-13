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
<title>메인 홈</title>
<link rel="stylesheet" href="/css/Home.css">
<%-- 폰트어썸 --%>
<script src="https://kit.fontawesome.com/7bb4972374.js" crossorigin="anonymous"></script>
<%-- 제이쿼리 --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%-- 스와이퍼 cdn --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script>
function ajax_Categories(typeName) {
    var categories = typeName;
    $.ajax({
        url: "/Categories",
        type: "POST",
        cache: false,
        dataType: 'json',
        data: { typeName:categories },
        async: false, // AJAX 요청을 동기적으로 처리합니다.
        success: function (data) {
        var list_container = $(".detail_list");
        list_container.empty();
             for (var i = 0; i < data.length; i++) {
                var content = data[i];
                list_container.append("<li class='z_height'><a href='goods_detail?type_detail=" + content + "'>" + content + "</a></li>");
             }
             var content = "";
             categories = "";
        },
        error: function (request, status, error) {
            console.log(error); // 에러 메시지를 콘솔에 출력
        }
    });
}
</script>
</head>
<body>
<% User_Entity user = (User_Entity) session.getAttribute("login_result"); %>
    <div>
        <div id="nav_con">
            <nav>
                <div>
                    즐겨찾기
                </div>
                <div id="right_nav">
                   <c:choose>
                       <c:when test = "${user == null}">
                           <div class="nav_right"><a href="/login">로그인</a></div>
                           <div class="nav_right"><a href="/signup">회원가입</a></div>
                       </c:when>
                        <c:otherwise>
                           <div class="myInfo"><h4>${user.getUser_name()}님</h4></div>
                           <div><h4><a href="/logout">로그아웃</a></h4></div>
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
        <div>
             <div class="swiper mySwiper">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="/img/스와이퍼2.jpg"></div>
                    <div class="swiper-slide"><img src="/img/스와이퍼1.jpg"></div>
                    <div class="swiper-slide"><img src="/img/스와이퍼3.jpg"></div>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <div class="swiper-pagination"></div>
             </div>
         </div>
         <div id="Today_items">
            <h3>오늘의 상품</h3>
            <div id="hot_item">
                <p>오늘 가장 HOT한 상품</p>
                <p>전체 보기</p>
            </div>
            <div id="Today_container">
                <div id="today_sub_con">
                    <div id="today_top">
                        <div class="today_top_item">
                            <img src="/img/필터.jpg">
                        </div>
                        <div class="today_top_item">
                            <img src="/img/화장실세제.jpg">
                        </div>
                    </div>
                    <div id="today_bottom">
                        <div class="today_bottom_item">
                            <img src="/img/에어컨.jpg">
                        </div>
                        <div class="today_bottom_item">
                            <img src="/img/삼계탕.jpg">
                        </div>
                        <div class="today_bottom_item">
                            <img src="/img/화장품.jpg">
                        </div>
                        <div class="today_bottom_item">
                            <img src="/img/세제.jpg">
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="/js/swiper.js"></script>
<script>
function Open_Categories() {
   $("#Categories_list").css('display', 'block');
}
function Close_Categoires() {
   $("#Categories_list").css('display', 'none');
}

     var swiper = new Swiper(".mySwiper", {
        spaceBetween: 10,    // 슬라이드 사이 여백

        slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
        centeredSlides: true,    //센터모드
        autoplay: {     //자동슬라이드 (false-비활성화)
          delay: 5000, // 시간 설정
          disableOnInteraction: false, // false-스와이프 후 자동 재생
        },

        loop : true,   // 슬라이드 반복 여부

        loopAdditionalSlides : 1,

 // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
        pagination: { // 호출(pager) 여부
          el: ".swiper-pagination", //버튼을 담을 태그 설정
          clickable: true, // 버튼 클릭 여부
        },
        navigation: {   // 버튼
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
</script>
</html>