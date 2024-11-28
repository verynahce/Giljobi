<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.prj.users.notification.dao.AnnounceDao" %>
<%@ page import="com.prj.users.notification.service.Announce" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
<script src="/js/header.js" defer></script>

<style>
main {
   background-color:#F0F2F5;

}
 .innercontents {
   display:flex;
     gap:30px;
    font-family: pretendard; 
    padding-top:30px; 
    padding-bottom:60px; 
 }
 
 .sidebar {

   width:400px;
   height:auto;
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
   background-color:#4876EF;
   color:white;
   height:80px;
   margin:0;
   font-size:25px;
 }
 .sidebar td {
   padding:15px 15px;;
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
   background-color: #BED0FF;
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
    min-height: 1400px;
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
    padding-bottom: 14px; 
    padding-top: 30px;
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
      order-bottom:1px solid #CCCCCC; 
      padding-bottom:30px; 
      padding-top: 30px;  
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
      padding-left: 180px;
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

/*서브 - 경력긴글*/    
#sub-duty {
 td:nth-child(1) > div {
	width:100%;
	min-height: 100px;
      					}   
 td:nth-child(2) > div {
	width:100%;
	min-height: 100px;
	color: #767676;
      					}
 } 
  
  
     
   /*기술스택 */   
.sub-skill-layout {
     display:flex;
     
     div {
     padding:12px;
     margin:6px;
     background-color:#EBECF1; 
     border-radius: 8px;
     color:#555555px;
     font-size: 13px;
     font-weight: 400;
     letter-spacing: 0.5px;
     }
     
     div:nth-child(1) {
      margin-left: 0px;
     }
} 

/*버튼*/

.btn-layout {   margin: 0 auto;
 text-align: center;

}
 .btn {
   display: inline-block;
    width: 200px; 
    height: 60px;   
    border-radius: 8px;
 
    a {
    display: block;
    text-decoration: none; 
    text-align: center;
    line-height: 60px;
 }
 }
  .btn-back {
  display:flex;
  justify-content:center;
  align-items:center;
  background: #585766; 
   color: white;
    text-align: center;
     &:hover {
     background-color:#666577;
     color:white;
     
   }
 }
.noob{
	padding:20px 0 0 5px;
	color: #333333; 
    font-size: 16px;
    font-weight: 400;
}

/*왼쪽 평가하기, 알림보내기 메뉴*/ 
#side-menu{
   width: 100%; /* 사이드 메뉴 너비 */
   background: white;
   border-radius: 16px;
   border: 1px #EBEDF1 solid;
   margin-top: 20px; /* 사이드 바와 간격 조정 */
   padding:20px;
   box-shadow: 0 2px 4px rgba(0,0,0,0.1);
   
    p:nth-child(1) {
    
    color: #767676; 
    font-size: 14px; 
    font-weight: 400; 
    line-height: 19.60px;
    padding-top: 10px ;
    padding-bottom: 12px;
    }
    #side-hit {    
    color: #767676; 
    font-size: 12px; 
    font-weight: 400; 
    line-height: 16.80px; 
    padding-bottom: 22px;
 
    }
    
   h4 {
   color: #333333; 
   font-size: 20px; 
   font-weight: 600; 
   line-height: 28px;
    padding-top: 10px ;
    padding-bottom: 12px ;
     white-space: nowrap;
      overflow: hidden; 
   text-overflow: ellipsis; 
   }
    }
    #side-bottom {
    display:flex;
    justify-content: space-between;
     align-items: center; 
    }
    .btn{
    width: 100px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border: none;
   border-radius: 8px;
   color:white;
    cursor: pointer;
   &:hover {
    background-color: #4A4A4A;
   }
   }
   #btn-evaluate{
   	background-color: #ffffff;
   	border: 1px solid #333333;
   	margin-right: 10px;
   	color: #333333;
   }
   #btn-notify{
   	background-color: #585766;
   	&:hover{
   		background-color: #666577;
   	}
   }
   
    
    #btn-scrape{
    width: 40px; 
   height: 40px;
   border-radius: 4px;
   border: 1px solid #cccccc;
   text-align: center;
   padding-top:3px;
   
   &:hover
    }
    .image {
    width: 28px; 
    height: 28px;
    font-size: 16px; 
    border-radius: 8px;
    line-height: 14px;
 
 }
 
 /* 평가지 */
.evaluation {
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%); 
   width: 700px; 
   background-color: white; 
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
   z-index: 3 
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 8px;
   padding: 30px 51px 15px 51px;
}
.e-header {
    display: flex;
    justify-content: space-between;
}
.e-title {
    color: #333333;
    font-size: 30px; 
    font-weight: 600; 
    line-height: 50.40px;
    margin-bottom: 30px;

}
.evaluation-val {
   width: 170px; 
   height: 50px; 
   background: #ffffff; 
   border-radius: 8px;
   color: #333333;
   margin: 0 auto;
   cursor: pointer;
   display: flex;
   justify-content: center;
   padding-top: 15px;
}
.evaluation-val:hover {
    background-color: #4876EF;
}
.e-delete {
    color: #767676;
    font-weight: 300;
    font-size: 36px;  
    cursor: pointer;
}
.evaluation-container {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}
.evaluation-container th, .evaluation-container td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}
.evaluation-container th:nth-child(1), /* 항목 열 */
.evaluation-container td:nth-child(1) {
    width: 17%; /* 항목 열 넓이 조정 */
}

.evaluation-container th:nth-child(2), /* 평가기준 열 */
.evaluation-container td:nth-child(2) {
    width: 25%; /* 평가기준 열 넓이 조정 */
}

.evaluation-container th:nth-child(3), /* 점수 열 */
.evaluation-container input[type="number"] {
    box-sizing: border-box; /* 패딩 포함 계산 */
}


.evaluation-container th:nth-child(4), /* 비고 열 */
.evaluation-container td:nth-child(4) {
    width: 40%; /* 비고 열 넓이 조정 */
}
.evaluation-container th {
    background-color: #f2f2f2;
}
.scrollable-area {
    max-height: 400px; /* 원하는 최대 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 활성화 */
}
textarea {
    width: 100%; /* 텍스트 영역 너비 조정 */
    height: 60px; /* 높이 조정 */
    margin-top: 10px; /* 여백 조정 */
}
.total {
    font-weight: bold;
    text-align: right;
}

.popup-evaluate {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 700px; 
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    z-index: 1000;
    border-radius: 8px;
    padding: 20px;
}
/* Input 요소 스타일 */
.evaluation-container textarea {
    width: 100px; /* 전체 너비 사용 */
    height: 60px; /* 높이 조정 */
    margin-top: 5px; /* 여백 조정 */
    box-sizing: border-box; /* 패딩 포함 계산 */
}


    }

.e-btn {
width: 170px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border-radius: 8px;
   color:white;
   margin:0 auto;
    cursor: pointer;
    display: flex;
    justify-content: center;
    margin-top: 20px;
    
   &:hover {
    background-color: #4A4A4A;
   }
   a{ display: block;
    text-decoration: none; 
    color: white; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 33px;
   }   
   }



.e-list{
  border-collapse: collapse;
  width:100%;
   & tr {
	   & td {padding:18px 0 18px;};
	   & td:nth-child(1){
		   width:80%;
		   text-align: left;
		   input{
		   width: 17px;
		   height: 17px;
		   border-bottom: #cccccc;
	      };
	   & label{
	   margin-left:8px;
	   font-size: 20px;
	   color: #333333;
	     }
	   }
	   & td:nth-child(2){
	   width:20%;
	   text-align: right;
	   color: #767676;
	   }
   }
}

.noob{
	padding-top :20px;
	font-size: 20px;
}

.evaluation-container {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .total {
            font-weight: bold;
            text-align: right;
        }
        textarea {
		    width: 100%; /* 텍스트 영역 너비 조정 */
		    height: 60px; /* 높이 조정 */
		    margin-top: 10px; /* 여백 조정 */
		}
		.dotted {
		    border-top: 1px dotted #ddd; /* 점선 */
		}
		.no-border {
		    border: none; /* 선 없음 */
		}


}


 /* 알람보내기 */
.notice {
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%); 
   width: 700px; 
   background-color: white; 
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
   z-index: 3 
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 8px;
   padding: 30px 51px 15px 51px;
}
.n-header {

display:flex;
justify-content: space-between;
}
.n-title {
color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    line-height: 50.40px;
    margin-bottom: 30px;
    }

.n-btn {
width: 170px; 
   height: 50px; 
   padding: 10px; 
   background: #333333; 
   border-radius: 8px;
   color:white;
   margin:0 auto;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin-top: 30px;
    margin-bottom: 20px;
    padding: 10px;
    
    img{
    width:20px;
    height: 20px;
    transform: translate(30%, 20%);
    }
    
   &:hover {
    background-color: #4A4A4A;
   }
   button { 
   display: block;
    text-decoration: none;
    background-color: #333333;
    color: white; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 33px;
   gap: 10px;
   border-style: none;
      &:hover {
    background-color: #4A4A4A;
    border-style: none;
   }
   }   
 }
.n-delete {
 color: #767676;
font-weight: 300;
font-size: 36px;  
cursor: pointer;
}

.noob{
	padding-top :20px;
	font-size: 20px;
}

.n-list{
  border-collapse: collapse;
  width:100%;
   & tr {
	   & td {padding:18px 0 18px;};
	   & td:nth-child(1){
		   width:80%;
		   text-align: left;
		   input{
		   width: 17px;
		   height: 17px;
		   border-bottom: #cccccc;
	      };
	   & label{
	   margin-left:8px;
	   font-size: 20px;
	   color: #333333;
	     }
	   }
	   & td:nth-child(2){
	   width:20%;
	   text-align: right;
	   color: #767676;
	   }
   }
}
 .notice-container {
     max-width: 600px;
     margin: auto;
     background: white;
     padding: 20px;
     border-radius: 8px;
     box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	 h1 {
	     text-align: center;
	     color: #333;
	 }
	 .info {
	     margin: 20px 0;
	     font-size: 18px;
	     line-height: 1.6;
	 }
	 .button {
	     display: block;
	     width: 100%;
	     padding: 10px;
	     background-color: #007bff;
	     color: white;
	     text-align: center;
	     border: none;
	     border-radius: 5px;
	     cursor: pointer;
	     text-decoration: none;
	     font-size: 16px;
	 }
	 .button:hover {
	     background-color: #0056b3;
	 }
	 select {
	     width: 100%;
	     padding: 10px;
	     margin-bottom: 20px;
	     border-radius: 5px;
	     border: 1px solid #ccc;
	 }
 }
 .overlay-notice {
    display: none; /* 기본 상태를 숨김으로 설정 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 배경색 설정 */
    z-index: 1000; /* 다른 요소 위에 표시 */

    p{
    margin: 5px 0;
    }
}


}

/* 평가 */
.popup-evaluate {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 700px; /* 팝업 너비 */
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    z-index: 1000; /* 다른 요소 위에 표시 */
    border-radius: 8px; /* 모서리 둥글게 */
    padding: 20px; /* 내부 여백 */
}

.e-header {
    display: flex;
    justify-content: space-between;
}

.e-delete {
    cursor: pointer;
    color: #767676;
    font-weight: 300;
    font-size: 24px;
}
.note-size {
width: 100%

}

</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>
	
	<!-- 평가창 -->
<form action="/Company/Mypage/ApplyList/Evaluate" method="POST">
        <input type="hidden" name="appli_idx" value="${appli_idx}">
    <input type="hidden" name="company_idx" value="${company_idx}">
    <input type="hidden" name="appli_status" value="${appli_status}">
    <input type="hidden" name="post_idx" value="${post_idx}">
    <input type="hidden" name="resume_idx" value="${vo.resume_idx}">
    <input type="hidden" name="evaluate_idx" value="${evaluate.evaluate_idx}">
    <input type="hidden" name="letter_score" value="${evaluate.letter_score != null ? evaluate.letter_score : 0}">

    <div class="popup-evaluate">  
        <c:choose>
            <c:when test="${not empty company_idx}">
                <div class="evaluation"> 
                    <div class="e-header">
                        <h2 class="e-title">평가지</h2>
                        <span class="e-delete">x</span>
                    </div>
                    <div class="evaluation-content"> <!-- 스크롤 가능 영역 -->
                        <div class="scrollable-area">
                            <table class="evaluation-container">
                                <thead>
                                    <tr>
                                        <th>항목</th>
                                        <th>평가기준</th>
                                        <th>점수</th>
                                        <th>비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="5">학력</td>
                                        <td>고졸이하:1</td>
                                        <td rowspan="5"><input type="number" name="edu_score" min="0" max="5" value="${evaluate.edu_score != null ? evaluate.edu_score : 0}"></td>
                                        <td rowspan="5"><textarea name="edu_note" class="note-size">${evaluate.edu_note}</textarea></td>
                                    </tr>
                                    <tr><td>전문학사:2</td></tr>
                                    <tr><td>학사:3</td></tr>
                                    <tr><td>석사:4</td></tr>
                                    <tr><td>박사:5</td></tr>
                                    <tr>
                                        <td>자격증 또는 기술</td>
                                        <td>인사담당자 재량</td>
                                        <td><input type="number" name="skill_score" min="0" max="5" value="${evaluate.skill_score != null ? evaluate.skill_score : 0}"></td>
                                        <td><textarea name="skill_note" class="note-size">${evaluate.skill_note}</textarea></td>
                                    </tr>

                                    <tr>
                                        <td rowspan="5">경력</td>
                                        <td>1년이상:1</td>
                                        <td rowspan="5"><input type="number" name="career_score" min="0" max="5" value="${evaluate.career_score != null ? evaluate.career_score : 0}"></td>
                                        <td rowspan="5"><textarea name="career_note" class="note-size">${evaluate.career_note}</textarea></td>
                                    </tr>
                                    <tr><td>3년이상:2</td></tr>
                                    <tr><td>5년이상:3</td></tr>
                                    <tr><td>7년이상:4</td></tr>
                                    <tr><td>10년이상:5</td></tr>

                                    <tr>
                                        <td rowspan="5">자기소개서</td>
                                        <td>직무관련 경험</td>
                                        <td><input type="number" name="score4" min="0" max="5" value="0"></td>
                                        <td rowspan="5"><textarea name="letter_note" class="note-size">${evaluate.letter_note}</textarea></td>
                                    </tr>
                                    <tr><td>성격 및 장단점</td><td><input type="number" name="score5" min="0" max="5" value="0"></td></tr>
                                    <tr><td>가치관</td><td><input type="number" name="score6" min="0" max="5" value="0"></td></tr>
                                    <tr><td>목표 달성 경험</td><td><input type="number" name="score7" min="0" max="5" value="0"></td></tr>
                                    <tr><td>실패 및 위기 극복 경험</td><td><input type="number" name="score8" min="0" max="5" value="0"></td></tr>

                                    <tr>
                                        <td>포트폴리오</td>
                                        <td>인사담당자 재량</td>
                                        <td><input type="number" name="portfolio_score" min="0" max="5" value="${evaluate.portfolio_score != null ? evaluate.portfolio_score : 0}"></td>
                                        <td><textarea name="portfolio_note" class="note-size">${evaluate.portfolio_note}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td>가점</td>
                                        <td>인사담당자 재량</td>
                                        <td><input type="number" name="ext_score" min="0" max="5" value="${evaluate.ext_score != null ? evaluate.ext_score : 0}"></td>
                                        <td><textarea name="ext_note" class="note-size" >${evaluate.ext_note}</textarea></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> <!-- 스크롤 가능 영역 종료 -->
                    </div>
                    <div>
                        <span class="total">총평</span>
                        <textarea name="total_note">${evaluate.total_note}</textarea>
                        <span class="totalscore">총점</span>
                        <input type="text" name="total_score" min="0" max="5" value="${evaluate.total_score != null ? evaluate.total_score : 0}">
                    </div>
                    <br>
                    <div class="e-btn">    
                        <button type="submit" class="evaluation-val">평가등록</button>
                    </div> 
                </div>
            </c:when>
            <c:otherwise>
                <div class="evaluate login-alter">
                    <h2 class="e-title">기업회원 로그인이 필요합니다.</h2>
                    <a href="/Company/LoginForm">로그인</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</form>
	
	<!-- 알림창 -->

<form action="/api/announce" id="notificationForm" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="companyIdx" id="companyIdx" value="${company_idx}">
    <input type="hidden" name="post_idx" id="postIdx" value="${post_idx}">
    <input type="hidden" name="userIdx" id="userIdx" value="${resumeVo.user_idx}">
    <div class="overlay-notice">
        <c:choose>
            <c:when test="${not empty company_idx}">
                <div class="notice"> 
                    <div class="n-header">
                        <h2 class="n-title">알림보내기</h2><span class="n-delete">x</span>
                    </div>
                    <div class="notice-container">
                        <select id="status-select" name="type" required>
                            <option value="default">제목을 선택해주세요</option>
                            <option value="document">서류합격</option>
                            <option value="interview">면접합격</option>
                        </select>
                        <div class="noti" id="notification">
                            <p>일반 알림입니다</p>
                            <p>이 이력서의 작성자에게 전달하고 싶으신 내용을 작성해주세요</p>
                            <p>일시: <input type="date" name="scadule"></p>
                            <p>장소: <input type="text" name="location"></p>
                            <p>안내사항: <textarea name="information"></textarea></p>
                        </div>
                    </div>
                    <div class="n-btn">
                        <button type="submit" class="notice-val">알림 전송<img src="/images/SendMessage.svg" class="img"></button>
                    </div> 
                </div>
            </c:when>
            <c:otherwise>
                <div class="notice login-alter">
                    <h2 class="n-title">기업회원 로그인이 필요합니다.</h2>
                    <a href="/Company/LoginForm">로그인</a>
                </div>
            </c:otherwise>
        </c:choose>    
    </div>
</form>

<main>
  <div class="inner">  
      <div class="innercontents">
      <div class="sidebar">
        <table>
         <tr><th>기업서비스</th></tr>
         <tr><td><a href="/Company/Mypage/Home/View?company_idx=${company_idx}" class="link"><img src="/images/myhome2.svg" class="img" data-hover="/images/myhome.svg">MY홈</a></td></tr>
         <tr><td><a href="/Company/Mypage/Post/List?company_idx=${company_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">채용공고</a></td></tr>
         <tr><td><a href="/Company/Mypage/Bookmark/List?company_idx=${company_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심인재</a></td></tr>
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${company_idx}"  class="active-color2" data-company-idx="${company_idx}"><img src="/images/arrow2.svg" class="img">지원내역</a></td></tr>
        </table>
        
	      <div id="side-menu">
	       <div id ="side-frame">
	         <p>최종수정일 : ${resumeVo.resume_fdate}<p>
	         <hr>
	         <h4>${resumeVo.resume_title}</h4>
	         <p id="side-hit">조회수 ${resumeVo.resume_hit}<p>
	         <div id="side-bottom">
	           <button class="btn" id="btn-evaluate">평가하기</button>
	           <button class="btn" id="btn-notice">알림보내기</button>
	         </div>
	       </div>
	    </div>
      </div>
      
      <div class="container" >
      <div class="contain-body">       
      <h2 class="main-title">${resumeVo.resume_title}</h2>
      <hr>
      <div id="info">
       <c:choose>
        <c:when test="${resumeVo.user_idx == 0}">
        <img src="/images/icon/user-profile.png" alt="이미지"/>
        <div id="info-content">
           <h3 id="info-title">탈퇴회원</h3>
           </div>
        </c:when>
        <c:otherwise>
         <c:choose>
       <c:when test="${imagePath != '0'}">
         <img src="/image/read?path=${imagePath}" alt="User Image" >
       </c:when> 
       <c:otherwise>
         <img src="/images/icon/user-profile.png" alt="User Image" >
       </c:otherwise>
      </c:choose> 
        <div id="info-content">
           <h3 id="info-title">${resumeVo.user_name}</h3>
           <p>${resumeVo.user_gender},${resumeVo.user_age}세 (${resumeVo.user_year}년)</p>
           <p>${resumeVo.user_email}</p>
           <p>${resumeVo.user_tel}</p>
        </div>
        </c:otherwise>
        </c:choose>
      </div>

      <div class="sub-filed">
        <h4 class="sub-title">학력</h4>
        <hr>
        <table class="sub-topic">
        <tr>
          <td>최종학력</td>
          <td>${resumeVo.eb_name} &nbsp;${resumeVo.edu_name} </td>
        </tr>		
        </table>
      </div>
     
    <c:if test="${not empty SkillList}">
      <div class="sub-filed">
        <h4 class="sub-title">업무 및 스킬</h4>
        <hr>
        <table class="sub-topic"> 
         <tr>
		   <td colspan="2" class="sub-skill">
           <div class="sub-skill-layout">  
          <c:forEach var="skill" items="${SkillList}">
              <div>${skill.skill_name}</div> 
          </c:forEach>          
           </div> 
         </td>
		</tr>
        </table>
      </div>
    </c:if>

      <div class="sub-filed">
	    <h4 class="sub-title">희망 근무조건</h4>
	    <hr> 
	    <table class="sub-topic">
		<tr>
	      <td>희망근무지</td>
	      <td>${resumeVo.city_name}</td>
	    </tr>
	    <tr>
	      <td>희망직무</td>
	      <td>${resumeVo.duty_name}</td>
	    </tr>
	    <tr>
	      <td>희망고용형태</td>
	      <td>${resumeVo.emp_name}</td>
	    </tr>
	   </table>
	  </div>	  
	  
       <div class="sub-filed">
	    <h4 class="sub-title">경력</h4>
	    <hr> 
       <c:choose>
		  <c:when test="${not empty resumeVo.career_cname}">
	    <table class="sub-topic">
	     <tr>
	       <td>회사명</td>
	       <td>${resumeVo.career_cname}</td>
	     </tr>
   
        <tr>
          <td>근무기간</td>
          <td>${resumeVo.career_sdate} ~ ${resumeVo.career_edate}</td>
        </tr>
        <tr id="sub-duty">
           <td><div>담당업무</div></td>
           <td><div>${resumeVo.career_description}</div></td>
        </tr>
       </table>
         </c:when>
	  	<c:otherwise>
	  		<div class="noob">신입</div>
	  	</c:otherwise>
	  </c:choose>
     </div>
	
      <div class="sub-filed">
	    <h4 class="sub-title" >자기소개서</h4>
	    <hr> 
        <div class ="sub-content">${resumeVo.cover_letter}</div>
	  </div>  
	     
      <c:if test="${not empty pfvoList}">
      <div class="sub-filed">
	    <h4 class="sub-title" >파일업로드</h4>
	    <hr> 
	    <c:forEach var="p" items="${pfvoList}">
       <div class="sub-filedown">
         <a href="/filedownload/${p.portfolio_idx}">
       <img src="/images/resume/link1.png"/>&nbsp;&nbsp;&nbsp;
       ${p.filename}
       </a>
       </div>
       </c:forEach>
	  </div>     
     </c:if>
    
          </div>
          <div class="btn-layout">
              <div class="btn btn-back"><a href ="/Company/Mypage/ApplyList/ApplyList?post_idx=${post_idx}&company_idx=${company_idx}">돌아가기</a></div>
         </div>
      </div>
   </div>
 </div>

</main>

 
 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 <script>
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
	 
 $('form').on('keypress', function(e) {
	    // 특정 입력 요소에서만 Enter 키를 방지
	    if (e.which === 13 && !$(e.target).is('textarea')) { // textarea가 아닌 경우에만
	        e.preventDefault(); // 기본 동작 방지
	    }
	});

 
 
 </script>
 <script>
 $(function(){
	 //평가하기
    $('#btn-evaluate').on('click', function(e) {
        $('.popup-evaluate').show(); // 팝업 보여주기
    });

    // 팝업 닫기
    $('.e-delete').on('click', function() {
        $('.popup-evaluate').hide(); // 팝업 숨기기
    });

    // 드래그 기능
let isDragging = false;
let offset = { x: 0, y: 0 };
const popup = $('.popup-evaluate');

// 마우스 다운 이벤트
$('.e-header').on('mousedown', function(e) {
    isDragging = true;
    // 마우스 클릭 위치와 팝업의 현재 위치 차이를 계산
    offset.x = e.clientX - popup.offset().left - 350; // 팝업의 문서 기준 왼쪽 위치
    offset.y = e.clientY - popup.position().top;  // 팝업의 문서 기준 위쪽 위치

    // 마우스 이동 이벤트 리스너 추가
    $(document).on('mousemove', mouseMoveHandler);
});

// 마우스 업 이벤트
$(document).on('mouseup', function() {
    isDragging = false;
    // 마우스 이동 이벤트 리스너 제거
    $(document).off('mousemove', mouseMoveHandler);
});

// 마우스 이동 핸들러
function mouseMoveHandler(e) {
    if (isDragging) {
        // 마우스 위치에 따른 팝업 이동
        popup.css({
            left: e.clientX - offset.x,
            top: e.clientY - offset.y
        });
    }
}



	
	//알림보내기
		$('#btn-notice').on('click', function(e){
			$('.overlay-notice').show();
		})
		$('.n-delete').on('click', function(){
			$('.overlay-notice').hide();				
		})
		$('.n-btn').on('click', function(){
			$('.overlay-notice').hide();				
		})
			$(".overlay-notice").on('click', function(e) {
		  		if($(e.target).closest('.notice').length == 0) { 
		       		$(".overlay-notice").hide();
		  	}
		});
	

  window.addEventListener('wheel', e => {
	  const scrollUp = e.deltaY <= 0;
	  if ( window.scrollY > 100 &&  scrollUp ||  scrollUp != 0) {
		  $("header").slideDown();	
	  } else {
		  $("header").slideUp();	
	  }
	});
 })

  
 </script>
 <!-- 평가 -->
<script>
$(function () {
    // 점수 입력 시 총점 및 자기소개서 점수 계산
    $('input[type="number"]').on('input', function () {
        calculateTotal();
        calculateLetterScore();
    });

    function calculateLetterScore() {
        let scores = []; // 점수 배열 초기화
        for (let i = 4; i <= 8; i++) {
            const score = parseFloat($(`input[name="score${i}"]`).val());
            if (!isNaN(score)) {
                scores.push(score);
            }
        }

        if (scores.length > 0) {
            const sum = scores.reduce((a, b) => a + b, 0);
            const average = (sum / scores.length).toFixed(2);
            $('input[name="letter_score"]').val(average); // 평균 점수를 입력 필드에 업데이트
        } else {
            $('input[name="letter_score"]').val(0); // 점수가 없으면 0으로 설정
        }
    }
    
    function calculateTotal() {
        let totalsum = 0;
        const inputs = $('.evaluation-content input[name^="score"], .evaluation-content input[name$="score"]');
        let validInputFound = false;

        inputs.each(function () {
            const value = parseFloat($(this).val());
            // 값이 유효한 경우에만 totalsum에 더함
            if (!isNaN(value) && value >= 0 && value <= 5) {
                totalsum += value;
                validInputFound = true;
            }
        });

        // 총점 계산
        let total = validInputFound ? (totalsum / 10).toFixed(2) : '0.00'; // 유효한 입력이 없으면 0.00
        $('input[name="total_score"]').val(total); // 총점을 입력 필드에 업데이트
    }

});
</script>
<!-- 알림함 -->

<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
    const selectElement = document.getElementById('status-select');
    const notificationDiv = document.getElementById('notification');
    const notice = document.querySelector('.notice-container');

    // 초기 상태 설정
    updateNotification(selectElement.value);

    selectElement.addEventListener('change', function() {
        updateNotification(this.value);
    });

    function updateNotification(selectedValue) {
        if (selectedValue === 'document') {
            notificationDiv.innerHTML = `
                <p>서류에 합격하였습니다.</p>
                <p>면접정보에 대해 다음과 같이 안내드립니다.</p>
                <p>일시: <input type="date" name="scadule"></p>
                <p>장소: <input type="text" name="location"></p>
                <p>안내사항: <textarea name="information"></textarea></p>
            `;
            notice.style.backgroundColor = '#ffffff'; 
        } else if (selectedValue === 'interview') {
            notificationDiv.innerHTML = `
                <p>면접에 합격하였습니다.</p>
                <p>입사 OT에 대해 다음과 같이 안내드립니다.</p>
                <p>일시: <input type="date" name="scadule"></p>
                <p>장소: <input type="text" name="location"></p>
                <p>안내사항: <textarea name="information"></textarea></p>
            `;
            notice.style.backgroundColor = '#EBECF1';
        }
        notificationDiv.style.display = 'block';
    }
});

</script>
<!----------------------------------------------------- 알림 전송 ------------------------------------------------------>

<%
    // 요청 방식이 POST인지 확인
    Integer announcementIdx = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // WebApplicationContext: ServletContext에 대한 접근을 제공하여, 웹 애플리케이션의 전역 설정이나 리소스에 접근할 수 있게함.
        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
        AnnounceDao announceDao = (AnnounceDao) context.getBean("announceDao");

        Announce announce = new Announce();
        announce.setCompanyIdx(Integer.valueOf(request.getParameter("companyIdx")));
        announce.setUserIdx(Integer.valueOf(request.getParameter("userIdx")));
        announce.setScadule(request.getParameter("scadule"));
        announce.setLocation(request.getParameter("location"));
        announce.setInformation(request.getParameter("information"));

        announceDao.save(announce);

        announcementIdx = announce.getAnnouncementIdx(); // 이제 null이 아님
        out.println("Generated announcement_idx: " + (announcementIdx != null ? announcementIdx : "null"));
    }
%>

<script>
//폼 제출 시 알림 전송 API 호출
document.getElementById('notificationForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 기본 폼 제출 동작 방지

    const formData = new FormData(event.target); // 폼 데이터 수집
    console.log([...formData.entries()]);
    const userIdx = document.getElementById('userIdx').value;
    const postIdx = document.getElementById('postIdx').value;
        const companyLink = document.querySelector('a.active-color2');
        const companyIdx = companyLink.getAttribute('data-company-idx');
        const type = document.getElementById('status-select').value;

    // 1단계: @PostMapping 메서드 호출
    fetch('/api/announce', {
        method: 'POST',
        body: formData
    })
    .then(response => {
    	console.log('Response status:', response.status);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // 서버로부터 announcementIdx를 응답받음
    })
    .then(data => {
    	console.log('Response data:', data);
        const announcementIdx = data.announcementIdx; // Controller에서 응답한 ID
        console.log("Generated announcementIdx:", announcementIdx);
        if (!announcementIdx) {
            alert('공지사항 ID가 유효하지 않습니다.');
            return;
        }

        // 2단계: 알림 전송 API 호출

        const noticeData = {
            userIdx: userIdx,
            companyIdx: companyIdx,
            announcementIdx: announcementIdx,
            type: type
        };
        console.log("Notice Data:", noticeData);
        return fetch('/api/send-notification', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(noticeData)
        });
    })
    .then(response => {
    	console.log('Response status:', response.status);
        if (!response.ok) {
            throw new Error('Notification sending failed');
        }
        alert('알림이 성공적으로 전송되었습니다.');
        // 리다이렉트
        window.location.href = "/Company/Mypage/ApplyList/ApplyList?company_idx=" + companyIdx + "&post_idx=" + postIdx;
    })
    .catch(error => {
        alert('작업 중 오류가 발생했습니다.');
        console.error('Error:', error);
    });
});

</script>

<!----------------------------------------------------- 알림 전송 ------------------------------------------------------>

</body>
</html>