<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /*获取项目的根路径*/
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" + request.getServerName()+":"+request.getServerPort()+path+"/";
    /*basePath就是得到的跟路径类似于：http://localhost:8080/test/*/
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>maoyan</title>
    <link rel="stylesheet" href="<%=basePath%>css/maoyan.css">
</head>
<body>
    <%@include file="pageTitle.jsp"%>
    <div class="content">
        <div class="real_content">
            <div class="movie">
                <div class="movie_title">
                    <div class="movie_info_tile" style="font-size: 35px; color: red;">正在热映（58部）</div>
                    <div class="movie_ifo_align" style="font-size: 20px; color: red;">全部></div>
                </div>
                <div class="movie_picture">
                    <div class="movie_picture_half">
                        <c:forEach items="${requestScope.movieList1}" var="movie">
                            <div class="each_movie myFlex_y">
                                <img class="ever_picture" onclick="openDetail(${movie.id})" src="<%=basePath%>img/${movie.movieImg}">
                                <div class="each_buy myFlex_x">购 票</div>
                                <div class="info">
                                    <div title="${movie.movieName}" class="name">${movie.movieName}</div>
                                    <div class="score">
                                        <div class="big">8.</div>
                                        <div class="small">9</div>
                                    </div>
                                </div>
                                <img class="tow_IMAX" src="<%=basePath%>img/2DIMAX.png">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="movie_picture_half">
                        <c:forEach items="${requestScope.movieList2}" var="movie">
                            <div class="each_movie myFlex_y">
                                <img class="ever_picture" onclick="openDetail(${movie.id})" src="<%=basePath%>img/${movie.movieImg}">
                                <div class="each_buy myFlex_x">购 票</div>
                                <div class="info">
                                    <div title="${movie.movieName}" class="name">${movie.movieName}</div>
                                    <div class="score">
                                        <div class="big">8.</div>
                                        <div class="small">9</div>
                                    </div>
                                </div>
                                <img class="tow_IMAX" src="<%=basePath%>img/2DIMAX.png">
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="info">
                <div class="winner_title">
                    <span style="font-size: 35px; color: red">今日票房</span>
                </div>
                <div class="top">
                    <img src="<%=basePath%>img/top_picture.jpg" style="height: 100%; margin-right: 20px">
                    <img class="winner_log" src="<%=basePath%>img/winner_cup.png">
                    <div class="top_right">
                        <div style="font-size: 30px; margin-bottom: 10px; margin-top: 10%;">第八个嫌疑人</div>
                        <div style="font-size: 20px; color: red">485.34万</div>
                    </div>
                </div>
                <div class="list">
                    <div class="ever_list">
                        <div class="number myFlex_x" style="color: red">2</div>
                        <div class="info">
                            <div class="movie_name">敢死队4：最终章</div>
                            <div class="data">388.91万</div>
                        </div>
                    </div>
                    <div class="ever_list">
                        <div class="number myFlex_x" style="color: red">3</div>
                        <div class="info">
                            <div class="movie_name">孤注一掷</div>
                            <div class="data">219.00万</div>
                        </div>
                    </div>
                    <div class="ever_list">
                        <div class="number myFlex_x" style="color: black">4</div>
                        <div class="info">
                            <div class="movie_name">奥本海默</div>
                            <div class="data">169.79万</div>
                        </div>
                    </div>
                    <div class="ever_list">
                        <div class="number myFlex_x" style="color: black">5</div>
                        <div class="info">
                            <div class="movie_name">封神第一部</div>
                            <div class="data">132.85万</div>
                        </div>
                    </div>
                </div>
                <div class="today_data myFlex_y">
                    <div class="inner">
                        <div class="inner_left myFlex_y">
                            <div>今</div> <div>日</div> <div>大</div> <div>盘</div>
                        </div>
                        <div class="inner_right">
                            <div class="space"></div>
                            <div class="half_up">
                                <div class="left">1836.7万</div>
                                <div class="right">查看更多></div>
                            </div>
                            <div class="half_down">
                                <div>北京时间 17:32:13</div>
                                <div>猫眼专业版实时票房数据</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function openDetail(movieId) {
            window.open("<%=basePath%>details?method=getDetail&id="+movieId);
        }
        function showInfo(id){
            document.getElementById(id).style.display = "block";
        }
        function closeInfo(id){
            document.getElementById(id).style.display = "none";
        }
    </script>
</body>
</html>