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
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
      	 <%
	    String clientId = "iP_8Cv0UhC7RyPImeUL2";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:9090/User/LoginForm", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	 %>
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
	            <li><input type="password" name="user_pw" placeholder="비밀번호"></li>
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
	  <a href="<%= apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
            <!-- 네이버 로그인 버튼 노출 영역 -->
    <div id="naver_id_login"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></div>
    
    
    
    <!-- 네이버 로그인 버튼 노출 영역 -->
    <div id="naver_id_login"></div>
    <!-- //네이버 로그인 버튼 노출 영역 -->
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("iP_8Cv0UhC7RyPImeUL2", "http://localhost:9090/User/LoginForm");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("white", 2,40);
        naver_id_login.setDomain("http://localhost:9090/");
        naver_id_login.setState(state);
        naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
    </script>
        </div>
      </main>
          <%
        String loginError = (String) request.getAttribute("loginError");
        if (loginError != null) {
    %>
        <script>
            alert("<%= loginError %>"); // 알림창 표시
        </script>
    <%
        }
    %>
</body>
</html>