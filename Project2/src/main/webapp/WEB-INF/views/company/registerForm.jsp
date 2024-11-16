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
            <li><a href="/User/RegisterForm">개인회원</a></li>
            <li class="active"><a href="/Company/RegisterForm">기업회원</a></li>
          </ul>
          <form action="/Company/Register" method="POST">
          <ul class="login-input">
            <li><input type="text" name="company_id" placeholder="아이디"></li>
            <li><input type="text" name="company_pw" placeholder="비밀번호"></li>
          </ul>
          <ul class="login-input">
            <li><input type="text" name="company_name" placeholder="기업명"></li>
            <li>
              <input type="text" name="company_area" placeholder="산업군">
            </li>
            <li>
              <input type="text" name="company_brnum" maxlength="12" placeholder="사업자등록번호" oninput="formatBRNumber(this)">
            </li>
          </ul>
          <ul class="login-input">
            <li><input type="text" name="rep_name" placeholder="담당자 이름"></li>
            <li>
              <input type="text" name="company_tel" maxlength="13" placeholder="연락처" oninput="formatPhoneNumber(this)">
            </li>
            <li>
              <input type="email" name="company_email" placeholder="담당자 이메일">
            </li>
          </ul>
          <div class="login-btn">
            <button type="submit">회원가입</button>
            <p class="regist-info">이미 회원이세요?<a href="/Company/LoginForm">로그인</a></p>
          </div>
          </form>
        </div>
      </main>
      <script>
	      function formatPhoneNumber(input) {
	    	    // 숫자만 허용
	    	    let cleanedInput = input.value.replace(/[^0-9]/g, '');
	
	    	    // 010으로 시작하는지 확인
	    	    if (cleanedInput.startsWith('010')) {
	    	        if (cleanedInput.length > 7) {
	    	            input.value = cleanedInput.replace(/(\d{3})(\d{4})(\d{1})/, '$1-$2-$3');
	    	            
	    	        } else if(cleanedInput.length > 3){
	    	        	 input.value = cleanedInput.replace(/(\d{3})(\d{1})/, '$1-$2');
	    	        } else {
	    	            input.value = cleanedInput; // 11자리가 아닐 경우 하이픈 추가하지 않음
	    	        }
	    	    }
	    	  }
      
      function formatBRNumber(input) {
  	    // 숫자만 허용
  	    let cleanedInput = input.value.replace(/[^0-9]/g, '');

  	    // 010으로 시작하는지 확인

  	        // 11자리 숫자일 경우
  	        if (cleanedInput.length > 5) {
  	            input.value = cleanedInput.replace(/(\d{3})(\d{2})(\d{1})/, '$1-$2-$3');
  	            
  	        } else if(cleanedInput.length > 3){
  	        	 input.value = cleanedInput.replace(/(\d{3})(\d{1})/, '$1-$2');
  	        } else {
  	            input.value = cleanedInput; // 11자리가 아닐 경우 하이픈 추가하지 않음
  	        }
  	    } 
			</script>
</body>
</html>