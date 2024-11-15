
   const $header         = document.querySelector("header")
   const $menuBtn        = document.querySelector(".menu-btn");
   const $headerUtil     = document.querySelectorAll(".header-util li");
   const $utilBtn        = document.querySelector(".menu-btn button");
   const $headerComunity = document.querySelector(".header-comunity")
   const $userBar = document.querySelector(".user-bar");
	 const $userLogin = document.querySelector(".user-login");
   
   let menuActive = false;
   $menuBtn.addEventListener("click", (e) => {
     menuActive = !menuActive;
     if (menuActive) {
       $header.classList.add("menu-btn-active");
       $menuBtn.classList.add("menu-btn-active");
       $utilBtn.classList.add("menu-btn-active");
       for(let i = 0; i < 3; i++){
         $headerUtil[i].style.display = "none"
       }

     } else {
       $header.classList.remove("menu-btn-active");
       $menuBtn.classList.remove("menu-btn-active");
       $utilBtn.classList.remove("menu-btn-active");
       for(let i = 0; i < 3; i++){
         $headerUtil[i].style.display = "block"
       }
     }
   });
   
   let userBarActive = true
   $userBar.addEventListener("click",function(){
		if(userBarActive){
		$userLogin.style.display = "block"
		userBarActive = !userBarActive
		}else{
			$userLogin.style.display = "none"
		userBarActive = !userBarActive
		}
	 })
