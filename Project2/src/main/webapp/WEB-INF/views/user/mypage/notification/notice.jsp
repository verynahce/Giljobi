<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
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
 .notice-item.unread {
    font-weight: bold;
    background-color: #f9f9f9;
}
 /* 알람보내기 */
.notice {
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%); 
   width: 700px; 
   background-color: white; 
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
   z-index: 3 
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 8px;
   padding: 30px 51px 15px 51px;
}
.n-header {

display:flex;
justify-content: space-between;
}
.n-title {
color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    line-height: 50.40px;
    margin-bottom: 30px;
    }

.n-btn {
width: 170px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border-radius: 8px;
   color:white;
   margin:0 auto;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-top: 30px;
    margin-bottom: 20px;
    padding: 10px;
    
    img{
    width:20px;
    height: 20px;
    transform: translate(30%, 20%);
    }
    
   &:hover {
    background-color: #4A4A4A;
   }
   a{ 
   display: block;
    text-decoration: none; 
    color: white; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 33px;
   gap: 10px;
   }   
 }
.n-delete {
 color: #767676;
font-weight: 300;
font-size: 36px;  
cursor: pointer;
}

.noob{
	padding-top :20px;
	font-size: 20px;
}

.n-list{
  border-collapse: collapse;
  width:100%;
   & tr {
	   & td {padding:18px 0 18px;};
	   & td:nth-child(1){
		   width:80%;
		   text-align: left;
		   input{
		   width: 17px;
		   height: 17px;
		   border-bottom: #cccccc;
	      };
	   & label{
	   margin-left:8px;
	   font-size: 20px;
	   color: #333333;
	     }
	   }
	   & td:nth-child(2){
	   width:20%;
	   text-align: right;
	   color: #767676;
	   }
   }
}
 .notice-container {
     max-width: 600px;
     margin: auto;
     background: white;
     padding: 20px;
     border-radius: 8px;
     box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	 h1 {
	     text-align: center;
	     color: #333;
	 }
	 .info {
	     margin: 20px 0;
	     font-size: 18px;
	     line-height: 1.6;
	 }
	 .button {
	     display: block;
	     width: 100%;
	     padding: 10px;
	     background-color: #007bff;
	     color: white;
	     text-align: center;
	     border: none;
	     border-radius: 5px;
	     cursor: pointer;
	     text-decoration: none;
	     font-size: 16px;
	 }
	 .button:hover {
	     background-color: #0056b3;
	 }
	 select {
	     width: 100%;
	     padding: 10px;
	     margin-bottom: 20px;
	     border-radius: 5px;
	     border: 1px solid #ccc;
	 }
 }
 .overlay-notice {
    display: none; /* 기본 상태를 숨김으로 설정 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 배경색 설정 */
    z-index: 1000; /* 다른 요소 위에 표시 */

    p{
    margin: 5px 0;
    }
}


}
/* 알림 목록 */
    .unread {
        color: red;
        font-weight: bold;
    }
    .read {
        color: gray;
    }
.notice-item {
    display: flex;
    align-items: center;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 10px;
    background-color: #f9f9f9;
    transition: background-color 0.3s ease;
}

.notice-item:hover {
    background-color: #f0f0f0;
}

.notice-link {
    text-decoration: none;
    color: #333;
    display: flex;
    align-items: center;
}

.icon {
    margin-right: 10px;
}

.notice-content h3 {
    font-size: 18px;
    margin: 0;
    font-weight: bold;
}

.notice-content p {
    font-size: 14px;
    color: #666;
    margin: 5px 0 0;
}
</style>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>
   
   	<div class="overlay-notice">
		 <div class="notice">
		   <div class="n-header">
		      <h2 class="n-title">축하드립니다.</h2><span class="n-delete">x</span>
		   </div>
			<div class="notice-container" id="notice-container">
	                <h3>안내</h3>
	                <p>일시: <span class="schedule"></span></p>
	                <p>장소: <span class="locaiotn"></span></p>
	                <p>안내사항: <span class="information"></span></p>
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
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
         <tr><td><a href="/User/MyPage/Notice?user_idx=${user_idx}" class="active-color" data-user-idx="${user_idx}"><img src="/images/Mail.svg" class="img" data-hover="/images/mail3.svg">수신함</a></td></tr>
        </table>
      </div>
	<!-- 알림 목록 -->
	<div class="container">
		<div>
			<h2 id="title">수신함</h2>
		</div>
		<div class="content">
			<div class="subtitles">
				<select id="typeFilter" onchange="filterByType(this.value)">
					<option value="all">전체</option>
					<option value="document">서류 합격 알림</option>
					<option value="interview">면접 합격 알림</option>
					<option value="reply">댓글 알림</option>
				</select>
					<ul id="noticeList">
					    <c:forEach var="notice" items="${notices}">
					        <li class="notice-item" data-type="${notice.type}" data-notice-idx="${notice.noticeIdx}">
					            <a href="javascript:void(0);">
					                <p>상태: <span class="state">${notice.state != 0 ? '읽지 않음' : '읽음'}</span></p>
					                <h3><span>${notice.notification}</span></h3>
					                <p>${notice.subnoti}</p>
					                <p class="remove" onclick="deleteNotice(noticeIdx)">🗑️</p>
					            </a>
					        </li>
					    </c:forEach>
					</ul>
			</div>
		</div>
	</div>
   </div>
 </div>


</main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
 <script>
 const links = document.querySelectorAll(".link");

//사이드 바 클릭시

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
	 
 $('form').on('keypress', function(e) {
	    // 특정 입력 요소에서만 Enter 키를 방지
	    if (e.which === 13 && !$(e.target).is('textarea')) { // textarea가 아닌 경우에만
	        e.preventDefault(); // 기본 동작 방지
	    }
	});

 
 
 </script>
 <script>
 $(function(){
	//수신함
		$('.notice-title').on('click', function(e){
			$('.overlay-notice').show();
		})
		$('.n-delete').on('click', function(){
			$('.overlay-notice').hide();				
		})
		$(".overlay-notice").on('click', function(e) {
				if($(e.target).closest('.notice').length == 0) { 
		   		$(".overlay-notice").hide();
			}
		});
	
  window.addEventListener('wheel', e => {
	  const scrollUp = e.deltaY <= 0;
	  if ( window.scrollY > 100 &&  scrollUp ||  scrollUp != 0) {
		  $("header").slideDown();	
	  } else {
		  $("header").slideUp();	
	  }
	});
 })

  
 </script>
 
 <script>
 const userIdx = userLink.getAttribute('data-user-idx');
 $(document).ready(function() {
	    // 페이지가 로드될 때 기본적으로 전체 알림을 표시
	    filterByType('all');
	    fetchRecentNotifications(userIdx);
	});
 
 const userLink = document.querySelector('a.active-color');
 const noticeList = document.getElementById("noticeList");
 
 function filterByType(type) {
	    console.log("필터링된 타입:", type);
	    const notices = document.querySelectorAll('.notice-item');
	    notices.forEach(notice => {
	        if (type === 'all' || notice.getAttribute('data-type') === type) {
	            notice.style.display = 'flex';
	        } else {
	            notice.style.display = 'none';
	        }
	    });

	    fetch(`/api/notifications/type/` + userIdx + `/` + type)
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            return response.json();
	        })
.then(notices => {
    console.log('Notices:', notices); 
    noticeList.innerHTML = '';  // 기존 알림 초기화
    if (notices.length === 0) {
        noticeList.innerHTML = '<li>알림이 없습니다.</li>';
    } else {
        notices.forEach(notice => {
            console.log('Notice:', notice);  // 확인: 개별 알림 출력
            const li = document.createElement('li');
            li.className = 'notice-item';
            li.setAttribute('data-notice-idx', notice.noticeIdx);
            li.setAttribute('data-community-idx', notice.communityIdx);

            // 값이 null이면 기본값을 사용하도록 처리
            const notification = notice.notification || '알림 내용 없음';
            const subnoti = notice.subnoti || '추가 정보 없음';
            const noticeIdx = notice.noticeIdx;
            
            
            console.log("sef",notification);
            console.log("sef",subnoti);
            li.innerHTML = `
                <a href="#" 
                  >
                   
                   <h3></h3> 
                   <p></p>
                   <p>상태:<span class="state"> </span></p>
                   <p>수신일:<span class="recieveddate"> </span></p>
                </a>
                   <p class="remove" onclick="deleteNotice(noticeIdx)">🗑️</p>
            `;
            li.querySelector('a h3').innerHTML = notification;
			li.querySelector('a p').innerHTML = subnoti;
			li.querySelector('a .state').innerHTML = notice.state == 0 ? '읽지 않음' : '읽음';
			li.querySelector('a .recieveddate').innerHTML = notice.recieveddate;
            noticeList.appendChild(li);
            
            
            
            
        });
        
        // 클릭 이벤트 리스너 등록
        document.querySelectorAll('.notice-item').forEach(item => {
            item.addEventListener('click', () => {
                const noticeIdx = item.getAttribute('data-notice-idx');
                const communityIdx = item.getAttribute('data-community-idx'); // communityIdx 가져오기
                const type = item.getAttribute('data-type'); // type 가져오기

                console.log("노티스", noticeIdx);

                if (type === 'reply') {
                    handleCommentNotification(communityIdx),markNoticeAsRead(noticeIdx);
                } else {
                    getNoticeDetail(noticeIdx),markNoticeAsRead(noticeIdx); // noticeIdx를 매개변수로 전달
                }
            });
        });
        document.querySelectorAll('.remove').forEach(del => {
        	del.addEventListener('click', () => {
                const noticeIdx = del.getAttribute('data-notice-idx');

                console.log("노티스", noticeIdx);

                deleteNotice(noticeIdx);
            });
        });
    }
})

	        .catch(error => console.error('Error:', error));
	}
 

 
 
// 오버레이 닫기
document.querySelector('.n-delete').addEventListener('click', () => {
    document.querySelector('.overlay-notice').style.display = 'none';
});


function getNoticeDetail(noticeIdx) { // noticeIdx를 매개변수로 받음
    console.log("getNoticeDetail 호출, noticeIdx:", noticeIdx); // 여기서 noticeIdx 확인
    fetch(`/api/notifications/\${noticeIdx}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);
            const overlay = document.querySelector('.overlay-notice');
            const container = document.getElementById('notice-container');
            container.innerHTML = `
                <div class="noti" id="notification">
                    <h3>안내</h3>
                    <p>일시: <span class="schedule"></span> </p>
                    <p>장소: <span class="location"></span> </p>
                    <p>안내사항: <span class="information"></span> </p>
                </div>`;
            container.querySelector('div .schedule').innerHTML = data.scadule; // 스케줄
            container.querySelector('div .location').innerHTML = data.location; // 장소
            container.querySelector('div .information').innerHTML = data.information; // 안내사항
            overlay.style.display = 'block'; // 오버레이 표시
        })
        .catch(error => console.error('Error:', error));
}
			
//댓글 게시글로 이동
function handleCommentNotification(communityIdx) {
    location.href = `/Main/Community/View?communityIdx=${communityIdx}`;
}

//알림 삭제
function deleteNotice(noticeIdx) {
    if (confirm('정말로 삭제하시겠습니까?')) {
        fetch(`/api/notification/remove/\${noticeIdx}`, { method: 'DELETE' })
            .then(response => response.text())
            .then(message => {
                alert(message);
                location.reload(); // 새로고침
            })
            .catch(error => console.error('Error:', error));
    }
}

//읽음상태 변경
function markNoticeAsRead(noticeIdx) {
    fetch(`/api/notifications/read/\${noticeIdx}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json' // 서버에 JSON 형식으로 데이터 전송
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text(); // 문자열 응답 처리
    })
    .then(message => {
        console.log(message); // 성공 메시지 출력
    })
    .catch(error => {
        console.error('Error:', error); // 에러 처리
    });
}

//새알림 체크
function fetchRecentNotifications(userIdx) {
    fetch(`/api/notifications/recent/`+userIdx)
        .then(response => response.json())
        .then(notifications => {
            const noticeList = document.querySelector('.notice-list');
            notifications.forEach(notice => {
                const li = document.createElement('li');
                li.className = 'notice-item unread';
                li.innerHTML = `
                    <a href="#" 
                      >
                       
                       <h3></h3> 
                       <p></p>
                       <p>상태:<span class="state"> </span></p>
                       <p>수신일:<span class="recieveddate"> </span></p>
                    </a>
                       <p class="remove" onclick="deleteNotice(noticeIdx)">🗑️</p>
                `;
            li.querySelector('a h3').innerHTML = notification;
			li.querySelector('a p').innerHTML = subnoti;
			li.querySelector('a .state').innerHTML = notice.state == 0 ? '읽지 않음' : '읽음';
			li.querySelector('a .recieveddate').innerHTML = notice.recieveddate;
                noticeList.prepend(li); // 새 알림을 목록 상단에 추가
            });
        })
        .catch(error => console.error('Error:', error));
}

/* // 10초마다 새 알림 체크
setInterval(() => fetchNewNotifications(1), 10000); // userIdx를 동적으로 설정 */
</script>

</body>
</html>
