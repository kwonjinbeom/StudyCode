$("#btn1").on("click",function(){
    const colorVal = $("#i1").val();
    console.log(colorVal);
    $("#boxx").css("backgroundColor", colorVal);
})

$("#btn2").on("click",function(){
    const arr = document.getElementsByClassName("i2");
    for(let i=0; i < arr.length; i++){
        $("#box"+i).css("backgroundColor", $(arr[i]).val());
    }
})