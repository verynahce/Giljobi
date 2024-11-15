<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/common.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
     <main>
        <div class="login-inner">
          <h1>
            <a href="/"><img src="/images/logo.png" alt="logo"></a>
          </h1>
          <ul class="login-type">
            <li class="active"><a href="/User/LoginForm">개인회원</a></li>
            <li><a href="/Company/LoginForm">기업회원</a></li>
          </ul>
          <form action="/User/Login" method="POST">
	          <ul class="login-input">
	            <li><input type="text" name="user_id" placeholder="아이디"></li>
	            <li><input type="text" name="user_pw" placeholder="비밀번호"></li>
	          </ul>
	          <p>
	            <input type="checkbox" id="keepId">
	            <label for="keepId">아이디 저장</label>
	          </p>
	          <ul class="login-btn">
	            <li><button type="submit">로그인</button></li>
	            <li><a href="/User/RegisterForm">회원가입</a></li>
	          </ul>
          </form>
        </div>
      </main>
</body>
</html>