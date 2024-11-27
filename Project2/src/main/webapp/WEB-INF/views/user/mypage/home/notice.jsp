<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
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
  /* 알림 목록 리스트 */
 .notice-list {
     list-style: none;
     padding: 0;
     margin: 0;
 }

 .notice-item {
     display: flex;
     justify-content: space-between;
     align-items: center;
     border-bottom: 1px solid #ddd;
     padding: 15px 10px;
     transition: background-color 0.3s ease;
 }

 .notice-item:last-child {
     border-bottom: none;
 }

 .notice-item:hover {
     background-color: #f5f5f5;
 }

 /* 메시지 내용 */
 .notice-info {
     display: flex;
     align-items: center;
     gap: 15px;
 }

 .notice-icon {
     width: 20px;
     height: 20px;
     color: #007bff;
 }

 .notice-title {
     font-size: 16px;
     font-weight: bold;
     color: #333;
     margin: 0;
 }

 .notice-desc {
     font-size: 14px;
     color: #666;
 }

 .notice-date {
     font-size: 12px;
     color: #999;
     text-align: right;
 }

 /* 버튼 스타일 */
 .notice-actions {
     display: flex;
     align-items: center;
     gap: 10px;
 }

 .delete-btn {
     background: none;
     border: none;
     color: #ff6b6b;
     font-size: 18px;
     cursor: pointer;
     transition: color 0.3s ease;
 }

 .delete-btn:hover {
     color: #d63a3a;
 }
 
 /* 알림창 */
 
</style>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>
   
   	<div class="overlay-notice">
		 <div class="notice"> 
		   <div class="n-header">
		      <h2 class="n-title">축하드립니다.</h2><span class="n-delete">x</span>
		   </div>
			<div class="notice-container">
			    <div class="noti" id="notification">
			    	<p>응애 합격하였습니다.</p>
	                <p>면접정보에 대해 다음과 같이 안내드립니다.</p>
	                <p>일시: <input type="date" name="scadule" value="${scadule}"></p>
	                <p>장소: <input type="text" name="location" value="${location}"></p>
	                <p>안내사항: <textarea name="information">${information}</textarea></p>
			    </div>
			</div>
		</div>
	</div>
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
         <tr><td><a href="/api/notice/list?user_idx=${user_idx}" class="link"><img src="/images/Mail.svg" class="img" data-hover="/images/mail3.svg">수신함</a></td></tr>
        </table>
      </div>
      <div class="container">
       <div>
     	<h2 id="title">수신함</h2>
       </div>
       <div class="content">
       	<div class="subtitles">
	        <ul class="notice-list">
	            <%-- 메시지 항목 반복 렌더링 --%>
	                <li class="notice-item">
	                    <div class="notice-info">
	                        <input type="checkbox" class="notice-checkbox" />
	                        <div>
	                            <p class="notice-title">${notice.notification}제목</p>
	                            <p class="notice-desc">${notice.subnoti}부제목</p>
	                        </div>
	                    </div>
	                    <div class="notice-actions">
	                        <span class="notice-date">${notice.recieveddate}수신일</span>
	                        <button class="delete-btn" onclick="deleteNotice(${notice.notice_idx})">
	                            🗑️
	                        </button>
	                    </div>
	                </li>
	        </ul>
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



<script>
    function deleteNotice(notice_idx) {
        if (confirm("삭제하시겠습니까?")) {
            // REST API DELETE 요청 보내기
            fetch(`/api/Notice/${notice_idx}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    alert("삭제되었습니다.");
                    location.reload();
                } else {
                    alert("삭제 실패!");
                }
            })
            .catch(error => {
                console.error("에러 발생:", error);
                alert("에러가 발생했습니다.");
            });
        }
    }
</script>
</body>
</html>
