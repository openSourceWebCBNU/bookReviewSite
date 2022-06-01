<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-01
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LOGIN</title>
</head>
<body>
    <div class="menu">
        <ul class="menu-bar">
            <li class="active"><a href="main.jsp">MAIN</a></li>
            <li><a href="mypage.jsp">My Page</a></li>
        </ul>
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
    </div>
    <div class="login">
        <form method="post" action="loginAction.jsp">
            <h3 style="text-align: center;">로그인 화면</h3>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="ID" name="user_id" maxlength="20">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" name="user_password" maxlength="20">
            </div>
            <input type="submit" class="btn-login" value="로그인">
        </form>
    </div>
    </div>
</body>
</html>
