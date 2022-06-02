<%--
  비밀번호 확인 수행
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_password" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CONFIRM PASSWORD</title>
</head>
<body>
    <%
        String user_id = (String)session.getAttribute("user_id");
        UserDAO userDAO = new UserDAO();
        int result = userDAO.confirm(user_id, user.getUser_password());

        if(result == 1) { %>
            <script>
                location.href='user_modify.jsp';
            </script>
    <%
        } else if(result == 0) { %>
            <script>
                alert("비밀번호가 틀립니다.");
                history.back();
            </script>
    <%
        } else if(result == -2) { %>
            <script>
                alert("데이터베이스 오류가 발생했습니다.");
                history.back();
            </script>
    <%
        }
    %>
</body>
</html>
