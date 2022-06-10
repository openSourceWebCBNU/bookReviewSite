<%--
    로그아웃 수행
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LOGOUT</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>
        location.href = 'index.jsp';
    </script>
</body>
</html>
