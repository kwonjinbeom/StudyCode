const navUl = document.querySelector("nav > ul");
const navLi = document.querySelectorAll("nav > ul > li");
navUl.addEventListener("mouseover",function(){
    for(let i = 0; i < navLi.length; i++){
        navLi[i].addEventListener("mouseover",function(){
            this.style.borderBottom ="2px solid #F5F765";
        })
        navLi[i].addEventListener("mouseout",function(){
            this.style.borderBottom ="2px solid #7FC4F8";
        })
    }
})