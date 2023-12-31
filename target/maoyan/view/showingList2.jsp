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
                <th>放映厅</th>
                <th>语言版本</th>
                <th>放映时间</th>
                <th>售价（元）</th>
                <th>选座购票</th>
            </tr>
            <c:forEach items="${requestScope.showingList}" var="list">
                <tr>
                    <td>${list[0].roomName}</td>
                    <td>国语2D</td>
                    <td>
                        <select class="startTimeSelect" onchange="updatePrice(this, ${requestScope.movie.price}, ${requestScope.cinema.discount})">
                            <c:forEach items="${list}" var="tag">
                                <option data-discount="${tag.discount}">
                                        ${String.format("%02d",tag.startTime.toLocalDateTime().getHour())}
                                            :${String.format("%02d",tag.startTime.toLocalDateTime().getMinute())}
                                        — ${String.format("%02d",tag.startTime.toLocalDateTime().plusMinutes(requestScope.movie.lonTime).getHour())}
                                            :${String.format("%02d",tag.startTime.toLocalDateTime().plusMinutes(requestScope.movie.lonTime).getMinute())}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                    <td style="font-size: 18px;color: red;font-weight: bold" class="priceSpan">￥${String.format("%.0f", requestScope.movie.price * list[0].discount * requestScope.cinema.discount)}</td>
                    <td><button style="padding: 3px">选座购票</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script>
        // 使用 JavaScript 监听下拉菜单变化事件
        // 入参：当前选中的标签，电影原价，影院折扣
        function updatePrice(selectElement, price, discountForCinema) {
            // 对于每个选项设定动态的专属的隐式参数，根据当前选项的index获取该场次折扣
            var discount = selectElement.options[selectElement.selectedIndex].getAttribute("data-discount");
            // 定位到最近的tr标签，也就是行标签，再根据class名字定位到其中的价格标签
            var priceSpan = selectElement.closest("tr").querySelector(".priceSpan");
            // 使用 JavaScript 获取相应的价格，并更新显示
            var updatedPrice = price * discountForCinema * discount;
            // 修改价格
            priceSpan.innerHTML = "￥" + updatedPrice.toFixed(0);
        }
    </script>
</body>
</html>