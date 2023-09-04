<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="/css/Auth_Page.css">
<%-- 제이쿼리 --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div>
        <nav>
            <div>
                <a href="home">
                    홈 페이지 이동
                </a>
            </div>
            <div id="Select_Page">
                <div id="Login_page" class="Auth_select_btn">
                    <a href="login">로그인</a>
                </div>
                <div id="Sign_page" class="Auth_select_btn">
                    <a href="signup">회원가입</a>
                </div>
            </div>
        </nav>
        <div>
            <div id="SignUP_Container">
                <form action="loginresult" method="post">
                    <div>
                        <div>
                            <label for="">아이디</label><br>
                            <input type="text" name="User_id" placeholder="아이디를 입력해주세요" class="text_input">
                        </div>
                        <div>
                            <label for="">비밀번호</label><br>
                            <input type="password" name="User_pw" placeholder="비밀번호를 입력해주세요" class="text_input">
                        </div>
                        <div>
                            <button type="submit" id="Submit_btn">로그인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>