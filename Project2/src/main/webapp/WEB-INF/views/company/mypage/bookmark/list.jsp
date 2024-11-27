<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
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
   top:20px;
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
   width:400px;
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
 
 .img2 {
   width:25px;
   height:25px;
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
         <tr><td><a href="/Company/Mypage/Bookmark/List?company_idx=${company_idx}" class=active-color2><img src="/images/icon33.svg" class="img">관심인재</a></td></tr>
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${company_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div>
     	<h2 id="title">관심인재</h2>
       </div>
       <div class="content">
       	<div class="subtitles">
       	 <table class="subtitle">
       	  <tr>
       	   <th>이름</th>
       	   <th>이력서 요약</th>
       	   <th colspan="2">경력</th>
       	  </tr>
       	  <c:forEach var="b" items="${BookList}">
       	  <tr>
       	   <td>${b.user_name}<br><span class="namebot">(${b.user_gender},${b.age}세)</span></td>
       	   <td>
       	    <a href="/Company/Mypage/Bookmark/View?resume_idx=${b.resume_idx}&company_idx=${b.company_idx}">${b.resume_title}</a>
       	    <br>
       	    
       	    <c:choose>      	    
			<c:when test="${not empty b.skill_name}">			
		        <c:set var="skills" value="${fn:split(b.skill_name, ',')}" />
		        <c:forEach var="skill" items="${skills}">
		            <span class="stacks">${skill}</span>&nbsp;
		        </c:forEach>					    			    
			</c:when>
			<c:otherwise>
			     <span class="stacks">미기입</span>&nbsp;
			</c:otherwise>
			</c:choose>			
       	    </td>
       	    
       	   <td>
       	    <c:choose>
       	    <c:when test="${not empty b.cyears and not empty b.cmonths}">
       	   ${b.cyears}년 ${b.cmonths}개월
       	   </c:when>
       	   <c:otherwise>
       	   신입
       	   </c:otherwise>
       	   </c:choose>
       	   </td>
       	   
       	   
       	   <td><a href="/Company/Mypage/Bookmark/Delete?cb_idx=${b.cb_idx}&company_idx=${b.company_idx}" class="link"><img src="/images/trashcan.png" class="img2" data-hover="/images/trashcan2.png"></a></td>
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
</script>

</body>
</html>