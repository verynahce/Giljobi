<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/common.js" defer></script>
<style>
.login-inner {
  & .login-type li.active {
    background: #4876EF;
  }
  & .login-btn{
  	& button{
  		background: #4876EF;
  	}
  }
  .alert {
    color: red;
    font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
     <main>
        <div class="login-inner">
          <h1>
            <a href="/"><img src="/images/logo.png" alt="logo"></a>
          </h1>
          <ul class="login-type">
            <li><a href="/User/LoginForm">개인회원</a></li>
            <li class="active"><a href="/Company/LoginForm">기업회원</a></li>
          </ul>
          <form action="/Company/Login" method="POST">
          <ul class="login-input">
            <li><input type="text" name="company_id" placeholder="아이디"></li>
            <li><input type="password" name="company_pw" placeholder="비밀번호"></li>
          </ul>
              <c:if test="${not empty sessionScope.loginFalseMessage}">
          <br>
        <div class="alert">
            ${sessionScope.loginFalseMessage}
        </div>
    <br>
        <c:remove var="loginFalseMessage" scope="session"/> <!-- 메시지를 출력 후 세션에서 제거 -->
    </c:if>
          <p>
            <input type="checkbox" id="keepId">
            <label for="keepId">아이디 저장</label>
          </p>
          <ul class="login-btn">
            <li><button type="submit">로그인</button></li>
            <li><a href="/Company/RegisterForm">회원가입</a></li>
          </ul>
          
          </form>
        </div>
      </main>

</body>
</html>