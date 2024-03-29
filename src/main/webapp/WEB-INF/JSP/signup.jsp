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
            <form action="signup" method="post" enctype="application/x-www-form-urlencoded">
                <div>
                    <div class="label_name">
                        <label for="">아이디</label><br>
                    </div>
                    <input type="text" placeholder="이메일 형태 아이디를 입력해주세요" name="User_id" class="text_input">
                    <p class="error" id="fir">${errors.getFieldError("User_id").defaultMessage}</p>
                </div>
                <div>
                    <div class="label_name">
                        <label for="">비밀번호</label><br>
                    </div>
                    <input type="password" placeholder="비밀번호를 입력해주세요" name="User_pw" class="text_input">
                    <p class="error" id="sec">${errors.getFieldError("User_pw").defaultMessage}</p>
                </div>
                <div>
                    <div class="label_name">
                        <label for="">비밀번호 재확인</label><br>
                    </div>
                    <input type="password" placeholder="비밀번호를 다시 입력해주세요" name="User_pw_chk" class="text_input">
                </div>
                <div>
                    <div class="label_name">
                        <label for="">생년월일</label><br>
                    </div>
                    <input type="text" placeholder="생년월일 8 자리를 입력하세요" name="User_birth" class="text_input">
                    <p class="error" id="fou">${errors.getFieldError("User_birth").defaultMessage}</p>
                </div>
                <div>
                    <div class="label_name">
                        <label for="">이름</label><br>
                    </div>
                    <input type="text" placeholder="이름을 입력하세요" name="User_name" class="text_input">
                    <p class="error" id="fou">${errors.getFieldError("User_name").defaultMessage}</p>
                </div>
                <div>
                    <div class="label_name">
                        <label for="">전화번호</label><br>
                    </div>
                    <input type="text" placeholder=" '-' 기호업이 숫자만 입력 해주세요" name="User_phone" class="text_input">
                    <p class="error" id="pd">${errors.getFieldError("User_phone").defaultMessage}</p>
                </div>
                <div>
                    <button class="sign" type="submit" onclick="inputChk()" id="Submit_btn">가입하기</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</body>
</html>