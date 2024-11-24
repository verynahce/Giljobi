<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
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
     font-size: 12px;
     font-weight: 400;
     }
     
     div:nth-child(1) {
      margin-left: 0px;
     }
} 

/*버튼*/

.btn-layout {   
margin: 0 auto;
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

display:flex;
justify-content: space-between;
}
.e-title {
color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    line-height: 50.40px;
    margin-bottom: 30px;
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
.e-delete {
 color: #767676;
font-weight: 300;
font-size: 36px;  
cursor: pointer;
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
    margin-top: 20px;
    padding: 10px;
    
    img{
    width:20px;
    height: 20px;
    padding-top: 5px;    
    }
    
   &:hover {
    background-color: #4A4A4A;
   }
   a{ 
   display: block;
    text-decoration: none; 
    color: white; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 33px;
   gap: 10px;
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
}

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
</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>
   
   <!-- 평가창 -->
   <form action="/Company/Mypage/ApplyList/Evaluate" method="POST">
       <input type="hidden" name="appli_idx" value="${appli_idx}">
    <input type="hidden" name="company_idx" value="${company_idx}">
    <input type="hidden" name="post_idx" value="${post_idx}">
    <input type="hidden" name="post_idx" value="${post_idx}">
   <div class="popup-evaluate">  
   
   <c:choose>
      <c:when test="${not empty company_idx}">
          <div class="evaluation"> 
            <div class="e-header">
               <h2 class="e-title">평가지</h2>
               <span class="e-delete">x</span>
            </div>
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
                    <td rowspan="5"><input type="number" name="edu_score" min="0" max="5" value="${evaluate.edu_score}" ></td>
                    <td rowspan="5" class="no-border"><input type="text" name="edu_note" value="${evaluate.edu_note}"></td>
                </tr>
                <tr class="dotted">
                    <td class="dotted">전문학사:2</td>
                </tr>
                <tr class="dotted">
                    <td>학사:3</td>
                </tr>
                <tr class="dotted">
                    <td>석사:4</td>
                </tr>
                <tr class="dotted">
                    <td>박사:5</td>
                </tr>
                <tr>
                    <td>자격증 또는 기술</td>
                    <td>인사담당자 재량</td>
                    <td><input type="number" name="skill_score" min="0" max="5" value="${evaluate.skill_score}" ></td>
                    <td class="no-border"><input type="text" name="skill_note"  value="${evaluate.edu_note}"></td>
                <tr>
                    <td rowspan="5">경력</td>
                    <td>1년이상:1</td>
                    <td rowspan="5"><input type="number" name="career_score" min="0" max="5"  value="${evaluate.edu_note}"  ></td>
                    <td rowspan="5" class="no-border"><input type="text" name="career_note"  value="${evaluate.edu_note}"></td>
                </tr>
                <tr>
                    <td>3년이상:2</td>
                </tr>
                <tr>
                    <td>5년이상:3</td>
                </tr>
                <tr>
                    <td>7년이상:4</td>
                </tr>
                <tr>
                    <td>10년이상:5</td>
                </tr>
                <tr>
                    <td rowspan="5">자기소개서</td>
                    <td>직무관련 경험</td>
                    <td><input type="number" name="score4" min="0" max="5"  ></td>
                    <td rowspan="5" class="no-border"><input type="text" name="letter_note" value="${evaluate.letter_note}"></td>
                   <td><input type="hidden" name="letter_score" value="${evaluate.letter_score}"></td>
                </tr>
                <tr>
                    <td>성격 및 장단점</td>
                    <td><input type="number" name="_score5" min="0" max="5"  ></td>
                </tr>
                <tr>
                    <td>가치관</td>
                    <td><input type="number" name="_score6" min="0" max="5"  ></td>
                </tr>
                <tr>
                    <td>목표 달성 경험</td>
                    <td><input type="number" name="_score7" min="0" max="5"  ></td>
                </tr>
                <tr>
                    <td>실패 및 위기 극복 경험</td>
                    <td><input type="number" name="_score8" min="0" max="5"  ></td>
                </tr>
                <tr>
                    <td>포트폴리오</td>
                    <td>인사담당자 재량</td>
                    <td><input type="number" name="portfolio_score" min="0" max="5" value="${evaluate.portfolio_score}"  ></td>
                    <td class="no-border"><input type="text" name="porfolio_note" value="${evaluate.portfolio_note}"></td>
                </tr>
                <tr>
                    <td>가점</td>
                    <td>인사담당자 재량</td>
                    <td><input type="number" name="ext_score" value="${evaluate.ext_score}"  ></td>
                    <td class="no-border"><input type="text" name="ext_note" value="${evaluate.ext_note}"></td>
                </tr>
            </tbody>
        </table>
        <div>
            <span class="total">총평</span>
            <textarea></textarea>
            <span class="totalscore">총점</span>
            <input type="text" name="total_score" min="0" max="5" readonly value="${evaluate.total_score}">
        </div>
        <br>
            <div class="e-btn" >    
            <button type="submit" class="evaluation-val">평가등록</button>
            </div> 
         </div>
      </c:when>
        <c:otherwise>
           <div class="evaluate login-alter">
            <h2 class="e-title">기업회원 로그인이 필요합니다.</h2>
           <a href ="/Company/LoginForm">로그인</a>
         </div>
        </c:otherwise>
   </c:choose>
   </div>
         </form>
   
   <!-- 알림창 -->
   <div class="overlay-notice">  
   <c:choose>
      <c:when test="${not empty company_idx}">
          <div class="notice"> 
            <div class="n-header">
               <h2 class="n-title">알림보내기</h2><span class="n-delete">x</span>
            </div>
            <div class="notice-container">
                <h1>제목을 선택해주세요</h1>
                <select>
                    <option>제목 1</option>
                    <option>제목 2</option>
                    <option>제목 3</option>
                </select>
            
                <div class="noti">
                    <p>서류에 합격하였습니다.</p>
                    <p>면접정보에 대해 다음과 같이 안내드립니다.</p>
                    <p>일시: 2024/12/21 10:00 AM</p>
                    <p>장소: 그린아카데미 402호</p>
                    <p>안내사항: 이력서, 포트폴리오 지참, 말씀한 복장 준수</p>
                </div>
            </div>
            <div class="n-btn" ><a onclick="alert('알림보내기를 완료했습니다.')" class="notice-val" href ="">알림 전송<img src="/images/SendMessage.svg" class="img"></a></div> 
         </div>
      </c:when>
        <c:otherwise>
           <div class="notice login-alter">
            <h2 class="n-title">기업회원 로그인이 필요합니다.</h2>
           <a href ="/Company/LoginForm">로그인</a>
         </div>
        </c:otherwise>
   </c:choose>   
   </div>
<main>
  <div class="inner">  
      <div class="innercontents">
      <div class="sidebar">
        <table>
         <tr><th>기업서비스</th></tr>
         <tr><td><a href="/Company/Mypage/Home/View?company_idx=${company_idx}" class="link"><img src="/images/myhome2.svg" class="img" data-hover="/images/myhome.svg">MY홈</a></td></tr>
         <tr><td><a href="/Company/Mypage/Post/List?company_idx=${company_idx}" class="link"><img src="/images/icon2.svg" class="img" data-hover="/images/icon22.svg">채용공고</a></td></tr>
         <tr><td><a href="/Company/Mypage/Bookmark/List?company_idx=${company_idx}" class="link"><img src="/images/icon3.svg" class="img" data-hover="/images/icon33.svg">관심인재</a></td></tr>
         <tr><td><a href="/Company/Mypage/ApplyList/PostList?company_idx=${company_idx}" class="active-color2"><img src="/images/arrow2.svg" class="img">지원내역</a></td></tr>
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
        <img src="/images/icon/user-profile.png" alt="${userVo.user_name}이미지"/>
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
     
    <c:if test="${not empty resumeVo.skill_name}">
      <div class="sub-filed">
        <h4 class="sub-title">업무 및 스킬</h4>
        <hr>
        <table class="sub-topic"> 
         <tr>
         <td colspan="2" class="sub-skill">
           <div class="sub-skill-layout">
     
              <div>${resumeVo.skill_name}</div> 
          
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
     
    
          </div>
          <div class="btn-layout">
              <div class="btn btn-back"><a class="return-btn"href ="/Company/Mypage/ApplyList/ApplyList?post_idx=${post_idx}&company_idx=${company_idx}">돌아가기</a></div>
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

    $('.e-header').on('mousedown', function(e) {
        isDragging = true;
        offset.x = e.clientX - $(this).closest('.popup-evaluate').offset().left;
        offset.y = e.clientY - $(this).closest('.popup-evaluate').offset().top;
        $(document).on('mousemove', mouseMoveHandler);
    });

    $(document).on('mouseup', function() {
        isDragging = false;
        $(document).off('mousemove', mouseMoveHandler);
    });

    function mouseMoveHandler(e) {
        if (isDragging) {
            $('.popup-evaluate').css({
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
 <script>
/* 평점 */
$(function () {
    // 점수 입력 시 총점 계산
    $('input[type="number"]').on('input', function () {
        calculateTotal();
        calculateLetterScore();
    });

    function calculateTotal() {
        let totalsum = 0;
        const inputs = $('input[type="number"]');
        let validInputFound = false; // 유효한 입력 값이 발견되었는지 추적

        inputs.each(function () {
            const value = parseFloat($(this).val());
            // 값이 유효한 경우에만 totalsum에 더함
            if (!isNaN(value)) {
                totalsum += value;
                validInputFound = true; // 유효한 입력이 발견됨
            }
        });

        // 유효한 입력이 없을 경우 totalsum을 0으로 설정
        if (!validInputFound) {
            totalsum = 0;
        }

        // 총점 계산
        let total = (totalsum / 10).toFixed(2); // 소수점 둘째 자리까지 반올림
        $('input[name="total_score"]').val(total); // 총점을 입력 필드에 업데이트
    }
});



document.querySelector('.evaluation-val').addEventListener('click', function (event) {
    const scores = document.querySelectorAll('input[type="number"]');
    let valid = true;

    scores.forEach(score => {
        if (score.value === '' || score.value < 0 || score.value > 5) {
            alert('모든 점수는 0과 5 사이여야 합니다.');
            valid = false;
        }
    });

    if (!valid) {
        event.preventDefault();
    }
});

function calculateLetterScore() {
    let scores = [];
    for (let i = 5; i <= 8; i++) {
        const score = parseFloat($(`input[name="score${i}"]`).val());
        if (!isNaN(score)) {
            scores.push(score);
        }
    }

    if (scores.length > 0) {
        const sum = scores.reduce((a, b) => a + b, 0);
        const average = (sum / scores.length).toFixed(2);
        $('input[name="letter_score"]').val(average);
    } else {
        $('input[name="letter_score"]').val(0);
    }
}
</script>
 
</body>
</html>