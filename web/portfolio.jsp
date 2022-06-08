<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PORTFOLIO</title>
</head>
<body>
    <%
        String url = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbuipjo1232200001&itemIdType=ISBN&ItemId=8958285346&output=xml&Version=20131101&OptResult=ebookList,usedList,reviewList";
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
