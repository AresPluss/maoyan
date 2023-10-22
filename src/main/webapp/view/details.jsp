<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="title">
        <div class="left">
            <img src="<%=basePath%>img/maoyan_log.png" style="height: 55%">
            <div class="city myFlex_x">武汉</div>
            <div class="option">
                <div class="secondary myFlex_x">首页</div>
                <div class="secondary myFlex_x">电影</div>
                <div class="secondary myFlex_x">影院</div>
                <div class="secondary myFlex_x">演出</div>
            </div>
        </div>

        <div class="right">
            <div class="app_download myFlex_x" onmouseover="showInfo('app_download')" onmouseout="closeInfo('app_download')">
                <img src="<%=basePath%>img/phone.png" style="margin-right: 10px; height: 40%">
                <div style="font-size: 22px;">APP下载</div>
                <div class="twoDimCode" id="app_download">
                    <div class="Code myFlex_x" style="width: 100%; height: 60%">
                        <img src="<%=basePath%>img/twoDimCode.png" style="height: 80%;margin-top: 20px">
                    </div>
                    <div class="info myFlex_y">
                        <div style="font-size: 20px;margin-bottom: 5px">扫码下载APP</div>
                        <div style="font-size: 15px;color: grey">选座更优惠</div>
                    </div>
                </div>
            </div>
            <div class="option">
                <div class="myFlex_x">登录</div>
                <div class="myFlex_x">注册</div>
            </div>
        </div>
    </div>
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