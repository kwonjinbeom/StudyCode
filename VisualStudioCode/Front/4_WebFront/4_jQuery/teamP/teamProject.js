
// 변수 선언 -------------------------------------------------------------------------------------------------------------------

// ID
const id = document.getElementById("inputid"); // 아이디
const idRegExp = /^(^[a-z])[a-zA-Z0-9]{7,14}$/ // 아이디 정규식 : 영어 소문자로 시작하고, 영어 대/소문자, 숫자, 로만 이루어진 8~15 글자 사이 문자열인지 검사

// PW
const pw = document.getElementById("inputpw"); // 비밀번호
const pwCheck = document.getElementById("inputpwCheck"); // 비밀번호 재확인
const pwMsg = document.getElementById("pwMsg"); // 비밀번호 메세지
const pwCheckMsg = document.getElementById("pwCheckMsg"); // 비밀번호 재확인 메세지
const pwRegExp = /^[a-z][a-zA-Z0-9\!\#]{5,14}$/ // 비밀번호 정규식 : 영어 소문자로 시작하고, 영어 대/소문자, 숫자, !, # 로만 이루어진 6~15 글자 사이 문자열인지 검사

// Name
const name = document.getElementById("inputname"); // 이름
const nameMsg = document.getElementById("nameMessage"); // 이름 메세지

// Email
const emailRegExp = /^[a-zA-Z0-9]{1,20}$/
const email = document.getElementById("inputemail") // 이메일
const emailmsg = document.getElementById("emailmsg"); // 이메일 메세지

// Gender
const gender = document.getElementsByName("gender"); // 성별

// Date
const date = document.getElementById("date");

// 이용약관
const checkbox  = document.getElementById("checkbox");

// 변수 선언 끝 -------------------------------------------------------------------------------------------------------------------

// ID
id.addEventListener("keyup", function(){
    
    if(idRegExp.test(id.value)){id.style.backgroundColor = "#CEFBC9";} // 만약 id가 정규식과 일치하면 초록배경
    else if(id.value.length == 0) {id.style.backgroundColor = "white";} // 만약 id가 비어있으면 하얀배경
    else{id.style.background = "#FFD8D8";} // 만약 id가 정규식과 일치하지 않는다면 빨간배경
});

// PW
pw.addEventListener("keyup", function(){
    if(!pwRegExp.test(this.value)){
        pwMsg.innerHTML = "비밀번호는 영어, 숫자, !, #으로만 구성해주세요.";  // 만약 비밀번호가 정규식과 일치하지 않다면! 불일치 메세지 보여주기
        pwMsg.classList.add("red");}
    else {pwMsg.innerText = " ";} // 일치하면 아무런 메세지도 띄우지 않음
    pwMethod();
});

// PW CHECK (비밀번호 재확인)
pwCheck.addEventListener("keyup", function(){
    if(pw.value.length == 0){                                       // 비밀번호 문자열이 0이라면 비밀번호 우선 입력 유도
        alert("비밀번호를 입력해주세요.");
        pwCheck.value = ""; 
        pw.focus();}
        pwMethod();
});

// PW와 PW CHECK가 공통으로 가지는 기능
function pwMethod(){
    if((pw.value == pwCheck.value) && inputpw.value.length != 0  ){                   // 만약 비밀번호, 비밀번호 재확인이 일치하고 빈값이 아니라면 비밀번호 일치 표시
        pwCheckMsg.innerHTML = "비밀번호 일치";
        pwCheckMsg.classList.add("green");
        pwCheckMsg.classList.remove("red");}
    else{pwCheckMsg.innerHTML = "비밀번호 불일치"
        pwCheckMsg.classList.add("red");
        pwCheckMsg.classList.remove("green");}

    if(pw.value.length == 0 && pwCheck.value.length == 0){pwCheckMsg.innerHTML = "";} // 비밀번호, 비밀번호 재확인 둘다 공백이라면 빈칸.
};

// Name
name.addEventListener("input", function(){ // 이름은 공백일때만 "span 내부에 "이름 형식이 유효하지 않습니다." 띄어주기
    if(this.value.length == 0){
        nameMsg.innerText = "이름을 입력해주세요."
        nameMsg.classList.remove("green");
        nameMsg.classList.add("red");
    }else{
        nameMsg.innerText = "입력되었습니다."
        nameMsg.classList.remove("red");
        nameMsg.classList.add("green");
    }
});

// Email
email.addEventListener("input", function(){
    if(!emailRegExp.test(this.value)){
            this.style.backgroundColor ="#FFD8D8";  
            emailmsg.innerHTML = "이메일 형식이 아닙니다." 
            emailmsg.classList.remove("green");
            emailmsg.classList.add("red");          
            return       
    } else {         
        this.style.backgroundColor ="#CEFBC9";   
        emailmsg.innerText = "이메일 형식 일치"
        emailmsg.classList.remove("red");
        emailmsg.classList.add("green");
    }
});

// 제출 시 조건
function sub(){
    if(id.value.length == 0) {      
        alert("아이디를 입력해주세요.");
        id.focus();
        return false;}
    else if(!(idRegExp.test(id.value))){
        alert("아이디 가입조건이 틀렸습니다.");
        id.focus();
        return false;}
    else if(!((inputpw.value.length != 0))){
        alert("비밀번호를 입력해주세요.");
        return false;}
    else if(!(pwRegExp.test(pw.value))){
        alert("비밀번호 가입조건이 틀렸습니다.");
        return false;}
    else if(!(pw.value == pwCheck.value)){
        alert("비밀번호 재확인이 일치하지 않습니다.");
        return false;}
    else if(name.value.length == 0) {
        alert("이름을 입력해주세요.");
        name.focus();
        return false;}
    else if(!(gender[0].checked || gender[1].checked)){
        alert("성별을 선택해주세요.");
        return false;}
    else if(!(checkbox.checked)){
        alert("이용약관 동의를 선택해주세요.");
        return false;}
    else{
        return true;}

};
