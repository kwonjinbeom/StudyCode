/* 스크롤 상단 시 숨기기 및 편하게 스크롤 */
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
    /* 편하게 스크롤 */
    let aboutMe = document.getElementById("aboutMe").offsetTop;
    let skills = document.getElementById("skills").offsetTop;
    let projects = document.getElementById("projects").offsetTop;
    let career = document.getElementById("career").offsetTop;
 
    if((scrollHeight >= 200) && (scrollHeight <= 400)){
        window.scrollTo({left:0, top:aboutMe, behavior:"smooth"});
    }else if((scrollHeight >= aboutMe + 200) && (scrollHeight <= aboutMe + 400)){
        window.scrollTo({left:0, top:skills, behavior:"smooth"});
    }else if((scrollHeight > skills + 200) && (scrollHeight <= skills + 400)){
        window.scrollTo({left:0, top:projects, behavior:"smooth"});
    }else if((scrollHeight > projects + 200) && (scrollHeight <= projects + 400)){
        window.scrollTo({left:0, top:career, behavior:"smooth"});
    }

})
/* nav 밑줄 애니메이션 및 스크롤 이동 */
/* 밑줄 */
const navUl = document.querySelector("nav > ul");
const navLi = document.querySelectorAll("nav > ul > li");
navUl.addEventListener("mouseover",function(){
    console.log(scrollCrash);
    
    let aboutMe = document.getElementById("aboutMe").offsetTop;
    let skills = document.getElementById("skills").offsetTop;
    let projects = document.getElementById("projects").offsetTop;
    let career = document.getElementById("career").offsetTop;
    for(let i = 0; i < navLi.length; i++){
        /* 밑줄 */
        navLi[i].addEventListener("mouseover",function(){
            this.style.borderBottom ="2px solid #F5F765";
        })
        navLi[i].addEventListener("mouseout",function(){
            this.style.borderBottom ="";
        })
    }
    /* 스크롤 이동 */
    navLi[0].addEventListener("click",function(){
            window.scrollTo({left:0, top:0, behavior:"smooth"});
    })
    navLi[1].addEventListener("click",function(){
            window.scrollTo({left:0, top:aboutMe, behavior:"smooth"});
    })
    navLi[2].addEventListener("click",function(){
            window.scrollTo({left:0, top:skills, behavior:"smooth"});
    })
    navLi[3].addEventListener("click",function(){
            window.scrollTo({left:0, top:projects, behavior:"smooth"});
    })
    navLi[4].addEventListener("click",function(){
            window.scrollTo({left:0, top:career, behavior:"smooth"});
    })
})
