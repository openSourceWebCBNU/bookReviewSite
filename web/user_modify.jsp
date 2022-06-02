<%--
  회원정보 수정
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>USER MODIFY</title>
</head>
<body>
    <%
        String user_id = (String)session.getAttribute("user_id");
        User user = new UserDAO().getUser(user_id);
    %>
    <ul class="logout">
        <li class="dropdown">
            <ul class="dropdown-manu">
                <li><a href="mypage.jsp">My Page</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </li>
    </ul>
    <div class="modify">
        <form method="post" action="user_modifyAction.jsp">
            <h3 style="text-align:center;">회원가입</h3>
            <div class="form-group">
                <input type="text" class="form-control" value="<%= user.getUser_id() %>" name="user_id" maxlength="20" readonly>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" value="<%= user.getUser_password() %>" name="user_password" maxlength="20">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" value="<%= user.getUser_name() %>" name="user_name" maxlength="20">
            </div>
            <div class="form-group">
                <input type="email" class="form-control" value="<%= user.getUser_email() %>" name="user_email" maxlength="40">
            </div>
            <input type="submit" class="btn-join" value="회원정보 수정">
        </form>
    </div>
</body>
</html>
