<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>
   <main class="jobs">
  <div class="inner">
    <h3>인재정보</h3>
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
          <option value="" selected="selected" style="display: none">직무</option>
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
          <input class="skill-input" type="text" placeholder="기술 스택 검색" />
          <input type="hidden" id="skillId">
          <button type="reset" onclick='window.location.reload()'>초기화</button>
          <ul class="sub-skill">
            <c:forEach var="skill" items="${skillList}">
              <li data-id="${skill.skill_id}">${skill.skill_name}</li>
            </c:forEach>
          </ul>
        </div>
      </form>
      <ul class="stack-list"></ul>
    </div>

    <table class="main-resume">
      <colgroup>
        <col width="17.5%">
        <col width="42.5%">
        <col width="10%">
        <col width="10%">
        <col width="7.5%">
        <col width="12.5%">
      </colgroup>
      <thead>
        <tr>
          <th>이름</th>
          <th>이력서 요약</th>
          <th>경력</th>
          <th>희망직무</th>
          <th>희망근무지역</th>
          <th>수정일</th>
        </tr>
      </thead>
		<tbody class="resume-list">
		  <c:forEach var="resume" items="${resumeList}">
		        <c:if test="${resume.user_idx != 0 }">
		    <tr>
		         <td>${resume.user_name}<span>(${resume.user_gender},${resume.user_age}세)</span></td>
		          <td>
		            <div><a href="View?resume_idx=${resume.resume_idx}">${resume.resume_title}</a></div>
		            <ul class="stack-list">
		              <c:if test="${not empty resume.skill_name}"><li>${resume.skill_name}</li></c:if>
		            </ul>
		          </td>
		          <td>
		            <c:choose>
		              <c:when test="${not empty resume.career_year and resume.career_year != 0}">${resume.career_year}년 ${resume.career_month}개월</c:when>
		              <c:when test="${not empty resume.career_month and resume.career_month != 0}">${resume.career_month}개월</c:when>
		              <c:otherwise>신입</c:otherwise>
		            </c:choose>
		          </td>
		          <td>${resume.duty_name}</td>
		          <td>${resume.city_name}</td>
		          <td>${resume.resume_fdate}</td>
		    </tr>
		      </c:if>
		  </c:forEach>
		</tbody>
    </table>
  </div>
</main>
	<%@include file="/WEB-INF/include/footer.jsp" %>
   <script>
	// 스택 검색을 위한 element
  const $skillInput = document.querySelector(".skill-input");
  const $skillUl    = document.querySelector(".skill-div ul");
  const $skills     = document.querySelectorAll(".skill-div ul li");
  const $stackList  = document.querySelector(".stack-list");

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

$("main").on('click', function(e) {
    if($(e.target).closest($skillInput).length == 0) { 
         $($skillUl).hide()
    }
	
	})





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
			let skillId = $("#skillId").val()
	        $.ajax({
	            url: '/Main/HrsFilter',
	            type: 'GET',
	            dataType: 'json',
	            data: { "city_id": cityId, "duty_id": dutyId,"career_id" : careerId ,"emp_id": empId, "skill_id" :skillId},
	            success: function(response) {
	                $('.resume-list').html("");
	                let html = "";
	                response.resumeList.forEach(function(a) {
	                    html += "<tr>";
	                    html += "<td>" + a.user_name + "<span>(" + a.user_gender + ", " + a.user_age + "세)</span></td>";
	                    html += "<td>";
	                    html += "<div><a href='View?resume_idx=" + a.resume_idx + "'>" + a.resume_title + "</a></div>";
	                    html += "<ul class='stack-list'>";
	                    if (a.skill_name) {
	                        html += "<li>" + a.skill_name + "</li>";
	                    }
	                    html += "</ul>";
	                    html += "</td>";
	                    html += "<td>";
	                    if (a.career_year !== "0" && a.career_year != null) {html += a.career_year + "년"} 
	                    if (a.career_month !== "0" && a.career_year != null) {html += a.career_month + "개월";} else {
	                    if (a.career_year == null && a.career_month == null){html += "신입"};

	                    }
	                    html += "</td>";
	                    html += "<td>" + a.duty_name + "</td>";
	                    html += "<td>" + a.city_name + "</td>";
	                    html += "<td>" + a.resume_fdate + "</td>";
	                    html += "</tr>";
	                });
	                $('.resume-list').append(html);
	                console.log(response.resumeList)

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