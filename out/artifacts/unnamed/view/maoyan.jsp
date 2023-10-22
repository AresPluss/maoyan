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
    <title>maoyan</title>
    <link rel="stylesheet" href="<%=basePath%>css/maoyan.css">
    <link rel="stylesheet" href="<%=basePath%>css/pageTitle.css">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
    <script src="<%=basePath%>layui/layui.js"></script>
</head>
<body>
    <div class="title">
        <div class="left">
            <img src="<%=basePath%>img/maoyan_log.png" style="height: 55%">
            <div class="city myFlex_x">武汉</div>
            <div class="option">
                <div class="main myFlex_x" style="background-color: red; color: white">首页</div>
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
                <div class="login myFlex_x">登录</div>
                <div class="register myFlex_x">注册</div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="real_content">
            <div class="movie">
                <div class="movie_title">
                    <div class="movie_info_tile" style="font-size: 35px; color: red;">正在热映（58部）</div>
                    <div class="movie_ifo_align" style="font-size: 20px; color: red;">全部></div>
                </div>
                <div class="movie_picture">
                    <div class="movie_picture_half">
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" onclick="openDetail()" src="<%=basePath%>img/movie_picture1.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="第八个嫌疑人" class="name">第八个嫌疑人</div>
                                <div class="score">
                                    <div class="big">8.</div>
                                    <div class="small">9</div>
                                </div>
                            </div>
                        </div>
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture2.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="敢死队4：最终章" class="name">敢死队4：最终章</div>
                                <div class="score">
                                    <div class="big">8.</div>
                                    <div class="small">3</div>
                                </div>
                            </div>
                        </div>
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture3.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="封神第一部" class="name">封神第一部</div>
                                <div class="score">
                                    <div class="big">9.</div>
                                    <div class="small">4</div>
                                </div>
                            </div>
                            <img class="tow_IMAX" src="<%=basePath%>img/2DIMAX.png">
                        </div>
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture4.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="奥本海默" class="name">奥本海默</div>
                                <div class="score">
                                    <div class="big">9.</div>
                                    <div class="small">3</div>
                                </div>
                            </div>
                            <img class="tow_IMAX" src="<%=basePath%>img/2DIMAX.png">
                        </div>
                    </div>
                    <div class="movie_picture_half">
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture5.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="学爸" class="name">学爸</div>
                                <div class="score">
                                    <div class="big">9.</div>
                                    <div class="small">3</div>
                                </div>
                            </div>
                        </div>
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture6.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="鹦鹉杀" class="name">鹦鹉杀</div>
<!--                                <div class="score">-->
<!--                                    <div class="big">8.</div>-->
<!--                                    <div class="small">9</div>-->
<!--                                </div>-->
                            </div>
                        </div>
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture7.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="孤注一掷" class="name">孤注一掷</div>
                                <div class="score">
                                    <div class="big">9.</div>
                                    <div class="small">1</div>
                                </div>
                            </div>
                            <img class="tow_IMAX" src="<%=basePath%>img/2DIMAX.png">
                        </div>
                        <div class="each_movie myFlex_y">
                            <img class="ever_picture" src="<%=basePath%>img/movie_picture8.jpg">
                            <div class="each_buy myFlex_x">购 票</div>
                            <div class="info">
                                <div title="威尼斯惊魂夜" class="name">威尼斯惊魂夜</div>
<!--                                <div class="score">-->
<!--                                    <div class="big">8.</div>-->
<!--                                    <div class="small">9</div>-->
<!--                                </div>-->
                            </div>
                        </div>
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
        function openDetail() {
            window.open("<%=basePath%>view/detail.jsp");
        }
        function showInfo(id){
            document.getElementById(id).style.display = "block";
        }
        function closeInfo(id){
            document.getElementById(id).style.display = "none";
        }
        layui.use(['jquery','layer'],function (){
            var layer = layui.layer;
            var $ = layui.jquery;

            document.getElementById("login")
            $(".login").click(function (){
                layer.open({
                    type: 2,
                    title: '欢迎登录',
                    shadeClose: true,
                    shade: 0.3,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['400px', '600px'],
                    content: 'view/login.html'
                });
            })
            $(".register").click(function (){
                layer.open({
                    type: 2,
                    title: '欢迎注册',
                    shadeClose: true,
                    shade: 0.3,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: 'view/register.html'
                });
            })
        })
    </script>
</body>
</html>