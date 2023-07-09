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
<% User_Entity user = (User_Entity) session.getAttribute("login_result");
out.println("세션에 저장된 사용자 이름: " + user);
%>
    <div>
        <nav>
            <div>
                즐겨 찾기
            </div>
            <div id="right_nav">
                <div>
                    <a href="login">로그인</a>
                </div>
                <div>
                    <a href="signup">회원가입</a>
                </div>
            </div>
        </nav>
         <c:choose>
                <c:when test = "${user == null}">
                    <button id="loginButton" onclick="location.href='/auth/login'">로그인</button>
                </c:when>
                <c:otherwise>
                    <div class="myInfo"><h4>${user.getUser_name()}님</h4></div>
                </c:otherwise>
         </c:choose>
    </div>
</body>
</html>