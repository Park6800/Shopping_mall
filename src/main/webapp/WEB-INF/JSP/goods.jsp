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
<title>굿즈 페이지</title>
<link rel="stylesheet" href="/css/Goods.css">
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
                            img
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
                        마이 페이지
                    </div>
                    <div id="My_basket">
                        장바구니
                    </div>
                </div>
            </div>
        </div>
        <div id="Type_container">
            <div id="Type_name_list">
                <c:forEach var="Goods" items="${Goods_info}">
                    <div>
                        <div class="TypeNames"><a href="">${Goods.goodsType}</a></div>
                    </div>
                </c:forEach>
            </div>
            <div id="img_type">
                <c:forEach var="Goods" items="${Goods_info}">
                    <div class="img_display">
                            <img src="${Goods.goodsUrl}">
                        <div class="TypeName">
                                ${Goods.goodsType}
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="bin_con">
                멈춰!
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