const leftBtn = document.querySelector(".left_btn");
const rightBtn = document.querySelector(".right_btn");
const bookList = document.querySelector(".book_list");

const MAXCOUNT = 3;
var count = 0;

leftBtn.addEventListener("click",function(){
    if(count==0){
        count = MAXCOUNT;
    }
    else{
        count = count - 1;
    }
    bookList.scrollTo({
        left: 780 * count,
        behavior: 'smooth'
    });
});
rightBtn.addEventListener("click",function(){
    if(count==MAXCOUNT){
        count = 0;
    }
    else{
        count = count + 1;
    }
    bookList.scrollTo({
        left: 780 * count,
        behavior: 'smooth'
    });
});