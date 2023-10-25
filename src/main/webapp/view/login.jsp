<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*获取项目的根路径*/
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" + request.getServerName()+":"+request.getServerPort()+path+"/";
    /*basePath就是得到的跟路径类似于：http://localhost:8080/test/*/
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="<%=basePath%>js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
    <script src="<%=basePath%>layui/layui.js"></script>
</head>
<style>
</style>
<body>
    <form id="loginForm" action="" onsubmit="return false">
        <input type="text" name="userName"><br>
        <input type="password" name="password"><br>
        <input type="submit" id="doLogin">
        <input type="reset">
    </form>
<script>
    $("#doLogin").click(function (){
        $.ajax({
            url: "<%=basePath%>user?method=login",
            data: $("#loginForm").serialize(),
            success:function (result){
                var user = JSON.parse(result);
                if(user == null){
                    layer.msg("用户名或密码错误！")
                }else{
                    layer.msg("登录成功！",{
                        icon: 1,
                        time: 2000
                    }, function (){
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        parent.location.reload();
                    })
                }
            }
        })
    })
</script>
</body>
</html>