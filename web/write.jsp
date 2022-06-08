<%--
  독후감 작성
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WRITE</title>
</head>
<body>
<div class="menu"> <ul class="menu-bar">
    <li class="active"><a href="main.jsp">MAIN</a></li>
</ul>
    <ul class="logout">
        <li class="dropdown">
            <ul class="dropdown-manu">
                <li><a href="mypage.jsp">My Page</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </li>
    </ul>
</div>
    <div class="container">
        <div class="row">
            <form method="post" action="writeAction.jsp">
            <table style="text-align: center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">독후감 양식</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" class="form-control" placeholder="글 제목" name="post_title" maxlength="50"></td>
                    </tr>
                    <tr>
                        <td><textarea class="form-control" name="post_text" maxlength="5000" style="height:350px;"></textarea></td>
                    </tr>
                </tbody>
            </table>
                <input type="submit" class="btn-submit" value="저장">
            </form>
        </div>
    </div>
</body>
</html>
