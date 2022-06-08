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

        if(user_id == null) { %>
            <script>
                alert("로그인이 필요합니다.");
                location.href='login.jsp';
            </script>
    <%
        }
        else {
            if(board.getPost_title() == null || board.getPost_text() == null) { %>
                <script>
                    alert("입력이 안 된 사항이 있습니다.");
                    history.back();
                </script>
    <%
            }
            else {
                BoardDAO boardDAO = new BoardDAO();
                int result = boardDAO.write(board.getPost_title(), user_id, board.getPost_text());

                if(result == -1) { %>
                    <script>
                        alert("저장 실패");
                        history.back();
                    </script>
    <%
                }
                else { %>
                    <script>
                        location.href='main.jsp';
                    </script>
    <%
                }
            }
        }
    %>
</body>
</html>
