<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
<script src="/js/header.js" defer ></script>
<style>
/*오버레이*/
.overlay {
  
  position: fixed;
  top: 0;
  left: 0;
  z-index: 2;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display:none;
    transition: all 0.3s  ease-in;
 }

 /*body*/
.inner {
  display:flex;
  justify-content: space-between;
}

main {
  background-color:#F0F2F5;
}

.innercontents {
  display:flex;
  gap:30px;
  font-family: pretendard; 
  padding-top:30px; 
  padding-bottom:60px; 
}

 .container {
  width:  100%;
  display:flex;
  flex-direction: column; 
  justify-content: center;
}
 
 .contain-body {
  width:1040px;
  height:auto;
  background-color: white;
  border-radius: 20px;
  margin: 0px auto 60px  auto  ;
  padding: 15px 60px 50px 40px;
}


.main-title {
  color: #333333;
  font-size: 36px; 
  font-weight: 600; 
  line-height: 50.40px;
  padding-bottom: 14px; 
  padding-top: 10px;
}
 
 #info {
  display: flex;
  font-size:18px;
  align-items:center;
  height:30px;
}

 /*서브 분야들*/ 
 .sub-filed{
          
}


/*서브 - 긴글*/
.sub-content {   
  width:100%;
  heigth:auto;
  color: #3d3c3c;
  margin-top:25px;
  padding-left:15px;
  font-size:20px;
  margin-bottom:20px;
}

/*버튼*/

.btn-layout {
  margin: 0 auto;
}

.btn {
  display: inline-block;
  width: 200px; 
  height: 60px;   
  border-radius: 8px;
  a {
    display: block;
    text-decoration: none; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 60px;
  }
}

.btn-back {
  background: white; 
  color: #4876EF;
  border:1px solid #4876EF;
}

/*Q 마크*/
#question-mark {
  color:#4876EF;
}

/*질문자 duty*/
#question-duty {
  margin-top:15px;
  margin-bottom:0px;
  width:70px;
  background-color:#EBECF1;
  text-align:center;
  font-size:20px;
  border-radius:4px;
}

/*답변 수*/
#replycount {
  color:#4876EF;
}

/*디바이더(가로선)*/
.divider {
  border:none;
  height:1px;
  background-color:#ccc;
}

/* 좋아요 공유하기 버튼*/
.likenshare {
  text-align:center;
  font-size:20px;
  padding-top:10px;
  display:flex;
  flex-direction:row;
  justify-content:center;
}



/*댓글 div전체*/
.replyarea {
  display:flex;
  flex-direction:row;
  gap:5px;
  margin-top:20px;
}

/*댓글 필터영역*/
.replyfilter {
  width:80px;
  text-align:center;
  color:#7B7979;
  td {
    border:1px solid #A8A8A8;
    background-color:#FDFCFC;
  }
}

/*댓글입력, 등록칸*/
.replycontent {
  width:100%;
  td {
    border:1px solid black;
  }
}

.replycontent td:nth-child(1) {
  padding-left:10px;
}

.replycontent td:nth-child(2) {
  text-align:center;
  background-color:#2B4A99;
  color:white;
}

/*등록칸 a태그 꽉차게*/
.reply-register {
  display:block;
}

/*질문자 닉네임 표시*/
.nickname {
  padding-bottom:10px;
}

/*답변자 필터*/
.replier {
  margin: 15px 0px 0px 15px;
  display:flex;
  gap:15px;
  font-size:19px;
}

/*댓글창 답변자 경력*/
#replier-career {
  color:#7B7979;
}


/*답댓글 좋아요 버튼*/
.reply-like {
  display:flex;
  border:1px solid #A8A8A8;
  width:70px;
  margin-left:15px;
  margin-top:5px;
  height:35px;
  margin-bottom:10px;
}

/**/
.reply-date {
  color:#7B7979;
  padding-left:15px;
  margin-top:5px;
}

.likea {
  display:block;
  width:100%;
  height:100%;
  display:flex;
  align-items:center;
  justify-content:center;
}

.replytext {
  width:100%;
  border:none;
  resize:none;
  height:100%;
  font-size:20px;
  outline:none;
}

.replytext::placeholder {
  position:relative;
  top:15px;
}

.atags {
  display:block;
  display:flex;
  align-items:center;
  justify-content:center;
}

</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>


	<div class="overlay">  
	<c:choose>
		<c:when test="${not empty postVo}">
			 <div class="support"> 
			   <div class="s-header">
			      <h2 class="s-title">채용제의</h2><span class="s-delete">x</span>
			   </div>
			    <table class="s-list">
			     <c:forEach var="post" items="${postVo}">
              <tr>
                <td>
					<input type="radio" name="post_idx" id="post_id${post.post_idx}" class="resume-input" value="${post.post_idx}">
					<label for="post_id${post.post_idx}">${post.post_title}</label>
                </td>
              </tr>
            </c:forEach>
          </table>
			   <div class="s-btn" ><a class="apply-val" href ="">채용제의</a></div> 
			</div>
		</c:when>
		  <c:otherwise>
		  	<div class="support login-alter">
		      <h2 class="s-title">기업회원 로그인이 필요합니다.</h2>
			  <a href ="/Company/LoginForm">로그인</a>
		   </div>
		  </c:otherwise>
	</c:choose>	
	</div>
	
	
<main>
  <div class="inner">  
    <div class="innercontents">
       <div class="container" >
        <div class="contain-body">
         <div id="question-duty">${ct.duty.dutyName}</div>       
          <h2 class="main-title"><span id="question-mark">Q</span>&nbsp;&nbsp;<!-- ${resumeVo.resume_title} -->이력서는 쳐다도 안보는 건가요?</h2>
           <div id="info">${ct.comHit}<img src="/images/community/divider2.png">${ct.comRegdate}&nbsp;작성</div>
            <div class="sub-filed">
	         <div class="sub-content">${ct.comTitle}</div>
	         <div class="nickname">닉네임&nbsp;&nbsp;:&nbsp; ${ct.users.user_name}씨</div>
	         <hr class="divider">
	         <div class="likenshare">
	          <span><a class="atags" href=""><img src="/images/community/like.png">&nbsp;${ct.comLike}</a></span>
	          &nbsp;&nbsp;&nbsp;&nbsp;
	          <span><a class="atags" href=""><img src="/images/community/share.png">&nbsp;공유하기</a></span>
	         </div>
	        </div>     
	        <div class="replyarea">
	         <table class="replyfilter">
	          <tbody>
	           <tr><td><a href="" class="atags"><img src="/images/community/down.png">직무</a></td></tr>
	           <tr><td><a href="" class="atags"><img src="/images/community/down.png">경력</a></td></tr>
	          </tbody>
	         </table> 
	         <table class="replycontent">
	          <tbody>
	           <tr>
	            <td><textarea class="replytext" placeholder="답변을 입력하세요"></textarea></td>
	            <td><a href="" class="reply-register">등록</a></td>
	           </tr>
	          </tbody>
	         </table>
	        </div>
        </div>
        <div class="contain-body">
          <h2 class="main-title"><!-- ${resumeVo.resume_title} -->답변&nbsp;&nbsp;<span id="replycount">2</span></h2>
          <hr class="divider">
            <div class="sub-filed">
             <div class="replier">익명의<span id="replier-career">IT/5년차</span></div>
	         <div class="sub-content">${resumeVo.cover_letter}2시간 거리면 다른곳 알아보세요.. 넘 멀어요. 금방 지쳐서 오래 못다님</div>
	         <div class="reply-date">2일전 작성</div>
	         <div class="reply-like"><a href="" class="likea"><img src="/images/community/like.png">&nbsp;<span>0</span></a></div>
              <hr class="divider">
	        </div>     
        </div>
        <div class="btn-layout">
        <div class="btn btn-back"><a href ="/Company/Mypage/Bookmark/List?company_idx=${company_idx}">목록보기</a></div>
        </div>
       </div>
    </div>
 </div>

</main>

 
 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 <script>
 
 //오버레이 
 $(function(){
	 
	$('.btn-apply').on('click', function(e){
		 e.preventDefault();
		$('.overlay').show();		
						
	})
	$('.s-delete').on('click', function(){
		$('.overlay').hide();				
	})
	$('.s-btn').on('click', function(){
		$('.overlay').hide();				
	})
		$(".overlay").on('click', function(e) {
    if($(e.target).closest('.support').length == 0) { 
         $(".overlay").hide();
    }

})

  $(".apply-val").attr("href","/Company/Mypage/Bookrmark/Support?resume_idx=${resumeVo.resume_idx}&post_idx=${0}")
		console.log( $(".apply-val").attr("href"))
  $(".resume-input").click(function(e){
			console.log(e.target.value)
			$(".apply-val").attr("href","/Company/Mypage/Bookrmark/Support?resume_idx=${resumeVo.resume_idx}&post_idx="+e.target.value)
		})



 const links = document.querySelectorAll(".link");

//사이드 바 클릭시

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
	 
 
 })
 </script>
 
</body>
</html>