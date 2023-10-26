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
    <link rel="stylesheet" href="<%=basePath%>css/public.css">
</head>
<style>
</style>
<body>
    <div class="Main myFlex_y" style="width: 100%;height: 500px;background-color: lightgray">
        <form id="registryForm" action="" onsubmit="return false">
            <div>请输入6-12位由数字或英文字母组成的用户名</div>
            <input type="text" name="userName" id="userName"><br>
            <div id="userNameCheckedPrompt">&nbsp;</div><br>

            <div>请输入6-18位由数字和英文字母组成的密码</div>
            <input type="password" name="password" id="password"><br>
            <div id="passwordCheckedPrompt">&nbsp;</div><br>

            <div>请输入与上述相同的密码以确认密码</div>
            <input type="password" name="password2" id="password2"><br>
            <div id="password2CheckedPrompt">&nbsp;</div><br>

            <input type="submit" id="registry">
            <input type="reset">
        </form>
    </div>
<script>
    $("#userName").blur(function (){
        var reg = /^[0-9a-zA-z]{6,12}$/;
        var content = $("#userNameCheckedPrompt");
        if(reg.test(this.value)){
            content.text("您输入的用户名合法");
            content.css("color","green");
        }else{
            content.text("您输入的用户名不合法");
            content.css("color","red");
        }
    })
    $("#password").blur(function (){
        var reg = /^(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]{6,18}$/;
        var content = $("#passwordCheckedPrompt");
        if(reg.test(this.value)){
            content.text("您输入的密码合法");
            content.css("color","green");
        }else{
            content.text("您输入的密码不合法");
            content.css("color","red");
        }
    })
    $("#password2").blur(function (){
        var originPassword = $("#password");
        var content = $("#password2CheckedPrompt");
        if(this.value !== originPassword.val()){
            content.text("您两次输入的密码不一致");
            content.css("color","red");
        }else{
            content.text("您两次输入的密码一致");
            content.css("color","green");
        }
    })
    $("#registry").click(function (){
        var contentColor1 = $("#userNameCheckedPrompt").css("color");
        var contentColor2 = $("#passwordCheckedPrompt").css("color");
        var contentColor3 = $("#password2CheckedPrompt").css("color");
        if(contentColor1 !== "rgb(0, 128, 0)"||
            contentColor2 !== "rgb(0, 128, 0)"||
            contentColor3 !== "rgb(0, 128, 0)"){

            layer.msg("请根据提示重新输入信息！")

        }else{
            console.log("hello");
            $.ajax({
                url: "<%=basePath%>user?method=registry",
                data: $("#registryForm").serialize(),
                success:function (result){
                    var res = JSON.parse(result);
                    console.log(res);
                    if(res === false){
                        layer.msg("您的用户名已经存在！")
                    }else{
                        layer.msg("注册成功！",{
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
        }

    })
</script>
</body>
</html>