<%--
  게시물 보기 페이지
--%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
    <%
        String user_id = null;
        if(session.getAttribute("user_id") != null) {
            user_id = (String)session.getAttribute("user_id");
        }

        int post_id = 0;
        post_id = Integer.parseInt(request.getParameter("post_id"));
        Board board = new BoardDAO().getBoard(post_id);

        if(board.getAvaliable() == 0) { %>
            <script>
                alert("삭제된 게시물입니다.");
                history.back();
            </script>
    <%
        }
    %>
    <header class="header-post">
        <div class="header-content-post">
            <a href="index.jsp">
                <div class="logo">
                    <h1>독독스</h1>
                </div>
            </a>
        </div>
    </header>
    <div class="post_instead_header"></div>

    <%
        String category = null;

        if(board.getCategory().equals("popularity")) {
            category = "인기순";
        }
        else if(board.getCategory().equals("development")) {
            category = "자기계발";
        }
        else if(board.getCategory().equals("poem")) {
            category = "시";
        }
        else if(board.getCategory().equals("essay")) {
            category = "에세이";
        }
        else if(board.getCategory().equals("economy")) {
            category = "경제";
        }
        else if(board.getCategory().equals("travel")) {
            category = "여행";
        }
        else if(board.getCategory().equals("philosophy")) {
            category = "철학";
        }
        else if(board.getCategory().equals("natural")) {
            category = "자연과학";
        }
        else if(board.getCategory().equals("technology")) {
            category = "기술과학";
        }
        else if(board.getCategory().equals("literature")) {
            category = "문학";
        }
        else if(board.getCategory().equals("fantasy")) {
            category = "판타지";
        }
        else if(board.getCategory().equals("mystery")) {
            category = "추리";
        }
        else if(board.getCategory().equals("romance")) {
            category = "로맨스";
        }
        else if(board.getCategory().equals("history")) {
            category = "역사";
       }
    %>

    <main class="read_main">
        <div class="line"></div>
        <div class="read_post_title_container">
            <h1 class="read_post_title"><%=board.getPost_title()%></h1>
        </div>
        <div class="read_post_info_container">

            <h2 class="sub_info read_category">카테고리: <%=category%></h2>
            <div style="width:15px; height:10px;"></div>
            <div style="width:15px; height:10px;"></div>
            <div style="width:15px; height:10px;"></div>
            <div style="width:15px; height:10px;"></div>
            <div style="width:15px; height:10px;"></div>
            <h2 class="sub_info read_name"><%=board.getUser_id()%></h2>
            <div class="like_container">
                <h2 class="sub_info">추천: </h2>
                <h2 class="sub_info read_like_num"><%=board.getLike()%></h2>
            </div>
            <h2 class="sub_info read_date"><%=board.getPost_date()%></h2>
        </div>
        <span class="read_text">
                <%=board.getPost_text()%>
            </span>
        <div class="read_book_info_container">
            <img class="read_book_img" src="<%=board.getCover()%>" alt="">
            <div class="read_book_summary_container">
                <h3 class="read_book_title">책 : <%=board.getBook_title()%></h3>
                <h3 class="read_one_line">한줄평 : 무척 재밌었다.</h3>
                <div class="read_like_btn">
                    <i class="fa-solid fa-heart"></i>
                    <h3>추천</h3>
                </div>
            </div>
        </div>
    </main>
    <footer class=""></footer>
</body>
<script src="https://kit.fontawesome.com/4029a3b361.js" crossorigin="anonymous"></script>
<script src="/resources/js/read.js"></script>
<script src="/resources/js/like.js"></script>
</html>
