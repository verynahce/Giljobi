<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
            <li><a href="/User/LoginForm">개인회원</a></li>
            <li class="active"><a href="/Company/LoginForm">기업회원</a></li>
          </ul>
          <form action="/Company/Login" method="POST">
          <ul class="login-input">
            <li><input type="text" name="company_id" placeholder="아이디"></li>
            <li><input type="text" name="company_pw" placeholder="비밀번호"></li>
          </ul>
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
	 <%
	    String clientId = "iP_8Cv0UhC7RyPImeUL2";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8080/", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	 %>
	  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
</body>
</html>