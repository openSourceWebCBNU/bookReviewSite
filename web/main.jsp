<%--
  DOKDOKS 메인
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MAIN</title>
</head>
<body>
<%
    String user_id = null;
    if(session.getAttribute("user_id") != null) {
        user_id = (String)session.getAttribute("user_id");
    }
%>
<div class="menu">
    <ul class="menu-bar">
        <li class="active"><a href="main.jsp">MAIN</a></li>
    </ul>
    <%
        if(user_id == null) {
    %>
    <ul class="login_register">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
               aria-haspopup="true" aria-expanded="false">접속하기</a>
            <ul class="dropdown-menu">
                <li><a href="login.jsp">로그인</a></li>
                <li><a href="join.jsp">회원가입</a></li>
            </ul>
        </li>
    </ul>
    <%
        } else {
    %>
    <ul class="logout">
        <li class="dropdown">
            <ul class="dropdown-manu">
                <li><a href="mypage.jsp">My Page</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </li>
    </ul>
    <%
        }
    %>
</div>
</nav>
</body>
</html>
