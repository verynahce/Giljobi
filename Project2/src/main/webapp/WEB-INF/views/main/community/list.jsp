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
<style>
#yellow {
  color:#FFD700;
}

#blue { 
  color:#4240C2;
}

#blue, #yellow {
  display: inline;
}

#yellow2 { 
  color:#FFD700;
}

#question-indicator {
  margin-right :30px;
  font-size :25px;
  font-weight:500;
  color:#4876EF;
}

.title-container {
  display:flex;
  align-items:center;
}

#question-content {
  margin-left :45px;
}

#duty-area {
  background-color:#EBECF1;
  max-width:100px;
  text-align:center;
  padding-left:10px;
  padding-right:10px;
  border-radius:7px;
  margin-bottom:10px;
}

.additional-info {
  display:flex;
  gap:10px;
  margin-top:15px;
}
.list-filter {
  display:flex;
  justify-content:space-between;
  padding-bottom:10px;
}

#list-filter-duty {
  background-color:#3633E8;
  color:#fff;
  border-radius:3px;
  padding:4px;
  height:30px;
  width:60px;
  text-align:center;
  font-size:20px;
}

.list-filter-hitndate {
  background-color:#779AF6;
  color:#fff;
  border-radius:30px;
  padding:4px;
  display:flex;
  gap:10px;
  border-spacing:0;
  font-size:20px;
}

#list-filter-hit {
  background-color:#6E6CDD;
  border-radius:30px;
  padding:8px;
}

#list-filter-date {
  background-color:#6E6CDD;
  border-radius:30px;
  padding:8px;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="review-inner">
		<div class="inner">
			<div class="review-title">
				<p class="sub-title1"></p>
				<h2>질문과 답변</h2>
				<p class="sub-title2">현직자에게 물어보세요</p>
			</div>
		</div>
		<div class="review-banner2">
			<div class="banner-inner">
				<a href="WriteForm" class="phone review-mybtn"><img src="/images/review/phone2.png"></a>
				<div class="banner-title">
					<h2 id="blue">커리어 고민될 땐,</h2><h2 id="yellow"> 커리어 피드!</h2>
					<p id="yellow2">현업자들의 속 시원한 대답!</p>
					<span class="myreview"><a href="MyReview" class="review-mybtn">내가 한 질문</a></span>
				</div>
			</div>
		</div>
		<div class="inner">
		  <div class="list-filter">
		  	<span id="list-filter-duty">직무</span><span class="list-filter-hitndate"><span id="list-filter-date">최신순</span><span id="list-filter-hit">인기순</span></span>
		  </div>
			<div class="company-list2">
				<c:forEach var="vo" items="${response.list}">
					<div class="company-card2">
					<div class="company-content2">
						<div class="company-text2">
							<div class="company-info2">
								<span id="duty-area">${vo.company_area }</span>
								<div class="title-container">
								<span id="question-indicator">Q</span>
								<h3><a class="review-list-btn" href="/Main/Community/Write">이력서는 쳐다도 안보는 건가요?</a></h3>
								</div>
							<p id="question-content">이력서가 한달내내 미열람인데요, 읽어보긴 하는건가요?</p>
							</div>
							<div class="additional-info">
							<span>723&nbsp;&nbsp;&nbsp;723&nbsp;&nbsp;&nbsp;723</span><span id="updelbtn"><img src="/images/dots.png"></span>
							</div>
						</div>
					</div>
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