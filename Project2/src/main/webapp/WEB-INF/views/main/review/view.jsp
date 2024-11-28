<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<style>
.company-info {
  display:flex;
  flex-direction:row;
  justify-content:space-between;
  width:100%;
  padding-right:20px;
}
 
.company-history {
  margin-top:15px;
  display:flex;
  gap:10px;
  flex-direction:column;
}

.company-history p {
  display:flex;
  align-items:center;
  justify-content:left;
  gap:10px;
  font-size:18px;
  font-weight:500;
}
.photoimage{
width: 100px;
height: 100px;
}
</style>
<script src="/js/common.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
<main>
 <div class="inner rview">
      <a class="back-btn" href="List">back</a>
      <div class="review-company-profile">
        <div class="company-image">
              <c:choose>
      <c:when test="${imagePath != '0'}">
         <img src="/image/read?path=${imagePath}" alt="User Image" class="photoimage">
       </c:when> 
       <c:otherwise>
         <img src="/images/icon/company-profile.png"alt="Company Image"class="photoimage"> >
       </c:otherwise>
       </c:choose> 
        </div>
        <div class="company-info">
         <div>
          <p class="company-name">${vo.company_name}</p>
          <p><span class="total">${vo.tot_point}</span> <span class="review-duty">${vo.company_area}</span></p>
		  <p>${vo.company_tel }</p>
		  <p>${vo.company_email }</p>
		  </div>
		 <div class="company-history">
		 <c:if test="${not empty vo.company_address }">
		  <p><img src="/images/review/location.png">${vo.company_address }</p>
		 </c:if>
		 <c:if test="${not empty vo.company_address }">
		  <p><img src="/images/review/Building.png">${vo.company_birthdate }</p>
		 </c:if>
		  <p><img src="/images/review/Clipboard.png">공고수 &nbsp; ${countP}개</p>
		 </div>
        </div>
      </div>
      <table class="review-table">
        <tr>
          <td>복지 및 급여</td>
          <td class="point">${vo.wc_point}</td>
        </tr>
        <tr>
          <td>업무와 삶의 균형</td>
          <td class="point">${vo.wlb_point}</td>
        </tr>
        <tr>
          <td>사내문화</td>
          <td class="point">${vo.cc_point}</td>
        </tr>
        <tr>
          <td>승진 기회 및 가능성</td>
          <td class="point">${vo.po_point}</td>
        </tr>
        <tr>
          <td>경영진</td>
          <td class="point">${vo.em_point}</td>
        </tr>
      </table>
      <p class="view-title">기업리뷰 <span>${count}건</span></p>
      <c:forEach var="review" items="${userReview}">
      	<div class="review-inner">
        <ul>
          <li>전직원</li>
          <li>|</li>
          <li>${review.review_date}</li>
          <li class="point">${review.tot_point}</li>
        </ul>
        <p class="review-view-title">${review.review_title}</p>
        <div class="review-pros">
          <p class="review-sub-title">장점</p>
          <p class="review-content">
            ${review.review_pros}
          </p>
        </div>
        <div class="review-cons">
          <p class="review-sub-title">단점</p>
          <p class="review-content">
            ${review.review_con}
          </p>
        </div>
      </div>
      </c:forEach>
    </div>
	</main>
		
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>