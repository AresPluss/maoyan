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
    <link rel="stylesheet" href="<%=basePath%>css/cinema.css">
</head>
<body>
    <%@include file="pageTitle.jsp"%>
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
                    <button>特惠购票</button>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>