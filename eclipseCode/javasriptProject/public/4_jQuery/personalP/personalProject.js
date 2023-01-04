/* 사이드바 여닫을 때 */
function sidebar(){
    const aside = document.querySelector("aside");
    const asidetransValue = getComputedStyle(aside).transform;
    let transValue = asidetransValue.match(/matrix.*\((.+)\)/)[1].split(", ")[4];

    const body = document.getElementById("body");
    
    if(transValue == -400){
        body.style.overflow = "hidden";
        aside.animate(
            {transform:['translateX(-400px)', 'translateX(0px)']},
            {duration:500, fill:'forwards', easing:'ease'}
        )
    }else if(transValue == 0){
        body.style.overflow = "auto";
        aside.animate(
            {transform:['translateX(0px)', 'translateX(-400px)']},
            {duration:500, fill:'forwards', easing:'ease'}
        )
    }
    
}
/* logo 이벤트 */
function logoEvent(){
    const logoEvent = document.querySelector("#logoEvent");
    logoEvent.style.display = "block";
    const logoEventtransValue = getComputedStyle(logoEvent).transform;
    let transValue = logoEventtransValue.match(/matrix.*\((.+)\)/)[1].split(", ")[5];
    
    if(transValue == 10){
        setTimeout(function(){
            logoEvent.animate(
            {transform:['translateY(-500px)', 'translateY(10px)']},
            {duration:800, fill:'forwards', easing:'ease'}
        )},800);
        logoEvent.animate(
            {transform:['translateY(10px)', 'translateY(-500px)']},
            {duration:800, fill:'forwards', easing:'ease'}
        )
    }
    setTimeout(function(){
        if (logoEvent.style.display == "block") {
            logoEvent.style.display = "none";
        }
    },1600);
    
}

/* current 밑줄 기능 */
const ulArr = document.querySelector("#navList > ul");
const liArr = document.querySelectorAll("#navList > ul > li");
liArr[0].classList.add("currentApply");
ulArr.addEventListener("click",function(){
    for(item of liArr){
        item.addEventListener("click",function(){
            for(i of liArr){i.classList.remove("currentApply");}
            this.classList.add("currentApply");
        })
    }
});


/* 곧 만나요 쉐어기능 */
const shareArr = document.querySelectorAll(".shareBtn");
const share = document.querySelector(".shareImg");
function shareF(){
    if(share.style.display == "none"){
        share.style.display = "block";
    }else{
        share.style.display = "none";
    }
}
shareArr[0].addEventListener("click",function(){shareF();});
shareArr[1].addEventListener("click",function(){shareF();});

/* 곧 만나요 알림신청기능 */
const alarmArr = document.querySelectorAll("#alarmBtn");
const alarmImg = document.querySelectorAll("#alarm > img");

alarmArr[0].addEventListener("click",function(){
    setTimeout(function(){
        alarmImg[0].style.width = "18px";
        alarmImg[0].style.height = "18px";
        alarmImg[0].src = "image/commingSoon_alarm_logo.jpg";
        
        
    },400);
    alarmImg[0].src = "image/commingSoon_alarm_logo2.jpg";
    alarmImg[0].style.width = "25px";
    alarmImg[0].style.height = "25px";
    
    
    

    
    const num = document.getElementById("commingNum1");
    const numSplit = num.innerHTML.split(",");
    const toStringSplit =  String(Number(numSplit[0]+numSplit[1]) + 1);
    num.innerHTML = toStringSplit[0]+","+toStringSplit.substring(1,);
});
alarmArr[1].addEventListener("click",function(){
    setTimeout(function(){
        alarmImg[1].style.width = "18px";
        alarmImg[1].style.height = "18px";
        alarmImg[1].src = "image/commingSoon_alarm_logo.jpg";
        
    },400);
    alarmImg[1].src = "image/commingSoon_alarm_logo2.jpg";
    alarmImg[1].style.width = "25px";
    alarmImg[1].style.height = "25px";
    const num = document.getElementById("commingNum2");
    num.innerHTML = Number(num.innerHTML) + 1;
});

/* body 하트 */
document.getElementById("body").addEventListener("click",function(){
    const h1 = document.getElementById("heart1");
    const h2 = document.getElementById("heart2");
    const h3 = document.getElementById("heart3");
    const value = Math.floor(Math.random()*3);
    let plusValue = [];
    plusValue[0] = h1;
    plusValue[1] = h2;
    plusValue[2] = h3;
    if(plusValue[value].style.display == ""){
        setTimeout(function(){
            plusValue[value].style.display = "";
        },400);
        plusValue[value].style.display = "block";
    }else{
    }
    
    const randomValue1 = Math.floor(Math.random()*1000);
    const randomValue2 = Math.floor(Math.random()*2000);
    
    plusValue[value].style.top = randomValue1 + "px";
    plusValue[value].style.left = randomValue2 + "px";
    
    
});