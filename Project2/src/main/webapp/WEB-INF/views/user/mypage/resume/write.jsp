<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>   
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>

<style>
 .innercontents {
   display:flex;
     gap:30px;
    font-family: pretendard; 
  

    padding-top:30px; 
    padding-bottom:60px; 
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
   padding:15px 15px;
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
   background-color: #FFEF96;
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
    min-height: 1840px;
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
              border-bottom:1px solid #CCCCCC; 
              padding-bottom:5px; 
              padding-top: 5px;  
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
           padding-left: 155px;
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
.pSkill {

display: inline-block;

  font-size: 17px; 
  color: #555555;   
  padding: 15px;
  margin-right:10px; 
  margin-top:-6px;      
 background-color:#EBECF1; 
 border-radius: 8px;
} 
.skillDelete {
 display: inline-block;
 padding:0 ;
  margin-top:-10.4px; 
 font-size: 17px;
 cursor: pointer;
}


/*버튼*/
  .btn:hover {
   background-color:#666577;
   color: white;
   } 

  .btn-submit {

   background: #585766; 
   color: white;
   font-size: 16.1px; 
   margin-left:353px;
   width: 200px; 
   height: 60px;   
   border-radius: 8px;
   border : 1px solid #585766;
 }
/*input 정리*/
input[type="text"] {
    height: 47px;

    border: 1px solid #cccccc; 
    border-radius:8px;
    padding: 10px;
    color: black; 
    margin: 18px 0;
    font-size: 16px; 
    &::placeholder {
        color: #cccccc; 
    }
}

.input-size2{
 width:100%;
}

.input-size1{
 width:300px;
  padding: 0px;

}
 
select {
    height: 47px;
    border: 1px solid #cccccc; 
    border-radius:8px;
    padding: 10px;
    color: #767676; 
    margin: 18px 4px;
    font-size: 16px; 
}
textarea {
    border: 1px solid #cccccc; 
    border-radius:8px;
    padding: 10px;
    color: #767676; 
    margin: 18px 4px;
    font-size: 16px; 
    width:100%;
    min-height: 240px;
     &::placeholder {
        color: #cccccc; 
    }

}
/*서브 - 경력긴글*/    
#sub-duty {
     	width:100%;
        min-height: 200px;
      					}   
 } 
 
 /*경력 신입 */
.switch {
    border-radius: 20px; 
}

.option {
    flex: 1;
    padding: 10px;
    text-align: center;
    transition: background-color 0.3s;
     background-color: #f0f0f0;
    color:#cccccc;
    cursor: pointer;
    display:inline-block;
    margin:10px 0 ;
    border-radius:8px;
    width:90px;
}

#newbie {
    /* 기본 색상 */
}

#experienced {
   /* 기본 색상 */
}

.active {
    background-color: white; /* 활성화 색상 */
    color: black;
    border: 2px solid #ccc;
}   

#wait-time {
    display: block;
    visibility: visible;
    height: auto;
    overflow: visible;
}
#time {
    display: inline;       /* 기본값 */
    visibility: visible;   /* 보이도록 설정 */
    color: black;          /* 텍스트 색상 */
    font-size: 16px;       /* 텍스트 크기 */
}
#improvedText {
    color: gray; /* 색상을 회색으로 설정 */
}
#improve-button {
width: 120px;
height: 30px;
padding: 0;
background-color: #FFFCEA;
border: 1px solid #CCCCCC;
border-radius: 4px;
 cursor: pointer;
margin-bottom: 9px;

}
.improve_layout{
display: flex;
justify-content: flex-end;
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
         <tr><td><a href="/User/MyPage/Home/View" class="link"><img src="/images/myhome2.svg" class="img" data-hover="/images/myhome.svg">MY홈</a></td></tr>
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${userVo.user_idx}" class="active-color"><img src="/images/icon22.svg" class="img">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${userVo.user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
         <tr><td><a href="/api/notice/list?user_idx=${user_idx}" class="link"><img src="/images/Mail.svg" class="img" data-hover="/images/mail3.svg">수신함</a></td></tr>
        </table>
      </div>
      
      <div class="container" >
    <form action="/User/MyPage/Resume/Write" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="user_idx" value="${userVo.user_idx}"/>      
      <div class="contain-body">  
       
      <h2 class="main-title">이력서 작성</h2>

      
      <h4 class="sub-title">기본정보</h4>
      <hr>
      <div id="info">
         <img src="/images/icon/user-profile.png" alt="${userVo.user_name}이미지" class="preview"/>
        <div id="info-content">
           <h3 id="info-title">${userVo.user_name}</h3>
           <p>${userVo.user_gender},${age}세 (${year}년)</p>
           <p>${userVo.user_tel} &nbsp; &nbsp;|&nbsp; &nbsp; ${userVo.user_email}</p>
          <c:choose> 
        <c:when test="${not empty userVo.user_address}">
           <p>${userVo.user_address}<p/>
        </c:when>
        <c:otherwise>
        <p>주소미기입<p/>
        </c:otherwise>
        </c:choose> 
        </div>
      </div>
        <input id="idPhoto" type="file" name="upimage" class="upimage" style="display:none"accept=".jpg, .jpeg, .png"/>
        <label class="input-file-button idPhto2" for="idPhoto">사진 업로드</label>
      
      <div class="sub-filed">
        <h4 class="sub-title">이력서 제목</h4>
        <hr>
        <input class="input-size2"  id="title"  name="resume_title" type="text" value="" placeholder="나를 표현할 한마디를 적어보세요"/>
      </div>
           

      <div class="sub-filed">
        <h4 class="sub-title">학력</h4>
        <hr>
        <table class="sub-topic">
        <tr>
          <td>최종학력</td>
          <td>
            <input class="input-size1" id="school" type="text" name="eb_name" value="" placeholder="학교명을 입력해주세요"  />
            <select name="edu_id" id="schoolState">
             <c:forEach var="Ed" items="${Edu}">
             <option value="${Ed.edu_id}" >${Ed.edu_name}</option>        
             </c:forEach>
            </select>
            
          </td>
        </tr>	
		
        </table>
      </div>
     
      <div class="sub-filed">
        <h4 class="sub-title">업무 및 스킬</h4>
        <hr>
   		<input class="input-size2" id="skill" type="text" value="" placeholder="스킬을 영어로 입력해주세요" list="skillOptions"/>
         <div id='techList'></div>
         <datalist id ="skillOptions">
       <c:forEach var="skill" items="${Skill}">
         <option value="${skill.skill_name}"/>
         </c:forEach>
         </datalist>
      </div>
      <div class="sub-filed">
	    <h4 class="sub-title">희망 근무조건</h4>
	    <hr> 
	    <table class="sub-topic">
		<tr>
	      <td>희망근무지</td>
	      <td> 
	         <select name="city_id" id="region">	      	       
	         <option>지역</option>
	         <c:forEach var="city" items="${City}">	       
            <option value="${city.city_id}">${city.city_name}</option>           
            </c:forEach>
            </select>
          </td>
	    </tr>
	    <tr>
	      <td>희망직무</td>
	         <td> 
	         <select name="duty_id" id="field">
	         <option value="직무">직무</option>
	         <c:forEach var="duty" items="${Duty}">	      	       
            <option value="${duty.duty_id}">${duty.duty_name}</option>
            </c:forEach>
            </select>
          </td>
	    </tr>
	    <tr>
	      <td>희망고용형태</td>
	      <td> 
	         <select name="emp_id" id="eForm">
	          <option value="고용형태">고용형태</option>
	         <c:forEach var="emp" items="${Emp}">      	       
            <option value="${emp.emp_id}">${emp.emp_name}</option>
            </c:forEach>
            </select>
          </td>
	    </tr>
	   </table>
	  </div>	  
	  
       <div class="sub-filed">
	    <h4 class="sub-title">경력</h4>
	    <hr> 
	    <table class="sub-topic">
	      <tr>
	        <td>신입/경력</td>
	        <td> 
	       <div class="switch">
           <div class="option" id="newbie">신입</div>
           <div class="option" id="experienced">경력</div>
         </div>
         </td>
	     </tr>	  
       </table>
       	  <table class="sub-topic career">
       </table>
     </div>
	

	<div class="sub-filed">
	    <h4 class="sub-title">자기소개서</h4>
	    <hr>
	    <textarea id="cover" name="cover_letter" placeholder="나에 대해 자유롭게 설명하고 채용 기회의 확률을 높이세요" rows="10" cols="50">${resumeVo.cover_letter}</textarea>
	    <br>
	    <div class="improve_layout"><button id="improve-button" type="button" >개선 요청</button></div>
	    <hr>
	    <div id="wait-time" style="display: none;">응답 대기 시간: <span id="time"></span>초</div>
	    <div>
	        <h4>추천 자기소개서:</h4>
	        <p id="improvedText">개선 요청을 클릭해 ai가 추천하는 자기소개서를 받아보세요!</p>
	    </div>
	</div>    

	      
      <div class="file-title">
      <input type="hidden" value="test" name="text">
      
	    <h4 class="sub-title" >파일업로드 </h4><input type="button" id="btnAddFile" value="파일추가(최대 100M Byte)"/>
	      </div> 
	    <hr> 	 
	    <div class="file">
       </div>
	  </div>     

          
          
          <div class="btn-layout">
               <input class="btn btn-submit" type="submit" value="이력서저장"/>
         </div>
         
         </form>
      </div>
   </div>
 </div>

</main>

 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 
 <script>
 
 $(function() {
	 
	 //이미지추가
     $('.upimage').on('change', function() {
                const file = this.files[0];
                console.log(file)
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $('.preview').attr('src', e.target.result).show(); // 미리보기 이미지 표시
                    }
                    reader.readAsDataURL(file); // 파일을 Data URL로 읽기
                }
            });
	 
	 //파일추가
	 
		let num =1;
		$('#btnAddFile').on('click',function(){
	  	  alert('파일추가');
		  let tag ='<div class="file1"><input id="input-file'+num +'" type="file" name="upfile" class="upfile" multiple style="display:none"/> <div class="file-output" ><label class="input-file-button" for="input-file'+num +'">첨부파일</label><div class="file-name">선택된 파일이 없습니다.</div></div></div>';
		  $('.file').append(tag);
		  
		  num++
		  console.log(num);
		})

		$(document).on('change', 'input[type="file"]', function () { 
       var files = $(this)[0].files;
       var fileArr = [];
       for (var i = 0; i < files.length; i++) {
    	   
    	   let num2 = num-1;
 		  console.log(num2);
    	   let deleteX = '<span class="deleteX'+num2
    	   + '"><img src="/images/resume/deletex.png"/>&nbsp;<span>&nbsp;&nbsp;&nbsp;'
 
    	   
        fileArr.push( deleteX  + files[i].name );
    }
     
    var fileList = fileArr.join(', ');
    $(this).closest('.file1').find('.file-name').html(fileList);
    
});     	 //파일삭제
		for (var i = 1; i < 21; i++) {
		    (function(index) {
		        $(document).on('click', '.deleteX' + index, function () { 
		            $(this).closest('.file-name').html('선택된 파일이 없습니다.');
		            console.log($('#input-file' + index).val());
		            $('#input-file' + index).val(''); // index에 맞는 파일 입력 필드 초기화
		            console.log($('#input-file' + index).val());
		        });
		    })(i);
		}
	



	
		
//변수
const formEl = document.getElementsByTagName('form')[0];	 
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



//




//신입 경력 	 
$('.option').click(function() {
	        // 모든 옵션에서 active 클래스 제거
	        $('.option').removeClass('active');

	        // 클릭한 옵션에 active 클래스 추가
	        $(this).addClass('active');
 });	 
 
 
 const addRow = `  
    <tr class="dynamic-row">
     <td>회사명</td>
     <td>
         <input name="career_cname" class="input-size1" id="company" type="text" value="" placeholder="회사명 입력해주세요"/>
     </td>
 </tr>
 <tr class="dynamic-row">
     <td>근무기간</td>
     <td>
         <select id="eYear">
             <option>입사년도</option>
             <c:forEach var="year" begin="2000" end="2024">
                 <option value="${year}">${year}</option>
             </c:forEach>
         </select>
         <select id="eMonth">
             <option>입사월</option>
             <c:forEach var="month" begin="1" end="12">
                 <option value="${month}">${month}</option>
             </c:forEach>
         </select>
         &nbsp;-&nbsp;
         <select id="dYear">
             <option>퇴사년도</option>
             <c:forEach var="year" begin="2000" end="2024">
                 <option value="${year}">${year}</option>
             </c:forEach>
         </select>
         <select id="dMonth">
             <option>퇴사월</option>
             <c:forEach var="month" begin="1" end="12">
                 <option value="${month}">${month}</option>
             </c:forEach>
         </select>
     </td>
 </tr>
 <tr class="dynamic-row">
     <td><div id="sub-duty">담당업무</div></td>
     <td>
         <textarea name="career_description" id="DutyContent" placeholder="담당업무와 업무를 적어주세요"></textarea>
         <input type="hidden" name="career_sdate" id="sdate" />
         <input type="hidden" name="career_edate" id="edate" />
     </td>
 </tr>`
 
 
$('#newbie').addClass('active');

$('#experienced').click(function(){
	$('.career').html(addRow)
          	
})

$('#newbie').click(function(){
	 $('.dynamic-row').remove();
})	 



// 경력 기간 vlaue값 보내기
   
    const eMonth = $('#eMonth').val();
    const dYear = $('#dYear').val();
    const dMonth = $('#dMonth').val();
    const eYear = $('#eYear').val();     

    const sval = eYear + eMonth
    const eval = dYear + dMonth
    $('#sdate').val(sval);
    $('#edate').val(eval);
    console.log(sval);
    console.log(eval); 

  $(document).on('change', '#eYear, #eMonth, #dYear, #dMonth', function() {
   
	const eMonth = $('#eMonth').val();
    const dYear = $('#dYear').val();
    const dMonth = $('#dMonth').val();
    const eYear = $('#eYear').val(); 	    
    const sval = eYear + eMonth
    const eval = dYear + dMonth
    $('#sdate').val(sval);
    $('#edate').val(eval);
    console.log(sval);
    console.log(eval); 
});



 
//기술 스택 
const techs = [];

<c:forEach var="skill" items="${Skill}">
    techs.push('${skill.skill_name}');
</c:forEach>

//기술 입력 필드에서 Enter 키 입력 처리
$('#skill').on("keyup", function(key) {
   if (key.keyCode === 13) { 
       const inputValue = $(this).val().trim(); 
       if (techs.includes(inputValue)) {
    	   
    	   const newDiv = $('<div class="pSkill"></div>').text(inputValue).append('<p class="skillDelete"> &nbsp; x &nbsp; </p>')
    	                                                 .append('<input type="hidden" name="skill_name" value="'+inputValue+'"/>'); 
           $('#techList').append(newDiv); 
           $(this).val(''); 
       } else {
           alert('유효하지 않은 기술입니다.');
       }
       key.preventDefault(); 
   }
});

$('#techList').on('click', '.skillDelete', function() {
    $(this).parent().remove(); // 클릭한 p 태그의 부모 div 삭제
});



//폼 제출 시 Enter 키 입력방치처리
$(formEl).on('keydown', function(event) {
   if (event.keyCode === 13) {
	   const textarea = document.querySelector('#cover'); // textarea의 id를 사용하여 선택
	    if (event.key === 'Enter' && document.activeElement !== textarea) {
	        event.preventDefault(); // textarea가 아닌 경우에만 기본 동작 방지
	    }
   }
});
 
 
 //폼 제출시 null값 방지
 formEl.onsubmit = function() { 
     if ($('#title').val().trim() == '') {
         alert('제목을 입력하세요');
         $('#title').focus();
         return false;
     } else if ($('.upimage').get(0).files.length === 0) { 
         alert('사진을 업로드하세요');
         $('.upimage').focus(); 
         return false;    
     }else if ($('#school').val().trim() == '') {
         alert('학교를 입력하세요');
         $('#school').focus();
         return false;
     } else if ($('#region').val() == '지역') {
         alert('지역을 선택하세요');
         $('#region').focus();
         return false;         
     } else if ($('#field').val() == '직무') {
         alert('희망직무를 선택하세요');
         $('#field').focus();
         return false;         
     } else if ($('#eForm').val() == '고용형태') {
         alert('고용형태를 선택하세요');
         $('#eForm').focus();
         return false;         
     } else if ($('#cover').val().trim() == '') {
         alert('자기소개서를 작성하세요');
         $('#cover').focus();
         return false;    
     } else if ($('#company').val().trim() == '') {
             alert('회사를 입력하세요');
             $('#company').focus(); 
             return false;    
         } else if ($('#eYear').val() == '입사년도') {
             alert('입사년도를 선택하세요');
             $('#eYear').focus(); 
             return false;    
         } else if ($('#eMonth').val() == '입사월') {
             alert('입사월을 선택하세요');
             $('#eMonth').focus(); 
             return false;    
         } else if ($('#dYear').val() == '퇴사년도') {
             alert('퇴사년도 선택하세요');
             $('#dYear').focus(); 
             return false;    
         } else if ($('#dMonth').val() == '퇴사월') {
             alert('퇴사월을 선택하세요');
             $('#dMonth').focus(); 
             return false;    
         } else if ($('#DutyContent').val() == '') { 
             alert('담당업무를 입력하세요');
             $('#DutyContent').focus(); 
             return false;    
         }else {
        	 
        	 
        	 return true;
         }
         
   
 };


 })
 </script>
 

 <script>
 document.getElementById('improve-button').addEventListener('click', function(event) {
	    event.stopPropagation();
	    event.preventDefault();
	    improveCoverLetter();
	});

	function improveCoverLetter() {
	    const coverLetter = document.getElementById("cover").value;

	    if (!coverLetter.trim()) {
	        alert("자기소개서를 입력해주세요");
	        return;
	    }

	    const waitTimeDisplay = document.getElementById("wait-time");
	    const timeDisplay = document.getElementById("time");
	    let startTime = Date.now(); // 시작 시간 기록
	    let intervalId = null; // setInterval을 위한 ID

	    // 대기 시간 표시 시작
	    waitTimeDisplay.style.display = "block"; 

	    // 실시간 업데이트
	    intervalId = setInterval(() => {
	        let elapsed = ((Date.now() - startTime) / 1000).toFixed(2); // 경과 시간 계산
	        timeDisplay.innerText = elapsed;
	    }, 10); // 0.01초마다 업데이트

	    fetch('http://localhost:9090/coverletter/improve', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify({ 
	            messages: [
	                {
	                    role: "system",
	                    content: "이 자기소개서를 업그레이드 시켜줘."
	                },
	                {
	                    role: "user",
	                    content: coverLetter
	                }
	            ]
	        })
	    })
	    .then(function(response) {
	        if (!response.ok) {
	            return response.json().then(function(errorData) {
	                throw new Error(errorData.message || '알 수 없는 에러가 발생했습니다.');
	            });
	        }
	        return response.json();
	    })
	    .then(function(data) {
	        // 개선된 자기소개서 표시
	        document.getElementById("improvedText").innerText = data.improvedCoverLetter;
	    })
	    .catch(function(error) {
	        alert(`에러 발생: ${error.message}`);
	    })
	    .finally(function() {
	        // 실시간 업데이트 종료
	        clearInterval(intervalId); // setInterval 중지
	        waitTimeDisplay.style.display = "none"; // 대기 시간 숨기기
	    });
	}


</script>
 
 
</body>
</html>