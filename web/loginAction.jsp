<%--
  로그인 수행
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_password" />
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8"/>
    <title>LOGIN_ACTION</title>
</head>
<body>
    <%
        String user_id = null;
        if(user_id != null) { %>
            <script>
                alert("이미 로그인 되어있습니다.");
                location.href='index.jsp';
            </script>
    <%
        }
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUser_id(), user.getUser_password());
        if(result == 1)
        {
            session.setAttribute("user_id", user.getUser_id()); %>
            <script>
                location.href='index.jsp';
            </script>
    <%
        } else if(result == 0) { %>
            <script>
                alert("비밀번호가 틀립니다.");
                history.back();
            </script>
    <%
        } else if(result == -1) { %>
            <script>
                alert("존재하지 않는 아이디입니다.");
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
