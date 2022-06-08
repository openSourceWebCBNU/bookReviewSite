<%@ page import="java.util.ArrayList" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        int pageList = 5;

        String keyWord = request.getParameter("keyword");
        String searchWord = request.getParameter("searchword");
    %>

    <div class="content">
        <table style="width:800px; align:center;">
            <b>Search</b> :
            <form action="search.jsp" method="get">
                <select name="keyword">
                    <option value="Keyword">제목+내용</option>
                    <option value="Title">제목</option>
                    <option value="Author">저자</option>
                    <option value="Publisher">출판사</option>
                </select>
                <input type="text" name="searchword">
                <input type="submit" value="Search">
            </form>
            <%
                String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbuipjo1232200001&Query="+searchWord+"&QueryType="+keyWord+"&MaxResults=10&start=1&SearchTarget=Book&output=xml&Version=20131101";
            %>
            <tr>
                <th style="width:10%;">번호</th>
                <th style="width:50%;">제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
        </table>
    </div>
<%
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    dbf.setNamespaceAware(false);
    dbf.setValidating(false);
    DocumentBuilder b = dbf.newDocumentBuilder();

    URLConnection urlConnection = new URL(url).openConnection();
    urlConnection.addRequestProperty("Accept", "application/xml");

    Document doc = b.parse(urlConnection.getInputStream());
    doc.getDocumentElement().normalize();

    NodeList title = doc.getDocumentElement().getElementsByTagName("title");
    NodeList author = doc.getDocumentElement().getElementsByTagName("author");
    NodeList publisher = doc.getDocumentElement().getElementsByTagName("publisher");
    NodeList pubDate = doc.getDocumentElement().getElementsByTagName("pubDate");
    NodeList category = doc.getDocumentElement().getElementsByTagName("categoryName");

    out.println("<table width=700 border=1 align=center>");
        out.println("<tr>");
            out.println("<5h width=50>순번</th>");
            out.println("<5h width=50>책 제목</th>");
            out.println("<5h width=50>저자</th>");
            out.println("<5h width=50>출판사</th>");
            out.println("<5h width=50>출판일자</th>");
            out.println("<5h width=50>카테고리</th>");
            out.println("</tr>");

        out.println("<tr>");
            out.println("<td align=center></td>");
            out.println("<td>"+title.item(0).getFirstChild().getTextContent()+"</td>");
            out.println("<td>"+author.item(0).getFirstChild().getTextContent()+"</td>");
            out.println("<td>"+publisher.item(0).getFirstChild().getTextContent()+"</td>");
            out.println("<td>"+pubDate.item(0).getFirstChild().getTextContent()+"</td>");
            out.println("<td>"+category.item(0).getFirstChild().getTextContent()+"</td>");
            out.println("</tr>");
        out.println("</table>");
    %>
</body>
</html>
