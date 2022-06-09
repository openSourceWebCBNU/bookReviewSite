<%--
  DOKDOKS 대문
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>도서 다이어리</title>
  <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body class="index-body">
<div id="searchLayer" class="display-none">
  <div class="x-container">
    <i class="fa-solid fa-x x-btn"></i>
  </div>
  <form action="">
    <div class="input-container">
      <input class="input" type="text" placeholder="도서명">
      <input class="input" type="text" placeholder="출판사">
      <input class="input" type="text" placeholder="저자">
      <button class="btn" type="submit">
        <i class="fa-solid fa-magnifying-glass"></i>
      </button>
    </div>
  </form>
</div>
<header class="header">
  <div class="header-content">
    <a href="/">
      <div class="logo">
        <h1>독독스</h1>
        <h2>세상의 모든 독후감 Documents</h2>
      </div>
    </a>

    <div>
      <h3>글쓰기</h3>
      <a href="write.jsp">클릭</a>
    </div>

    <div class="side-menu">
      <div class="search-btn">
        <i class="fa-solid fa-magnifying-glass"></i>
        <h3>독후감 검색</h3>
      </div>
      <a href="login.jsp" class="user-page-btn">
        <i class="fa-solid fa-user"></i>
      </a>
    </div>
  </div>
</header>

<div class="instead_header"></div>

<main class="index_main">
  <div class="category">
    <div class="category-btn popularity select-border">
      <i class="fa-solid fa-star"></i>
      <h3>인기순</h3>
    </div>
    <div class="category-btn development">
      <i class="fa-solid fa-graduation-cap"></i>
      <h3>자기계발</h3>
    </div>
    <div class="category-btn poem">
      <i class="fa-solid fa-scroll"></i>
      <h3>시</h3>
    </div>
    <div class="category-btn essay">
      <i class="fa-solid fa-pen-nib"></i>
      <h3>에세이</h3>
    </div>
    <div class="category-btn economy">
      <i class="fa-solid fa-sack-dollar"></i>
      <h3>경재</h3>
    </div>
    <div class="category-btn travel">
      <i class="fa-solid fa-plane"></i>
      <h3>여행</h3>
    </div>
    <div class="category-btn philosophy">
      <i class="fa-solid fa-brain"></i>
      <h3>철학</h3>
    </div>
    <div class="category-btn natural-science">
      <i class="fa-brands fa-envira"></i>
      <h3>자연과학</h3>
    </div>
    <div class="category-btn technology-science">
      <i class="fa-solid fa-microchip"></i>
      <h3>기술과학</h3>
    </div>
    <div class="category-btn literature">
      <i class="fa-solid fa-book"></i>
      <h3>문학</h3>
    </div>
    <div class="category-btn fantasy">
      <i class="fa-solid fa-wand-sparkles"></i>
      <h3>판타지</h3>
    </div>
    <div class="category-btn mystery">
      <i class="fa-solid fa-question"></i>
      <h3>추리</h3>
    </div>
    <div class="category-btn romance">
      <i class="fa-solid fa-heart"></i>
      <h3>로맨스</h3>
    </div>
    <div class="category-btn history">
      <i class="fa-solid fa-landmark"></i>
      <h3>역사</h3>
    </div>
  </div>
  <div class="book_container">

  </div>
  <div class="book_recommend"></div>
</main>

<footer class="index_footer"></footer>

<a class="goto_btn" href="javascript:linkDelay()">
  <div ></div>
</a>
</body>
<script src="https://kit.fontawesome.com/4029a3b361.js" crossorigin="anonymous"></script>
<script src="/resources/js/index.js"></script>
<script src="/resources/js/button.js"></script>
<script src="/resources/js/searchLayer.js"></script>
</html>
