<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   gap:30px;

 }
 
 .sidebar {
   border :1px solid #ccc;
   width:300px;
   height:378px;
   border-radius:15px;
   overflow:hidden;
   margin:0;
   position: sticky; 
   top: 124px; 
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
 .img {
   width:24px;
   height:24px;}

 .container {
   margin-top:25px;
   padding-left:35px;
   display :flex;
   flex-direction:column;
   width:100%;
 }
 
  #title {
   font-weight:550;
   font-size:36px;
 }
 
 .content {
   margin-top:35px;
   display:flex;
   gap:15px;
 }
 
 .post-writebox {
   border:1px solid #E0DEDE;
   border-radius:10px;
   padding:45px;
   text-align:center;
   width:220px;
   height:150px;
 }
 
 .post-box {
   border:1px solid #E0DEDE;
   border-radius:10px;
   text-align:left;
   max-width:220px;
   width:220px;
   height:150px;
   padding-left:15px;
 }
 
 .postname {
   font-size:18px;
   font-weight:450;

 }
 
 #posteddate {
   font-size:14px;
   color:#B2B0B0;
 }
 

 .boxflex {
 display:flex;
 justify-content: flex-start;
 gap:14px;
 flex-wrap: wrap; 
 }
 
 /*dot 속성*/
 .dots {
   text-align:right;
   padding-right:15px;
 }
 
.mini-box{
   border:1px solid #E0DEDE;
   border-radius:10px;
   padding:5px 0;
   a{
   margin: 0 2px;
   padding: 3px 10px 3px 9px;
   
    }
   a:hover {
   background-color: #EBECF1;   
   border-radius:5px;
   padding: 3px 10px 3px 9px;
   }
  
   hr{
   margin:3px 0;
   border:1px solid #E0DEDE;
   }
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
         <tr><td><a href="/User/MyPage/Home/View" class="link"><img src="/images/myhome2.svg" class="img" data-hover="/images/myhome.svg">MY홈</a></td></tr>
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${user_idx}" class="active-color"><img src="/images/icon22.svg" class="img">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${user_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div>
     	<h2 id="title">이력서 관리</h2>
       </div>
       <div class="content">
       <div class="boxflex">
        <table class="post-writebox">
         <tr>
          <td><a href="/User/MyPage/Resume/WriteForm?user_idx=${user_idx}"><img src="/images/plus.png"><br>새 이력서 작성</a></td>
         </tr>
        </table>
    
        <c:forEach var="item" items="${resumeList}">
        <table class="post-box">
         <tr>
          <td class="postname"><a href="/User/MyPage/Resume/View?resume_idx=${item.resume_idx}">${item.resume_title}</a></td>
          <td class="dots" ><a href="" class="link"><img src="/images/dots.png" class="img dot" data-hover="/images/dots2.png" data-idx="${item.resume_idx}"></a></td>
         </tr>
         <tr>
          <td id="posteddate">${item.resume_cdate}</td>
         </tr>
        </table>
        </c:forEach>
        
        <div class="space"> </div>
<<<<<<< HEAD
=======
        <div><a id="restT" href="/api/article">restapi 테스트</a> </div>
        <div class="output"></div>
>>>>>>> 7ee7827b63be2e6d849e0b25b2626760503e31c2
        </div>
       </div>
       </div>
   </div>
 </div>

</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
<script>

$(function() {
<<<<<<< HEAD
=======
    
	const  restT  =  document.querySelector('#restT') 
      // 모든 a tag
   
       restT.onclick  =  function( e ) {
           e.preventDefault();  // 기본이벤트를 취소: a tag 를 누르면 href로 이동한다
           e.stopPropagation();
          
          
           	fetch( restT.href  )
           	  .then((response) => response.json())
           	  .then( result => {
                     console.log(result)

           	  })  
           	 
	
    }
	
>>>>>>> 7ee7827b63be2e6d849e0b25b2626760503e31c2
	//사이드바 
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
    
    //dots
    const dots = $('.dot'); 
  
    let count = 0
    
    for (var i = 0; i < dots.length; i++) {
       
    	$(dots[i]).click(function(event) {          
    		event.preventDefault();
    		
    		// 부모 위치 잡기
            const dotOffset = $(this).offset();
            const dotHeight = $(this).outerHeight();
            const dotWidth = $(this).outerWidth();
            //idx 빼오기
            const resume_idx = $(this).data('idx');
            console.log(resume_idx);
            
        	if(count === 0) {
      	
        	const dotdiv = $('<div class="mini-box"></div>')
                .append('<a href="/User/MyPage/Resume/UpdateForm?resume_idx='+resume_idx+'">수정</a>')
                .append('<hr>')
                .append('<a href="/User/MyPage/Resume/Delete?resume_idx='+resume_idx+'">삭제</a>');
        	 $('.space').html(dotdiv)
                        .css({	 position: 'absolute',
				                 top: dotOffset.top + dotHeight + 5, 
				                 left: dotOffset.left+ (dotWidth / 2) - ($('.space').outerWidth() / 2),
				                 zIndex: 1000 
				             }).show();         	         	 
                 count=1;  
    	       }else if(count === 1){
    	    	   $('.space').empty();    	    	  
    	    	   count=0;     

    	       }  
        })
    }
    
    
    //세부 레이아웃 조정
    $('.postname').each(function() {
        let linkText = $(this).find('a').text(); 
        
        if (linkText.length > 11) {
            // 12글자까지만 남기고 "..." 추가
            $(this).find('a').text(linkText.slice(0, 11) + '...');
        }
    });
    
     
})  
</script>

</body>
</html>