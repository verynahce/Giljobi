<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <header>
   <div class="inner">
     <h1><a href="/"><img src="/images/logo.png" alt="logo"></a></h1>
     <ul class="header-gnb">
       <li><a href="/Main/Jobs/List">채용정보</a></li>
       <li><a href="/Main/Hrs/List">인재정보</a></li>
       <li class="header-comunity">
         <a href="/Main/Review/List?nowpage=1">기업리뷰</a>
       </li>
       <li><a href="/Main/Cust/Center">고객센터</a></li>
     </ul>
     <ul class="header-util">
	     <c:choose>
	        <c:when test="${sessionScope.login.role == '개인회원'}">
	           <li class="user-bar">${sessionScope.login.user_name }
	              <ul class="user-login">
	                 <li><a href="/User/MyPage/Home/updateForm?user_idx=${login.user_idx}">회원정보 수정</a></li>
	                 <li><a href="/User/MyPage/Home/View">마이페이지</a></li>
	                 <li><a href="/User/MyPage/Resume/List?user_idx=${login.user_idx}">이력서</a></li>
	                 <li><a href="/User/Logout">로그아웃</a></li>
	              </ul>
	           </li>
	         </c:when>
	         <c:when test="${sessionScope.login.role == '기업회원'}">
	           <li class="user-bar">${sessionScope.login.company_name }
	              <ul class="user-login">
	                 <li><a href="/Company/Mypage/Home/UpdateForm?company_idx=${login.company_idx }">회원정보 수정</a></li>
	                 <li><a href="/Company/Mypage/Home/View">마이페이지</a></li>
	                 <li><a href="/Company/Mypage/Post/List?company_idx=${login.company_idx}">채용공고</a></li>
	                 <li><a href="/User/Logout">로그아웃</a></li>
	              </ul>
	           </li>
	         </c:when>
	        <c:otherwise><li><a href="/User/LoginForm">로그인</a></li>
	                <li>|</li>
	                <li><a href="/User/RegisterForm">회원가입</a></li>
	      	</c:otherwise>
     </c:choose>
       <li class="menu-btn"><button></button></li>
     </ul>
   </div>
 </header>