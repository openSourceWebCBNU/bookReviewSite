<%--
  DOKDOKS 메인
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MAIN</title>
</head>
<body>
<%
    String user_id = null;
    if(session.getAttribute("user_id") != null) {
        user_id = (String)session.getAttribute("user_id");
    }
    int pageNumber = 1;
    if(request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
<div class="menu">
    <ul class="menu-bar">
        <li class="active"><a href="main.jsp">MAIN</a></li>
    </ul>
    <%
        if(user_id == null) {
    %>
    <ul class="login_register">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
               aria-haspopup="true" aria-expanded="false">접속하기</a>
            <ul class="dropdown-menu">
                <li><a href="login.jsp">로그인</a></li>
                <li><a href="join.jsp">회원가입</a></li>
                <li><a href="search.jsp">독후감 검색</a></li>
            </ul>
        </li>
    </ul>
    <%
        } else {
    %>
    <ul class="logout">
        <li class="dropdown">
            <ul class="dropdown-manu">
                <li><a href="mypage.jsp">My Page</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </li>
    </ul>
    <div class="container">
        <div class="row">
            <table style="text-align: center; border:1px solid">
                <thead>
                    <tr>
                        <th style="background-color:#eeeeee; text-align:center">번호</th>
                        <th style="background-color:#eeeeee; text-align:center">제목</th>
                        <th style="background-color:#eeeeee; text-align:center">작성자</th>
                        <th style="background-color:#eeeeee; text-align:center">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BoardDAO boardDAO = new BoardDAO();
                        ArrayList<Board> list = boardDAO.getList(pageNumber);

                        for(int i = 0; i < list.size(); i++) { %>
                        <tr>
                            <td><%= list.get(i).getPost_id()%></td>
                            <td><a href="view.jsp?post_id=<%= list.get(i).getPost_id() %>"><%= list.get(i).getPost_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
                            <td><%= list.get(i).getUser_id() %></td>
                            <td><%= list.get(i).getPost_date().substring(0, 11) + list.get(i).getPost_date().substring(11, 13) %></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                if(pageNumber != 1) { %>
            <a href="main.jsp?pageNumber=<%=pageNumber-1 %>" class="btn-previous">이전</a>
            <%
                }
                if(boardDAO.nextPage(pageNumber + 1)) { %>
            <a href="main.jsp?pageNumber=<%=pageNumber+1 %>" class="btn-next">다음</a>
            <%
                }
            %>
            <a href="write.jsp" class="btn-write">글쓰기</a>
            <%
                }
            %>
        </div>
    </div>
</div>
</nav>
</body>
</html>
