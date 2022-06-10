<%--
  독후감 작성 수행
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="post_title" />
<jsp:setProperty name="board" property="post_text" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <%
        String user_id = null;
        if(session.getAttribute("user_id") != null) {
            user_id = (String)session.getAttribute("user_id");
        }

        if(board.getPost_title() == null || board.getPost_text() == null) { %>
            <script>
                alert("입력이 안 된 사항이 있습니다.");
                history.back();
            </script>
    <%
        }
        else {

            request.setCharacterEncoding("UTF-8");
            String book_title = request.getParameter("search");
            String book_author = request.getParameter("book_author");
            String isbn = request.getParameter("isbn");
            String publisher = request.getParameter("publisher");
            String pub_date = request.getParameter("pub_date");
            String category = request.getParameter("category");
            String cover = request.getParameter("cover");

            BoardDAO boardDAO = new BoardDAO();
            int result = boardDAO.write(board, user_id, isbn, book_title, book_author, publisher, pub_date, category, cover);

            if(result == -1) { %>
                <script>
                    alert("저장 실패");
                    history.back();
                </script>
    <%
            }
            else { %>
                <script>
                    alert("독후감이 등록되었습니다.");
                    location.href='index.jsp';
                </script>
    <%
            }
        }
    %>
</body>
</html>
