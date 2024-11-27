<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/common.js" defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
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
          <form action="/User/Register" id="form" method="POST" >
          <ul class="login-input">
           <li>
            <div class="id-container">
             <input type="text" name="user_id" placeholder="아이디" />
             <input type="button" id="checkDuplication" value="중복확인" />
            </div>
           </li>
            <li><input type="text" name="user_pw" id="user_pw" placeholder="비밀번호" ></li>
            <li><input type="text" id="user_pw2" placeholder="비밀번호확인" ></li>
          </ul>
          <ul class="login-input regist-radio">
            <li><input type="text" name="user_name" placeholder="이름" ></li>
            <li>
              <input type="text" name="user_birthdate" maxlength="8" placeholder="생년월일 8자리"  oninput="formatBirthNumber(this)" >
            </li>
            <li>
              <input type="text" name="user_tel" maxlength="13" placeholder="전화번호" oninput="formatPhoneNumber(this)" >
            </li>
            <li>
             <div class="email-container">
              <input type="email" id="user_email" name="user_email" placeholder="이메일 입력" />
                <select id="email_domain" onchange="updateEmail()">
                	<option value="" selected>직접입력</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="kakao.com">kakao.com</option>
                    <option value="yahoo.com">yahoo.com</option>
                    <option value="outlook.com">outlook.com</option>
                </select>
             </div>
            </li>
          </ul>
          <ul>
            <li class="address-btn"><button type="button" onclick="searchAddress()">주소 검색</button></li>
            <li class="login-input">
             <input type="text" name="user_address" id="roadFullAddr" placeholder="주소 검색을 해주세요" readonly required/>
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
	      
	      function searchAddress() {
	          window.open("/User/SearchAddress","pop","width=570,height=430, scrollbars=yes, resizable=yes");
	      }
	      function jusoCallBack(roadFullAddr){
	          document.getElementById('roadFullAddr').value = roadFullAddr;
	      }
	        function updateEmail() {
	            var emailInput = document.getElementById('user_email');
	            var domainSelect = document.getElementById('email_domain');

	            var selectedDomain = domainSelect.value;

	            if (selectedDomain) {
	                emailInput.value = emailInput.value.split('@')[0] + '@' + selectedDomain;
	            } else {
	                emailInput.value = emailInput.value.split('@')[0]; // 도메인 제거
	            }
	        }
		</script>
      <script>
	      const formEl       		 = document.querySelector('#form');
	      const useridEl     		 = document.querySelector('[name=user_id]');
	      const checkDuplicationEl   = document.querySelector('#checkDuplication');
	      const passwd1El    		 = document.querySelector('#user_pw');
	      const passwd2El    		 = document.querySelector('#user_pw2');
	      const usernameEl   	     = document.querySelector('[name=user_name]');
	      const birthdateEl   	     = document.querySelector('[name=user_birthdate]');
	      const telEl   	     	 = document.querySelector('[name=user_tel]');
	      const emailEl   	         = document.querySelector('[name=user_email]');
	
	       //공백확인 및 등록
	       formEl.onsubmit=function(){
	     	if(useridEl.value.trim() == ''){
	     		useridEl.focus();
	     		return false;
	     	}
	     	if(checkDuplicationEl.onclick == false){
	     		alert("중복확인을 해주세요")
	     		return false;
	     	}
	     	if (passwd1El.value.trim() == ''){
	     		passwd1El.focus();
	     		return false;
	     	}
	     	if( passwd1El.value.trim() != passwd2El.value.trim() ) {
	     	   alert('비밀번호와 비밀번호확인이 일치하지 않습니다')
	     	   passwd2El.focus();
	     	   return false;
	     	}
	     	if(usernameEl.value.trim() == ''){
	     		usernameEl.focus();
	     		return false;
	     	}
	     	if(birthdateEl.value.trim() == ''){
	     		birthdateEl.focus();
	     		return false;
	     	}
	     	if(telEl.value.trim() == ''){
	     		telEl.focus();
	     		return false;
	     	}
	     	if(emailEl.value.trim() == ''){
	     		emailEl.focus();
	     		return false;
	     	}
	     	return true;
	       };
	       
	       $(function() {
	           $('#checkDuplication').on('click', function() {
	               const inputUserid = $('[name=user_id]').val().trim(); // 사용자 입력 아이디 가져오기
	
	               if (inputUserid === '') {
	                   alert("아이디를 입력하세요.");
	                   return;
	               }
	
	               $.ajax({
	                   url: '/User/CheckDuplication',
	                   method: 'GET',
	                   data: { user_id: inputUserid }
	               })
	               .done(function(data) {
	                   console.log("Duplication Check Response:", data); // 서버 응답 확인
	                   if (data.trim() === "가능") {
	                       alert(inputUserid + '은(는) 사용 가능한 아이디입니다.');
	                   } else {
	                       alert(inputUserid + '은(는) 사용할 수 없는 아이디입니다.');
	                   }
	               })
	               .fail(function(err) {
	                   console.error("Error during duplication check:", err);
	                   alert("중복 확인 중 오류가 발생했습니다.");
	               });
	        	});
	       });
      </script>
      
      </main>
			
</body>
</html>
