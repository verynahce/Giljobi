<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer ></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="review-inner">
		<div class="inner">
			<div class="review-title">
				<p class="sub-title1">리뷰로 보는 기업의 미래</p>
				<h2>기업리뷰</h2>
				<p class="sub-title2">직원의 목소리를 통해 기업의 성장 가능성을 분석해 보세요.</p>
			</div>
		</div>
		<div class="review-banner">

			<div class="banner-inner">
				<a href="WriteForm" class="phone review-mybtn"><img src="/images/review/phone.png"></a>
				<div class="banner-title">
					<h2>
						현재 <span>${count}</span>개의 기업리뷰가 등록됐어요!
					</h2>
					<p>회사 리뷰 남기고, 나와 맞는 기업을 저장하세요!</p>
					<span class="myreview"><a href="MyReview" class="review-mybtn">내가 쓴 리뷰관리</a></span>
				</div>
			</div>
		</div>
		<div class="inner">
			<div class="company-list">
				<c:forEach var="vo" items="${response.list}">
					<div class="company-card">
					<div class="company-content">
						<div class="company-img">
							<a href="View?company_idx=${vo.company_idx}">
								  <img src="/images/icon/company-profile.png" alt="회사 이미지"/>
							</a>
						</div>
						<div class="company-text">
							<div class="company-info">
								<h3><a class="review-list-btn" href="View?company_idx=${vo.company_idx}">${vo.company_name }</a></h3>
								<p>${vo.company_area }</p>
							</div>
							<p>현재 채용 중 ${vo.count}건</p>
						</div>
					</div>
					<c:choose>
						<c:when test="${sessionScope.login.role eq '개인회원'}">
							<button class="bookmark book-off" data-uid="${sessionScope.login.user_idx}" data-cid="${vo.company_idx}">관심기업</button>
						</c:when>
						<c:otherwise>
							<button class="bookmark book-off" data-cid="${vo.company_idx}">관심기업</button>
						</c:otherwise>
					</c:choose>
				</div>
				</c:forEach>
			</div>
		<c:set var="startNum" value="${response.pagination.startPage}"/>
		<c:set var="endNum" value="${response.pagination.endPage}"/>
		<c:set var="totalpagecount" value="${response.pagination.totalPageCount}"/>
		<div class="paging-container">
    <ul>
        <c:if test="${nowpage ne 1}">
            <li class="paging-btn">
                <a href="/Main/Review/List?nowpage=${nowpage-1}">< 이전</a>
            </li>
        </c:if>
        
        <c:forEach var="pagenum" begin="${startNum}" end="${endNum}" step="1">
            <li class="paging-list">
                <a href="/Main/Review/List?nowpage=${pagenum}">${pagenum}</a>
            </li>
        </c:forEach>
        
        <c:if test="${nowpage lt totalpagecount}">
            <li class="paging-btn">
                <a href="/Main/Review/List?nowpage=${nowpage+1}">다음 ></a>
            </li>
        </c:if>
    </ul>
</div>
		</div>
	</main>
	<div class="pop-bg">
		<div class="support login-alter login-pop">
      <h2 class="s-title">로그인이 필요합니다.</h2>
	  <a href ="/User/LoginForm">로그인</a>
   </div>		
	</div>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script>
	 $(document).ready(function() {
	        // 서버에서 전달된 sessionScope.login.role 값을 JavaScript 변수로 저장
	        

	        $(".review-mybtn").click(function(e) {
	            // 로그인 상태 확인
	            if (userRole != "개인회원") { // userRole이 비어있으면 로그인 안 됨
	                e.preventDefault(); // 기본 동작 막기
	                $(".pop-bg").css("display","block");
	            }
	        });
	        
	    	$(".pop-bg").click(()=>{
	    		$('.pop-bg').hide();	
	    		$(".login-pop").click(e=>{
	    			e.stopPropagation();	
	    		})
	    	})
	    	
	    	$(".paging-list").eq(${nowpage-1}).addClass("paging-active");
	    	
	    	console.log("${sessionScope.login.role}")
	    	
	    	$(".book-off").each(function(i, a) {
	    		const userRole = "${sessionScope.login.role}";
	    		if(userRole == "개인회원"){
	    		    $(a).on('click', function() {
		    	        var ub_idx = $(this).attr('alt');
		    	        $(this).removeClass('book-off')
		    	        $(this).addClass('book-on')
		    	        $.ajax({
		    	            url: '/Main/Review/BookMarkOn',
		    	            data: { "user_idx": a.dataset.uid,"company_idx": a.dataset.cid },
		    	            success: function(data) {
		    	         			
		    	            },
		    	            error: function(err) {
		    	                console.error("북마크 설정 실패:", err);
		    	            }
		    	        });
		    	    	alert("관심기업으로 등록했습니다.")
		    			});
	    			
	    			
	    		}
	    	
	    	    
				}) 	 
	        
	 })
	</script>
</body>
</html>