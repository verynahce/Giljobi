<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
   position:sticky;
   top:123px;
 }
 
 .sidebar table {
   width:100%;
   margin:0;
   border-spacing:0;
 }

 .sidebar th {
   background-color:#4876EF;
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
   background-color: #BED0FF;
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
   gap:30px;
 }
 .titlezone h2 {
   display:flex;
   align-items: center;
 }
 #title {
   font-weight:550;
   font-size:36px;
   padding-left:20px;
   padding-bottom:5px;
 }
 
 .arrow {
   width:33px;
   height:33px; 
 }
 
 .subtitles {
   padding-left:10px;
   margin-top:12px;
   margin-bottom:12px;
 }
 .subtitle {
   width:750px;
   border-collapse:collapse;
 }
 .subtitle tr{
   border-top:1px solid #E0DEDE;
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
   width:280px;
 }
 
 .subtitle th:nth-child(3) {
   width:140px;
   text-align:left;
   padding-left:35px;
 }

 .subtitle td {
   padding-top:15px;
   padding-bottom:10px;
   font-size:15px;
   font-weight:300;
   line-height:0.9;
 }
 
 .subtitle td:nth-child(1) {
   text-align:center;
 }
 
 .subtitle td:nth-child(2) {
   padding-left:22px;
 }
 
 .subtitle td:nth-child(3) {
   padding-left:18px;
 }
 
 .subtitle td:nth-child(4) {
   padding-right:3px;
   text-align:center;
 }
 .subtitle td:nth-child(5) {
   padding-right:14px;
   text-align:right;
 } 
 .namebot {
   font-size:10px;
   color:#AEACAC;
 }
 
 .stacks {
   font-size:11px;
   color:#7585D8;
   background-color:#F1F3F5;
   padding:4px;
   border-radius:3px;
   line-height:2.5;
 }
 
 .img {
   width:24px;
   height:24px;
 }
 
 .select{
   border:1px solid #AEACAC;
   border-radius:7px;
   color:#AEACAC;
   padding:10px 7px 10px 5px;
 }
 
.restoreDeleted {
   border:1px solid #C7C6C6;
   border-radius:7px;
   padding:10px 7px 10px 5px;
   cursor: pointer;
   background-color: white;
}
.restoreDeleted:hover {
	background-color: #F2F2F2;
}
.statusFilter {
padding:7px 5px;
   border:1px solid #C7C6C6;
   border-radius:7px;
   margin:0px 150px 7px 0px;
}
#filterlayout{
display:flex;
justify-content: flex-end;

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
         <tr><th>기업서비스</th></tr>
         <tr><td><a href="/Company/Mypage/Home/View?company_idx=${company_idx}" class="link"><img src="/images/myhome2.svg" class="img" data-hover="/images/myhome.svg">MY홈</a></td></tr>
         <tr><td><a href="/Company/Mypage/Post/List?company_idx=${company_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">채용공고</a></td></tr>
         <tr><td><a href="/Company/Mypage/Bookmark/List?company_idx=${company_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심인재</a></td></tr>
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${company_idx}" class="active-color2"><img src="/images/arrow2.svg" class="img">지원내역</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div class="titlezone">
     	<h2><a href=""><img src="/images/back.png" class="arrow"></a><span id="title">공고제목</span></h2>
       </div>
       <div class="content">
       	<div class="subtitles">
       	
      <div id="filterlayout">
         <select class="statusFilter" >
  	       <option >전체보기</option>
  	       <option >서류 심사중</option>
  	       <option >서류합격</option>
  	       <option >서류 탈락</option>
  	       <option >최종합격</option>
  	       <option >면접 탈락</option>
  	       <option >면접대기</option>    	
       	</select>
       </div>	
       	 <table class="subtitle">
       	  <tr>
       	   <th>이름</th>
       	   <th>이력서 요약</th>
       	   <th>경력</th>
       	   <th >평점</th>

       	  </tr>
       	  <c:forEach var="a" items="${applyList}">
       	  
       	  <tr class="Dcontent"  data-idx="${a.appli_idx}">
       	  
       	   <c:choose>
	        <c:when test="${a.user_idx == 0}">
	           <td>탈퇴회원</td>
	        </c:when>
	        <c:otherwise>
	       	   <td>${a.user_name}<br><span class="namebot">(${a.user_gender},${a.age}세)</span></td>
       	    </c:otherwise>
       	   </c:choose>
       	   <td><a href="/Company/Mypage/ApplyList/View?resume_idx=${a.resume_idx}&company_idx=${company_idx}&post_idx=${post_idx}&appli_idx=${a.appli_idx}">${a.resume_title}</a>
       	   <br>
       	   <c:choose>      	    
			<c:when test="${not empty a.skill_name}">
			    <span class="stacks">${a.skill_name}</span>&nbsp;
			</c:when>
			<c:otherwise>
			     <span class="stacks">미기입</span>&nbsp;
			</c:otherwise>
			</c:choose>			
       	    </td>
       	    
       	    <td>
       	    <c:choose>
       	    <c:when test="${not empty a.cyears and not empty a.cmonths}">
       	   ${a.cyears}년 ${a.cmonths}개월
       	   </c:when>
       	   <c:otherwise>
       	   신입
       	   </c:otherwise>
       	   </c:choose>
       	   </td>
       	      
<c:choose>
    <c:when test="${not empty a.total_score}">
        <td>${a.total_score}</td>
    </c:when>
    <c:otherwise>
        <td>미기입</td>
    </c:otherwise>
</c:choose>
       	       	   
       	   <td>
       	     <select class="select" data-idx="${a.appli_idx}">
       	       <option <c:if test="${a.appli_status == '서류 심사중'}">selected</c:if>>서류 심사중</option>
       	       <option <c:if test="${a.appli_status == '서류합격'}">selected</c:if>>서류합격</option>
       	       <option <c:if test="${a.appli_status == '서류 탈락'}">selected</c:if>>서류 탈락</option>
       	       <option <c:if test="${a.appli_status == '최종합격'}">selected</c:if>>최종합격</option>
       	       <option <c:if test="${a.appli_status == '면접 탈락'}">selected</c:if>>면접 탈락</option>
       	       <option <c:if test="${a.appli_status == '면접대기'}">selected</c:if>>면접대기</option>
       	      </select>
       	    </td>
   
       	    <td><a href="" class="link nolink"><img src="/images/trashcan.png" class="img2 delete" data-idx="${a.appli_idx}"data-hover="/images/trashcan2.png"></a></td>
       	  </tr>
       	  
       	   </c:forEach>  
       	 </table>
       	</div>
       	
       </div>
      </div>
   </div>
 </div>

</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
<script>
$(function(){
	//필터
	$('.statusFilter').on('change', function () {
	    //필터의 값을 가져오기
	    let filterValue = $(this).val(); 
	    
	    if (filterValue === '전체보기') {
	        $('.Dcontent').css('display', ''); 
	    } else {        
	        $('.Dcontent').each(function () {           
	            let selectValue = $(this).find('.select').val(); 
	            // .select의 값과 filterValue가 같으면 표시, 다르면 숨기기
	            $(this).css('display', (selectValue === filterValue) ? '' : 'none');
	        });
	    }
	});
        
	
	
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

   $('.select').each(function(){
	    
	    $(this).change(function(){
		   
		   let state = $(this).val();  
		   let applyidx = $(this).data('idx')
		   
           $.ajax({
               url: '/Company/Mypage/ApplyList/State', 
               data: {appli_idx: applyidx,
            	      appli_status: state}
           }).done(function(data){           			
   		   }).fail(function(err){
   			    console.log(err)

   		    })
		   
		   
	   })
	   
   })
   $('.nolink').on('click',function(event) {
	   event.preventDefault();
	   
   })
   
  
   	        $('.Dcontent').each(function () {           
	            let remove = $(this).find('.delete')
	            let remove9 = $(this).find('.delete').data('idx')
	            let trorgin = $(this)
	            console.log(remove9);
	            remove.on('click',function(){
	     		let applyidx = remove.data('idx')
	                $.ajax({
	                    url: '/Company/Mypage/ApplyList/Remove', 
	                    data: {appli_idx: applyidx}
	                }).done(function(trr){ 
	                	console.log(trorgin)
	                	trorgin.remove();
	        		   }).fail(function(err){
	        			    console.log(err)

	        		    })
	            	
	        		    
	            })

	        });

    
})   
</script>

</body>
</html>