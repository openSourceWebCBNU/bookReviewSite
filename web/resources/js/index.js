const popularity = document.querySelector(".popularity");
const development = document.querySelector(".development");
const poem = document.querySelector(".poem");
const essay = document.querySelector(".essay");
const economy = document.querySelector(".economy");
const travel = document.querySelector(".travel");
const philosophy = document.querySelector(".philosophy");
const naturalScience = document.querySelector(".natural-science");
const technologyScience = document.querySelector(".technology-science");
const literature = document.querySelector(".literature");
const fantasy = document.querySelector(".fantasy");
const mystery = document.querySelector(".mystery");
const romance = document.querySelector(".romance");
const history = document.querySelector(".history");

var currentTag = popularity;

// popularity.addEventListener("click", function(){
//     popularity.classList.add("select-border");
//     development.classList.remove("select-border");
//     poem.classList.remove("select-border");
//     essay.classList.remove("select-border");
//     economy.classList.remove("select-border");
//     travel.classList.remove("select-border");
//     philosophy.classList.remove("select-border");
//     naturalScience.classList.remove("select-border");
//     technologyScience.classList.remove("select-border");
//     literature.classList.remove("select-border");
//     fantasy.classList.remove("select-border");
//     mystery.classList.remove("select-border");
//     romance.classList.remove("select-border");
//     history.classList.remove("select-border");
// });


popularity.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    popularity.classList.add("select-border");
    currentTag = popularity;
});
development.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    development.classList.add("select-border");
    currentTag = development;
});
poem.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    poem.classList.add("select-border");
    currentTag = poem;
});
essay.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    essay.classList.add("select-border");
    currentTag = essay;
});
economy.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    economy.classList.add("select-border");
    currentTag = economy;
});
travel.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    travel.classList.add("select-border");
    currentTag = travel;
});
philosophy.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    philosophy.classList.add("select-border");
    currentTag = philosophy;
});
naturalScience.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    naturalScience.classList.add("select-border");
    currentTag = naturalScience;
});
technologyScience.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    technologyScience.classList.add("select-border");
    currentTag = technologyScience;
});
literature.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    literature.classList.add("select-border");
    currentTag = literature;
});
fantasy.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    fantasy.classList.add("select-border");
    currentTag = fantasy;
});
mystery.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    mystery.classList.add("select-border");
    currentTag = mystery;
});
romance.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    romance.classList.add("select-border");
    currentTag = romance;
});
history.addEventListener("click", function(){
    currentTag.classList.remove("select-border");
    history.classList.add("select-border");
    currentTag = history;
});