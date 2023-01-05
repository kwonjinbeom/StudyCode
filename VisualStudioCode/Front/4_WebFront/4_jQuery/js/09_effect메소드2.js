$(function(){
    $('div').on("click", function(){
        console.log($(this).next("p").css("display"));
        const arr = document.getElementsByTagName("div");

        if( $(this).next("p").css("display") == "none" ){
            $(this).siblings("p.contents").slideUp();
            $(this).next().slideDown();
            
        }else{
            $(this).next().slideUp();
            
        }
    });  
});