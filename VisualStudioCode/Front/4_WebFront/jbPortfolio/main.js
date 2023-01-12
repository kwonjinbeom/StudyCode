/* 메뉴 선택 시 스크롤 이동 */
let home = document.getElementById("home").offsetTop;
let Me = document.getElementById("Me").offsetTop;
let skills = document.getElementById("skills").offsetTop;
let projects = document.getElementById("projects").offsetTop;
let career = document.getElementById("career").offsetTop;
let navClickArray = [home, Me, skills, projects, career];
const navLi = document.querySelectorAll("nav > ul > li"); /* nav > ul > li query */
navLi[0].addEventListener("click",function(){
    
    window.scrollTo({left:0, top:navClickArray[0], behavior:"smooth"})
    for(let i = 0; i < navLi.length; i++){
        navLi[i].style.color = "white"
    }
    this.style.color = "yellow"
})

navLi[1].addEventListener("click",function(){
    window.scrollTo({left:0, top:navClickArray[1], behavior:"smooth"});
    for(let i = 0; i < navLi.length; i++){
        navLi[i].style.color = "black"
    }
    this.style.color = "yellow"
})
navLi[2].addEventListener("click",function(){
    window.scrollTo({left:0, top:navClickArray[2], behavior:"smooth"})
    for(let i = 0; i < navLi.length; i++){
        navLi[i].style.color = "black"
    }
    this.style.color = "yellow"
})
navLi[3].addEventListener("click",function(){
    window.scrollTo({left:0, top:navClickArray[3], behavior:"smooth"})
    for(let i = 0; i < navLi.length; i++){
        navLi[i].style.color = "black"
    }
    this.style.color = "yellow"
    
})
navLi[4].addEventListener("click",function(){
    window.scrollTo({left:0, top:navClickArray[4], behavior:"smooth"})
    for(let i = 0; i < navLi.length; i++){
        navLi[i].style.color = "black"
    }
    this.style.color = "yellow"
})
/* 메뉴 선택 시 스크롤 이동 끝*/

/* 스크롤 상단 시 스크롤 숨기기 및 편하게 스크롤 */
const body = document.querySelector("body"); /* body query */
body.classList.add('scroll_hidden');
body.classList.add('scroll_hidden::-webkit-scrollbar');
window.addEventListener("scroll", (event) => {
    let scrollHeight = this.scrollY;
    if(scrollHeight != 0){
        body.classList.remove('scroll_hidden');
        body.classList.remove('scroll_hidden::-webkit-scrollbar');
    }else{
        body.classList.add('scroll_hidden');
        body.classList.add('scroll_hidden::-webkit-scrollbar');
    }
    /* 편하게 스크롤 (잘안돼서(메뉴 선택시 스크롤과 충돌이남) 보류*/
    let Me = document.getElementById("Me").offsetTop;
    let skills = document.getElementById("skills").offsetTop;
    let projects = document.getElementById("projects").offsetTop;
    let career = document.getElementById("career").offsetTop;
    
    // if(scrollCrash == true){
    //     console.log(scrollCrash);
    //     if((scrollHeight >= 200) && (scrollHeight <= 400)){
    //         window.scrollTo({left:0, top:Me, behavior:"smooth"});
    //     }else if((scrollHeight >= Me + 200) && (scrollHeight <= Me + 400)){
    //         window.scrollTo({left:0, top:skills, behavior:"smooth"});
    //     }else if((scrollHeight > skills + 200) && (scrollHeight <= skills + 400)){
    //         window.scrollTo({left:0, top:projects, behavior:"smooth"});
    //     }else if((scrollHeight > projects + 200) && (scrollHeight <= projects + 400)){
    //         window.scrollTo({left:0, top:career, behavior:"smooth"});
    //     }
    // }

})
/* 스크롤 상단 시 스크롤 숨기기 및 편하게 스크롤 끝 */

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
