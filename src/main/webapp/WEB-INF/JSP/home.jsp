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
<%-- 제이쿼리 --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<% User_Entity user = (User_Entity) session.getAttribute("login_result"); %>
    <div>
        <div id="nav_con">
            <nav>
                <div>
                    즐겨 찾기
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
        <div id="categories">
            <div id="categories_btn">
                카테고리
            </div>
            <div id="search_con">
                <div id="logo_img">
                    img
                </div>
                <div id="search">
                    <select id="select_search">
                        <option value=>하이</option>
                    </select>
                    <input type="text" id="input_search">
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
</body>
</html>