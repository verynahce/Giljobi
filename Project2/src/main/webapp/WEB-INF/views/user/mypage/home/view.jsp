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
   display :flex;
   flex-direction:column;
   width:100%;
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
   margin-right:auto;
   margin-left: 10px;
 }

 .settings-image {
   width:45px;
   height:45px;
   margin-top:15px;
   margin-right:30px;
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

 .headache td:nth-child(1) {
   width:25%;
 }

 .headache td:nth-child(2) {
   width:25%;
 }

 .headache td:nth-child(3) {
   width:25%;
 }

 .headache td:nth-child(4) {
   width:25%;
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
         <tr><th>개인서비스</th></tr>
         <tr><td><a href="/User/MyPage/Home/View" class="active-color"><img src="/images/myhome.svg" class="img">MY홈</a></td></tr>
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>       
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
         <tr><td><a href="/api/notice/list?user_idx=${user_idx}" class="link"><img src="/images/Mail.svg" class="img" data-hover="/images/mail3.svg">수신함</a></td></tr>
        </table>
      </div>
      <div class="container">
        <div class="content">
       <c:choose>
      <c:when test="${imagePath != '0'}">
         <img src="/image/read?path=${imagePath}" alt="User Image" class="profileSize">
       </c:when> 
       <c:otherwise>
         <img src="/images/icon/user-profile.png" alt="User Image" >
       </c:otherwise>
       </c:choose>
       
          <div class="text-box">
            <span class="highlight">${userVo.user_name}</span><br>
            <span>${userVo.user_gender}, ${age}세(${UYear}년)</span><br>
            <span>${userVo.user_tel} &nbsp; &nbsp;|&nbsp; &nbsp; ${userVo.user_email}</span><br>
        <c:choose> 
        <c:when test="${not empty userVo.user_address}">
            <span>${userVo.user_address}</span>
        </c:when>
        <c:otherwise>
        <span>주소미기입</span>
        </c:otherwise>
        </c:choose> 
          </div>
          
            <a  class="settings-image" href="/User/MyPage/Home/updateForm?user_idx=${userVo.user_idx}"><img src="/images/settings.png"></a>
       </div>
        <div class="content2">
         <table class="headache">
            <tr>
               <td><a href="/User/MyPage/Resume/List?user_idx=${userVo.user_idx}">${CountR}<br>이력서</a></td>
               <td><a href="/User/MyPage/BookMark/List?user_idx=${userVo.user_idx}">${CountB}<br>관심기업</a></td>
               <td><a href="/User/MyPage/BookMark/List?user_idx=${userVo.user_idx}">${CountS}<br>받은제의</a></td>
               <td><a href="/User/MyPage/ApplyList/List?user_idx=${userVo.user_idx}">${CountA}<br>지원내역</a></td>
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