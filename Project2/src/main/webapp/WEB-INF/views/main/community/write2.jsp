<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡덕</title>
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
        });
    </script>
<style>
/*오버레이*/
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 2;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display:none;
  transition: all 0.3s  ease-in;
 }

 /*body*/
.inner {
  display:flex;
  justify-content: space-between;
}

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

 .container {
  width:  100%;
  display:flex;
  flex-direction: column; 
  justify-content: center;
}
 
.contain-body {
  width:940px;
  min-height: 1200px;
  background-color: white;
  border-radius: 20px;
  margin: 0px auto 60px  auto  ;
  padding: 0 60px 50px 60px;
}

.main-title {
  color: #ccc;
  font-size: 36px; 
  font-weight: 600; 
  line-height: 15.40px;
  height:70px;
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
 width:fit-content;
 margin: 80px auto 0 auto;
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
}
 
 .btn-apply {
   
   background:#2F9EFF;
   color: #fff;
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

</style>

</head>
<body>

<%@include file="/WEB-INF/include/header.jsp" %>

<main>
  <div class="inner">  
  <form action="/Main/Community/Write" method="POST">
      <div class="innercontents">
      <div class="container" >
      <div class="contain-body">       
      <h2 class="main-title"><textarea name="comTitle" class="title-text" placeholder="제목을 입력하세요."></textarea></h2>
      <hr class="divider">
      <div id="info">
        <span><a class="upload" href=""><img src="/images/community/link.png">링크</a></span>&nbsp;
        <span><a class="upimage upload" href=""><img src="/images/community/photo.png">사진</a></span>
      </div>
      <hr class="divider">
      <div class="sub-filed">
	    <textarea id="question-content"  name="comContent" placeholder="질문할 내용을 입력하세요."></textarea>
	  </div> 
      <hr class="divider">
	  <div class="btn-layout">
              <div class="btn btn-apply"><a href ="#">등록하기</a></div>
              <div class="btn btn-back"><a href ="/Company/Mypage/Bookmark/List?company_idx=${company_idx}">취소</a></div>
         </div>  
                 <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea>
           
          </div>
      </div>
   </div>
   </form>
 </div>

</main>

 
 <%@include file="/WEB-INF/include/footer.jsp" %>
 
 <script>
 
 //오버레이 
 $(function(){
	 




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