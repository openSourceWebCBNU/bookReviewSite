const openBtn = document.querySelector(".search-btn");
const closeBtn = document.querySelector(".x-btn");
const searchLayer = document.querySelector("#searchLayer");

openBtn.addEventListener("click", function(){
    searchLayer.classList.add("search-layer");
    searchLayer.classList.remove("display-none");
});

closeBtn.addEventListener("click", function(){
    searchLayer.classList.add("display-none");
    searchLayer.classList.remove("search-layer");
});