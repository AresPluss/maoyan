<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>css/pageTitle.css">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
    <script src="<%=basePath%>layui/layui.js"></script>
</head>
<body>
    <div class="pageTitle">
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
                <c:if test="${sessionScope.user == null}">
                    <div class="login myFlex_x">登录</div>
                    <div class="register myFlex_x">注册</div>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <div class="myFlex_x" style="width: 80%">欢迎:${sessionScope.user.userName}</div>
                    <div class="myFlex_x" id="loginOut" style="color: red">注销</div>
                </c:if>
            </div>
        </div>
    </div>
</body>
<script>
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
                content: 'view/login.jsp'
            });
        })
        $(".register").click(function (){
            layer.open({
                type: 2,
                title: '欢迎注册',
                shadeClose: true,
                shade: 0.3,
                maxmin: true, //开启最大化最小化按钮
                area: ['400px', '600px'],
                content: 'view/registry.jsp'
            });
        })
        $("#loginOut").click(function (){
            layer.confirm('确定要退出登录?', {icon: 3, title:'提示'}, function(index){
                //do something
                $.ajax({
                    url: "<%=basePath%>user?method=loginOut",
                    success: function (result){
                        var res = JSON.parse(result);
                        if(!res){
                            layer.msg("注销失败");
                        }
                        layer.close(index);
                        window.location.reload();
                    }
                })
            });

        })
    })
</script>
</html>
