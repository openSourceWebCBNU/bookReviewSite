const comment = document.querySelector(".prestigy-comment");
const bookName = document.querySelector(".book-name");
const bookImg = document.querySelector(".book-img");

const quotes =[
{
    quote : "\" 최고의 시절이자 최악의 시절, 지혜의 시대이자 어리석음의 시대였다. 믿음의 세기이자 의심의 세기였으며, 빛의 계절이자 어둠의 계절이었다. \"",
    book : "『두 도시 이야기』 중에서",
    img : "img/두도시.jpg"
},
{
    quote : "\" 가난한 내가, 아름다운 나타샤를 사랑해서, 오늘밤은 푹푹 눈이 내린다 \"",
    book : "『나와 나타샤와 흰 당나귀』 중에서",
    img : "img/나와_나타샤.jpg"
},
{
    quote : "\" 국경의 긴 터널을 빠져나오자, 눈의 고장이었다. 밤의 밑바닥이 하얘졌다. 신호소에 기차가 멈춰섰다. \"",
    book : "『설국』 중에서",
    img : "img/설국.jpg"
},
{
    quote : "\" 아무래도 X됐다. 그것이 내가 심사숙고 끝에 내린 결론이다. 나는 X됐다. \"",
    book : "『마션』 중에서",
    img : "img/마션.jpg"
},
{
    quote : "\" 이 땅의 먼지에 취하여 긴 세월을 돌아다녔다. 온갖 것을 보고 온갖 것을 만졌다. 발은 지저분 한 것들을 밟았지만 눈은 언제나 아름다운 것을 좇았다. \"",
    book : "『피를 마시는 새』 중에서",
    img : "img/피를.png"
},
{
    quote : "\" 술이 뭔데요? \" \t \" 차가운 불입니다. 거기에 달을 담아 마시지요. \"",
    book : "『눈물을 마시는 새』 중에서",
    img : "img/눈물을.png"
},
{
    quote : "\" 말과 글에는 나름의 따뜻합과 차가움이 있다. \"",
    book : "『언어의 온도』 중에서",
    img : "img/언어의.png"
},
{
    quote : "\" 네 사랑이 무사하기를. 내 사랑도 무사하니까. 세상의 모든 사랑이 무사하기를. \"",
    book : "『사서함 110호의 우편물』 중에서",
    img : "img/사서함.png"
}
]

function reloadQute(){
    var index = Math.floor(Math.random() * quotes.length);
    var presentQuote = quotes[index];
    comment.innerHTML = presentQuote.quote;
    bookName.innerHTML = presentQuote.book;
    bookImg.src = presentQuote.img;
}

reloadQute();
setInterval(reloadQute, 7000);
