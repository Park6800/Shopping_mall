<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/css/Auth_Page.css">
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
                      로그인
                 </div>
                 <div>
                      <a href="signup.jsp">회원가입</a>
                 </div>
            </div>
        </nav>
        <div>
            <div id="SignUP_Container">
            <form action="signup" method="post" enctype="application/x-www-form-urlencoded">
                <div>
                    <label for="">아이디</label><br>
                    <input type="text" placeholder="이메일 형태 아이디를 입력해주세요" name="User_id">
                    <p class="error" id="fir">${errors.getFieldError("User_id").defaultMessage}</p>
                </div>
                <div>
                    <label for="">비밀번호</label><br>
                    <input type="password" placeholder="비밀번호를 입력해주세요" name="User_pw">
                    <p class="error" id="sec">${errors.getFieldError("User_pw").defaultMessage}</p>
                </div>
                <div>
                    <label for="">비밀번호 재확인</label><br>
                    <input type="password" placeholder="비밀번호를 다시 입력해주세요" name="User_pw_chk">
                </div>
                <div>
                    <label for="">생년월일</label><br>
                    <input type="text" placeholder="생년월일 8 자리를 입력하세요" name="User_birth">
                    <p class="error" id="fou">${errors.getFieldError("User_birth").defaultMessage}</p>
                </div>
                <div>
                    <label for="">이름</label><br>
                    <input type="text" placeholder="이름을 입력하세요" name="User_name">
                    <p class="error" id="fou">${errors.getFieldError("User_name").defaultMessage}</p>
                </div>
                <div>
                    <label for="">전화번호</label><br>
                    <input type="text" placeholder=" '-' 기호업이 숫자만 입력 해주세요" name="User_phone">
                    <p class="error" id="pd">${errors.getFieldError("User_phone").defaultMessage}</p>
                </div>
                <div>
                    <button class="sign" type="submit" onclick="inputChk()">가입하기</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</body>
</html>