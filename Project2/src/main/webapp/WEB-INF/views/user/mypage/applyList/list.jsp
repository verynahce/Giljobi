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
   margin-top:25px;
   padding-left:35px;
   display :flex;
   flex-direction:column;
   width:100%;
   gap:30px;
 }
 
 #title {
   font-weight:550;
   font-size:36px;
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
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${user_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${user_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${user_idx}" class="active-color"><img src="/images/arrow2.svg" class="img">지원내역</a></td></tr>
         <tr><td><a href="/User/MyPage/Notice/List">수신함</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div>
     	<h2 id="title">지원내역</h2>
       </div>
       <div class="content">
       	<div class="subtitles">
       	 <table class="subtitle">
       	  <tr>
       	   <th>지원일</th>
       	   <th>회사명/공고제목</th>
       	   <th>모집마감일</th>
       	   <th colspan="2">지원현황</th>
       	  </tr>
       	  
       	  <c:forEach var="item" items="${applyList}">
       	  <tr>
       	  <c:choose>    
       	  <c:when test="${item.company_idx == 0}">
       	   <td>${item.appli_date}</td>
       	   <td ><a href="/User/MyPage/ApplyList/View?post_idx=${item.post_idx}&user_idx=${user_idx}"><span id="coname">탈퇴회원</span><br><span class="posttitle">${item.post_title}</span></a></td>
       	   <td>~${item.post_ddate}</td>
       	   <td>${item.appli_status}</td>
       	   <td><a href="/User/MyPage/ApplyList/Delete?appli_idx=${item.appli_idx}" class="link"><img src="/images/cancel.png" class="img2" data-hover="/images/cancel2.png"></a></td>
       	  </c:when> 
       	  <c:otherwise>
       	   <td>${item.appli_date}</td>
       	   <td ><a href="/User/MyPage/ApplyList/View?post_idx=${item.post_idx}&user_idx=${user_idx}"><span id="coname">${item.company_name}</span><br><span class="posttitle">${item.post_title}</span></a></td>
       	   
       	   <td>~${item.post_ddate}</td>
       	   <td>${item.appli_status}</td>
       	   <td><a href="/User/MyPage/ApplyList/Delete?appli_idx=${item.appli_idx}" class="link"><img src="/images/cancel.png" class="img2" data-hover="/images/cancel2.png"></a></td>
       	  </c:otherwise>
       	  </c:choose> 	  
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
    
    //세부 레이아웃 조정
    $('.posttitle').each(function() {
        let linkText = $(this).text(); 
        
        if (linkText.length > 22) {
            // 12글자까지만 남기고 "..." 추가
            $(this).text(linkText.slice(0, 22) + '...');
        }
    });
    
})         
    
</script>

</body>
</html>