<%--
  마이페이지
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
</head>
<body>
    <div class="menu">
    <ul class="main-menu-bar">
        <li class="active"><a href="main.jsp">MAIN</a></li>
        <li><a href="mypage.jsp">My Page</a></li>
    </ul>
        <ul class="mypage-menu">
            <li><a href="portfolio.jsp">포트폴리오</a></li>
            <li><a href="confirm.jsp">회원정보 수정</a></li>
        </ul>
    <ul class="logout">
        <li class="dropdown">
            <ul class="dropdown-manu">
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </li>
    </ul>
    </div>
</body>
</html>
