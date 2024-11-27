<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>길JOB이</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/common.js" defer></script>
<script src="/js/header.js" defer ></script>
    <script src="https://cdn.tiny.cloud/1/naqbc2q2alc7s5c2xz1hh7pgsgxs5xxhjs0kglbspcy0i9vl/tinymce/5/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: '#content', // textarea에 에디터를 적용
            plugins: 'image',
            toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | image',
            image_uploadtab: true,
            file_picker_types: 'image',  // 이미지 파일만 선택 가능
            automatic_uploads: true,  // 자동 업로드 활성화
            images_upload_url: '/upload-image',  // 이미지 업로드 URL
            images_upload_base_path: '/images',  // 이미지 저장 경로
            setup: function (editor) {
                editor.on('change', function () {
                    editor.save(); // 에디터의 내용을 textarea에 저장
                });}
        });
    </script>
<style>



 /*body*/
.inner {
  display:flex;
  justify-content: center;

  
}

main {
  background-color:#F0F2F5;
}

 .innercontents {
  display:flex;
justify-content:center;
  font-family: pretendard; 
  padding-top:30px; 
  padding-bottom:60px; 


.contain-body {
  border: 1px solid #cccccc;
  width:940px;
  min-height: 1200px;
  background-color: white;
  border-radius: 20px;
  margin: 0px auto;
  padding: 0 60px 50px 60px;
}

.main-title {
 margin-top: 25px;
  input[type="text"] {
    margin-bottom:10px;
    color: #333333;
    font-size: 36px; 
    font-weight: 600; 
    height: 70px;
    border: none;
    width:640px;
  }
}

.title-text {
  width:100%;
  border:none;
  resize:none;
  font-size:30px;
  outline:none;
  padding-left:10px;
  padding-top:15px;
  max-height:70px;
}

.title-text::placeholder {
  font-size:30px;
  font-weight:500;
}
 
 #info {
  display: flex; 
  padding-top:23px;
  padding-left:10px;
  gap:15px;
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
      height: 74px;         
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

     

/*버튼*/

.btn-layout {  
padding-top: 40px;
display: flex;
justify-content: center;

}
 .btn {
   display: inline-block;
    width: 200px; 
    height: 60px;   
    border-radius: 8px;
 
    a {
    display: block;
    text-decoration: none; 
    width: 100%; 
    height: 100%;
    text-align: center;
    line-height: 60px;
  }
 }
  .btn-back {
  background: #fff; 
  color: #7C7373;
  border: 1px solid #ccc;
  font-size: 16px;
}
 
 .btn-apply {
   
   background:#2F9EFF;
   color: #fff;
   font-size: 16px;
   border : 1px solid #ccc;
}

/*디바이더(가로선)*/
.divider {
  border:none;
  height:1px;
  background-color:#ccc;
}

/*링크 및 사진 파일 업로드 버튼*/
.upload {
  font-size:25px;
  padding-bottom:14px;
}

/*텍스트영역*/
#question-content {
  border:none;
  resize:none;
  width:100%;
  height:800px;
  margin-top:15px;
  font-size:16px;
  color:#767676;
  padding:7px 5px 5px 7px;
}
 
#question-content::placeholder {
  font-size:20px;
}

.upload {
  display:block;
  display:flex;
  align-items:center;
  justify-content:center;
}
textarea {
height: 1000px;
}

.contain-header {
display: flex;
justify-content: space-between;
align-items:baseline;
select{
width: 130px;
height: 30px;
    border: 1px solid #cccccc;
    color: #333333;
    font-size:16px;
    border-radius: 7px;
}
p{
 font-size:16px;
 font-weight: 400;
}
}
</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>

<main>
  <div class="inner">  
  <form action="/Main/Community/Write" method="POST">
      <div class="innercontents">
      <div class="contain-body">   
      <div class="contain-header">   
      <h2 class="main-title"><input type="text" name="comTitle" placeholder="제목을 입력하세요"></h2>
      <p>분야&nbsp;</p>
      <select name="dutyId">
      <c:forEach var="d" items="${dutyList}">
      <option value="${d.dutyId}">${d.dutyName}</option>
      </c:forEach>
      </select>
      </div> 
     <hr class="divider">
       <textarea id="content" name="comContent" required></textarea>
      <hr class="divider">
	  <div class="btn-layout">
	  <input type="hidden" name="userIdx" value="${userIdx}">
              <div><input class="btn btn-apply"type="submit"value="등록하기"></div>
              <div class="btn btn-back"><a href ="/Main/Community/List">취소</a></div>
       </div>
         </div>  
  
      
           

      </div>
   </div>
   </form>
 </div>

</main>

 
 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 <script>
 

 $(function(){
	 
	 //tiny 커스텀
	 tinymce.init({
		  selector: 'textarea',  
		  max_height: 500,
		  max_width: 500,
		  min_height: 100,
		  min_width: 400
		}); 




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
	 
 
 })
 </script>
 
</body>
</html>