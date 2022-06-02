<%--
  비밀번호 확인
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CONFIRM PASSWORD</title>
</head>
<body>
<div class="pass-confirm">
    <form method="post" action="confirmAction.jsp">
        <h3 style="text-align: center;">비밀번호 확인</h3>
        <div class="form-group">
            <input type="password" class="form=control" placeholder="Password" name="user_password" maxlength="20">
        </div>
        <input type="submit" class="btn-confirm" value="비밀번호 확인">
    </form>
</div>
</body>
</html>
