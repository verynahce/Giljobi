<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        <div class="company-info">
          <p class="company-name form-style">기업리뷰 작성</p>
        </div>
      </div>
      <form action="Write">
      	 <input type="hidden" name="user_idx" value="${sessionScope.login.user_idx}">
	      <table class="review-table review-writeFrom">
	      	<tr>
	          <td class="cname">기업선택</td>
	          <td>
	          	<input class="cname" name="company_name" placeholder="회사명을 입력하세요.">
	          </td>
	        </tr>
	        <tr>
	          <td>복지 및 급여</td>
			  <td><input class="point-input" type="number" placeholder="1~5점" min="1" max="5" maxlength="1" name="wc_point"></td>
	        </tr>
	        <tr>
	          <td>업무와 삶의 균형</td>
	          <td><input class="point-input" type="number" placeholder="1~5점" min="1" max="5" maxlength="1" name="wlb_point"></td>
	        </tr>
	        <tr>
	          <td>사내문화</td>
	          <td><input class="point-input" type="number" placeholder="1~5점" min="1" max="5" maxlength="1" name="cc_point"></td>
	        </tr>
	        <tr>
	          <td>승진 기회 및 가능성</td>
	          <td><input class="point-input" type="number" placeholder="1~5점" min="1" max="5" maxlength="1" name="po_point"></td>
	        </tr>
	        <tr>
	          <td>경영진</td>
	          <td><input class="point-input" type="number" placeholder="1~5점" min="1" max="5" maxlength="1" name="em_point"></td>
	        </tr>
	      </table>
	      <div class="review-inner">
	        <p class="review-view-title"><input class="writeForm-review-title" type="text" placeholder="리뷰 제목을 입력해주세요." name="review_title"></p>
	        <div class="review-pros">
	          <p class="review-sub-title">장점</p>
	          <textarea class="review-textarea" name="review_pros"></textarea>
	        </div>
	        <div class="review-cons">
	          <p class="review-sub-title">단점</p>
	          <textarea class="review-textarea" name="review_con"></textarea>
	        </div>
	      </div>
	      <p class="write-btnForm"><button class="review-btn">리뷰 작성</button></p>
      </form>
    </div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>