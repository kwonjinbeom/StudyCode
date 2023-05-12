$(function(){
	/* 메뉴 선택 시 스크롤 이동 */
	let Home = $("#home").offset().top;
	let Education = $("#Education").offset().top;
	let Skills = $("#Certificate").offset().top;
	let Certificate = $("#Skills").offset().top;
	let Projects = $("#Projects").offset().top;
	let navClickArray = [Home, Education, Certificate, Skills, Projects];
	const navLi = $("nav > ul > li"); /* nav > ul > li query */
	
	$(navLi[0]).click(function(){
	    window.scrollTo({left:0, top:navClickArray[0], behavior:"smooth"})
	    for(let i = 0; i < navLi.length; i++){
	        $(navLi[i]).css("color","white");
	    }
	    $(this).css("color","yellow");
	})
	
	$(navLi[1]).click(function(){
	    window.scrollTo({left:0, top:navClickArray[1], behavior:"smooth"});
	    for(let i = 0; i < navLi.length; i++){
			$(navLi[i]).css("color","black");
	    }
	    $(this).css("color","yellow");
	})
	$(navLi[2]).click(function(){
	    window.scrollTo({left:0, top:navClickArray[2], behavior:"smooth"})
	    for(let i = 0; i < navLi.length; i++){
			$(navLi[i]).css("color","black");
	    }
	    $(this).css("color","yellow");
	})
	$(navLi[3]).click(function(){
	    window.scrollTo({left:0, top:navClickArray[3], behavior:"smooth"})
	    for(let i = 0; i < navLi.length; i++){
			$(navLi[i]).css("color","black");
	    }
	    $(this).css("color","yellow");
	    
	})
	$(navLi[4]).click(function(){
	    window.scrollTo({left:0, top:navClickArray[4], behavior:"smooth"})
	    for(let i = 0; i < navLi.length; i++){
			navLi[i].css("color","black");
	    }
	    $(this).css("color","yellow");
	})
	/* 메뉴 선택 시 스크롤 이동 끝*/
	
	/* 스크롤 상단 시 스크롤 숨기기 및 편하게 스크롤 */
	const body = document.querySelector("body"); /* body query */
	body.classList.add('scroll_hidden');
	body.classList.add('scroll_hidden::-webkit-scrollbar');
	/*logo, 아래 화살표, home 버튼 클릭 시 기본 이벤트*/
	$("#logo").click(function(){
				 window.scrollTo({left:0, top:navClickArray[0], behavior:"smooth"})
			})
	$("#homeImage").click(function(){
				 window.scrollTo({left:0, top:navClickArray[0], behavior:"smooth"})
			})
	if(($(window).scrollTop() >= 0) && ($(window).scrollTop() < navClickArray[1]-15)){
			 $("#downArrowImage").click(function(){
				 window.scrollTo({left:0, top:navClickArray[1], behavior:"smooth"})
			})
         }
     /*아래화살표 클릭 시 기본 이벤트 끝*/
	body.classList.add('scroll_hidden');
	body.classList.add('scroll_x_hidden');
	body.classList.add('scroll_hidden::-webkit-scrollbar');/*메인화면 스크롤바 숨기기*/
	$(window).scroll(function(){
	    let scrollHeight = $(this).scrollTop();
	    
	    console.log(scrollHeight);
	    if(scrollHeight != 0){
	        body.classList.remove('scroll_hidden');
	        body.classList.remove('scroll_hidden::-webkit-scrollbar');
	    }else{
	        body.classList.add('scroll_hidden');
	        body.classList.add('scroll_hidden::-webkit-scrollbar');
	    }
	    /* 스크롤 시 nav바 색상 변경 */
         if((scrollHeight >= 0) && (scrollHeight < navClickArray[1]-15)){
			 $("#downArrowImage").click(function(){
				 window.scrollTo({left:0, top:navClickArray[1], behavior:"smooth"})
			})
             for(let i = 0; i < navLi.length; i++){
				 $(navLi[i]).css("color","#5C5C5C");
		    	}
		    	$(navLi[0]).css("color","#8BC0FF");
         }else if((scrollHeight >= navClickArray[1]-10) && (scrollHeight < navClickArray[2]-15)){
			 $("#downArrowImage").click(function(){
				 window.scrollTo({left:0, top:navClickArray[2], behavior:"smooth"})
			})
             for(let i = 0; i < navLi.length; i++){
				 $(navLi[i]).css("color","#5C5C5C");
		    	}
		    	$(navLi[1]).css("color","#8BC0FF");
         }else if((scrollHeight >= navClickArray[2]-10) && (scrollHeight < navClickArray[3]-15)){
			 $("#downArrowImage").click(function(){
				 window.scrollTo({left:0, top:navClickArray[3], behavior:"smooth"})
			})
			 for(let i = 0; i < navLi.length; i++){
				 $(navLi[i]).css("color","#5C5C5C");
		    	}
		    	$(navLi[2]).css("color","#8BC0FF");
         }else if((scrollHeight >= navClickArray[3]-10) && (scrollHeight < navClickArray[4]-15)){
			 $("#downArrowImage").click(function(){
				 window.scrollTo({left:0, top:navClickArray[4], behavior:"smooth"})
			})
			 for(let i = 0; i < navLi.length; i++){
				 $(navLi[i]).css("color","#5C5C5C");
		    	}
		    	$(navLi[3]).css("color","#8BC0FF");
         }else if((scrollHeight >= navClickArray[4]-10)){
			 for(let i = 0; i < navLi.length; i++){
				 $(navLi[i]).css("color","#5C5C5C");
		    	}
		    	$(navLi[4]).css("color","#8BC0FF");
         }
         /* 스크롤 시 nav바 색상 변경 끝 */

	})
	
	/* nav 밑줄 애니메이션 및 스크롤 이동 */
	/* 밑줄 */
	const navUl = document.querySelector("nav > ul");
	navUl.addEventListener("mouseover",function(){
	    for(let i = 0; i < navLi.length; i++){
	        /* 밑줄 */
	        navLi[i].addEventListener("mouseover",function(){
	            this.style.borderBottom ="2px solid #F5F765";
	        })
	        navLi[i].addEventListener("mouseout",function(){
	            this.style.borderBottom ="";
	        })
	    }
	
	        
	})
})