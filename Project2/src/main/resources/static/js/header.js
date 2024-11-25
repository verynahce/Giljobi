  window.addEventListener('wheel', e => {
	   $header.classList.remove("menu-btn-active");
       $menuBtn.classList.remove("menu-btn-active");
       $utilBtn.classList.remove("menu-btn-active");
  const scrollUp = e.deltaY <= 0;
  if ( window.scrollY > 100 &&  scrollUp ||  scrollUp != 0) {
	  $("header").slideDown();	
  } else {
	  $("header").slideUp();	
  }
});