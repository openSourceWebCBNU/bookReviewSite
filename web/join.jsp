<%--
  회원가입 화면
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JOIN</title>
</head>
<body>
    <div class="menu">
        <ul class="main-menu-bar">
            <li class="active"><a href="main.jsp">MAIN</a></li>
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
    <div class="join">
        <form method="post" action="joinAction.jsp">
            <h3 style="text-align:center;">회원가입</h3>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="ID" name="user_id" maxlength="20">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" name="user_password" maxlength="20">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="이름" name="user_name" maxlength="20">
            </div>
            <div class="form-group">
                <input type="email" class="form-control" placeholder="E-Mail" name="user_email" maxlength="40">
            </div>
            <input type="submit" class="btn-join" value="회원가입">
        </form>
    </div>
</body>
</html>
