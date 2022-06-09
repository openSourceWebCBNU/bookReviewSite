const leftBtn = document.querySelector(".left_btn");
const rightBtn = document.querySelector(".right_btn");
const bookContainer = document.querySelector(".book_container");

const MaxPage = 10;
var pageNum = 5;
var nowPostion = 0;

leftBtn.addEventListener("click",function(){
    nowPostion = bookContainer.offset().left;
    bookContainer.offset({left: nowPostion - 320});
});
rightBtn.addEventListener("click",function(){
    nowPostion = bookContainer.offset().left; 
    bookContainer.offset({left: nowPostion + 320});
});