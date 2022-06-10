<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/portfolio.css" />
    <script src="https://d3js.org/d3.v5.js"></script>

    <%
        String user_id = null;
        String post_id[] = new String[24];
        String post_title[] = new String[24];
        String post_date[] = new String[24];
        String book_title[] = new String[24];
        String post_id_str = "";
        String post_title_str = "";
        String post_date_str = "";
        String book_title_str = "";

        if(session.getAttribute("user_id") != null) {
            user_id = (String)session.getAttribute("user_id");
        }
        if(user_id == null) { %>
            <script>
                alert("로그인이 필요한 서비스입니다.");
                location.href='login.jsp';
            </script>
    <%
        } else {
            BoardDAO boardDAO = new BoardDAO();
            ArrayList<Board> list = boardDAO.getPortfolio(user_id);

            for(int i = 0; i < 24; i++) {
                post_id[i] = Integer.toString(list.get(i).getPost_id());
            }

            for(int i = 0; i < 24; i++) {
                post_title[i] = list.get(i).getPost_title();
            }

            for(int i = 0; i < 24; i++) {
                post_date[i] = list.get(i).getPost_date();
            }

            for(int i = 0; i < 24; i++) {
                book_title[i] = list.get(i).getBook_title();
            }

            for(int i = 0; i < post_id.length; i++) {
                if(i==0) post_id_str= "'"+post_id[i]+"'";
                else post_id_str+= ",'"+post_id[i]+"'";
            }

            for(int i = 0; i < post_title.length; i++) {
                if(i==0) post_title_str= "'"+post_title[i]+"'";
                else post_title_str+= ",'"+post_title[i]+"'";
            }


            for(int i = 0; i < post_date.length; i++) {
                if(i==0) post_date_str= "'"+post_date[i]+"'";
                else post_date_str+= ",'"+post_date[i]+"'";
            }


            for(int i = 0; i < book_title.length; i++) {
                if(i==0) book_title_str= "'"+book_title[i]+"'";
                else book_title_str+= ",'"+book_title[i]+"'";
            }
        }
    %>


    <script>
        var initFirst = true;
        var rect_lst = [];
        var s_rect_lst = [];
        var book_report_lst = [];
        var color_lst = ["#EB5353", "#F9D923", "#36AE7C", "#187498", "#7D1E6A", "#EEB0B0", "#FFE59D", "#BDE6F1", "#541690", "#FF4949", "#FF8D29", "#FFCD38"]


        var width = 200;
        var height = 140;
        //최초 사각형의 x좌표와 y좌표
        var xPosition ;
        var yPosition;

        var degPlus = 15;
        var rectNum = (180/degPlus+1)+2; //2는 양 방향 외곽, 1은 왼쪽 혹은 오른쪽 180도 부분을 포함한 개수
        var offset = 0;
        var click = false;

        var post_id = [<%=post_id_str%>];
        var post_title = [<%=post_title_str%>];
        var post_date = [<%=post_date_str%>];
        var book_title = [<%=book_title_str%>];


        window.onload = function(){
            init(0, 7);
        };
        window.onresize = function(){
        };

        function setBRLst(){
            for(var i =0; i<24 ; i++){ //rect_lst에 splice기기 위해 초기화
                if(post_title[i].length>4){
                    post_title[i] = post_title[i].slice(0,4);
                    post_title[i] += "...";
                }

                book_report_lst.push({
                    "id" : post_id[i],
                    "report_name" : post_title[i],
                    "book_name" : book_title[i],
                    "color" : color_lst[Math.floor(i/2)],
                    "month" : Math.floor(i/3),
                    "brNum" : i,
                    "date" : post_date[i]
                });
            }
        }

        function init(firstBrNum, selectedBrNum){
            //layer 설정
            setBRLst();
            setRectList();
            drawRect(firstBrNum, selectedBrNum);
            setRotateSensor();
        }

        function drawRect(firstBrNum, selectedBrNum) {
            offset = firstBrNum;
            setRectListLayer(selectedBrNum);
            setSRectList();

            xPosition = (parseInt(d3.select("svg").style("width")) / 2)-(width*2.2);
            yPosition = (parseInt(d3.select("svg").style("height"))-(height))+height;


            //month 변화
            if(rect_lst[selectedBrNum-offset].month+"월" != d3.select("#month").text()){
                d3.select("#month").text(rect_lst[selectedBrNum-offset].month+"월")
            }
            if(click == true){
                click = false;
            }
            //book_name 변화
            d3.select("#book_name").text("<"+rect_lst[selectedBrNum-offset].book_name+">")

            //report_name 변화
            d3.select("#report_name").text(rect_lst[selectedBrNum-offset].report_name)

            //date 변화
            d3.select("#date").text(rect_lst[selectedBrNum-offset].date)


            //svg 초기화
            d3.select("svg").selectAll("*").remove();

            //사각형 생성 및 회전
            d3.select("svg").selectAll("rect").data(s_rect_lst).enter().append("g")
                .attr("transform", function (d) { return d.transform })
                .attr("transform-origin", ""+ (parseInt(d3.select("svg").style("width")) / 2)+" "+(parseInt(d3.select("svg").style("height"))+(height/2)))
                .append("rect")
                .attr("x", xPosition)
                .attr("y", yPosition)
                .attr("width", width)
                .attr("height", height)
                .attr("fill", function(d){return d.fill;})
                .attr("stroke", function (d) { return d['stroke'] })
                .attr("stroke-width", "1")

            //텍스트 추가
            d3.selectAll("g").append("text")
                .attr("x", xPosition)
                .attr("y", yPosition+80)
                .attr("fill", "white")
                .attr("font-size", "25")
                .attr("font-family", "'DM Serif Display', serif")
                .attr("transform", "rotate(-90)")
                .attr("transform-origin", "center")
                .attr("style", "transform-box : fill-box")
                .text(function(d, i){ return s_rect_lst[i].report_name;});

            d3.selectAll("g").append("text")
                .attr("x", xPosition+(width/2)+25)
                .attr("y", yPosition+17)
                .attr("fill", "white")
                .attr("font-size", "12")
                .attr("font-family", "'Jua', sans-serif")
                .attr("transform", "rotate(180)")
                .attr("transform-origin", "center")
                .attr("style", "transform-box : fill-box")
                .text(function(d, i){ return s_rect_lst[i].book_name;});

            d3.selectAll("g").append("text")
                .attr("x", xPosition+165)
                .attr("y", yPosition+133)
                .attr("fill", "white")
                .attr("font-size", "30")
                .attr("font-family", "sans-serif")
                .attr("font-weight", "bold")
                .attr("transform", "rotate(-90)")
                .attr("transform-origin", "center")
                .attr("style", "transform-box : fill-box")
                .text(function(d, i){ return s_rect_lst[i].brNum;});

            //사각형 hover
            if(initFirst == true){
                d3.select("svg").selectAll("g")
                    .on("mouseover", function(d, i){
                        drawRect(rect_lst[0].brNum, s_rect_lst[i].brNum);
                    })

                initFirst = false;
            }
            else{
                d3.select("svg").selectAll("g")
                    .on("mouseout", function(d){
                        d3.select("svg").selectAll("g")
                            .on("mouseover", function(d, i){
                                drawRect(rect_lst[0].brNum, s_rect_lst[i].brNum);
                            })
                    })
                    .on("mousedown", function(d, i){
                        console.log(s_rect_lst[i].brNum)
                        toUrl(s_rect_lst[i].id);
                    })
            }
        }

        function toUrl(num){
            console.log(num);
            var t = num.toString();
            location.href = "/read.jsp?post_id="+t;
        }

        function second(plusNum){
            //layer 설정
            var isLstChange;
            isLstChange = moveRectList(plusNum);
            if(isLstChange === "out"){

            }
            else if(isLstChange == true){
                drawRect(rect_lst[0].brNum, 7+offset);
            }
            else{
                setSRectList();

                //사각형 생성 및 회전
                d3.select("svg").selectAll("g")
                    .attr("transform", function (d, i) { return s_rect_lst[i].transform})
            }

        }

        function setRectList(){
            //rect_lst 초기화
            rect_lst = [];
            //layer 설정
            for (var i =0; i<rectNum; i++) {
                var deg = i*degPlus - (degPlus);

                rect_lst.push({
                    "id" :  book_report_lst[i].id,
                    "deg" : deg,
                    "transform" : "rotate(" + deg + ")",
                    "stroke" : "black",
                    "fill" : book_report_lst[i].color,
                    "report_name" : book_report_lst[i].report_name,
                    "book_name" : book_report_lst[i].book_name,
                    "month" : book_report_lst[i].month,
                    "brNum" : book_report_lst[i].brNum,
                    "date" : book_report_lst[i].date,
                });
            }
        }
        function setRectListLayer(selectedBrNum){
            var layerLeftNum;
            var layerRightNum;

            layerRightNum = rectNum-selectedBrNum-1+offset;
            layerLeftNum = rectNum-layerRightNum-1;
            //layer 설정
            for (var i =0; i<rectNum; i++) {
                var iBrNum = rect_lst[i].brNum;

                var diff;
                var layer;

                if(iBrNum>selectedBrNum ){ //select 기준 우익
                    diff = iBrNum-selectedBrNum;
                    if(diff <= layerLeftNum) //이쪽은 우익, 즉 우익의 개수가 왼쪽의 lectNum보다 많아졌을 때(예를 들어 왼쪽이 두개고 오른쪽이 10개면 오른쪽 3개째부터)
                        layer = (rectNum-1)-(diff*2)+1;
                    else{
                        layer = (rectNum-1)-(layerLeftNum*2)-(diff-layerLeftNum);
                    }
                }
                else{ //select 기준 좌익
                    diff = selectedBrNum-iBrNum;
                    if(diff <= layerRightNum)
                        layer = (rectNum-1)-(diff*2);
                    else{
                        layer = (rectNum-1)- //layer 최대값에서
                            (layerRightNum*2)-  //*2를 해서 갔던 레이어 만큼을 제하고
                            (diff-layerRightNum); //거기부터 1씩(layerRight와 diff의 차이만큼) 줄인다
                    }
                }
                rect_lst[i].layer = layer;
            }
        }
        function setSRectList(){
            s_rect_lst = [];
            for(var i=0; i<rectNum; i++)
                s_rect_lst.push({});

            for(var i=0; i<rectNum; i++){
                s_rect_lst.splice(rect_lst[i].layer, 1, rect_lst[i])
            }
        }
        function moveRectList(plusNum){
            if((offset != 0 || plusNum < 0) && (offset+rectNum < book_report_lst.length || plusNum > 0)){
                if(rect_lst[0].deg >= 0){
                    offset--;
                    rect_lst.pop();
                    rect_lst.unshift({
                        "id" : book_report_lst[0+offset].id,
                        "deg" : -degPlus,
                        "transform": "rotate("+ -degPlus +")",
                        "stroke" : "black",
                        "fill" : book_report_lst[0+offset].color,
                        "report_name" : book_report_lst[0+offset].report_name,
                        "book_name" :book_report_lst[0+offset].book_name,
                        "month" : book_report_lst[0+offset].month,
                        "brNum" : book_report_lst[0+offset].brNum,
                        "date" : book_report_lst[0+offset].date,
                    })
                    return true;
                }
                else if(rect_lst[rectNum-1].deg <= 180){
                    offset++;
                    rect_lst.shift();
                    rect_lst.push({
                        "id" : book_report_lst[rectNum-1+offset].id,
                        "deg" : 180 + degPlus,
                        "transform": "rotate("+ (180 + degPlus) +")",
                        "stroke" : "black",
                        "fill" : book_report_lst[rectNum-1+offset].color,
                        "report_name" : book_report_lst[rectNum-1+offset].report_name,
                        "book_name" :book_report_lst[rectNum-1+offset].book_name,
                        "month" :book_report_lst[rectNum-1+offset].month,
                        "brNum" : book_report_lst[rectNum-1+offset].brNum,
                        "date" : book_report_lst[rectNum-1+offset].date,
                    })
                    return true;
                }
                else{
                    for(i=0; i<rectNum; i++){
                        rect_lst[i].deg += plusNum;
                        rect_lst[i].transform = "rotate(" + rect_lst[i].deg + ")";
                    }
                    return false;
                }
            }
            else
                return "out";

        }
        function setRotateSensor(){
            var interval;

            d3.select("#event1")
                .on("mouseover", function(){interval = setInterval(function(){
                    second(1);
                }, 10)})
                .on("mouseout", function(){clearInterval(interval)});

            d3.select("#event2")
                .on("mouseover", function(){interval = setInterval(function(){
                    second(-1);
                }, 10)})
                .on("mouseout", function(){clearInterval(interval)});
        };

        function getRandomColor() {
            return "#" + Math.floor(Math.random() * 16777215).toString(16);
        }

    </script>
</head>

<body class = "body" style = "margin : 0 0">
<a href="write.jsp" class="to_write">
    독후감 쓰기
</a>
<svg width="100%" height="100vh" style="border:1px solid black">
</svg>
<div id = "event1" ></div>
<div id = "event2"></div>
<div id = "monthView">
    <div id = "month">4월</div>
    <div id = "book_name">납골당의 린린자자</div>
    <div id = "report_name">좀비 세상에 떨어진 어린왕자</div>
    <div id = "date">22/03/11</div>
</div>
<div class = "hidden" id = "textView" >
    <div>
        <img src="/resources/img/XL.jpg" height = 400>
    </div>
    <div>
        <div class = "report_name">납골당의 린린자자</div>
        <div>
            있으며, 바이며, 설산에서 것이다. 꽃 자신과 것은 불러 청춘에서만 보라. 설레는 그들은 같지 방황하여도, 피다. 평화스러운 얼마나 심장의 보내는 그것을 바로 더운지라 보라. 되는 이것을 소리다.이것은 약동하다. 노래하며 그것은 싸인 만천하의 뼈 찬미를 같이, 가슴에 눈이 사막이다. 인생을 노년에게서 인간에 바로 바이며, 수 끓는다. 끝까지 청춘의 황금시대의 풀이 돋고, 있다. 천고에 산야에 자신과 못할 말이다.
        </div>
    </div>
</div>
</body>