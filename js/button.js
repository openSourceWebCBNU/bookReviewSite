const gotoBtn = document.querySelector(".goto_btn");

function linkDelay(){
    setTimeout(function(){
        location.href = "mydocs.html";
    }, 2000);
}

gotoBtn.addEventListener('click', function(){
    gotoBtn.classList.add("click_animation");
});