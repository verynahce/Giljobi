<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
<style>
.stack-line{
margin-top:6px;
margin-left: -8px;
}
</style>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>
   <main class="jobs">
        <div class="inner">
          <h3>채용정보</h3>
          <div class="filter-input">
             <form action="Main/JobsFilter">
               <select id="cityId" name="city_id">
                 <option value="" selected="selected" style="display: none">지역</option>
                 <option value="">전국</option>
                 <c:forEach var="city" items="${cityList}">
                    <option value="${city.city_id}">${city.city_name}</option>
                 </c:forEach>
               </select>
               <select id="dutyId" name="duty_id">
                 <option value="" selected="selected" style="display: none" >직무</option>
                 <option value="">직무무관</option>
                  <c:forEach var="duty" items="${dutyList}">
                       <option value="${duty.duty_id}">${duty.duty_name}</option>
                 </c:forEach>
               </select>
               <select id="careerId" name="career_id">
                 <option value="" selected="selected" style="display: none">경력</option>
               <option value="">경력무관</option>
            <c:forEach var="career" items="${careerList}">
                    <option value="${career.career_id}">${career.career_name}</option>
                 </c:forEach>
               </select>
                  <select id="empId" name="emp_id">
                    <option value="" selected="selected" style="display: none">고용형태</option>
                  <option value="">고용형태</option>
            <c:forEach var="emp" items="${empList}">
                    <option value="${emp.emp_id}">${emp.emp_name}</option>
                 </c:forEach>
                  </select>
                     <div class="skill-div">
                  <input
                    class="skill-input"
                    type="text"
                    placeholder="기술 스택 검색"
                  />
                  <input type="hidden" id="skillId">
                  <input type="text" id="companyNameInput" placeholder="회사명 검색하기" />
                  
               <button type="reset" onclick='window.location.reload()'>초기화</button>
                  <ul>
                     <c:forEach var="skill" items="${skillList}">
                        <li data-id="${ skill.skill_id}">${skill.skill_name}</li>
                     </c:forEach>
                  </ul>
                     </div>
             </form>
              <ul class="stack-list">
             </ul>
          </div>
          <div class="main-post">
            <div class="main-post-list">
          <c:forEach var="card" items="${postList}">
          <c:choose>
             <c:when test="${not empty card.skill_name }">
                 <div class="post-card">
                <ul>
                  <li class="post-card-img"><a href="/Main/Jobs/View?post_idx=${card.post_idx}"><img src="/images/duty/${card.duty_id}.png"></a></li>
                  <li class="post-card-company">${card.company_name}</li>
                  <li class="post-card-title"><a href="/Main/Jobs/View?post_idx=${card.post_idx}">${card.post_title}</a></li>
                  <li class="post-card-info">${card.city_name}, ${card.duty_name},${card.career_name},${card.emp_name}  </li>               
                 <li class="post-card-info stack-line">
                        <c:set var="skills" value="${fn:split(card.skill_name, ',')}" />
                       <c:forEach var="skill" items="${skills}">
                            <span class="postSkill">${skill}</span>&nbsp;
                       </c:forEach>
                 </li>
                </ul>
              </div>
             </c:when>
             <c:otherwise>
             <div class="post-card">
                <ul>
                  <li class="post-card-img"><a href="/Main/Jobs/View?post_idx=${card.post_idx}"><img src="/images/duty/${card.duty_id}.png"></a></li>
                  <li class="post-card-company">${card.company_name}</li>
                  <li class="post-card-title"><a href="/Main/Jobs/View?post_idx=${card.post_idx}">${card.post_title}</a></li>
                  <li class="post-card-info">${card.city_name}, ${card.duty_name},${card.career_name},${card.emp_name}</li>
                </ul>
              </div>
             </c:otherwise>
          </c:choose>
          </c:forEach>
            </div>
          </div>
        </div>
        </main>
   <%@include file="/WEB-INF/include/footer.jsp" %>
  <script>
  
   // 스택 검색을 위한 element
  const $skillInput = document.querySelector(".skill-input");
  const $skillUl    = document.querySelector(".skill-div ul");
  const $skills     = document.querySelectorAll(".skill-div ul li");
  const $stackList  = document.querySelector(".stack-list");
  const $companyNameInput = document.getElementById("companyNameInput");


//회사명 검색 입력에서 엔터키 이벤트 처리
  $companyNameInput.addEventListener("keydown", function(event) {
      if (event.key === "Enter") { // 엔터키가 눌렸을 때
          event.preventDefault(); // 기본 행동 방지 (폼 제출 등)
          fillterAjax(); // Ajax 호출
      }
  });
  // 검색 인풋 focus
  $skillInput.addEventListener("focus", function(){
    $skillUl.style.display = "block"
  })
  
  
// 검색 인풋에서 입력 시 value 포함 여부 검사
$skillInput.addEventListener("input", function(e) {
    $skillUl.style.display = "block"; // 스킬 목록 표시
    let html = "";
    console.log(e.target.value)
    if(e.target.value != ""){
       $skillInput.style.background = "none";
    }else{
       $skillInput.style.background = "url('/images/icon/stack.png') no-repeat 12px center";
    }

    // 모든 스킬을 순회하며 입력값과 일치하는 스킬 찾기
    $skills.forEach(skill => {
        let skillStr = skill.innerText.toUpperCase();
        let inputStr = e.target.value.toUpperCase();

        // 입력값이 스킬 이름에 포함되는지 검사
        if (skillStr.includes(inputStr)) {
            html += "<li data-id='" + skill.dataset.id + "'>" + skill.innerText + "</li>";
        }
    });

    // 필터링된 스킬 목록 업데이트
    $skillUl.innerHTML = html;
});

   $("main").on('click', function(e) {
        if($(e.target).closest($skillInput).length == 0) { 
             $($skillUl).hide()
        }
      
      })
  
  
  
  
// 스킬 목록에서 클릭 이벤트 처리
$skillUl.addEventListener("click", function(e) {
    if (e.target.tagName === 'LI') {
        $skillUl.style.display = "none"; // 목록 숨김
        const skillName = e.target.innerText;
        const skillId = e.target.dataset.id; // 데이터 속성에서 ID 가져오기
        addSkillToStack(skillName, skillId); // 스택에 스킬 추가
        fillterAjax(); // AJAX 호출
    }
});

// 스택에 스킬 추가
function addSkillToStack(skillName, skillId) {
    const html = "<li>" + skillName + 
                 "<img src='/images/icon/close.png' onclick='deleteSkill()'></li>";
    $stackList.innerHTML = html; // 스택에 스킬 추가
    $("#skillId").val(skillId); // 스킬 ID 설정
    $skillUl.style.display = "none";
}

// 스택에서 스킬 삭제
function deleteSkill() {
    $stackList.innerHTML = ""; // 스택 비우기
    $("#skillId").val(""); // 스킬 ID 초기화
    fillterAjax(); // AJAX 호출
}

// 스택 인풋에서 엔터키 방지
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault(); // 엔터키 기본 동작 방지
    }
}, true);
  // select 변경 시 Ajax
      $("#cityId,#dutyId,#careerId,#empId").change(function(){
         fillterAjax();
       });
  
  function fillterAjax(skill){
        let cityId = $("#cityId").val();
           let dutyId = $("#dutyId").val();
           let careerId= $("#careerId").val();
           let empId = $("#empId").val();
         let skillId = $("#skillId").val();
         let companyName = $companyNameInput.value; // 회사명 입력값 가져오기
           $.ajax({
               url: '/Main/JobsFilter',
               type: 'GET',
               dataType: 'json',
               data: { "city_id": cityId, "duty_id": dutyId,"career_id" : careerId ,"emp_id": empId, "skill_id" :skillId, "company_name": companyName},
               success: function(response) {
                   $('.main-post-list').html("");
                   response.postList.forEach(a => {
                      console.log(a.post_idx)
                 let res = "";
                  if (a.skill_name) {
                      const skillnameList = a.skill_name.split(",");
                      skillnameList.forEach(skill => {
                          res += `<span class="postSkill">\${skill}</span> &nbsp;`;
                      });
                         
                      $('.main-post-list').append(
                          '<div class="post-card">' +
                              '<ul>' +
                                  '<li class="post-card-img"><a href="/Main/Jobs/View?post_idx='+a.post_idx+'"><img src="/images/duty/'+ a.duty_id +'.png"></a></li>' +
                                  '<li class="post-card-company">' + a.company_name + '</li>' +
                                  '<li class="post-card-title"><a href="/Main/Jobs/View?post_idx=' + a.post_idx + '">' + a.post_title + '</a></li>' +
                                  '<li class="post-card-info">' +
                                      a.city_name + ', ' + a.duty_name + ',' + a.career_name + ' ,' + a.emp_name +

                                  '</li><li class="post-card-info stack-line">' + res +
                              '</li></ul>' +
                          '</div>'
                      );
                  } else {
                      $('.main-post-list').append(
                          '<div class="post-card">' +
                              '<ul>' +
                                  '<li class="post-card-img"><a href="/Main/Jobs/View?post_idx=' + a.post_idx + '"><img src="/images/duty/'+a.duty_id +'.png"></a></li>' +
                                  '<li class="post-card-company">' + a.company_name + '</li>' +
                                  '<li class="post-card-title"><a href="/Main/Jobs/View?post_idx=' + a.post_idx + '">' + a.post_title + '</a></li>' +
                                  '<li class="post-card-info">' +
                                      a.city_name + ', ' + a.duty_name + ',' + a.career_name + ' ,' + a.emp_name +
                                  '</li>' +
                              '</ul>' +
                          '</div>'
                      );
}
                      
                   });
               },
               error: function(jqXHR, textStatus, errorThrown) {
                   console.error(textStatus, errorThrown);
                   alert("데이터를 가져오는 데 실패했습니다. 다시 시도해 주세요.");
               }
           });
  }
  

    </script>
</body>
</html>