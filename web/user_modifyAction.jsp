<%--
   회원정보 수정 수행
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
    <title>USER MODIFY ACTION</title>
</head>
<body>
    <%
        UserDAO userDAO = new UserDAO();
        int result = userDAO.modify(user);

        if(result == -1) { %>
            <script>
                alert("데이터베이스 오류 발생");
                history.back();
            </script>
    <%
        }
        else { %>
            <script>
                alert("회원정보가 수정되었습니다.");
                location.href = 'main.jsp';
            </script>
    <%
        }
    %>
</body>
</html>
