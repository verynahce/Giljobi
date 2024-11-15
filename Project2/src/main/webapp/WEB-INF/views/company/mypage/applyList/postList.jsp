<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
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
   top:123px;
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
 }
 
  #title {
   font-weight:550;
   font-size:36px;
 }
 
 .content {
   margin-top:35px;
 }
 
 .content-box {
   border:1px solid #E0DEDE;
   border-radius:10px;
   width:800px;
   margin-top:15px;
   
 }
 
 .content-box td {
   padding-top:30px;
   padding-bottom:30px;
 }
 
 .content-box td:nth-child(1) {
   padding-left:35px;
   font-weight:550;
   font-size:18px;
 }
 
 .content-box td:nth-child(2) {
   text-align:right;
   padding-right:35px;
   font-size:14px;
   color:#B2B0B0;
 }
 
 .content-box td:nth-child(3) {
   font-weight:300;
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
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${company_idx}" class="active-color"><img src="/images/arrow2.svg" class="img">지원내역</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div>
     	<h2 id="title">지원내역</h2>
       </div>
       <div class="content">
        <c:forEach var="p" items="${postList}">
        <table class="content-box">
         <tr>
          <td><a href="/Company/Mypage/ApplyList/ApplyList?post_idx=${p.post_idx}&company_idx=${p.company_idx}">${p.post_title}</a></td>
          <td>${p.post_ddate}(${p.post_dday}) 마감</td>
          <td>${p.count}명</td>
         </tr>
        </table>
        </c:forEach>
        
       </div>
       </div>
   </div>
 </div>

</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
<script>
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
</script>

</body>
</html>