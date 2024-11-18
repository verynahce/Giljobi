<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer ></script>
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

#job{
   font-family: pretendard; 
    background-color:#F0F2F5;
    padding-top:30px; 
    padding-bottom:60px; 

       
    main{        
    width: 890px;
    min-height: 1960px;
    background-color: white;
    border-radius: 20px;
    margin: 0px auto 60px  auto  ;
    padding-left: 60px;
    padding-right: 60px;
    padding-bottom:50px;
   

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
     padding-bottom:20px; 
     padding-top: 20px;  
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
      padding-left: 160px;
      border-bottom:                       
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
    .side-menu{
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
    padding-bottom: 12px;
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
    .btn {
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
   width: 570px; 
   height: 700px; 
   background-color: white; 
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
   z-index: 3 
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 8px;
   padding: 80px 51px 15px 51px;
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
 margin-bottom: 8px;
 padding:0;
    }


.s-list{
  border-collapse: collapse;
  width:100%;
   tr {
   td { 
   padding:18px 0 18px;
   }
   td:nth-child(1){
   width:80%;
   text-align: left;
   input{
   width: 17px;
   height: 17px;
   border-bottom: #cccccc
      }
   label{
   margin-left:8px;
   font-size: 20px;
   color: #333333;
   }
   }
   td:nth-child(2){
   width:20%;
   text-align: right;
   color: #767676;
   }
   }
}


.s-btn {
   width: 170px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border-radius: 8px;
   color:white;

   position: absolute; /* 절대 위치 설정 */
   bottom: 50px;
   cursor: pointer;
   left: 50%;
   transform: translateX(-50%);
   
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
   }   
   }
.s-delete {
 color: #767676;
font-weight: 300;
font-size: 36px;  
cursor: pointer;

}

.jobs-view-title{
	font-size : 36px;
	margin-top : 60px;
	text-align: center;
	font-weight: 500;
	
}



/* 원그래프 (파이 차트) */
.pie-chart {
margin:10px 0 8px 0;
  width: 140px;
  height: 140px;

  border-radius: 50%;
  position: relative;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  
   background: conic-gradient(
    #CCCCCC 0% 70%,   /* 70% 까지 파란색 */
    #CCCCCC 70% 100%  /* 나머지 30%는 금색 */
  );
}

/* 원그래프 중간을 비워두기 */
.pie-chart-inner {
  position: absolute;
  top: 17.5%;  /* 150px의 17.5% = 26.25px */
  left: 17.5%; /* 150px의 17.5% = 26.25px */
  width: 65%;  /* 150px의 65% = 97.5px */
  height: 65%; /* 150px의 65% = 97.5px */
  background-color: white;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
   /* 배경에 사람 이모티콘 이미지 추가 */
  background-image: url('/images/post/people.png'); /* 실제 이미지 경로로 수정 */
  background-size: 70%; /* 이미지 크기를 80%로 설정하여 배경보다 작게 만들기 */
  background-position: center; /* 이미지를 중앙에 배치 */
  background-repeat: no-repeat; /* 이미지 반복 안 함 */
}

/* 중앙 텍스트 스타일 */
.chart-text {
  font-size: 24px;
  font-weight: 600;
  color: #333;
}

</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>
<div class="overlay">  
<c:choose>
  <c:when test="${not empty userObject}">
    <div class="support">
      <div class="s-header">
        <h2 class="s-title">이력서</h2>
        <span class="s-delete">x</span>
      </div>
      <hr>
      <c:choose>
        <c:when test="${not empty resumeVo}">
          <table class="s-list">
            <c:forEach var="resume" items="${resumeVo}">
              <tr>
                <td>
                  <input type="radio" name="resume_idx" class="resume-input" value="${resume.resume_idx}">
                  <label for="resume_id${resume.resume_idx}">${resume.resume_title}</label>
                </td>
                <td>
                  <p>${resume.resume_fdate}</p>
                </td>
              </tr>
            </c:forEach>
          </table>
          <div class="s-btn">
            <a class="apply-val" href="">입사지원</a>
          </div>
        </c:when>
        <c:otherwise>
        <div class="jobs-view-title">등록된 이력서가 없습니다.</div>
          <div class="s-btn">
          	
            <a onclick="alert('채용제의를 완료했습니다.')" class="apply-val,resume-add" href="">이력서 등록</a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </c:when>
  <c:otherwise>
    <div class="support login-alter">
      <h2 class="s-title">개인회원 로그인이 필요합니다.</h2>
      <a href="/User/LoginForm">로그인</a>
    </div>
  </c:otherwise>
</c:choose>
</div>
<div id="job">
  <div class="inner">
    <div id="main-layout">
    <main>
      <h2 class="main-title">${vo.post_title}</h2>
      <hr>
      <div id="info">
        <img src="/images/icon/company-profile.png" alt="회사 이미지"/>
        <div id="info-content">
           <h3 id="info-title">${vo.company_name}</h3>
           <p><img id="star-size1"src="/images/star1.png" alt="Star Image"> (${not empty totPoint ? totPoint : 0.0 })</p>
           <p>${vo.company_email}</p>
           <p>${vo.company_tel }<p/>
        </div>
      </div>
      <div class="sub-filed">
        <h4 class="sub-title">모집조건</h4>
        <hr>
        <table class="sub-topic">
        <tr>
          <td>직무</td>
          <td>${vo.duty_name}</td>
        </tr>
		<tr>
		 <td>경력</td>
		  <td>${vo.career_name}</td>
		</tr>
		<tr>
		  <td>최종학력</td>
		  <td>${vo.edu_name}</td>
		</tr>
		<tr>
		  <td>급여</td>
		  <td>연봉 ${vo.post_salary}</td>
		</tr>
		<c:if test="${not empty vo.skill_name}">
			<tr>
			  <td colspan="2" class="sub-skill">업무스킬
	           <div class="sub-skill-layout">
	              <div>${vo.skill_name}</div>
	           </div> 
	         </td>
			</tr>		
		</c:if>
        </table>
      </div>
      <div class="sub-filed">
	    <h4 class="sub-title">근무조건</h4>
	    <hr> 
	    <table class="sub-topic">
		<tr>
	      <td>근무형태</td>
	      <td>${vo.emp_name}</td>
	    </tr>
	    <tr>
	      <td>근무지역</td>
	      <td>${vo.city_name}</td>
	    </tr>
	   </table>
	  </div>
      <div class="sub-filed">
	    <h4 class="sub-title" >상세내용</h4>
	    <hr> 
	    <div class ="sub-content">${vo.post_content}</div>
	  </div>

	  <div class="sub-filed">
	    <h4 class="sub-title">접수기간 및 방법</h4>
	    <hr> 
	    <table class="sub-applyinfo">
	     <tr>
	       <td>
	       <div class="apply-layout1">
	         <div><img src="/images/post/clock.png"  alt="시계"/></div>
	         <div class="apply-title">남은기간</div>
	         <div class="apply-dday"></div>
	         <div class="apply-date">시작일&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;${vo.post_cdate}</div>
	         <div class="apply-date">마감일&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;${vo.post_ddate}</div>
	       </div>
	       </td>
	       
	       <td>	    
	      <img class="apply-paper" src="/images/post/paper.png"  alt="종이"/>
	       <div class="apply-layout2">
	         <div class="apply-title">지원방법</div><div>길잡이 입사지원</div>
	       </div>
	       <div class="apply-layout2">
	         <div class="apply-title">접수양식</div><div>길잡이 이력서양식</div>
           </div>        
	       </td>
	       
	       <td>	 
	       <div class="apply-layout1">   
	         <div class="apply-title">지원자수</div>
		    <div class="pie-chart">
		      <div class="pie-chart-inner">
		        <span class="chart-text" id="total-applicants">${pcount.total_count}명</span>
		      </div>
		    </div>
	         <div class="apply-date">여자&nbsp;&nbsp;&nbsp;${pcount.female_count}명&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;남자&nbsp;&nbsp;&nbsp;${pcount.male_count}명</div>	         
	       </div>
	       </td>
	     </tr>
   
      
       </table>
     </div>

     <div class="sub-filed">
        <h4 class="sub-title" >유의사항</h4>
        <hr> 
        <p>입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후에도 채용이 취소될 수 있습니다<p>
     </div>

    </main>
    <div class="btn-back"><a href ="List">돌아가기</a></div>
   </div>
     <div>
    <div class="side-menu">
       <div class ="side-frame">
         <p>최종수정일 : ${vo.post_fdate}<p>
         <hr>
         <h4>${vo.post_title}</h4>
         <p id="side-hit">조회수 ${vo.post_hit}<p>

         <div id="side-bottom">
           <button class="btn" id="btn-apply">입사지원</button>
           <div id="btn-scrape" >
            <input type="image" src="/images//star1.png" alt="Star Image"class="image">
           </div>
         </div>
       </div>
    </div>
    <c:if test="${not empty clickList}">
    <div class="side-recommend">
    <h4>추천공고</h4>
    <p>해당 공고를 본 유저들이 <span style="color: #4876EF;">클릭한</span> 공고<p>
    <hr>
    
    <c:forEach var="c"  items="${clickList}">
     <a class="side-hover" href="/Main/Jobs/View?post_idx=${c.post_idx}" style="display: block;"> 
     <div class="side-post" >
       <div class="side-pcontent" >${c.company_name}<span>${c.post_ddate}</span></div>
       <div class="side-ptitle">${c.post_title}</div>
       <div class="side-pcontent2" >${c.career_name}&nbsp;<span>|</span>&nbsp;${c.duty_name}&nbsp;<span>|</span>&nbsp;${c.emp_name}</div>    
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

	$('#btn-apply').on('click', function(){
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
	
	
	
	$(".apply-val").attr("href","Apply?post_idx=${vo.post_idx}&resume_idx=0")
		$(".resume-input").click(function(e){
			console.log(e.target.value)
			$(".apply-val").attr("href","Apply?post_idx=${vo.post_idx}&resume_idx="+e.target.value)
			
		})
		
	
		
      const total = ${pcount.total_count};
	  const malePercentage = (${pcount.male_count} / total) * 100;
      const femalePercentage = (${pcount.female_count}  / total) * 100;	
		
	  const pieChart = document.querySelector('.pie-chart');
	  pieChart.style.background = 'conic-gradient(' +
	    '#4876EF 0% ' + malePercentage + '%, ' +    
	    '#FFD700 ' + malePercentage + '% 100%' +
	    ')';
	
	  
	  /*시간 타이머 */
	  const dday = "${vo.post_ddate}";

	  let ddayDate = dday.replace(/[^\d]/g, '-').replace(/--+/g, '-').replace(/-$/, '');
	  const DDate = new Date(ddayDate + "T23:59:59");
      
	    // 타이머 업데이트 함수
	    function updateTimer() {
	      const cTime = new Date();
	      const timeRemaining = DDate - cTime; // 목표 날짜와 현재 시간의 차이
            
	      // 남은 시간이 0보다 크면 타이머를 갱신
	      if (timeRemaining > 0) {
	        const days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24)); 
	        const hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
	        const minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60)); 
	        const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);
	       
	        
	        const fHours = hours < 10 ? '0' + hours : hours;
	        const fMinutes = minutes < 10 ? '0' + minutes : minutes;
	        const fSeconds = seconds < 10 ? '0' + seconds : seconds;
	        
	        const ddayText = days + '일 ' +fHours +':'+fMinutes+':'+fSeconds
	        document.querySelector('.apply-dday').textContent = ddayText;
	   
	      } else {
	        // 타이머가 끝나면 "D-Day"라고 표시
	    	  document.querySelector('.apply-dday').textContent = "마감된 공고입니다";
	      }
	    }

	    // 1초마다 타이머 업데이트
	    setInterval(updateTimer, 1000);

	    // 초기 실행
	    updateTimer();
	  
	  
	
  })

  </script>
</body>
</html>