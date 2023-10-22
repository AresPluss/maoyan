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
</head>
<style>
</style>
<body>
    <form id="userForm" onsubmit="return false" action="#">
        <input type="text" name="userName"><br>
        <input type="password" name="password"><br>
        <input type="submit" onclick="doSub()">
        <input type="reset">
    </form>
<script>
    function doSub(){
        // 获取账号
        // 获取密码
        // 访问后端
        window.location.href="http://localhost:8080/maoyan_war_exploded/user?method=login&userName=admin&password=123456";
    }
</script>
</body>
</html>