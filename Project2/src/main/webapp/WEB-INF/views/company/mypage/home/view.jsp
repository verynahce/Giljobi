<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   width:233px;
   min-width:233px;
   max-width:233px;

   border-radius:15px;
   overflow:hidden;
   margin:0;
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
   display :flex;
   flex-direction:column;
   width:940px;
   gap:30px;
 }
 
 .container table {
   width:100%;
   height:100%;
   
 }
 
 .content {
   flex:1;
   border: 1px solid #ccc;
   text-align:left;
   border-radius:10px;
   display:flex;
   flex-direction:row;
   padding-left:45px;
   padding-top:30px;
 }
 
 .highlight {
   font-size:25px;
   font-weight:bold;
   color:#333;
 }
 .profile-image {
   margin-right:35px;
   width:125px;
   height:125px;
 }
 
 .text-box {
   margin-top:10px;
   margin-right:500px;
   margin-left: 20px;
   
 }
   
 .settings-image {
   height:45px;
   margin-top:15px;
   margin-left:-87px;
 }
   
 
 .content2 {
   flex:1;
   text-align:center;
   border: 1px solid #ccc;
   border-collapse:collapse;
   border-radius:10px;
   font-size:20px;
   font-weight:450;
   color:#555;
 }
.profileSize {
width: 110px;
height: 110px;
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
         <tr><td><a href="/Company/Mypage/Home/View?company_idx=${companyVo.company_idx}" class="active-color2"><img src="/images/myhome.svg" class="img" >MY홈</a></td></tr>
         <tr><td><a href="/Company/Mypage/Post/List?company_idx=${companyVo.company_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">채용공고</a></td></tr>
         <tr><td><a href="/Company/Mypage/Bookmark/List?company_idx=${companyVo.company_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심인재</a></td></tr>
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${companyVo.company_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
        </table>
      </div>
      <div class="container">
        <div class="content">
  	<c:choose>
      <c:when test="${imagePath != '0'}">
         <img src="/image/read?path=${imagePath}" alt="User Image" class="profileSize">
       </c:when> 
       <c:otherwise>
         <img src="/images/icon/user-profile.png" alt="User Image" class="profileSize" >
       </c:otherwise>
       </c:choose>
  		  <div class="text-box">
           	<span class="highlight">${companyVo.company_name }</span><br>
           	<span><img src="/images/star.png">&nbsp;(${score})</span><br>
            <span>${companyVo.company_email }</span><br>
            <span>${companyVo.company_tel }</span><br>
          </div>
            <a class="lay"href="/Company/Mypage/Home/UpdateForm?company_idx=${companyVo.company_idx }"><img src="/images/settings.png" class="settings-image"></a>
       </div>
        <div class="content2">
         <table>
            <tr>
               <td><a href="/Company/Mypage/Post/List?company_idx=${companyVo.company_idx }">${CountP}<br>채용공고</a></td>
               <td><a href="/Company/Mypage/Bookmark/List?company_idx=${companyVo.company_idx }">${CountB}<br>관심인재</a></td>
               <td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${companyVo.company_idx }">${CountA}<br>지원내역</a></td>
            </tr>
         </table>
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