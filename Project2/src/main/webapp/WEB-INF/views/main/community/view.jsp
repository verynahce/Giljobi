<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
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
  justify-content: center;
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
  width:140px;
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

  select {
  
	border:1px solid #A8A8A8;
	background-color:#FDFCFC;
	width: 120px;
	height: 100%;
	margin: 0px;
	padding: 3px;
    font-size: 15px;
  }
  
}

/*댓글입력, 등록칸*/
.replycontent {

  td {
    border:1px solid #A8A8A8;
    
  }
}

.replycontent td:nth-child(1) {
  padding-left:10px;
  width: 700px;
}

.replycontent td:nth-child(2) {
  text-align:center;
  background-color:#2B4A99;
  color:white;
   width: 105px;
}

/*등록칸 a태그 꽉차게
.reply-register {
  display:inline-block;
}
*/
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
.reply-delete {
  display:flex;
  justify-content:center;
  align-items:center;
  border:1px solid #A8A8A8;
  width:70px;
  margin-left:7px;
  margin-top:5px;
  height:35px;
  margin-bottom:10px;
  cursor: pointer;
}
.reply-delete:hover{
background-color: #E4EBFF;
}

.reply-frame{
display:flex;
justify-content: flex-start;
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
.Like2 {
background-color: #F8E372;

}
.Like {
padding: 4px;
border-radius: 12px;
}
.Like:hover{
background-color: #E4EBFF !important;
}
</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>

	
<main>
  <div class="inner">  
    <div class="innercontents">
       <div class="container" >
        <div class="contain-body">
         <div id="question-duty">${ct.duty.dutyName}</div>       
          <h2 class="main-title"><span id="question-mark">Q</span>&nbsp;&nbsp;${ct.comTitle}</h2>
           <div id="info"><img src="/images/community/Eye.png">&nbsp;&nbsp;${ct.comHit}<img src="/images/community/divider2.png">${ct.comRegdate}&nbsp;&nbsp;작성</div>
            <div class="sub-filed">
	         <div class="sub-content">${ct.comContent}</div>
	         <div class="nickname">닉네임&nbsp;&nbsp;:&nbsp; ${ct.users.userName}씨</div>
	         <hr class="divider">
	         <div class="likenshare">
	          <span><a class="atags Like" href="#" data-idx="${ct.communityIdx}"><img src="/images/community/like.png">&nbsp;<span class="likeCount">${ct.comLike}</span></a></span>
	          &nbsp;&nbsp;&nbsp;&nbsp;
	          <span><a class="atags share" href=""><img src="/images/community/share.png">&nbsp;공유하기</a></span>
	         </div>
	        </div>     
	        <div class="replyarea">
	         <table class="replyfilter">
	          <tbody>
	           <tr><td>
	           <select id="dutyId" class="atags">	           
		       <option>직무</option>
		      <c:forEach var="d" items="${dutyList}">
		      <option value="${d.dutyId}">${d.dutyName}</option>
		      </c:forEach>
	           </select>
	           </td></tr>
	           <tr><td>
	          <select id="careerSelf"class="atags">	           
		       <option>경력</option>
		       <option>신입</option>
		       <option>1년차</option>
		       <option>2년차</option>
		       <option>3년차</option>
		       <option>5년차</option>
		       <option>8년차</option>
	           </select>
	           </td></tr>
	          </tbody>
	         </table> 
	         <table class="replycontent">
	          <tbody>
	           <tr>
	            <td>
	            <textarea id="replyContent" class="replytext" placeholder="답변을 입력하세요"></textarea>
	            </td>
	            <td><a href="/Main/Reply/Write" class="reply-register" >등록</a></td>
	           </tr>
	          </tbody>
	         </table>

	        </div>
        </div>
        <div class="contain-body ">
          <h2 class="main-title">답변&nbsp;&nbsp;<span id="replycount">${replyCount}</span></h2>
          <hr class="divider">
          <div class="result-box">
          <c:forEach var="r" items="${replyList}">
          
		  <div class="sub-filed">
           <div class="replier">
               익명 <span id="replier-career">${r.duty.dutyName}/${r.careerSelf}</span>
           </div>
           <div class="sub-content">
               ${r.replyContent}
           </div>
           <div class="reply-date">
               ${r.replyRegdate} 작성
           </div>
           <div class="reply-frame">
           <div class="reply-like">
              <a href="" class="likea" data-idx="${r.replyIdx}"data-liked="on">
                  <img src="/images/community/like.png">&nbsp;<span class="replyLike">${r.replyLike}</span>
              </a>	
           </div>
            <c:if test="${userIdx == r.users.userIdx}">		               
           <div class="reply-delete" data-idx="${r.replyIdx}">삭제</div>
           </c:if>  
           </div>
           <hr class="divider">
       </div>
   </c:forEach>
   </div>
   
   
        </div>
        <div class="btn-layout">
        <div class="btn btn-back"><a href ="/Main/Community/List">목록보기</a></div>
        </div>
       </div>
    </div>
 </div>

</main>

 
 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 <script>
 

 $(function(){ 
	 
//쿠키로 게시판 좋아요 조회
   const userIdx = ${userIdx};
   const comIdx = ${ct.communityIdx};
   const cookieName = `likedCommunity_\${userIdx}_\${comIdx}`; // 유저별+게시판별 고유 쿠키 이름
   const isLiked = getCookie(cookieName);
  //ture라면
  if (isLiked) {
      $('.Like').addClass('Like2');
  }

  // 쿠키 값 가져오기 함수
  function getCookie(name) {
      let value = "; " + document.cookie;
      let parts = value.split("; " + name + "=");
      if (parts.length == 2) return parts.pop().split(";").shift();
  }
console.log(isLiked);

//쿠키로 댓글 좋아요 조회






//댓글 삭제하기
$(document).on('click', '.reply-delete', function(e) {
	
	const replyIdx = $(this).data('idx');
	const replyContainer = $(this).closest('.sub-filed');	
	console.log(replyIdx);
	console.log(replyContainer);	 
	

	$.ajax({
		url:'/Main/Reply/Delete',
		method: 'DELETE',
		contentType : 'application/json', 
		data: JSON.stringify({ replyIdx: replyIdx }) 
	})
	.done(function(data){  
		console.log(data + " 삭제완료");    
		
	})
	.fail(function(err){ console.log(err);})
	replyContainer.remove();
	
    let replyCount = parseInt($('#replycount').text());	
	console.log(replyCount)
	replyCount --
	$('#replycount').text(replyCount);
})
	 
	 
//공유하기
 $(document).on('click', '.share', function(e) {
	
	e.preventDefault();
        // 현재 페이지의 URL 가져오기
        const currentUrl = window.location.href;
        console.log(currentUrl)
        // 텍스트 영역을 만들어서 URL을 선택 가능하게 만든 뒤 복사
        const temp = $('<textarea>');
        $('body').append(temp);
        temp.val(currentUrl).select();
        document.execCommand('copy');
        temp.remove();
        
        // 사용자에게 알림
        alert('URL이 클립보드에 복사되었습니다!');
    });

	 
	 
//게시글 - 좋아요
$('.Like').on('click', function(e) {
     
	e.preventDefault(); // 기본 클릭 동작 방지
     
   let likeCount = parseInt($(this).find('.likeCount').text()); // 'likeCount' span의 텍스트 값
    
   const communityIdx = $(this).data('idx'); 
   const cookieName = `likedCommunity_\${userIdx}_\${communityIdx}`;
    
    if ($(this).hasClass('Like2')) {
         
    	$.ajax({
 			url:'/Main/Reply/Like/off',
 			 method: 'PATCH',
     	    contentType: 'application/json', 
    	    data: JSON.stringify({ communityIdx: communityIdx }) 
 		}).done(function(data){  
 			console.log(data + "응답 Off")
 		}).fail(function(err){
 			console.log(err)
 		}) 

 		//좋아요 수 감소
        likeCount--;
        // 쿠키 삭제
        document.cookie = `\${cookieName}=;  path=/Main/Community; expires=Thu, 01 Jan 1970 00:00:00 GMT`;
        //클래스 삭제
	    $(this).removeClass('Like2');
   	 
    } else {
    	$.ajax({
    	    url: '/Main/Reply/Like/on',
    	    method: 'PATCH',
    	    contentType: 'application/json', 
    	    data: JSON.stringify({ communityIdx: communityIdx }) 
    	})
    	.done(function(data) {
    	    console.log(data + " 응답 On");
    	})
    	.fail(function(err) {
    	    console.log(err);
    	});
    	//클래스 삭제
     	 $(this).addClass('Like2');  
    	//쿠키 삽입
    	const currentDate = new Date();
    	currentDate.setMonth(currentDate.getMonth() + 1);
    	const expires = currentDate.toUTCString();  	
    	document.cookie = `\${cookieName}=true; path=/Main/Community; expires=\${expires}`;	
    	//좋아요 수 증가
    	likeCount++;

    }


    $('.likeCount').text(likeCount);
});



//댓글- 좋아요   

    	 $(document).on('click', '.likea', function(e) {
            e.preventDefault();

            const span = $(this).find('span'); 
            let replyLike = parseInt(span.text());
            const replyIdx = $(this).data('idx'); 
            let liked = $(this).data('liked'); 
            const replyCookieName = `likedReply_\${userIdx}_\${replyIdx}`;
            
            if (liked === "off") {
            	
            	$.ajax({
            	    url: '/Main/Reply/RLike/off',
            	    method: 'PATCH',
            	    contentType: 'application/json', 
            	    data: JSON.stringify({ replyIdx: replyIdx }) 
            	})
            	.done(function(data) {
            	    console.log(data + " 응답 On");
            	})
            	.fail(function(err) {
            	    console.log(err);
            	});         	
                // 쿠키 삭제
                document.cookie = `\${replyCookieName}=;  path=/Main/Community; expires=Thu, 01 Jan 1970 00:00:00 GMT`;
                   	
                replyLike -= 1;  
                liked = "on";
                console.log(liked);
            } else {
            	
            	$.ajax({
            	    url: '/Main/Reply/RLike/on',
            	    method: 'PATCH',
            	    contentType: 'application/json', 
            	    data: JSON.stringify({ replyIdx: replyIdx }) 
            	})
            	.done(function(data) {
            	    console.log(data + " 응답 On");
            	})
            	.fail(function(err) {
            	    console.log(err);
            	});           	
            	
                replyLike += 1; 
                liked = "off";
                console.log(liked);
                
            	//쿠키 삽입
            	const currentDate = new Date();
            	currentDate.setMonth(currentDate.getMonth() + 1);
            	const expires = currentDate.toUTCString();  	
            	document.cookie = `\${replyCookieName}=true; path=/Main/Community; expires=\${expires}`;	    
                
                
            }
            span.text(replyLike);           
            $(this).data('liked', liked);
        })
        
  //댓글 좋아요
 $('.likea').each(function(){	

    let liked = $(this).data('liked'); 
    console.log(liked);   
    const replyIdx2 = $(this).data('idx'); 
    const replyCookieName = `likedReply_\${userIdx}_\${replyIdx2}`;
    const replyIsLiked = getCookie(replyCookieName);
    console.log(replyIdx2+'쿠키여부 :' +replyIsLiked);
    //ture라면
    if (replyIsLiked) {
        liked = "off";
        $(this).data('liked', liked);
        console.log(replyIdx2+ '쿠키상태 :'+liked);  
    }  
})
       

//댓글 작성 
$('.reply-register').on('click', function(e){
	 e.preventDefault();
	//변수
	 const userIdx = '${userIdx}';
	 const communityIdx = '${ct.communityIdx}'
	 const  dutyId =  $('#dutyId').val();
	 const  replyContent =  $('#replyContent').val();
	 const  careerSelf =  $('#careerSelf').val();
	 const registerEl = $(this).attr('href');	  
	
	 // 유효성 검사
	if( careerSelf === '경력') {
		 alert('경력을 선택하세요');
		  $('#careerSelf').focus();
		 return false
	 }else if( dutyId ==='직무') {
		 alert('직무를 선택하세요');
		  $('#dutyId').focus();	 
		  return false;
	 }else if( replyContent.length < 5) {
		 alert('내용을 5자 이상 입력하세요');
		  $('#replyContent').focus();	 
		  return false;
	 }
	 //fetch 보내기
	   fetch( registerEl,   {
	    		  method: 'POST',
	    		  body: JSON.stringify({
	    			  userIdx   : userIdx,
	    			  communityIdx : communityIdx,
	    			  dutyId : dutyId,
	    			  replyContent : replyContent,
	    			  careerSelf : careerSelf,
	    		  }),
	    		  headers: {
	    		    'Content-type': 'application/json; charset=UTF-8',
	    		  },
	    		})
	    		  .then((response) => response.json())
	    		  .then( reply  => {

	               
	                //dutylist를 json으로 바꾸기
	                const dutyListStr = '${dutyList}';
	                const dutyList = dutyListStr
	                .slice(1, -1)
	                .split('),')
	                .map(item => {
	                    const parts = item.replace('Duty(', '').replace(')', '').split(',');
	                    const dutyId = parseInt(parts[0].split('=')[1].trim(), 10);
	                    const dutyName = parts[1].split('=')[1].trim();
	                    return { dutyId, dutyName };
	                });	                
	                	                
	                //dutyid -> name으로 바꾸기 
					const duty = dutyList.find(item => item.dutyId === reply.dutyId); 
					const dutyName = duty ? duty.dutyName : '미정';            
	                  
	                //추가할 답변 모양   
				       const result = `
			        <div class="sub-filed">
			            <div class="replier">
			                익명 <span id="replier-career">\${dutyName}/\${reply.careerSelf}</span>
			            </div>
			            <div class="sub-content">
			                \${reply.replyContent}
			            </div>
			            <div class="reply-date">
			                \${reply.replyRegdate} 작성
			            </div>
			          <div class="reply-frame">
			            <div class="reply-like">
			                <a href="" class="likea" data-idx="\${reply.replyIdx}" data-liked="on">
			                    <img src="/images/community/like.png">&nbsp;<span>\${reply.replyLike}</span>
			                </a>
			            </div>
			            <div class="reply-delete" data-idx="\${reply.replyIdx}">삭제</div>
			            </div>
			            <hr class="divider">
			        </div>
			    `;
			    
			    //보이기 (앞에서 부터)
	                $('.result-box').prepend(result); 	
	                
			    //답변 수 올라가기
			        let replyCount = parseInt($('#replycount').text());	
					console.log(replyCount)
					replyCount ++
					$('#replycount').text(replyCount);
				//input칸 비우기
			      $('#dutyId').prop('selectedIndex', 0); // 첫 번째 옵션으로 설정
		          $('#careerSelf').prop('selectedIndex', 0); // 첫 번째 옵션으로 설정
		          $('#replyContent').val('');
				
			    
	               })
	              .catch((error) => alert(error + '저장실패') );
	 
	
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