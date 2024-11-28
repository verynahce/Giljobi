<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
</head>
<body>
	<div class="pop-bg">
		<div class="support login-alter login-pop">
			  <c:choose>
				        <c:when test="${sessionScope.login.role == '개인회원'}">
									 <h2 class="s-title">기업회원 로그인이 필요합니다.</h2>
				         </c:when>
				         <c:when test="${sessionScope.login.role == '기업회원'}">
										<h2 class="s-title">개인회원 로그인이 필요합니다.</h2>
				         </c:when>
				        <c:otherwise>
										<h2 class="s-title">로그인이 필요합니다.</h2>
				      	</c:otherwise>
			     	</c:choose>     
	  	<a href ="">로그인</a>
		</div>
	</div>
	<%@include file="/WEB-INF/include/header.jsp" %>
	<main>
			 <div class="main-visual">
           <p><span>구직자</span> 와 <span>기업</span>을 잇는 가장 든든한 길!</p>
           <h2>길JOB이와 함께하세요!</h2>
           	   <c:choose>
				        <c:when test="${sessionScope.login.role == '개인회원'}">
									 <p><a class="resume-add" href="/User/MyPage/Resume/WriteForm?user_idx=${sessionScope.login.user_idx}">이력서 등록</a><a class="post-add">공고 등록</a></p>
				         </c:when>
				         <c:when test="${sessionScope.login.role == '기업회원'}">
										<p><a class="resume-add">이력서 등록</a><a class="post-add" href="/Company/Mypage/Post/WriteForm?company_idx=${sessionScope.login.company_idx}">공고 등록</a></p>
				         </c:when>
				        <c:otherwise>
										<p><a class="resume-add">이력서 등록</a><a class="post-add">공고 등록</a></p>
				      	</c:otherwise>
			     	</c:choose>      	
         </div>
       <div class="inner home-main">
         <div class="main-post">
           <h3>오늘의 추천공고</h3>
           <div class="main-post-list">
		   				<c:forEach var="card" items="${postList}">
		          		<div class="post-card">
		                <ul>
		                  <li class="post-card-img"><a href="/Main/Jobs/View?post_idx=${card.post_idx}"><img src="/images/duty/${card.duty_id}.png"></a></li>
		                  <li class="post-card-company">${card.company_name}</li>
		                  <li class="post-card-title"><a href="/Main/Jobs/View?post_idx=${card.post_idx}">${card.post_title}</a></li>
		                  <li class="post-card-info">${card.city_name}, ${card.duty_name}, ${card.career_name}</li>
		                </ul>
		              </div>
            </c:forEach>
           </div>
         </div>
       </div>
     </main>
	<%@include file="/WEB-INF/include/footer.jsp" %>
	<script>

	$(".pop-bg").on('click', function(e) {
     if($(e.target).closest('.login-pop').length == 0) { 
          $(".pop-bg").hide();
     }
	})
	

// 클릭 이벤트에 함수 연결
$(".resume-add").click(function(){
    const loginRole = "${sessionScope.login.role}";
    console.log(loginRole);
    if(loginRole !== "개인회원"){
        $(".login-pop a").attr("href","/User/LoginForm");
        $(".pop-bg").css("display","block");
    } 

});

$(".post-add").click(function(){
    const loginRole = "${sessionScope.login.role}";
    console.log(loginRole);
    if(loginRole !== "기업회원"){
        $(".login-pop a").attr("href","/User/LoginForm");
        $(".pop-bg").css("display","block");
    } 
});

	</script>
</body>
</html>