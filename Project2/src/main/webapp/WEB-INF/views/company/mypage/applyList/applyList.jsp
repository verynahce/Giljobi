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
   width:380px;
 }
 
 .subtitle th:nth-child(3) {
   width:240px;
   text-align:left;
   padding-left:25px;
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
   padding-right:24px;
   text-align:right;
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
       	 <table class="subtitle">
       	  <tr>
       	   <th>이름</th>
       	   <th>이력서 요약</th>
       	   <th colspan="2">경력</th>
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
       	   <td><a href="/Company/Mypage/ApplyList/View?resume_idx=${a.resume_idx}&company_idx=${company_idx}&post_idx=${post_idx}">${a.resume_title}</a>
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
       	   신입</td>
       	   </c:otherwise>
       	   </c:choose>
       	   </td>
       	   <td>
       	     <select class="select" data-idx="${a.appli_idx}">
       	       <option <c:if test="${a.appli_status == '면접대기'}">selected</c:if>>면접대기</option>
       	       <option <c:if test="${a.appli_status == '불합격'}">selected</c:if>>불합격</option>
       	       <option <c:if test="${a.appli_status == '합격'}">selected</c:if>>합격</option>
       	      </select>
       	    </td>
       	    <td><a href="" class="link nolink"><img src="/images/trashcan.png" class="img2 delete" data-hover="/images/trashcan2.png"></a></td>
       	  </tr>
       	  
       	   </c:forEach>  
       	 </table>
       	</div>
       	<input type="button" class="restoreDeleted" value="전체지원자 다시보기"/>
       	
       </div>
      </div>
   </div>
 </div>

</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
<script>
$(function(){
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
   
   
   //리스트만 안보이는 삭제 구현
   
    // 초기 체크
   function checkDeletedItems() {
       if (localStorage.getItem('deletedItems')) {
           var deletedItems = JSON.parse(localStorage.getItem('deletedItems'));
           deletedItems.forEach(function(idx) {
               $('tr.Dcontent[data-idx="' + idx + '"]').hide();
           });
       }
   }

   checkDeletedItems();
    
 
   // 삭제 버튼 클릭 이벤트 (이벤트 위임 사용)
   $(document).on('click', '.delete', function() {
       var $row = $(this).closest('tr.Dcontent'); 
       var appliIdx = $row.data('idx'); 

       // localStorage에 삭제된 항목 추가
       var deletedItems = localStorage.getItem('deletedItems') ? JSON.parse(localStorage.getItem('deletedItems')) : [];
       deletedItems.push(appliIdx); 
       localStorage.setItem('deletedItems', JSON.stringify(deletedItems)); 
     
       $row.hide(); 
   });

   // 삭제된 항목 복원 버튼 클릭
   $('.restoreDeleted').on('click', function() {

       localStorage.removeItem('deletedItems');
       $('tr.Dcontent').show(); 
   });
   
   
   
    
})   
</script>

</body>
</html>