<%--
  독후감 작성
--%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
    <%
        String user_id = null;
        if(session.getAttribute("user_id") != null) {
            user_id = (String)session.getAttribute("user_id");
        }
        if(user_id == null) { %>
                <script>
                    alert("로그인이 필요한 서비스입니다.");
                    location.href='login.jsp';
                </script>
    <% }
        %>

<header class="header-post">
    <div class="header-content-post">
        <a href="index.jsp">
            <div class="logo">
                <h1>독독스</h1>
            </div>
        </a>
    </div>
</header>
<div class="post_instead_header"></div>
<main class="post-body">
    <%
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");

        if(search == null) {
            search = "";
        }
    %>
    <form class="search-form" name=search method="get" action="write.jsp">
        <div style="width: 410px;">
            <input class="book_search_input" type="text" name="search" value="<%=search%>" placeholder="책 이름을 입력하세요">
            <button class="book_search_btn" type="submit" onclick="delete_space()">불러오기</button>
            <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
            <script type="text/javascript">
                function delete_space()
                {
                    var a = $('.book_search_input').val().replace(/ /gi, '');
                    $('.book_search_input').val(a);
                }
            </script>
            <%
                request.setCharacterEncoding("UTF-8");
                String SearchWord = request.getParameter("search");

                String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbuipjo1232200001&Query="+SearchWord+"&QueryType=Title&Cover=Big&MaxResults=10&start=1&SearchTarget=Book&Sort=SalesPoint&output=xml&Version=20131101";
                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                dbf.setNamespaceAware(false);
                dbf.setValidating(false);
                DocumentBuilder b = dbf.newDocumentBuilder();

                URLConnection urlConnection = new URL(url).openConnection();
                urlConnection.addRequestProperty("Accept", "applicaton/xml");

                Document doc = b.parse(urlConnection.getInputStream());
                doc.getDocumentElement().normalize();

                NodeList title = doc.getDocumentElement().getElementsByTagName("title");
                NodeList author = doc.getDocumentElement().getElementsByTagName("author");
                NodeList isbn = doc.getDocumentElement().getElementsByTagName("isbn13");
                NodeList publisher = doc.getDocumentElement().getElementsByTagName("publisher");
                NodeList pubDate = doc.getDocumentElement().getElementsByTagName("pubDate");
                NodeList cover = doc.getDocumentElement().getElementsByTagName("cover");
            %>
        </div>
        <div class="post_book_img_container">
            <img class="post_book_img" src="<%=cover.item(1).getFirstChild().getTextContent()%>" alt="">
        </div>
        <div style="width: 410px; height: 10px;"></div>
    </form>




    <form method="get" class="post-form" action="writeAction.jsp">
        <div class="post_head_container">
            <div class="book_search_container">
                <select class="gerne_category" name="category">
                    <option value="none">카테고리</option>
                    <option value="popularity">인기순</option>
                    <option value="development">자기계발</option>
                    <option value="poem">시</option>
                    <option value="essay">에세이</option>
                    <option value="economy">경제</option>
                    <option value="travel">여행</option>
                    <option value="philosophy">철학</option>
                    <option value="natural">자연과학</option>
                    <option value="technology">기술과학</option>
                    <option value="literature">문학</option>
                    <option value="fantasy">판타지</option>
                    <option value="mystery">추리</option>
                    <option value="romance">로맨스</option>
                    <option value="history">역사</option>
                </select>
            </div>
<%--            <div class="post_book_img_container">--%>
<%--                <img class="post_book_img" src="<%=cover.item(1).getFirstChild().getTextContent()%>" alt="">--%>
<%--            </div>--%>
            <div class="empty"></div>
        </div>

        <div class="line"></div>

        <input class="post-title" type="text" name="post_title" placeholder="제목을 입력하세요" maxlength="50">

        <div class="line"></div>

        <textarea cols="40" rows="30" name="post_text" class="main_text"></textarea>
        <input type="hidden" name="search" value="<%=search%>">
        <input type="hidden" name="book_author" value="<%=author.item(1).getFirstChild().getTextContent()%>">
        <input type="hidden" name="isbn" value="<%=isbn.item(1).getFirstChild().getTextContent()%>">
        <input type="hidden" name="publisher" value="<%=publisher.item(1).getFirstChild().getTextContent()%>">
        <input type="hidden" name="pub_date" value="<%=pubDate.item(2).getFirstChild().getTextContent()%>">
        <input type="hidden" name="cover" value="<%=cover.item(1).getFirstChild().getTextContent()%>">

        <div class="submit_bar">
            <button class="post_submit" type="submit">완료</button>
        </div>
    </form>
</main>
<footer class=""></footer>
</body>
<script src="https://kit.fontawesome.com/4029a3b361.js" crossorigin="anonymous"></script>
</html>