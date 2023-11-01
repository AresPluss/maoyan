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
    <title>Detail</title>
    <link rel="stylesheet" href="<%=basePath%>css/details.css">
    <link rel="stylesheet" href="<%=basePath%>css/pageTitle.css">
</head>
<body>
    <%@include file="pageTitle.jsp"%>
    <div class="banner">
        <div class="picture">
            <img class="movie_picture" src="<%=basePath%>img/${movie.movieImg}">
        </div>
        <div class="info">
            <div class="info_top">
                <div class="info_title">
                    <div style="font-size: 40px; font-weight: bold">${movie.movieName}</div>
                    <div style="font-size: 25px">Dust To Dust</div>
                </div>
                <div class="info_info">
                    <div>剧情 犯罪</div>
                    <div>中国大陆 / 111分钟</div>
                    <div>2023-09-09 09:00中国大陆上映</div>
                </div>
            </div>
            <div class="info_button">
                <div class="up_self">
                    <div class="button myFlex_x"><span>&hearts;</span>想看</div>
                    <div class="button myFlex_x"><span>&#9733</span>评分</div>
                </div>
                <div class="buy myFlex_x">
                    <div class="button myFlex_x">特惠购票</div>
                </div>
            </div>
        </div>
        <div class="score">
            <div class="data">
                <div style="color: white;margin-bottom: 5px">猫眼口碑</div>
                <div style="color: orange;font-size: 35px">8.9</div>
            </div>
            <div class="data">
                <div style="color: white;margin-bottom: 5px">累计票房</div>
                <div>
                    <span style="color: white;font-size: 40px">3.78</span>
                    <span style="color: white">亿</span>
                </div>
            </div>
        </div>
    </div>
    <script>
        function showInfo(id){
            document.getElementById(id).style.display = "block";
        }
        function closeInfo(id){
            document.getElementById(id).style.display = "none";
        }
    </script>
</body>
</html>