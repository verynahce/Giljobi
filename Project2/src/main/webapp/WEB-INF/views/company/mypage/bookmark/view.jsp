<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
<script src="/js/header.js" defer ></script>
<style>
/*오버레이*/
.overlay {
  
  position: fixed;
  top: 0;
  left: 0;
  z-index: 2;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display:none;
    transition: all 0.3s  ease-in;
 }

 /*body*/
.inner {
display:flex;
justify-content: space-between;

}
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
    top: 20px; 
  
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
   background-color: #BED0FF;
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
      height: 74px;         
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
 
 .btn-apply {
   
   color: #585766;
   border : 1px solid #585766;
   &:hover {
     background-color:#F8F8F8;
     color:#585766;

   }
 }
 
 /*채용제의 */
.support {
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%); 
   width: 600px; 
   background-color: white; 
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
   z-index: 3 
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 8px;
   padding: 40px 51px 15px 51px;
}
.s-header {

display:flex;
justify-content: space-between;
}
.s-title {
color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    line-height: 50.40px;
    margin-bottom: 30px;
    }

.s-select {
    width: 100%; 
    height: 60px;
    border: 1px solid #cccccc;
    border-radius:12px;
    color: #767676;
    padding: 5px;
    margin-bottom: 19px;
}

.s-content {
    width: 100%; 
    max-width: 100%; 
    height: 200px;
    max-height: 200px;
    border: 1px solid #cccccc;
    border-radius:12px;
    color: #767676;
    padding: 5px;
    margin-bottom: 80px;
}
.s-btn {
width: 170px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border-radius: 8px;
   color:white;
   margin:0 auto;

    cursor: pointer;
   &:hover {
    background-color: #4A4A4A;
   }
   a{ display: block;
    text-decoration: none; 
    color: white; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 33px;
   }   
   }
.s-delete {
 color: #767676;
font-weight: 300;
font-size: 36px;  
cursor: pointer;
}

.noob{
	padding:20px 0 0 5px;
	color: #333333; 
    font-size: 16px;
    font-weight: 400;
}

.s-list{
  border-collapse: collapse;
  width:100%;
  margin-bottom: 20px;
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

</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>
	<div class="overlay">  
	<c:choose>
		<c:when test="${not empty postVo}">
			 <div class="support"> 
			   <div class="s-header">
			      <h2 class="s-title">채용제의</h2><span class="s-delete">x</span>
			   </div>
			    <table class="s-list">
			     <c:forEach var="post" items="${postVo}">
              <tr>
                <td>
					<input type="radio" name="post_idx" id="post_id${post.post_idx}" class="resume-input" value="${post.post_idx}">
					<label for="post_id${post.post_idx}">${post.post_title}</label>
                </td>
              </tr>
            </c:forEach>
          </table>
			   <div class="s-btn" ><a class="apply-val" href ="">채용제의</a></div> 
			</div>
		</c:when>
		  <c:otherwise>
		  	<div class="support login-alter">
		      <h2 class="s-title">기업회원 로그인이 필요합니다.</h2>
			  <a href ="/Company/LoginForm">로그인</a>
		   </div>
		  </c:otherwise>
	</c:choose>	
	</div>
<main>
  <div class="inner">  
      <div class="innercontents">
      <div class="sidebar">
        <table>
         <tr><th>기업서비스</th></tr>
         <tr><td><a href="/Company/Mypage/Home/View?company_idx=${company_idx}" class="link"><img src="/images/myhome2.svg" class="img" data-hover="/images/myhome.svg">MY홈</a></td></tr>
         <tr><td><a href="/Company/Mypage/Post/List?company_idx=${company_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">채용공고</a></td></tr>
         <tr><td><a href="/Company/Mypage/Bookmark/List?company_idx=${company_idx}" class="active-color2"><img src="/images/icon33.svg" class="img">관심인재</a></td></tr>
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${company_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
        </table>
      </div>
      
      <div class="container" >
      <div class="contain-body">       
      <h2 class="main-title">${resumeVo.resume_title}</h2>
      <hr>
      <div id="info">
      <c:choose>
       <c:when test="${imagePath != '0'}">
         <img src="/image/read?path=${imagePath}" alt="User Image" >
       </c:when> 
       <c:otherwise>
         <img src="/images/icon/user-profile.png" alt="User Image" >
       </c:otherwise>
      </c:choose> 
        <div id="info-content">
           <h3 id="info-title">${resumeVo.user_name}</h3>
           <p>${resumeVo.user_gender},${resumeVo.user_age}세 (${resumeVo.user_year}년)</p>
           <p>${resumeVo.user_email}</p>
           <p>${resumeVo.user_tel}</p>
        </div>
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
    <c:if test="${not empty pfvoList}">
      <div class="sub-filed">
	    <h4 class="sub-title" >파일업로드</h4>
	    <hr> 
	    <c:forEach var="p" items="${pfvoList}">
       <div class="sub-filedown">
         <a href="/filedownload/${p.portfolio_idx}">
       <img src="/images/resume/link1.png"/>&nbsp;&nbsp;&nbsp;
       ${p.filename}
       </a>
       </div>
       </c:forEach>
	  </div>     
     </c:if>
    
          </div>
          <div class="btn-layout">
              <div class="btn btn-apply"><a href ="#">채용제의</a></div>
              <div class="btn btn-back"><a href ="/Company/Mypage/Bookmark/List?company_idx=${company_idx}">돌아가기</a></div>
         </div>
      </div>
   </div>
 </div>

</main>

 
 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 <script>
 
 //오버레이 
 $(function(){
	 
	$('.btn-apply').on('click', function(e){
		 e.preventDefault();
		$('.overlay').show();		
						
	})
	$('.s-delete').on('click', function(){
		$('.overlay').hide();				
	})
	$('.s-btn').on('click', function(){
		$('.overlay').hide();				
	})
		$(".overlay").on('click', function(e) {
    if($(e.target).closest('.support').length == 0) { 
         $(".overlay").hide();
    }

})

  $(".apply-val").attr("href","/Company/Mypage/Bookrmark/Support?resume_idx=${resumeVo.resume_idx}&post_idx=${0}")
		console.log( $(".apply-val").attr("href"))
  $(".resume-input").click(function(e){
			console.log(e.target.value)
			$(".apply-val").attr("href","/Company/Mypage/Bookrmark/Support?resume_idx=${resumeVo.resume_idx}&post_idx="+e.target.value)
		})



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
 

 })
 </script>
 
</body>
</html>