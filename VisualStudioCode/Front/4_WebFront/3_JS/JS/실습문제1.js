// 전체선택 버튼
function selectAll(){
    const allbox = document.getElementById("all");
    const hobbyList = document.getElementsByName("hooby");
    // console.log(allbox.checked)
    // if (allbox.checked){
    //     for(let i=0; i < hobbyList.length; i++){
    //         hobbyList[i].checked = true;
    //     }
    // }else{
    //     for(let i=0; i < hobbyList.length; i++){
    //         hobbyList[i].checked = false;
    //     }
    // }
    for(let i=0; i < hobbyList.length; i++){
        hobbyList[i].checked = allbox.checked;
    }
    // hobbyList.forEach((a)=>{a.checked = allbox.checked;});
}


// 카테고리 선택 버튼
function selectCategory(){
    const hobbyList = document.getElementsByName("hooby");

    let str = "";

    for(let i=0; i < hobbyList.length; i++){
        
        if(hobbyList[i].checked){
            str += hobbyList[i].value + " ";
        }
    }
    document.getElementById("result").innerHTML = str ;
}