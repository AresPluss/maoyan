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
    <link rel="stylesheet" href="<%=basePath%>css/showingList.css">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
    <script src="<%=basePath%>layui/layui.js"></script>
    <script src="<%=basePath%>js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <%@include file="pageTitle.jsp"%>
    <div class="timeListPage">
        <div class="title">
            <div class="head">
                <span class="name" style="margin-right: 35px;">${requestScope.movie.movieName}</span>
                <span class="score" style="margin-right: 3px;color: orange">9.6</span>
                <span style="font-size: 20px;color: orange">分</span>
            </div>
            <div class="content">
                <span class="title">时长：</span><span>${requestScope.movie.lonTime}分钟</span>
                <span class="title">类型：</span>
                <span>
                    <c:forEach items="${requestScope.movie.type.split(',')}" var="tag">
                        ${tag}
                    </c:forEach>
                </span>
                <span class="title">主演：</span>
                <span>
                    <c:forEach items="${requestScope.movie.leadingRoles.split(',')}" var="role">
                        ${role}
                    </c:forEach>
                </span>
            </div>
        </div>
        <div class="dayOption">
            <span style="margin-right: 10px;color: gray">观影时间：</span>
            <div style="margin-right: 20px">今天 11月4日</div>
            <div style="margin-right: 10px">周日 11月5日</div>
        </div>

        <table>
            <tr>
                <th>放映时间</th>
                <th>语言版本</th>
                <th>放映厅</th>
                <th>售价（元）</th>
                <th>选座购票</th>
            </tr>
            <c:forEach items="${requestScope.showingList}" var="tag">
                <tr>
                    <td><span style="font-size: 20px;font-weight: bold">${String.format("%02d",tag.startTime.getHour())}:${String.format("%02d",tag.startTime.getMinute())}</span><br>
                        <span style="font-size: 10px">${String.format("%02d",tag.startTime.plusMinutes(requestScope.movie.lonTime).getHour())}:${String.format("%02d",tag.startTime.plusMinutes(requestScope.movie.lonTime).getMinute())}散场</span></td>
                    <td>国语2D</td>
                    <td>${tag.roomName}</td>
                    <td style="font-size: 18px;color: red;font-weight: bold">￥${String.format("%.0f", requestScope.movie.price * tag.discount * requestScope.cinema.discount)}</td>
                    <td><button class="buy" data-id="${tag.id}" style="padding: 3px">选座购票</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script>
        $(".buy").click(function () {
            var showtimeId = $(this).attr("data-id");
            window.open("<%=basePath%>selectSeat?method=getRoomDetails&showtime_id=" + showtimeId);
        })
    </script>
</body>
</html>