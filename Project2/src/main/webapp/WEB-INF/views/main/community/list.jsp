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
  height: 100%;
}

#question-content {
    margin-left :45px;
     height: 100%;
}

#duty-area {
  background-color:#EBECF1;

  max-width:120px;
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
  height:40px;
  width:120px;
  text-align:center;
  font-size:20px;
}

.list-filter-hitndate {
  background-color:#779AF6;
  color:#fff;
  border-radius:30px;
  padding:10px 8px;
  display:flex;
  gap:7px;
  border-spacing:0;
  font-size:20px;

}

#list-filter-hit {
  background-color:#6E6CDD;
  border-radius:30px;
  padding:7px 8px;
    &:hover {
   background-color:#8886DA;
  }
}

#list-filter-date {
  background-color:#6E6CDD;
  border-radius:30px;
  padding:7px 8px;
   &:hover {
   background-color:#8886DA;
  }
}
.addinfo-layout {
display:flex;
align-items: center;
}

.ellipsis {
  flex-shrink: 1; /* Flex 환경에서 텍스트 줄이기 허용 */
  min-width: 0; 
  white-space: nowrap !important;      
  overflow: hidden !important;          
  text-overflow: ellipsis !important;
  width: 150px;  
  height: 10px;

}
.pagination {
display:flex;
justify-content: center;
align-items: center;

.center {
background-color:#E4EBFF;
}
.pagingList{
margin:30px 10px 15px 10px;
padding:5px 8px;
border: 1px solid #cccccc;
}
.pagingSt {
margin:15px 10px;
padding:5px 8px;
border: 1px solid #cccccc;
margin:30px 10px 15px 10px;
}
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
				<a href="/Main/Community/WriteForm" class="phone review-mybtn"><img src="/images/review/phone2.png"></a>
				<div class="banner-title">
					<h2 id="blue">커리어 고민될 땐,</h2><h2 id="yellow"> 커리어 피드!</h2>
					<p id="yellow2">현업자들의 속 시원한 대답!</p>
					<span class="myreview"><a href="MyReview" class="review-mybtn">내가 한 질문</a></span>
				</div>
			</div>
		</div>
		<div class="inner">
		  <div class="list-filter">
		  	<select id="list-filter-duty">
		  	<option>직무</option>
		  	<c:forEach var="d" items="${dutyList}">
		  	<option value="${d.dutyId}">${d.dutyName}</option>		  	
		  	</c:forEach>
		  	</select>
		  	<span class="list-filter-hitndate">
		  	  <a href="/Main/Community/List?newhit=1" ><span id="list-filter-date">최신순</span></a>
		  	  <a href="/Main/Community/List?newhit=2" ><span id="list-filter-hit">인기순</span></a>
		  	  <a href="/Main/Community/List" ><span id="list-filter-hit">전체</span></a>
		  	</span>
		  </div>
			<div class="company-list2">
				<c:forEach var="vo" items="${List}">
					<div class="company-card2" data-duty="${vo.duty.dutyId}">
					<div class="company-content2">
						<div class="company-text2">
							<div class="company-info2">
								<span id="duty-area">${vo.duty.dutyName}</span>
								<div class="title-container">
								<span id="question-indicator">Q</span>
								<h3><a class="review-list-btn" href="/Main/Community/View?communityIdx=${vo.communityIdx}">${vo.comTitle}</a></h3>
								</div>
							<p id="question-content"class="ellipsis">${vo.comContent}</p>
							</div>
							<div class="additional-info">
							 <div class="addinfo-layout">
							    <img src="/images/community/eye.png">&nbsp;${vo.comHit}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
							    <img src="/images/community/like.png">&nbsp;${vo.comLike}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
							    <img src="/images/community/Message.png">&nbsp;${vo.replies.size()}
							</div>
							
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		<c:set var="startNum" value="${response.pagination.startPage}"/>
		<c:set var="endNum" value="${response.pagination.endPage}"/>
		<c:set var="totalpagecount" value="${response.pagination.totalPageCount}"/>

	<!-- 페이징 UI -->
	<div class="pagination">
	    <!-- 이전 페이지 버튼 -->
	    <c:if test="${currentPage > 0}">
	        <a class="pagingSt" href="/Main/Community/List?page=${currentPage - 1}&size=${size}&newhit=${newhit}">이전</a>
	    </c:if>
	
	    <!-- 페이지 번호 링크 -->
	    <c:forEach begin="0" end="${totalPages - 1}" var="i">
	        <c:choose>
	            <c:when  test="${i == currentPage}">
	                <span class="center pagingList">${i + 1}</span>  <!-- 현재 페이지는 강조 표시 -->
	            </c:when>
	            <c:otherwise>
	                <a class="pagingList" href="/Main/Community/List?page=${i}&size=${size}&newhit=${newhit}">${i + 1}</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	
	    <!-- 다음 페이지 버튼 -->
	    <c:if test="${currentPage < totalPages - 1}">
	        <a class="pagingSt" href="/Main/Community/List?page=${currentPage + 1}&size=${size}&newhit=${newhit}">다음</a>
	    </c:if>
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
     
//필터
$('#list-filter-duty').on('change', function () {
    //필터의 값을 가져오기
    let filterValue = $(this).val(); 
    
    if (filterValue === '직무') {
        $('.company-card2').css('display', ''); 
    } else {        
        $('.company-card2').each(function () {           
            let dutyId = $(this).data('duty')

            //  filterValue가 같으면 표시, 다르면 숨기기 (타입변환 확인 꼭하기)
            $(this).css('display', (String(dutyId) === String(filterValue)) ? '' : 'none');
        });
    }
});   




    	
	 
        
 })
	</script>
</body>
</html>