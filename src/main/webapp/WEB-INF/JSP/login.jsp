<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        <div>
            <div id="SignUP_Container">
                <form action="loginresult" method="post">
                    <div>
                        <div>
                            <label for="">아이디</label><br>
                            <input type="text" name="User_id" placeholder="아이디를 입력해주세요">
                        </div>
                        <div>
                            <label for="">비밀번호</label><br>
                            <input type="password" name="User_pw" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <div>
                            <button type="submit">로그인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>