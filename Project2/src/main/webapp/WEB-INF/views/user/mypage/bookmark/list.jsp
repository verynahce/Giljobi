<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/common.js" defer></script>
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

 .innercontents {
   display:flex;
   gap:30px;
 }
 
 .sidebar {
   border :1px solid #ccc;
   width:300px;
   border-radius:15px;
   overflow:hidden;
   margin:0;
   max-height:fit-content;
 }

 .sidebar table {
   width:100%;
   margin:0;
   border-spacing:0;
 }

 .sidebar th {
   background-color:#ffd700;
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
   background-color: #FFEF96;
   color: #111;
 }
 
 .sidebar a img {
   margin-right:10px;
   
 }

 .container {
   margin-top:25px;
   padding-left:35px;
   display :flex;
   flex-direction:column;
   width:100%;
 }
 
 .title {
   font-weight:550;
   font-size:36px;
 }
 
 .subtitles {
   margin-top:30px;
   margin-bottom:12px;
 }
 .subtitle {
   width:750px;
   border-collapse:collapse;
   margin-top:20px;
 }
 .subtitle tr{
   border-bottom:1px solid #E0DEDE;
 }
 
 .subtitle th{
   font-weight:400;
   color:gray;
   padding-top:10px;
   padding-bottom:10px;
   font-size:12px;
 }
 .subtitle th:nth-child(1) {
   width:110px;
   text-align:center;
 }
 
 .subtitle th:nth-child(2) {
   width:300px;
 }
 
 .subtitle th:nth-child(3) {
   width:160px;
   text-align:left;
   padding-left:30px;
 }
 .subtitle th:nth-child(4) {
   text-align:left;
   padding-left:15px;
 }
 
 .subtitle td {
   padding-top:15px;
   padding-bottom:15px;
   line-height:0.9;
 }
 
 .subtitle td:nth-child(1) {
   text-align:center;
   font-size:15px;
   font-weight:250;
   color:gray;
 }
 
 .subtitle td:nth-child(2) {
   padding-left:30px;
   
 }
 
 .subtitle td:nth-child(3) {
   padding-left:18px;
   font-size:15px;
   font-weight:250;
   color:gray;
 }
 
 .subtitle td:nth-child(4) {
   text-align:right;
 }

 .img {
   width:24px;
   height:24px;
 }
 
 #coname {
   color:gray;
   font-size:14px;
 }
 
 .posttitle {
   font-weight:500;
   font-size:17px;
 }
 
 #postname {
   font-size:18px;
   font-weight:450;
   width: 80%;
 }
 
 #posteddate {
   font-size:14px;
   color:#B2B0B0;
 }
 
 .post-box {
   border:1px solid #E0DEDE;
   border-radius:10px;
   text-align:left;
   width:220px;
   height:150px;
   padding-left:15px;
   margin-top:20px;
   box-sizing: border-box;

 }
 
.boxflex {
 display:flex;
 justify-content: flex-start;
 gap:14px;
 flex-wrap: wrap; 
 }
 
.star{
    cursor:pointer;
    width: 20px;
    height: 20px;
 }
 
 
 /*채용제의 */
.support {
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%); 
   width: 550px; 
   height: 630px; 
   background-color: white; 
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
   z-index: 3 
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 8px;
   padding: 80px 51px 15px 51px;
}
.s-header {

 display:flex;
 justify-content: space-between;
}
.s-title {
 color: #333333;
 font-size: 36px; 
 font-weight: 600; 
 line-height: 50.40px;
 margin-bottom: 8px;
 padding:0;
    }


.s-list{
  border-collapse: collapse;
  width:100%;
   tr {
   td { 
   padding:18px 0 18px;
   }
   td:nth-child(1){
   width:80%;
   text-align: left;
   input{
   width: 17px;
   height: 17px;
   border-bottom: #cccccc
      }
   label{
   margin-left:8px;
   font-size: 20px;
   color: #333333;
   }
   }
   td:nth-child(2){
   width:20%;
   text-align: right;
   color: #767676;
   }
   }
}


.s-btn {
  position: absolute; 
  bottom: 50px;
  left: 50%;
  transform: translateX(-50%);
  font-weight: 80;
      
   }
.s-delete {
 color: #767676;
 font-weight: 300;
 font-size: 36px;  
 cursor: pointer;

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
  background: #585766; 
  color: white;

   &:hover {
     background-color:#666577;
     color:white;
     
   }
 }
 

 
</style>
</head>
<body>


<div class="overlay">  
<form action="/User/MyPage/BookMark/Apply" method="POST">
 <div class="support"> 
   <div class="s-header">
      <h2 class="s-title">이력서</h2><span class="s-delete">x</span>
   </div>
   <hr>
   
   <table class="s-list"> 
   <c:forEach var="item" items="${resumeList}">
     <tr>
     <td><input type="radio"name="resume_idx" id="${item.resume_idx}" value="${item.resume_idx}"> <label for="${item.resume_idx}">${item.resume_title}</label></td>
     <td>     
     <p>${item.resume_fdate}<input type="hidden" name="post_idx" value=""/><input type="hidden" name="scout_idx" value=""/></p>
    </td>
   </tr>
   </c:forEach>
  </table>
  
    <div class="s-btn">
   <input class ="btn btn-back" type="submit" value="입사지원"/>
    </div>
   </div>
 </form>
</div>



   <%@include file="/WEB-INF/include/header.jsp" %>
 <main>
  <div class="inner">
      <div class="innercontents">
      <div class="sidebar">
         <table>
         <tr><th>개인서비스</th></tr>
         <tr><td><a href="/User/MyPage/Home/View"><img src="/images/myhome.svg" class="img">MY홈</a></td></tr>
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${userVo.user_idx}"class="active-color"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>       
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
         <tr><td><a href="/api/notice/list?user_idx=${user_idx}" class="link"><img src="/images/Mail.svg" class="img" data-hover="/images/mail3.svg">수신함</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div>
     	<h2 class="title">관심기업</h2>
       </div>
       
        <div class="boxflex">
        <c:forEach var="item" items="${BookmarkList}">
         <table class="post-box">
         <tr>
          <td id="postname"><a href="/Main/Review/View?company_idx=${item.company_idx}">${item.company_name}</a></td>
          <td class="postbook"><input type="image" src="/images/bookmark/staron.png" class="star" alt="${item.ub_idx}"data-co="${item.company_idx}" data-user="${item.user_idx}"/></td>
         </tr>
         <tr>
          <td id="posteddate">${item.company_area}</td>
         </tr>        
        </table>
        </c:forEach>
        </div>
        
       	<div class="subtitles">
       	 <div>
       	 <br><br>
     	  <h2 class="title">받은제의</h2>
         </div>
       	 <table class="subtitle">
       	  <tr>
       	   <th>제의날짜</th>
       	   <th>회사명/공고제목</th>
       	   <th colspan="2">모집마감일</th>
       	  </tr>
       	  <c:forEach var="item" items="${ScoutList}">
       	  <tr>
       	   <td>${item.scout_date}</td>
       	   <td><span id="coname">${item.company_name}</span><br>
       	   <span class="posttitle"><a href="/User/MyPage/BookMark/View?post_idx=${item.post_idx}&user_idx=${item.user_idx}">${item.post_title}</a></span></td>
       	   <td>${item.post_ddate}</td>
       	   <td><a href="" class="link"><img src="/images/applybtn.png" class="img2 resume" data-hover="/images/applybtn2.png" data-date="${item.post_ddate}"data-idx="${item.post_idx}" data-scout="${item.scout_idx}"></a></td>
       	  </tr>
       	  </c:forEach>
       	 </table>
       	</div>
      </div>
   </div>
 </div>

</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
<script>

$(function(){
     //사이드바 색변경
    const links = document.querySelectorAll(".link");

    links.forEach(link => {
        const img = link.querySelector(".img, .img2");
        const originalSrc = img.src;
        const hoverSrc = img.getAttribute("data-hover");

        link.addEventListener("mouseover", () => {
            img.src = hoverSrc;
        });

        link.addEventListener("mouseout", () => {
            img.src = originalSrc;
        });
    });
    
    // 북마크 색 변환
          let count = 0; 	 
         const stars = $('.star'); 
         
        
         for (let i = 0; i < stars.length; i++) {
             $(stars[i]).on('click', function() {
            	 
            	 if (count === 0) {
            		 $(stars[i]).attr('src', '/images/bookmark/staroff.png');
                     count = 1;                    
                     console.log($(stars[i]).attr('alt'))
                     alert('북마크가 해제되었습니다');
                 	$.ajax({
            			url:'/User/MyPage/BookMark/Off',
            			data:{ub_idx: $(stars[i]).attr('alt')}
            		}).done(function(data){           			
            			console.log()
            		}).fail(function(err){
            			console.log(err)
            		})
                     
                     
                 } else {   	
                	 $(stars[i]).attr('src', '/images/bookmark/staron.png');
                     count = 0;     
                     alert('북마크 되었습니다');
                      console.log($(stars[i]).data('co'));
                      console.log($(stars[i]).data('user'));
                     $.ajax({
             			url:'/User/MyPage/BookMark/On',
             			data:{company_idx: $(stars[i]).data('co'),
             				  user_idx: $(stars[i]).data('user')
             			}
             		}).done(function(data){           			
             			console.log()
             		}).fail(function(err){
             			console.log(err)
             		})                     
                 }  	            	 
             });                 
         }   
     
         
         
//이력서 버튼
    
    //입사지원 버튼 
    const abtns = $('.resume')
    for (var i = 0; i < abtns.length; i++) {
 	 $(abtns[i]).on('click', function(event){
 	  		event.preventDefault();
 	  		
 	 	  const dday = $(this).data('date');
 		  let ddayDate = dday.replace(/[^\d]/g, '-').replace(/--+/g, '-').replace(/-$/, '');
 		  const DDate = new Date(ddayDate + "T23:59:59")
 		  const cTime = new Date();
 		  
 		 if (cTime < DDate) {

 	 		$('.overlay').fadeIn();  	 		
 	 const post_idx = $(this).data('idx');	
 	 const scout_idx = $(this).data('scout');	
 	 console.log(scout_idx);
 	 
 	 $('[name="post_idx"]').val(post_idx);   	
 	 $('[name="scout_idx"]').val(scout_idx);
 		}else {
 			 const scout_idx = $(this).data('scout');	
 			alert('마감된 공고입니다 ')
 			 window.location.href = '/User/MyPage/BookMark/deadline?scout_idx='+scout_idx ;
 			
 			
 		}
 	 	});
  }
           $('.btn').on('click', function() {
    	alert('지원 완료 되었습니다')
    	 
     })
  	

 	//닫기 기능 버튼
 	$('.s-delete').on('click', function(){
 		$('.overlay').fadeOut();				
 	})
 	$('.s-btn').on('click', function(){
 		$('.overlay').fadeOut();				
 	})
 	
	//세부 레이아웃 조정
    $('.posttitle').each(function() {
        let linkText = $(this).find('a').text(); 
        
        if (linkText.length > 23) {
            // 12글자까지만 남기고 "..." 추가
            $(this).find('a').text(linkText.slice(0, 23) + '...');
        }
    });
	

	
	
	})
    
    
    


       

</script>

</body>
</html>