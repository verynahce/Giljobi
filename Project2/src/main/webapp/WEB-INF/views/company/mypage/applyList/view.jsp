<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="/js/common.js" defer></script>

<style>
main {
   background-color:#F0F2F5;

}
 .innercontents {
   display:flex;
     gap:30px;
    font-family: pretendard; 
  

    padding-top:30px; 
    padding-bottom:60px; 
 }
 
 .sidebar {

   width:300px;
   height:378px;
   border-radius:15px;
   overflow:hidden;
   margin:0;
   
    position: sticky; 
    top: 124px; 

  
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
   background-color:white;
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

     width:  100%;
     display:flex;
      flex-direction: column; 
    justify-content: center;
 }
 
  .contain-body {
    width:940px;
    min-height: 1400px;
    background-color: white;
    border-radius: 20px;
    margin: 0px auto 60px  auto  ;
    padding: 0 60px 50px 60px;
  }

.main-title {
    color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    line-height: 50.40px;
    padding-bottom: 14px; 
    padding-top: 30px;
     }
 
 #info {
     display: flex; 
     padding-top:23px;

    #info-content {
    padding-left:23px;
    #star-size1 {
      width: 15px;
    height: 15px;
    }    
    }    
#info-title {
    
    color: #333333; 
    font-size: 28px; 
    font-weight: 600; 
    line-height: 39.20px; 
}        
p {
    color: #555555; 
    font-size: 16px; 
    font-weight: 400; 
    line-height: 22.40px;
    margin-top: 4px;
    margin-bottom: 3px;
}   
 img {
     width: 120px;
    height: 120px;
    }  
    }

 /*서브 분야들*/ 
 .sub-filed{    
  .sub-topic {
      width:100%;
       border-collapse: collapse;      
    tr {
      border-bottom:1px solid #CCCCCC; 
    td {
      order-bottom:1px solid #CCCCCC; 
      padding-bottom:30px; 
      padding-top: 30px;  
            }   
   .sub-skill {
      padding-bottom:15px; 
      padding-top: 15px;      
              }             
   td:nth-child(1) {                   
      color: #333333; 
      font-size: 16px; 
      font-weight: 500; 
      line-height: 22.40px; 
      width:80px;   
}
   td:nth-child(2) {
      color: #333333; 
      font-size: 16px;
      font-weight: 400;
      line-height: 22.40px; 
      padding-left: 180px;
      border-bottom:                       
           }
          }                    
     }      
    

     p {
      padding-top: 10px;
    color: #767676;
     }         
}


/*서브 - 긴글*/
.sub-content {   
    width:100%;
    min-height: 250px;
    padding-top: 10px;
    color: #767676;
    border-bottom: 1px solid #CCCCCC;
}
/*서브 - 소제목*/
.sub-title {
    color: #333333;
    font-size: 20px; 
    font-weight: 500; 
    line-height: 28px;
    margin-top:63px;
    margin-bottom:16px;
}

/*서브 - 경력긴글*/    
#sub-duty {
 td:nth-child(1) > div {
	width:100%;
	min-height: 100px;
      					}   
 td:nth-child(2) > div {
	width:100%;
	min-height: 100px;
	color: #767676;
      					}
 } 
  
  
     
   /*기술스택 */   
.sub-skill-layout {
     display:flex;
     
     div {
     padding:12px;
     margin:6px;
     background-color:#EBECF1; 
     border-radius: 8px;
     color:#555555px;
     font-size: 12px;
     font-weight: 400;
     }
     
     div:nth-child(1) {
      margin-left: 0px;
     }
} 

/*버튼*/

.btn-layout {   margin: 0 auto;
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
.noob{
	padding:20px 0 0 5px;
	color: #333333; 
    font-size: 16px;
    font-weight: 400;
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
      
      <div class="container" >
      <div class="contain-body">       
      <h2 class="main-title">${resumeVo.resume_title}</h2>
      <hr>
      <div id="info">
       <c:choose>
        <c:when test="${resumeVo.user_idx == 0}">
        <img src="/images/icon/user-profile.png" alt="이미지"/>
        <div id="info-content">
           <h3 id="info-title">탈퇴회원</h3>
           </div>
        </c:when>
        <c:otherwise>
        <img src="/images/icon/user-profile.png" alt="${userVo.user_name}이미지"/>
        <div id="info-content">
           <h3 id="info-title">${resumeVo.user_name}</h3>
           <p>${resumeVo.user_gender},${resumeVo.user_age}세 (${resumeVo.user_year}년)</p>
           <p>${resumeVo.user_email}</p>
           <p>${resumeVo.user_tel}</p>
        </div>
        </c:otherwise>
        </c:choose>
      </div>

      <div class="sub-filed">
        <h4 class="sub-title">학력</h4>
        <hr>
        <table class="sub-topic">
        <tr>
          <td>최종학력</td>
          <td>${resumeVo.eb_name} &nbsp;${resumeVo.edu_name} </td>
        </tr>		
        </table>
      </div>
     
    <c:if test="${not empty resumeVo.skill_name}">
      <div class="sub-filed">
        <h4 class="sub-title">업무 및 스킬</h4>
        <hr>
        <table class="sub-topic"> 
         <tr>
		   <td colspan="2" class="sub-skill">
           <div class="sub-skill-layout">
     
              <div>${resumeVo.skill_name}</div> 
          
           </div> 
         </td>
		</tr>
        </table>
      </div>
    </c:if>

      <div class="sub-filed">
	    <h4 class="sub-title">희망 근무조건</h4>
	    <hr> 
	    <table class="sub-topic">
		<tr>
	      <td>희망근무지</td>
	      <td>${resumeVo.city_name}</td>
	    </tr>
	    <tr>
	      <td>희망직무</td>
	      <td>${resumeVo.duty_name}</td>
	    </tr>
	    <tr>
	      <td>희망고용형태</td>
	      <td>${resumeVo.emp_name}</td>
	    </tr>
	   </table>
	  </div>	  
	  
       <div class="sub-filed">
	    <h4 class="sub-title">경력</h4>
	    <hr> 
       <c:choose>
		  <c:when test="${not empty resumeVo.career_cname}">
	    <table class="sub-topic">
	     <tr>
	       <td>회사명</td>
	       <td>${resumeVo.career_cname}</td>
	     </tr>
   
        <tr>
          <td>근무기간</td>
          <td>${resumeVo.career_sdate} ~ ${resumeVo.career_edate}</td>
        </tr>
        <tr id="sub-duty">
           <td><div>담당업무</div></td>
           <td><div>${resumeVo.career_description}</div></td>
        </tr>
       </table>
         </c:when>
	  	<c:otherwise>
	  		<div class="noob">신입</div>
	  	</c:otherwise>
	  </c:choose>
     </div>
	
      <div class="sub-filed">
	    <h4 class="sub-title" >자기소개서</h4>
	    <hr> 
        <div class ="sub-content">${resumeVo.cover_letter}</div>
	  </div>     
     
    
          </div>
          <div class="btn-layout">
              <div class="btn btn-back"><a href ="/Company/Mypage/ApplyList/ApplyList?post_idx=${post_idx}&company_idx=${company_idx}">돌아가기</a></div>
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
	 
 
 
 </script>
 
</body>
</html>