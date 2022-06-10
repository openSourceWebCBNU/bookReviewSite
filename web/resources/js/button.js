const gotoBtn = document.querySelector(".goto_btn");
const myReviewText = document.querySelector(".my_reviews_h1");

function linkDelay(){
    setTimeout(function(){
        location.href = "portfolio.jsp";
    }, 2000);

    gotoBtn.classList.add("color_gray");
    myReviewText.classList.add("color_gray");
}

gotoBtn.addEventListener('click', function(){
    gotoBtn.classList.add("click_animation");
});