document.getElementById("add").addEventListener("click",function(){
    
    // div 요소 생성
    const div = document.createElement("div");

    // div에 row 클래스 추가
    div.classList.add("row");
    
    
    // --------------------------------------------------------

    // input 요소 생성
    const input = document.createElement("input");

    input.classList.add("in");
    
    // input에 "type" 속성,"number" 속성 값 추가(type="number")
    
    // - 요소.setAttribute("속성", "속성값") : 요소에 속성/속성값 추가
    input.setAttribute("type","number");
    // --------------------------------------------------------

    // span 요소 생성
    const span = document.createElement("span");
    
    span.classList.add("remove");
    
    // span의 내용으로 "X" 추가
    span.innerHTML += "X";

    // span이 클릭 되었을 때에 대한 이벤트 동작 추가
    
    // 요소.parentElemt : 부모요소
    // 요소.remove() : 요소 제거
    // 부모(.row) 제거

    span.addEventListener("click",function(){
        span.parentElement.remove();
    })

    // --------------------------------------------------------
    
    const row = document.getElementsByClassName("row");
    const container = document.getElementById("container");
    // container.append(row);
    // container.innerHTML += row;
    div.append(input);
    div.append(span);

    // #container에 div를 마지막 자식으로 추가
    container.append(div);
})

document.getElementById("cal").addEventListener("click",function(){
    const inputList = document.getElementsByClassName("in");
    let sum = 0;
    for(let i of inputList){

        // Number("") == 0 // 빈칸은 0으로 변환되기 때문에 신경쓰지 말자

        // sum에 입력값 누적
        // -> input에 작성된 값은 모두 String -> 숫자 변환 Number() 필요
        sum += Number(i.value);
    }

    alert("합계 : " +  sum)
    
})