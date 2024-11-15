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
						<li class="active"><a href="/User/RegisterForm">개인회원</a></li>
            <li><a href="/Company/RegisterForm">기업회원</a></li>
          </ul>
          <form action="/User/Register" method="POST">
          <ul class="login-input">
            <li><input type="text" name="user_id" placeholder="아이디"></li>
            <li><input type="text" name="user_pw" placeholder="비밀번호"></li>
          </ul>
          <ul class="login-input regist-radio">
            <li><input type="text" name="user_name" placeholder="이름"></li>
            <li>
              <input type="text" name="user_birthdate" maxlength="8" placeholder="생년월일 8자리"  oninput="formatBirthNumber(this)">
            </li>
            <li>
              <input type="text" name="user_tel" maxlength="13" placeholder="전화번호" oninput="formatPhoneNumber(this)">
            </li>
            <li>
              <input type="email" name="user_email" placeholder="이메일">
            </li>
          </ul>
          <ul class="input-radio">
            <li><input id="gender-male" type="radio" name="user_gender" value="남" checked><label for="gender-male">남</label></li>
            <li><input id="gender-female" type="radio" name="user_gender" value="여"><label for="gender-female">여</label></li>
          </ul>
          <div class="login-btn">
            <button type="submit">회원가입</button>
            <p class="regist-info">이미 회원이세요?<a href="/User/LoginForm">로그인</a></p>
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
    	        // 11자리 숫자일 경우
    	        if (cleanedInput.length > 7) {
    	            input.value = cleanedInput.replace(/(\d{3})(\d{4})(\d{1})/, '$1-$2-$3');
    	            
    	        } else if(cleanedInput.length > 3){
    	        	 input.value = cleanedInput.replace(/(\d{3})(\d{1})/, '$1-$2');
    	        } else {
    	            input.value = cleanedInput; // 11자리가 아닐 경우 하이픈 추가하지 않음
    	        }
    	    } else {
    	        // 010이 아닐 경우 입력값 초기화
    	        input.value = cleanedInput;
    	    }
    	}
      
      function formatBirthNumber(input) {
  	    // 숫자만 허용
  	    let cleanedInput = input.value.replace(/[^0-9]/g, '');
  	    input.value = cleanedInput;
      }
			</script>
</body>
</html>