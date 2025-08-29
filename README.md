<h1>휴먼클라우드웹 프로젝트 - 길잡이(GILJOBI)</h1>

<img width="1920" height="1080" alt="포폴용 헤더-나히4" src="https://github.com/user-attachments/assets/ae3b7fd9-2873-4255-acdb-16f543b68f77" />

<ul>
  <li>프로젝트 기간 : 2024.11.19 ~ 2024.11.29 (10일)</li>
</ul>
&nbsp
<h2>프로젝트 소개</h2>
<ul>
  <li>길잡이는 기업과 개인의 구인구직을 지원하며, 맞춤형 취업 정보를 제공합니다.</li> 
  <li>이력서별 평점 기능, 개인 맞춤 알림 서비스, 추천 공고 및 이력서 목록, 커뮤니티 기능 등 회원들의 편리함과 자율성을 중시하여 다양한 서비스를 제공합니다.</li>
</ul>
&nbsp

<h2>시연 영상</h2>
<h4>사진 클릭시 이동 >> </h4>
<div align="center">
  <a href="https://www.youtube.com/watch?v=v6tctOEp3VM">
    <img src="https://github.com/user-attachments/assets/4cdc085b-d2bd-401b-88b8-98b5e0d51027" alt="시연 영상 썸네일" width="600"/>
  </a>
</div>
&nbsp

<h2>담당 업무</h2>
<ul>
  <li>추천 알고리즘 기반 직무 매칭 시스템 구현: 공고 및 이력서 직무 데이터를 분석하여 클릭 수 TOP3 공고/이력서 추천 기능 개발</li>
  <li>파일 관리 모듈 개발: 이력서 및 채용 공고 파일 <strong>업로드 / 다운로드 / Preview / CRUD</strong> 기능 구현</li>
  <li>이력서 관리 기능 고도화: <strong>멀티 기술 스택 입력 및 데이터베이스 연동</strong> 지원</li>
  <li>커뮤니티 서비스 구현: 구직자 전용 게시판(조회, 작성, 수정, 댓글, 좋아요) 기능 개발 및 <strong>RESTful API</strong> 설계</li>
  <li>알림 시스템 개발: 이벤트 기반 알림 메시지 표시 기능 구현</li>
</ul>
&nbsp

<h2>기술스택</h2>

![Git-F05032.svg](https://img.shields.io/badge/Git-F05032.svg?&style=for-the-badge&logo=Git&logoColor=white)
![GitHuB-181717.svg](https://img.shields.io/badge/GitHub-181717.svg?&style=for-the-badge&logo=GitHub&logoColor=white)
![Notion-000000.svg](https://img.shields.io/badge/Notion-000000.svg?&style=for-the-badge&logo=Notion&logoColor=white)
![Figma-F24E1E.svg](https://img.shields.io/badge/Figma-F24E1E.svg?&style=for-the-badge&logo=Figma&logoColor=white)

### IDE

![VS-CODE](https://img.shields.io/badge/Visual%20Studio%20Code-007ACC.svg?&style=for-the-badge&logo=Visual%20Studio%20Code&logoColor=white)
![IntelliJ](https://img.shields.io/badge/IntelliJ%20IDEA-000000.svg?&style=for-the-badge&logo=IntelliJ%20IDEA&logoColor=white)
![eclipseide](https://img.shields.io/badge/eclipseide-2C2255.svg?&style=for-the-badge&logo=eclipseide&logoColor=white)


### Frontend

![HTML5](https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=white)
![jquery](https://img.shields.io/badge/jquery-0769AD.svg?&style=for-the-badge&logo=jquery&logoColor=white)
![JPA](https://img.shields.io/badge/JPA-1D9FD7.svg?&style=for-the-badge&logoColor=white)
![JSTL](https://img.shields.io/badge/JSTL-1D9FD7.svg?&style=for-the-badge&logoColor=white)

### Backend

![Java](https://img.shields.io/badge/Java-B07219.svg?&style=for-the-badge)
![SpringBoot](https://img.shields.io/badge/Spring_Boot-6DB33F.svg?&style=for-the-badge&logo=SpringBoot&logoColor=white)
![SpringSecurity](https://img.shields.io/badge/Spring_Security-6DB33F.svg?&style=for-the-badge&logo=SpringSecurity&logoColor=white)
![SpringJPA](https://img.shields.io/badge/Spring_JPA-6DB33F.svg?&style=for-the-badge)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![MyBatis](https://img.shields.io/badge/MyBatis-1D9FD7.svg?&style=for-the-badge&logoColor=white)


### API
![OpenAI](https://img.shields.io/badge/OpenAI-111111.svg?style=for-the-badge&logo=OpenAI&logoColor=white)
![Kakao](https://img.shields.io/badge/Kakao-FFCD00.svg?&style=for-the-badge&logo=Kakao&logoColor=white)
![TinyMCE](https://img.shields.io/badge/TinyMCE-7D4698?style=for-the-badge&logo=Tor-Browser&logoColor=white)

<h2>트러블 슈팅</h2>

<h3>문제 상황</h3>
<ul>
  <li><code>input=file</code> 사용 시 동일 파일 업로드가 덮어쓰기로 처리되어 여러 파일 추가 불가</li>
  <li>운영체제 경로 차이(윈도우 <code>\</code> vs 리눅스 <code>/</code>)로 저장/로드 시 오류 발생</li>
  <li>추천 공고/이력서 기능이 단순 클릭 수 기반이라 사용자와의 연관성이 부족</li>
</ul>

<h3>개선 방안</h3>
<ul>
  <li><code>Paths.get()</code>, <code>File.separator</code>를 사용하여 운영체제(OS) 독립적인 경로 처리</li>
  <li>JavaScript <code>FileList</code> 병합 및 <code>FormData.append()</code> 방식으로 멀티 파일 업로드 지원</li>
  <li>직무 기반 필터링을 적용해 같은 직무 내 클릭 수 TOP3를 추천하도록 로직 개선  
      → SQL/DTO 설계를 직무 조건에 맞게 수정해 추천 정확도 향상</li>
</ul>

<h2>ERM</h2>
<img width="7382" height="5487" alt="Display_1" src="https://github.com/user-attachments/assets/bfc60c34-850e-433f-9c24-7e0a2d321fbb" />

&nbsp;
<h2>화면 설계</h2>
<h3>메인페이지</h3>
<h3>공고</h3>
<h3>이력서</h3>
<h3>커뮤니티</h3>
<h3>개인회원</h3>
<h3>기업회원</h3>

