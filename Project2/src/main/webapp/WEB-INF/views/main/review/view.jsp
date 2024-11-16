<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/common.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
<main>
 <div class="inner rview">
      <a class="back-btn" href="List">back</a>
      <div class="review-company-profile">
        <div class="company-image"><img src="/images/icon/company-profile.png" alt="회사 이미지"/></div>
        <div class="company-info">
          <p class="company-name">${vo.company_name}</p>
          <p><span class="total">${vo.tot_point}</span> <span class="review-duty">${vo.company_area}</span></p>
		  <p>${vo.company_tel }</p>
		  <p>${vo.company_email }</p>
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