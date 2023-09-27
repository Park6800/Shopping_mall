<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="shopping_mall.Repository.*"%>
<%@ page import="shopping_mall.Entity.User_Entity" %>
<%@ page import="shopping_mall.Entity.GoodsDetail_Entity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 상세 페이지</title>
<link rel="stylesheet" href="/css/GoodsDetail.css">
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
                list_container.append("<li class='z_height'><a href='/goods_detail?type_detail=" + content + "'>" + content + "</a><li>");
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
<%-- 제이쿼리 --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
        <div>
            <div id="categories_con">
                <div id="categories">
                    <div id="categories_btn" onmouseover="Open_Categories()" onmouseout="Close_Categoires()">
                        <div id="re">
                            <div id="position">
                                카테고리
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

                    </div>
                    <div id="img_type">
                         <c:forEach var="Goods" items="${Goods_detail}">
                            <div class="img_display">
                                <a href="goods_info?GoodsName=${Goods.goodsName}">
                                    <div class="TypeName">
                                        <img src="${Goods.goodsUrl}">
                                        ${Goods.goodsName}
                                    </div>
                                </a>
                            </div>
                         </c:forEach>
                    </div>
                    <div id="bin_con">
                    </div>
                </div>
            </div>
</body>
<script>
function Open_Categories() {
   $("#Categories_list").css('display', 'block');
}
function Close_Categoires() {
   $("#Categories_list").css('display', 'none');
}
</script>
</html>