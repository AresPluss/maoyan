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
                    alert("登录失败");
                }else{
                    alert("Welcome!");
                }
            }
        })
    })
</script>
</body>
</html>