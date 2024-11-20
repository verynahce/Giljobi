<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>

<style>
 .innercontents {
   display:flex;
   gap:120px;
 }
 
 .sidebar {
   border :1px solid #ccc;
   width:300px;
   height:378px;
   border-radius:15px;
   overflow:hidden;
   margin:0;
   position:sticky;
   top:124px;
 }
 
 .sidebar table {
   width:100%;
   margin:0;
   border-spacing:0;
 }

 .sidebar th {
   background-color:#333;
   color:white;
   height:80px;
   margin:0;
   font-size:25px;
 }
 .sidebar td {
   padding:15px 15px;;
   margin:0;
   
 }
 
 .sidebar a {
   display:block;
   padding:10px 0;
   text-decoration:none;
   border-radius:7px;
   padding-left:10px;
   color: #767676;
   display:flex;
   align-items:center;
 }
   
 .sidebar a:hover {
   background-color: #EBECF1;
   color: #111;
 }
 
 .sidebar a img {
   margin-right:10px;
   
 }

 .container {
   display :flex;
   flex-direction:column;
   align-items:left;
   width: 100%;
 }
 
 .title {
   text-align:center;
   margin-bottom:30px;
    font-size:36px;
   font-weight:550;
 }
 
 .subtitle {
   font-weight:450;
   font-size:24px;
   padding-bottom:14px;
 }
 
 .contents {
   width:550px;
 }
 
 .info {
   display:flex;
   padding-top:23px;
   flex-direction:row;
 }
 
 .info-content {
   display:flex;
   flex-direction:column;
   margin-left:15px;
 }
 
 #info-title {
   font-weight:465;
   font-size:20px;
 }
 
 #info-year {
   color:#767676;
 }
 
 .profile-image {
   display:flex;
   flex-direction:column;
   align-items:center;
 }
 
 #profileimage-update {
   color:#767676;
   border: 1px solid silver;
   border-radius:5px;
   text-align:center;
   width:85%;
   margin-top:10px;
 }
 #profileimage-updatebtn {
   display:block;
 }
 
 .info-sub {
   display:flex;
   flex-direction:row;
   margin-top:70px;
   gap:30px;
   width:100%;
   padding-right:0;
   padding-left:45px;
   justify-content:left;
 }
 
 .updatetitles {
   width:110px;
   margin-right:15px;
 }
 
 .updateinputs {
   border:1px solid silver;
   border-radius:5px;
   width:330px;

 }
 .inputs {
   border:none;
   outline:none;
 }

 .underline {
   border-bottom: 1px solid silver;
   border-collapse:collapse;
   padding:15px;
 }
 
 .updateinputs tr:last-child .underline {
   border-bottom: none;
 }
 
 .btn-layout {
   margin: 100px 180px;
   display: flex; 
   justify-content: space-between;
}

 .btn {
   display: inline-block;
   width: 200px; 
   height: 60px;   
   border-radius: 8px;
   font-size: 16.1px; 
   
 }
   
 .btn:hover {
  background-color:#666577;
  color: white;
   } 

 .btn-back, .btn-delete {
   background: #585766; 
   color: white;
   padding: 20px;
   margin : 10px;

 }
 
 
</style>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>
 <main>
  <div class="inner">
      <div class="innercontents">
       <div class="sidebar">
         <table>
         <tr><th>개인서비스</th></tr>
         <tr><td><a href="/User/MyPage/Home/View" class="active-color"><img src="/images/myhome.svg" class="img">MY홈</a></td></tr>
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
         <tr><td><a href="/User/MyPage/Notice/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/Mail.svg" class="img" data-hover="/images/Mail.svg">수신함</a></td></tr>
        </table>
       </div>
       <div class="container">
      	<div class="contents">
      	 <h2 class="title">회원 정보 수정</h2>
      	 <h3 class="subtitle">기본정보</h3>
      	 <hr>
      	 <div class="info">
      	  <div class="profile-image">
      	  	<img src="/images/profile.png"/>
      	    <span id="profileimage-update"><a href="" id="profileimage-updatebtn">프로필 변경</a></span>
      	  </div>
      	  <div class="info-content">
      	  	<h3 id="info-title">${userVo.user_name}</h3>
      	    <p id="info-year">${userVo.user_gender}, ${age}세(${UYear}년)</p>
      	  </div>      	 
      	 </div>
       <form action="/User/MyPage/Home/update" method="POST">
       <input type="hidden" name="user_idx" value="${userVo.user_idx}"/>
      	 <div class="info-sub">
      	  <table class="updatetitles">
      	  	<tr>
      	   	  <td>아이디</td>
      	  	</tr>
      	  	<tr>
      	   	  <td>비밀번호</td>
      	  	</tr>
    	  	<tr>
      	   	  <td>비밀번호 확인</td>
      	  	</tr>
      	  </table>
      	  <table class="updateinputs">
      	  	<tr>
      	   	  <td class="underline"><input type="text" class="inputs"name="user_id" value="${userVo.user_id}" readonly></td>
      	  	</tr>
      	  	<tr>
      	   	  <td class="underline"><input type="password"  name="user_pw"class="inputs passwd1" value=""placeholder="비밀번호"required></td>
      	  	</tr>
    	  	<tr>
      	   	  <td class="underline"><input type="password" class="inputs passwd2"  value="" placeholder="비밀번호 확인"required></td>
      	  	</tr>
      	  </table>
      	 </div>
      	 <div class="info-sub">
      	  <table class="updatetitles">
      	  	<tr>
      	   	  <td>이름</td>
      	  	</tr>
      	  	<tr>
      	   	  <td>생년월일</td>
      	  	</tr>
    	  	<tr>
      	   	  <td>전화번호</td>
      	  	</tr>
      	  	<tr>
      	   	  <td>이메일</td>
      	  	</tr>
      	  </table>
      	  <table class="updateinputs">
      	  	<tr>
      	   	  <td class="underline"><input type="text" class="inputs" name="user_name"value="${userVo.user_name}" required></td>
      	  	</tr>
      	  	<tr>
      	   	  <td class="underline"><input type="text" class="inputs"name="user_birthdate" id="bdate"value="${userVo.user_birthdate}"required></td>
      	  	</tr>
    	  	<tr>
      	   	  <td class="underline"><input type="text" class="inputs" name="user_tel"id="tel" value="${userVo.user_tel}"required></td>
      	  	</tr>
      	  	<tr>
      	   	  <td class="underline"><input type="email" class="inputs" name="user_email"value="${userVo.user_email}"required></td>
      	  	</tr>
      	  </table>     	 
      	</div>
      	   
      	   <div class="btn-layout">
      	      <input  type="hidden"  name="user_idx"value="${userVo.user_idx}"/>
              <input class="btn btn-back" type="submit" value="회원정보 수정"/>             
              <input class="btn btn-delete" type="button" value="회원 탈퇴"/>                        
         </div>
          </form>
      	</div>
       </div>
      </div>
 </div>

</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
<script>
$(function() {
	

    const links = document.querySelectorAll(".link");

    links.forEach(link => {
        const img = link.querySelector(".img");
        const originalSrc = img.src;
        const hoverSrc = img.getAttribute("data-hover");

        link.addEventListener("mouseover", () => {
            img.src = hoverSrc;
        });

        link.addEventListener("mouseout", () => {
            img.src = originalSrc;
        });
    });

    $('.btn-back').on('click', function() {
      
    	const passwd1 = $('.passwd1').val().trim()
        const passwd2 = $('.passwd2').val().trim()
        const bdate = $('#bdate').val().trim()
        const tel = $('#tel').val().trim()
        const serverPassword = '${userVo.user_pw}';
       
        const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
        
         if( passwd1 == '') {
    		alert('비밀번호를 입력하세요')
    		$('.passwd1').focus()
    		return false
    	}else if( passwd1 !== serverPassword) {
    		alert('비밀번호가 틀립니다')
    		$('.passwd1').focus()
    		return false
    	}else if(passwd2 !== passwd1) {
    		alert('비밀번호가 다릅니다')
    		$('.passwd2').focus()
    		return false
    	}else  if(bdate.length !== 8) {
    		alert('생년월일은 8글자입력해주세요')
    		$('#bdate').focus()
    		return false
    	}else  if(!phoneRegex.test(tel)) {
    		alert('올바른 전화번호 형식이 아닙니다')
    		$('#tel').focus()
    		return false
    	}else{
    		return true;
    	}
         
    	
    })

    $('.btn-delete').on('click', function() {
        if (confirm("정말 탈퇴하시겠습니까?")) {
            location.href = "/User/MyPage/Home/Delete?user_idx="+${userVo.user_idx};
        }
    });

    
})
 
</script>

</body>
</html>