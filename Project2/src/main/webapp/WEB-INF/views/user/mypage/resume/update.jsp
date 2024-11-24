<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>   
<!DOCTYpE html>
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
    font-family: pretendard; 
  

    padding-top:30px; 
    padding-bottom:60px; 
 }
 
 .sidebar {
   border :1px solid #ccc;
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
    padding:30px 0 14px 0 ;
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
input[type="text"]:not(.title-input) {
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

.title-input {
    border: 0px solid #cccccc;
     height: 47px; 
     color: black; 
    font-size: 36px; 
    font-weight: 600; 
     width:100%;
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
.active {
    background-color: white; 
    color: black;
    border: 2px solid #ccc;
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
         <tr><td><a href="/User/MyPage/Resume/List?user_idx=${user_idx}" class="active-color"><img src="/images/icon22.svg" class="img">이력서</a></td></tr>
         <tr><td><a href="/User/MyPage/BookMark/List?user_idx=${user_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심기업 / 받은제의</a></td></tr>
         <tr><td><a href="/User/MyPage/ApplyList/List?user_idx=${user_idx}" class="link"><img src="/images/arrow.svg" class="img" data-hover="/images/arrow2.svg">지원내역</a></td></tr>
         <tr><td><a href="/User/MyPage/Notice/List?user_idx=${user_idx}" class="link"><img src="/images/Mail.svg" class="img" data-hover="/images/Mail.svg">수신함</a></td></tr>
        </table>
      </div>
      
      <div class="container" >
    <form action="/User/MyPage/Resume/Update" method="Post"enctype="multipart/form-data"> 
    <input type="hidden" name="resume_idx" value="${resumeVo.resume_idx}"/>   
      <div class="contain-body">  
       
      <h2 class="main-title">
      <input class="title-input"type="text" name="resume_title"value="${resumeVo.resume_title}" placeholder="제목을 입력하세요"/>
      </h2>
      <hr>
      <div id="info">
       <c:choose>
      <c:when test="${imagePath != '0'}">
         <img src="/image/read?path=${imagePath}" alt="User Image" class="preview">
       </c:when> 
       <c:otherwise>
         <img src="/images/icon/user-profile.png" alt="User Image" class="preview">
       </c:otherwise>
       </c:choose> 
        <div id="info-content">
           <h3 id="info-title">${resumeVo.user_name}</h3>
           <p>${resumeVo.user_gender},${resumeVo.user_age}세 (${resumeVo.user_year}년)</p>
           <p>${resumeVo.user_tel} &nbsp; &nbsp;|&nbsp; &nbsp; ${resumeVo.user_email}</p>
          <c:choose> 
        <c:when test="${not empty resumeVo.user_address}">
           <p>${resumeVo.user_address}<p/>
        </c:when>
        <c:otherwise>
        <p>주소미기입<p/>
        </c:otherwise>
        </c:choose> 
        </div>
      </div>
        <input id="idPhoto" type="file" name="upimage" class="upimage" style="display:none"accept=".jpg, .jpeg, .png"/>
        <label class="input-file-button idPhto2" for="idPhoto">사진 업로드</label>
       <c:if test="${not empty ifvo.image_idx}">
        <input type="hidden" value="${ifvo.image_idx}" name="image_idx"/>
       </c:if>
      <div class="sub-filed">
        <h4 class="sub-title">학력</h4>
        <hr>
        <table class="sub-topic">
        <tr>
          <td>최종학력</td>
          <td>
            <input class="input-size1" id="school" type="text" name="eb_name"value="${resumeVo.eb_name}" placeholder="학교명을 입력해주세요"  />
            <select name="edu_id" id="schoolState">           
            
            <c:forEach var="Ed" items="${Edu}">
            <option value="${Ed.edu_id}"  <c:if test="${Ed.edu_name == resumeVo.edu_name}">selected</c:if>>${Ed.edu_name}</option>        
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
         <div id='techList'>  
         <c:if test="${not empty resumeVo.skill_name}">
           <div class="pSkill">
           ${resumeVo.skill_name}
            <p class="skillDelete"> &nbsp; x &nbsp; </p>
            <input type="hidden" name="skill_name" value="${resumeVo.skill_name}"/>
           </div>
         </c:if> 
         
         </div>       
         
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
	         <c:forEach var="city" items="${City}">	       
            <option value="${city.city_id}"<c:if test="${city.city_name == resumeVo.city_name }">selected</c:if>>${city.city_name}</option>
           
            </c:forEach>	      
            </select>
          </td>
	    </tr>
	    <tr>
	      <td>희망직무</td>
	         <td> 
	         <select name="duty_id" id="field">
	         <c:forEach var="duty" items="${Duty}">	      	       
            <option value="${duty.duty_id}"<c:if test="${duty.duty_name == resumeVo.duty_name }">selected</c:if>>${duty.duty_name}</option>
            </c:forEach>
            </select>
          </td>
	    </tr>
	    <tr>
	      <td>희망고용형태</td>
	      <td> 
	         <select name="emp_id" id="eForm">
	         <c:forEach var="emp" items="${Emp}">      	       
            <option value="${emp.emp_id}"<c:if test="${emp.emp_name == resumeVo.emp_name }">selected</c:if>>${emp.emp_name}</option>
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
	    <h4 class="sub-title" >자기소개서</h4>
	    <hr> 
	    <textarea name="cover_letter"id="cover" placeholder="나에 대해 자유롭게 설명하고 채용기회의 확률을 높이세요">${resumeVo.cover_letter}</textarea>
	  </div>     
     
     	      
      <div class="file-title">
      <input type="hidden" value="test" name="text">
      
	    <h4 class="sub-title" >파일업로드 </h4><input type="button" id="btnAddFile" value="파일추가(최대 100M Byte)"/>
	      </div> 
	    <hr> 
	     <c:forEach var="p" items="${pfvoList}">
       <div class="sub-filedown">
         <a class="aDelete" href="/deleteFile?portfolio_idx=${ p.portfolio_idx }">
       <img src="/images/resume/deletex.png"/>&nbsp;&nbsp;&nbsp;
       ${p.filename}
       </a>
       </div>
       </c:forEach>	 
	    <div class="file">
       </div>
    
    
          </div>
          
          
          <div class="btn-layout">
               <input class="btn btn-submit" type="submit" value="이력서수정"/>
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
		
	//기존 파일 삭제	
		//x 클릭
  $('.aDelete').on('click',function(event){
	
	event.preventDefault();   // a tag의 기본 이벤트 취소	
	event.stopPropagation();  // 이벤트 상위로 보낸다
	let aDelete = this; // 현재클릭한 x a tag 
	
	//서버에서 파일과 Files table의 정보를 삭제하고 돌아온다
	$.ajax({
		url : this.href,
		method:'GET'
	}).done(function(result){
		$(aDelete).parent().remove();
	}).fail(function(error){
		console.log(error);
		alert('서버오류발생:' + error + '관리자에게문의하세요')
	})
	
  })
		
		 
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
         <input name="career_cname" class="input-size1 cp" id="company" type="text" value="${resumeVo.career_cname}" placeholder="회사명 입력해주세요"/>
     </td>
 </tr>
 <tr class="dynamic-row">
     <td>근무기간</td>
     <td>
         <select id="eYear">
         <c:if test="${empty sYear}">
         <option>입사년도</option>
         </c:if>
             <c:forEach var="year" begin="2000" end="2024">
                 <option value="${year}"<c:if test="${year == sYear}">selected</c:if>>${year}년</option>
             </c:forEach>
         </select>
         <select id="eMonth">
         <c:if test="${empty sMonth}">
         <option >입사월</option>
         </c:if>        
             <c:forEach var="month" begin="01" end="12">
                 <option value="${month}" <c:if test="${month == sMonth}">selected</c:if>>${month}월</option>
             </c:forEach>
         </select>
         &nbsp;-&nbsp;
         <select  id="dYear">
         <c:if test="${empty eYear}">
         <option >퇴사년도</option>
         </c:if>                 
             <c:forEach var="year" begin="2000" end="2024">
                 <option value="${year}"<c:if test="${year == eYear}">selected</c:if>>${year}년</option>
             </c:forEach>
         </select>
         
         
         <select  id="dMonth">
         <c:if test="${empty eMonth}">
         <option >퇴사월</option>
         </c:if>
         
             <c:forEach var="month" begin="01" end="12">
                 <option value="${month}" <c:if test="${month == eMonth}">selected</c:if>>${month}월</option>
             </c:forEach>
         </select>
         
     </td>
 </tr>
 <tr class="dynamic-row">
     <td><div id="sub-duty">담당업무</div></td>
     <td>
         <textarea name="career_description" id="DutyContent" placeholder="담당업무와 업무를 적어주세요">${resumeVo.career_description}</textarea>
         <input type="hidden" name="career_sdate" id="sdate" />
         <input type="hidden" name="career_edate" id="edate" />
     </td>
 </tr>`
 
 
 
 // input 값이 하나라도 있으면 경력이 보인다(수정 예정)
if ( $('.cp').val() !== '') {  
	 $('#experienced').addClass('active');
	 $('.career').html(addRow); 
	 console.log($('.cp').val())
	 }else {
		 
	 }
  
 
 //신입 경력 클릭시 
 $('#experienced').click(function(){

		 $('.career').html(addRow)   	
})

$('#newbie').click(function(){
	 $('.dynamic-row').remove();
})	 


// 경력 기간 value값 보내기  
   
    const eMonth = $('#eMonth').val();
    const dYear = $('#dYear').val();
    const dMonth = $('#dMonth').val();
    const eYear = $('#eYear').val();     

    const sval = eYear + eMonth
    const eval = dYear + dMonth
    $('#sdate').val(sval);
    $('#edate').val(eval);

  $(document).on('change', '#eYear, #eMonth, #dYear, #dMonth', function() {
   
	  const eMonth = $('#eMonth').val();
	    const dYear = $('#dYear').val();
	    const dMonth = $('#dMonth').val();
	    const eYear = $('#eYear').val(); 	    
	    const sval = eYear + eMonth
	    const eval = dYear + dMonth
	    $('#sdate').val(sval);
	    $('#edate').val(eval);

});

 
//기술 스택 

    const techs = [];

    <c:forEach var="skill" items="${Skill}">
        techs.push('${skill.skill_name}');
    </c:forEach>
// 미리 스택 받기




//기술 입력 필드에서 Enter 키 입력 처리
$('#skill').on("keyup", function(key) {
   if (key.keyCode === 13) { 
       const inputValue = $(this).val().trim(); 
       if (techs.includes(inputValue)) {
    	   
    	   const newDiv = $('<div class="pSkill"></div>').text(inputValue).append('<p class="skillDelete"> &nbsp; x &nbsp; </p>')
    	                                                 .append('<input type="hidden" name="skill_name" value="'+inputValue+'"/>'); 
    	   $('#techList').append(newDiv); 
           $(this).val(''); 
           console.log($('[name=skill_name]').val())
           
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
});;
 

 //폼 제출시 null값 방지
 formEl.onsubmit = function() { 
	 if ($('.title-input').val().trim() == '') {
         alert('제목을 입력하세요');
         $('.title-input').focus();
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
 
 
 
</body>
</html>