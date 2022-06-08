<%--
    회원가입 수행
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_password" />
<jsp:setProperty name="user" property="user_name" />
<jsp:setProperty name="user" property="user_email" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JOIN_ACTION</title>
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
        if(user.getUser_id() == null || user.getUser_password() == null || user.getUser_name() == null
        || user.getUser_email() == null) { %>
            <script>
                alert("입력이 안 된 사항이 있습니다.");
                history.back();
            </script>
    <%
        }
        else {
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);

            if(result == -1) { %>
                <script>
                    alert("이미 존재하는 아이디입니다.");
                    history.back();
                </script>
    <%
        }
            else {
                session.setAttribute("user_id", user.getUser_id()); %>
                <script>
                    location.href = 'login.jsp';
                </script>
    <%
            }
        }
    %>
</body>
</html>
