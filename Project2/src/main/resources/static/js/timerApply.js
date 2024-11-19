		
  $(function(){		
	  
	  /*시간 타이머 */
	  const dday = "${vo.post_ddate}";

	  let ddayDate = dday.replace(/[^\d]/g, '-').replace(/--+/g, '-').replace(/-$/, '');
	  const DDate = new Date(ddayDate + "T23:59:59");
      
	    // 타이머 업데이트 함수
	    function updateTimer() {
	      const cTime = new Date();
	      const timeRemaining = DDate - cTime; // 목표 날짜와 현재 시간의 차이
            
	      // 남은 시간이 0보다 크면 타이머를 갱신
	      if (timeRemaining > 0) {
	        const days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24)); 
	        const hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
	        const minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60)); 
	        const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);
	       
	        
	        const fHours = hours < 10 ? '0' + hours : hours;
	        const fMinutes = minutes < 10 ? '0' + minutes : minutes;
	        const fSeconds = seconds < 10 ? '0' + seconds : seconds;
	        
	        const ddayText = days + '일 ' +fHours +':'+fMinutes+':'+fSeconds
	        document.querySelector('.apply-dday').textContent = ddayText;
	   
	      } else {
	        // 타이머가 끝나면 "D-Day"라고 표시
	    	  document.querySelector('.apply-dday').textContent = "마감된 공고입니다";
	      }
	    }

	    // 1초마다 타이머 업데이트
	    setInterval(updateTimer, 1000);

	    // 초기 실행
	    updateTimer();
	    
	    })