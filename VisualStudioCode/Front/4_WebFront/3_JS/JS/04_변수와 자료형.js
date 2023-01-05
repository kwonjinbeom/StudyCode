var str = "JS 코드를 함수 내부가 아닌 JS 파일 또는 script 태그 밑에"
        + "바로 작성하면 HTML 랜더링 시 바로 수행 된다."

// 변수 선언 위치에 따른 구분
var num1 = 10;
num2 = 20;

function test(){
    console.log(num2);

    var num3 = 3; // functio 지역 변수
    num4 = 4;     // 전역 변수

    if(true){ // 무조건 if문 수행
        var num5 = 5; // function 지역 변수
        num6 = 6; // 전역 변수
    }
    console.log("num5 : " + num5);
}
if(true){ // 무조건 if문 수행
    var num5 = 5; // function 지역 변수
    num6 = 6; // 전역 변수
}
test();
// console.log("num3 : " + num3); //error
console.log("num4 : " + num4); //function 종료 후에도 사용할 수 있다.

console.log("num5 : " + num5); //error
// console.log("num6 : " + num6); 

// 자료형 확인
function typeTest(){
    
    const typeBox = document.getElementById("typeBox");

    let temp; // 선언 후 값을 초기화 하지 않음. == undefined
    typeBox.innerHTML = "temp : " + temp;

    // string
    const name = "다나카";

    // typeof 변수명 : 해당 변수의 자료형을 검사하는 연산자
    typeBox.innerHTML += "<br>name : " + name + " / " + typeof name;

    const gender = 'M';
    typeBox.innerHTML += "<br>gender : " + gender + " / " + typeof gender;
    //자바스크립트는 char 자료형이 존재하지 않는다.
    // "", '' 모두 string 리터럴 표기법

    //number
    const age = 20;
    const height = 178.3;

    typeBox.innerHTML += "<br>age : " + age + " / " + typeof age;
    typeBox.innerHTML += "<br>height : " + height + " / " + typeof height;

    // boolean
    const isTrue = true;
    typeBox.innerHTML += "<br>isTrue : " + isTrue + " / " + typeof isTrue;

    // object
    // java ({}사용)
    // int[] arr = {1,2,3,4,5};

    // javascript ([] 사용)
    const arr = [10, 30, 70, 50];
    typeBox.innerHTML += "<br>arr : " + arr + " / " + typeof arr;

    // 작성법은 java와 다르나, 사용법은 동일(index 사용)
    for (let i = 0; i < arr.length; i++) {
        typeBox.innerHTML += "<br>arr[" + i + "] : " + arr[i];
    }

    // 자바스크립트 객체는 K:V (Map 형식)로 작성
    const user = {"id" : "user01", "pw" : "pass01"};
    typeBox.innerHTML += "<br>user : " + user + " / " + typeof user;

    // 객체 내용 출력 방법1
    typeBox.innerHTML += "<br>user.id : " + user.id

    typeBox.innerHTML += "<br>user.pw : " + user.pw

    // 객체 내용 출력 방법2 (객체 전용 for문 for ...in)
    for(let key in user){
        // user 객체의 키(id, pw)를 반복할 때 마다 하나씩 얻어와 key 변수에 저장
        typeBox.innerHTML += "<br>user[key] : " + user[key];
    }
    console.log(user); // 콘솔 출력 시 보기 더 좋음 

    // function (함수도 자료형이다)
    // 1) 변수명 == 함수명
    const sumFn = function 함수명(n1, n2){ // 익명 함수
        return n1 + n2;
    }

    // 함수명만 작성한 경우 -> 함수에 작성된 코드가 출력됨
    typeBox.innerHTML += "<br>sumFn : " + sumFn + " / " + typeof sumFn;
    
    // 함수명() 괄호를 포함해서 작성하는 경우 -> 함수 호출(수행)
    typeBox.innerHTML += "<br>sumFn(10, 20) : " + sumFn(10, 20);

    typeBox.innerHTML += "<br>tempFn(30, sumFn) : " + tempFn(30, sumFn);
} 

function tempFn(n3, fn){
    return n3 + fn(10, 20);
}