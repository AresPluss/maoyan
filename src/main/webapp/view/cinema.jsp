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
    <title>Title</title>
    <script src="<%=basePath%>js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/cinema.css">
</head>
<body>
    <%@include file="pageTitle.jsp"%>
    <input type="text" value="${requestScope.movie.id}" class="movieId" hidden>
    <div class="cinemaPage">
        <div class="title">
            <span>影院列表</span>
        </div>
        <c:forEach items="${requestScope.cinemaList}" var="cinema">
            <div class="cinema">
                <div class="content">
                    <span style="font-size: 20px;font-weight: bold">${cinema.name}</span>
                    <span>地址：${cinema.address}</span>
                    <div class="tag">
                        <c:forEach items="${cinema.tag.split(',')}" var="tag">
                            <span>${tag}</span>
                        </c:forEach>
                    </div>
                </div>
                <div class="price myFlex_x">
                    <span>￥</span>
                    <span>${requestScope.movie.discountPrice(cinema.discount)}</span>
                    <span>元</span>
                </div>
                <div class="buy myFlex_x">
                    <button data-cinema-id="${cinema.id}" data-movie-id="${requestScope.movie.id}" class="buyButton">特惠购票</button>
                </div>
            </div>
        </c:forEach>
        <div class="pageCurr myFlex_x" style="width: 100%;height: 100px">
            <div id="layuiPageCur"></div>
        </div>
    </div>
    <script>
        $(".buyButton").click(function (){
            var tag = $(this);
            var cinema_id = tag.attr("data-cinema-id");
            var movie_id = tag.attr("data-movie-id");
            console.log(cinema_id);
            window.open("<%=basePath%>showing?method=getShowingList&cinema_id="+cinema_id+"&movie_id="+movie_id);
        })

        var movieId = $(".movieId").val();
        layui.use('laypage', function(){
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'layuiPageCur' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: ${requestScope.cinemaTotal}
                ,limit: ${requestScope.pageLimit}
                ,curr: location.hash.replace('#!hash=', '') //获取起始页
                ,hash: 'hash' //自定义hash值
                ,jump: function(obj, first){
                    //obj包含了当前分页的所有参数，比如：
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数

                    //首次不执行
                    if(!first){
                        //do something
                        window.location.href="<%=basePath%>cinema?method=getCinemas&id="+movieId+"&curr="+obj.curr+"#!hash="+obj.curr;
                    }
                }
            });
        });
    </script>
</body>
</html>