<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
<script src="/js/header.js" defer></script>

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

#job{
   font-family: pretendard; 
    background-color:#F0F2F5;
    padding-top:30px; 
    padding-bottom:60px; 
    position: relative; 
    z-index: 1; 
    main{        
    width: 890px;
    min-height: 1650px;
    background-color: white;
    border-radius: 20px;
    margin: 0px auto 60px  auto  ;
    padding: 0 60px 50px 60px;
   
     /* 주 제목 */   
    .main-title {
    color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    line-height: 50.40px;
    padding-bottom: 14px; 
    padding-top: 30px;
       }
       
    /* 기업 정보 */   
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
              border-bottom:1px solid #CCCCCC; 
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
     } 
      
    .sub-title {
                color: #333333;
                font-size: 20px; 
                font-weight: 500; 
                line-height: 28px;
                margin-top:63px;
                margin-bottom:16px;
    }
    .sub-content {
    
  				  width:100%;
  				  min-height: 250px;
   				 padding-top: 10px;
    			color: #767676;
   				 border-bottom: 1px solid #CCCCCC;
    }
     p {
      padding-top: 10px;
    color: #767676;
     }
     
     
     /*기술스택 */
     .sub-skill-layout {
     display:flex;
     div {
     padding:12px;
     margin:8px;
     background-color:#EBECF1; 
     border-radius: 4px;
     }
     div:nth-child(1) {
      margin-left: 0px;
     }
     
       }             
     }
    }
    
    /*오른쪽 메뉴*/ 
    #side-menu{
    padding :0 24px ;
    width: 280px; 
    height: 222px;
    background: white; 
    border-radius: 16px; 
    border: 1px #EBEDF1 solid;
  
    
    position: sticky; 
    top: 20px; 
    
    
    
    
    p:nth-child(1) {
    
    color: #767676; 
    font-size: 14px; 
    font-weight: 400; 
    line-height: 19.60px;
    padding-top: 28px ;
    padding-bottom: 12px;
    }
    #side-hit {    
    color: #767676; 
    font-size: 12px; 
    font-weight: 400; 
    line-height: 16.80px; 
    padding-bottom: 22px;
 
    }
    
   h4 {
   color: #333333; 
   font-size: 20px; 
   font-weight: 600; 
   line-height: 28px;
    padding-top: 9px ;
    padding-bottom: 12px ;
     white-space: nowrap;
      overflow: hidden; 
   text-overflow: ellipsis; 
   }
    }
    #side-bottom {
    display:flex;
    justify-content: space-between;
     align-items: center; 
    }
    .btn{
    width: 170px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border-radius: 8px;
   color:white;
    cursor: pointer;
   &:hover {
    background-color: #4A4A4A;
   }
    }
    
    #btn-scrape{
    width: 40px; 
   height: 40px;
   border-radius: 4px;
   border: 1px solid #cccccc;
   text-align: center;
   padding-top:3px;
   
   &:hover
    }
    .image {
    width: 28px; 
    height: 28px;
    font-size: 16px; 
    border-radius: 8px;
    line-height: 14px;
 
 }
 /*버튼*/
 .btn-back {

    width: 200px; 
    height: 60px;
    background: #585766; 
    color: white;
    margin: 0 auto; 
    border-radius: 8px;
    &:hover {
     background-color:#666577;
     color:white;
     
   }
    
    a {
    display: block;
    text-decoration: none; 
    color: white; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 60px;
 }
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
	padding-top :20px;
	font-size: 20px;
}

.s-list{
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

.star, .rats {
margin-top:2px;
width: 28px;
height: 28px;
}

</style>

</head>
<body >
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
			   <div class="s-btn" ><a onclick="alert('채용제의를 완료했습니다.')" class="apply-val" href ="">채용제의</a></div> 
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

<div id="job">
  <div class="inner">
    <div id="main-layout">
    <main>
     
      <h2 class="main-title">${vo.resume_title}</h2>
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
        <c:choose>
        <c:when test="${vo.user_idx == 0}">
            <h3 id="info-title">탈퇴회원</h3>
            </c:when>
            <c:otherwise>
           <h3 id="info-title">${vo.user_name}</h3>
           <p>${vo.user_gender},${vo.user_age}세 (${vo.user_year}년생)</p>
           <p>${vo.user_email}</p>
           <p>${vo.user_tel}<p/>
           </c:otherwise>
        </c:choose>
        </div>
      </div>

      <div class="sub-filed">
        <h4 class="sub-title">학력</h4>
        <hr>
        <table class="sub-topic">
        <tr>
          <td>최종학력</td>
          <td>${vo.eb_name} ${vo.edu_name}</td>
        </tr>
        </table>
      </div>
     <c:if test="${not empty SkillList }">
      <div class="sub-filed">
        <h4 class="sub-title">업무 및 스킬</h4>
        <hr>
        <table class="sub-topic"> 
         <tr>
		   <td colspan="2" class="sub-skill">
           <div class="sub-skill-layout">
          <c:forEach var="skill" items="${SkillList}">
              <div>${skill.skill_name}</div> 
          </c:forEach>
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
	      <td>${vo.city_name}</td>
	    </tr>
	    <tr>
	      <td>희망직무</td>
	      <td>${vo.duty_name}개발</td>
	    </tr>
	    <tr>
	      <td>희망고용형태</td>
	      <td>${vo.emp_name}</td>
	    </tr>
	   </table>
	  </div>
	  
	  
	  
       <div class="sub-filed">
	    <h4 class="sub-title">경력</h4>
	    <hr> 
	  <c:choose>
		  <c:when test="${not empty vo.career_cname}">
				<table class="sub-topic">
		     <tr>
		       <td>회사명</td>
		       <td>${vo.career_cname}</td>
		     </tr>
	   
	        <tr>
	          <td>근무기간</td>
	          <td>${vo.career_sdate} ~ ${vo.career_edate}</td>
	        </tr>
	        <tr id="sub-duty">
	           <td><div>담당업무</div></td>
	           <td><div>${vo.career_description}</div></td>
	        </tr>
	       </table>
		  </c:when>
	  	<c:otherwise>
	  		<spna class="noob">신입</spna>
	  	</c:otherwise>
	  </c:choose>
     </div>
	
      <div class="sub-filed">
	    <h4 class="sub-title" >자기소개서</h4>
	    <hr> 
	    <div class ="sub-content"> ${vo.cover_letter}</div>
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

     
    </main>
    <div class="btn-back"><a href ="List">돌아가기</a></div>
   </div>
   <div>
    <div id="side-menu">
       <div id ="side-frame">
         <p>최종수정일 : ${vo.resume_fdate}<p>
         <hr>
         <h4>이력서 제목</h4>
         <p id="side-hit">조회수 ${vo.resume_hit}<p>

         <div id="side-bottom">
           <button class="btn" id="btn-apply">채용제의</button>
           <div id="btn-scrape" >
           
           <c:choose>
           <c:when test="${vo.user_idx == 0}">
           </c:when>
           <c:when test="${empty cb_idx}">
            <input type="image" class="star"src="/images/bookmark/staroff.png" alt="Star Image"class="image" data-com="${company_idx}" data-re="${vo.resume_idx}">
           </c:when>
           <c:otherwise>
            <input type="image" class="rats"src="/images/bookmark/staron.png" alt="Star Image"class="image" data-com="${company_idx}" data-re="${vo.resume_idx}">          
           </c:otherwise>
           </c:choose>
           
           </div>
         </div>
       </div>
    </div>

   <c:if test="${not empty clickList}">
    <div class="side-recommend">
    <h4>추천 이력서</h4>
    <p>해당 이력서를 본 유저들이 <span style="color: #4876EF;">클릭한</span> 이력서<p>
    <hr>
    
    <c:forEach var="c"  items="${clickList}">
     <a class="side-hover" href="/Main/Hrs/View?resume_idx=${c.resume_idx}" style="display: block;"> 
     <div class="side-post" >
       <div class="side-pcontent" >${c.user_name}</div>
       <div class="side-ptitle">${c.resume_title}</div>
       <div class="side-pcontent2" >${c.duty_name}&nbsp;<span>|</span>&nbsp;${c.duration}&nbsp;</div>
    </div>
   </a>
    </c:forEach>
    </div>
    </c:if>

    
    
    
    
    </div>    
   </div>
 </div>
 
     <%@include file="/WEB-INF/include/footer.jsp" %>

  
  <script>
  
  $(function(){
		$('#btn-apply').on('click', function(e){
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
	

		  window.addEventListener('wheel', e => {
			  const scrollUp = e.deltaY <= 0;
			  if ( window.scrollY > 100 &&  scrollUp ||  scrollUp != 0) {
				  $("header").slideDown();	
			  } else {
				  $("header").slideUp();	
			  }
			});
		
		
//북마크 이벤트	

		var count = '${cb_idx}' ? 1 : 0;
		console.log(count);
		$('.star, .rats').on('click',function() {
		
		if(count === 0)	{
			$(this).attr('src', '/images/bookmark/staron.png');
			 alert('북마크 되었습니다');
			 console.log($(this).data('com'))
			 console.log($(this).data('re'))
			
			 $.ajax({
        			url:'/Main/Hrs/BookMark/On',
        			data:{company_idx: $(this).data('com'),
        				 resume_idx: $(this).data('re')}
        		}).done(function(data){           			
        			console.log()
        		}).fail(function(err){
        			console.log(err)
        		})
        	
			 count = 1; 
			 
		}else {
			$(this).attr('src', '/images/bookmark/staroff.png');
			 alert('북마크 해제되었습니다');
			 console.log($(this).data('com'))
			 console.log($(this).data('re'))
			 
			 $.ajax({
     			url:'/Main/Hrs/BookMark/Off',
     			data:{company_idx: $(this).data('com'),
     				  resume_idx: $(this).data('re')}
     		}).done(function(data){           			
     			console.log()
     		}).fail(function(err){
     			console.log(err)
     		})			 
			count = 0;			
		} 
		})	
		

  })
  

  
  $(".apply-val").attr("href","Scout?resume_idx=${vo.resume_idx}&post_idx=0")
		
  $(".resume-input").click(function(e){
			console.log(e.target.value)
			$(".apply-val").attr("href","Scout?resume_idx=${vo.resume_idx}&post_idx="+e.target.value)
		})
  
 
  
  </script>
  
  
</body>
</html>