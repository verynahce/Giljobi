<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
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
</style>
</head>
<body>
	<!-- 평가창 -->
	<div class="overlay-evaluate">  
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
                    <td rowspan="5"><input type="number" name="score1" min="0" max="5" required></td>
                    <td rowspan="5" class="no-border"></td>
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
                    <td><input type="number" name="score2" min="0" max="5" required></td>
                    <td class="no-border"><input type="text"></td>
                <tr>
                    <td rowspan="5">경력</td>
                    <td>1년이상:1</td>
                    <td rowspan="5"><input type="number" name="score3" min="0" max="5" required></td>
                    <td rowspan="5" class="no-border"><input type="text"></td>
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
                    <td><input type="number" name="score4" min="0" max="5" required></td>
                    <td rowspan="5" class="no-border"><input type="text"></td>
                </tr>
                <tr>
                    <td>성격 및 장단점</td>
                    <td><input type="number" name="score5" min="0" max="5" required></td>
                </tr>
                <tr>
                    <td>가치관</td>
                    <td><input type="number" name="score6" min="0" max="5" required></td>
                </tr>
                <tr>
                    <td>목표 달성 경험</td>
                    <td><input type="number" name="score7" min="0" max="5" required></td>
                </tr>
                <tr>
                    <td>실패 및 위기 극복 경험</td>
                    <td><input type="number" name="score8" min="0" max="5" required></td>
                </tr>
                <tr>
                    <td>포트폴리오</td>
                    <td>인사담당자 재량</td>
                    <td><input type="number" name="score9" min="0" max="5" required></td>
                    <td class="no-border"><input type="text"></td>
                </tr>
                <tr>
                    <td>가점</td>
                    <td>인사담당자 재량</td>
                    <td><input type="number" name="score10" min="0" max="5" required></td>
                    <td class="no-border"><input type="text"></td>
                </tr>
            </tbody>
        </table>
        <div>
            <span class="total">총평</span>
            <textarea></textarea>
            <span class="totalscore">총점</span>
            <input type="text" name="totalScore" readonly value="3.8">
        </div>
        <br>
			   <div class="e-btn" ><a onclick="alert('평기를 완료했습니다.')" class="apply-val" href ="">평가등록</a></div> 
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
</body>
</html>