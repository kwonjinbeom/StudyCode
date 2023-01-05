/* 아이디 : 값이 변했을 때 
영어 소문자로 시작하고, 
영어 대/소문자, 숫자, - , _ 로만 이루어진 6~14 글자 사이 문자열인지 검사
아이디 정규표현식 : (각자 작성) ^(^[a-z])(\w|\d|\-|\_){5,13}$

- 형식이 일치할 경우
입력창의 배경색을 springgreen 으로 변경

- 형식이 일치하지 않은 경우
입력창의 배경색을 red, 글자색을 white 로 변경*/

// ------------------------------------------------------------------

/* 비밀번호, 비밀번호 확인 : 키보드가 올라올 때 
"비밀번호" 를 미입력한 상태에서 "비밀번호 확인"을 작성할 경우
"비밀번호 확인"에 작성된 내용을 모두 삭제하고
'비밀번호를 입력해주세요' 경고창 출력 후
focus 를 "비밀번호" 입력창으로 이동
*/

// ------------------------------------------------------------------

/*
- 비밀번호가 일치할 경우
"비밀번호" 입력창 오른쪽에 "비밀번호 일치" 글자를 초록색으로 출력.

- 비밀번호가 일치하지 않을 경우
"비밀번호" 입력창 오른쪽에 "비밀번호가 불일치" 글자를 빨간색으로 출력

- 비밀번호가 작성되지 않은경우 오른쪽에 출력되는 문구 삭제

*/

// -------------------------------------------------------------

/* 이름 : 값이 변화했을 때 
한글 2~5 글자 사이 문자열인지 검사.
이름 정규표현식 : /^[가-힣]{2,5}$/
- 형식이 일치할 경우
"이름" 입력창 오른쪽에 "정상입력" 글자를 초록색으로 출력.
- 형식이 일치할 경우
"이름" 입력창 오른쪽에 "한글만 입력하세요" 글자를 빨간색으로 출력.
*/

// -----------------------------------------------------------

/* 회원가입 버튼 클릭 시 : validate() 함수를 호출하여 
성별이 선택 되었는지, 전화번호가 형식에 알맞게 작성되었는지 검사 */

function validate(){
    const gender = document.getElementsByName("gender");
    const regExp = /^[0][0-9]{1,2}-[0-9]{3,4}-[0-9]{4}/;
    const val = document.getElementById("inputTel").value;

    for(let i = 0; i < gender.length; i++){
        if(gender[0].checked | gender[1].checked ){
            if(regExp.test(val)){
                return true;
            }else{
                alert("전화번호의 형식이 올바르지 않습니다");
                return false;
            }
        }else{

            alert("성별을 선택해주세요.")
            return false;
        }
    }

    /*- 성별이 선택되지 않은 경우 
    "성별을 선택해주세요." 경고창(==대화상자) 출력 후
    submit 기본 이벤트를 제거하여 회원가입이 진행되지 않게 함.*/

    
    /*
    - 전화번호 형식이 올바르지 않을 경우 
    "전화번호의 형식이 올바르지 않습니다" 경고창(==대화상자) 출력 후
    submit 기본 이벤트를 제거하여 회원가입이 진행되지 않게 함.
    전화번호 정규 표현식 : /^[0][0-9]{1,2}-[0-9]{3,4}-[0-9]{4}/
    */

}

// 아이디
document.getElementById("inputId").addEventListener("keyup", function(){
    
    const regExp = /^(^[a-z])(\w|\d|\-|\_){5,13}$/;
    const val = this.value;
    const ele = document.getElementById("inputId");

    // 정규식 검사
    if(regExp.test(val)){
        ele.style.backgroundColor = "springgreen";

    }else{
        ele.style.backgroundColor = "red";
        ele.style.color = "white";
    }
    // 빈칸인지 검사
    if(val == ""){
        ele.innerHTML = ""
    }

})

// 비밀번호
document.getElementById("inputPw").addEventListener("keyup", function(){
    const pw = document.getElementById("inputPw");
    const pwCheck = document.getElementById("inputPwConfirm");

    if(pw.value.length == 0 && pwCheck.value.length==0){
        document.getElementById("pwMessage").innerHTML = "";
    }

})

// 비밀번호, 비밀번호 확인 연동
document.getElementById("inputPwConfirm").addEventListener("keyup", function(){
    const pw = document.getElementById("inputPw");
    const pwCheck = document.getElementById("inputPwConfirm");
    const ele = document.getElementById("pwMessage");
    if(pw.value == ""){
        pwCheck.value = "";
        alert("비밀번호를 입력해주세요.")
        pw.focus();
    }
    
    // 정규식 검사
    if(pw.value == pwCheck.value){
        ele.classList.remove("error");
        ele.classList.add("confirm");
        ele.innerHTML = "비밀번호 일치"
    }else{
        ele.classList.add("error");
        ele.innerHTML = "비밀번호가 불일치"
    }
    // 빈칸인지 검사
    if(val == ""){
        ele.innerHTML = ""
    }
})

// 이름 확인
document.getElementById("inputName").addEventListener("keyup", function(){
    
    const regExp = /^[가-힣]{2,5}$/;
    const val = this.value;
    const ele = document.getElementById("nameMessage");

    // 정규식 검사
    if(regExp.test(val)){
        ele.classList.remove("error");
        ele.classList.add("confirm");
        ele.innerHTML = "정상입력"
    }else{
        ele.classList.add("error");
        ele.innerHTML = "한글만 입력하세요"
    }
    // 빈칸인지 검사
    if(val == ""){
        ele.innerHTML = ""
    }

})

document.getElementById("reset").addEventListener("click",function(){
    // document.getElementById("inputId").value = ""
    // ele.style.backgroundColor = "white";
    // document.getElementById("inputPw").value = ""
    
    // 위에 코드가 밑에 내용이 안지워지게 방해함 이유는 잘모르겠음.
    document.getElementById("pwMessage").innerText = "";
    document.getElementById("nameMessage").innerText = "";
    document.getElementById("pwMessage").classList = "";
    document.getElementById("nameMessage").classList = "";
    
    // document.getElementById("inputName").value = ""
    // document.getElementById("inputTel").value = ""
    // document.getElementById("inputEmail").value = ""

    // const gender = document.getElementsByName("gender");


    // for(let i = 0; i < gender.length; i++){
    //     gender[i].checked.value = false;
    // }
    
})

// 