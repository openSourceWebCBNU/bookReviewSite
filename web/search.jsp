<%--
    검색
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body class="search-body">
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

        <div></div>

        <div class="side-menu">
            <a href="login.html" class="user-page-btn">
                <i class="fa-solid fa-user"></i>
            </a>
        </div>
    </div>
</header>

<div class="instead_header"></div>

<main class="search_main">
    <div class="search_info_container">
        <div id="searchLayer" class="">
            <form action="">
                <div class="search_input_container">
                    <input class="search_info_input" list="book-options" type="text" placeholder="도서명">
                    <datalist id="book-options">
                        <option value="눈물을 마시는 새" />
                        <option value="피를 마시는 새" />
                        <option value="노르웨이의 숲" />
                        <option value="숨" />
                        <option value="해리포터" />
                        <option value="어린왕자" />
                    </datalist>
                    <button class="search_info_btn" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <div class="search_result_container">
        <div class="search_result_content">
            <a class="search_result_content_ankor" href="">
                <div class="search_result_img_cover">
                    <img class="search_result_img" src="resources/img/노르웨이_c.jpg" alt="">
                </div>
                <div class="search_result_info_container">
                    <h1 class="search_result_title">일본판 막장 드라마</h1>
                    <div class="search_result_oneline_container">
                        <h2 class="search_result_oneline">절친이 죽고 절친의 여자친구와 사귀었는데 그 여자친구도 자살했다.</h2>
                    </div>
                </div>
            </a>
            <div class="search_result_who_container">
                <h1>작성자</h1>
                <!--아래의 한 요소는 read 페이지에서 가져왔다.-->
                <h2 class="sub_info read_name">임종훈</h2>
            </div>
            <div class="search_result_like_container">
                <!--아래의 두 요소는 read 페이지에서 가져왔다.-->
                <div class="like_container">
                    <h2 class="sub_info">추천: </h2>
                    <h2 class="sub_info read_like_num">30</h2>
                </div>
                <div class="read_like_btn">
                    <i class="fa-solid fa-heart"></i>
                    <h3>추천</h3>
                </div>
            </div>
        </div>
        <div class="search_result_content">
            <a class="search_result_content_ankor" href="">
                <div class="search_result_img_cover">
                    <img class="search_result_img" src="resources/img/노르웨이_c.jpg" alt="">
                </div>
                <div class="search_result_info_container">
                    <h1 class="search_result_title">일본판 막장 드라마</h1>
                    <div class="search_result_oneline_container">
                        <h2 class="search_result_oneline">절친이 죽고 절친의 여자친구와 사귀었는데 그 여자친구도 자살했다.</h2>
                    </div>
                </div>
            </a>
            <div class="search_result_who_container">
                <h1>작성자</h1>
                <!--아래의 한 요소는 read 페이지에서 가져왔다.-->
                <h2 class="sub_info read_name">임종훈</h2>
            </div>
            <div class="search_result_like_container">
                <!--아래의 두 요소는 read 페이지에서 가져왔다.-->
                <div class="like_container">
                    <h2 class="sub_info">추천: </h2>
                    <h2 class="sub_info read_like_num">30</h2>
                </div>
                <div class="read_like_btn">
                    <i class="fa-solid fa-heart"></i>
                    <h3>추천</h3>
                </div>
            </div>
        </div>
        <div class="search_result_content">
            <a class="search_result_content_ankor" href="">
                <div class="search_result_img_cover">
                    <img class="search_result_img" src="resources/img/노르웨이_c.jpg" alt="">
                </div>
                <div class="search_result_info_container">
                    <h1 class="search_result_title">일본판 막장 드라마</h1>
                    <div class="search_result_oneline_container">
                        <h2 class="search_result_oneline">절친이 죽고 절친의 여자친구와 사귀었는데 그 여자친구도 자살했다.</h2>
                    </div>
                </div>
            </a>
            <div class="search_result_who_container">
                <h1>작성자</h1>
                <!--아래의 한 요소는 read 페이지에서 가져왔다.-->
                <h2 class="sub_info read_name">임종훈</h2>
            </div>
            <div class="search_result_like_container">
                <!--아래의 두 요소는 read 페이지에서 가져왔다.-->
                <div class="like_container">
                    <h2 class="sub_info">추천: </h2>
                    <h2 class="sub_info read_like_num">30</h2>
                </div>
                <div class="read_like_btn">
                    <i class="fa-solid fa-heart"></i>
                    <h3>추천</h3>
                </div>
            </div>
        </div>
    </div>
</main>
<footer class=""></footer>
</body>
<script src="https://kit.fontawesome.com/4029a3b361.js" crossorigin="anonymous"></script>
<script src="resources/js/like.js"></script>

</html>