<%--
  게시글 보기
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=board.BoardDAO"UTF-8">
    <title>VIEW</title>
</head>
<body>
    <%
      String user_id = null;
      if(session.getAttribute("user_id") != null) {
          user_id = (String)session.getAttribute("user_id");
      }

      int post_id = 0;
      if(request.getParameter("post_id") != null) {
          post_id = Integer.parseInt(request.getParameter("post_id"));
      }

      if(post_id == 0) { %>
            <script>
                alert("유효하지 않은 글입니다.");
                location.href='main.jsp';
            </script>
    <%
        }
        Board board = new BoardDAO().getBoard(post_id);
    %>

    <div class="container">
        <div class="row">
            <table class="view-table" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color: #eeeeee; text-align:center;">게시글 보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 20%;">글 제목</td>
                        <td colspan="2"><%= board.getPost_title() %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= board.getUser_id() %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= board.getPost_date().substring(0, 11) + board.getPost_date().substring(11, 13) %></td>
                    </tr>
                    <tr>
                        <td>글 제목</td>
                        <td colspan="2"><%= board.getPost_title() %></td>
                    </tr>
                    <tr>
                        <td>본문</td>
                        <td colspan="2" style="min-height : 20px; text-align: left;"><%= board.getPost_text() %></td>
                    </tr>
                </tbody>
            </table>
            <a href="main.jsp" class="btn-main">메인화면</a>
        </div>
    </div>
</body>
</html>
