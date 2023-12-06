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
    <link rel="stylesheet" href="<%=basePath%>css/selectSeat.css">
    <script src="<%=basePath%>js/jquery-3.7.1.min.js"></script>
</head>

<body>
    <%@include file="pageTitle.jsp"%>
    <div class="selectSeat_page myFlex_x" data-showtimeId="${requestScope.showtimeId}">
        <div class="main myFlex_x">
            <div class="select">
                <div class="top myFlex_x">
                    <div class="myFlex_x">
                        <img src="<%=basePath%>img/blankSeat.png">
                        <span>可选座位</span>
                    </div>
                    <div class="myFlex_x">
                        <img src="<%=basePath%>img/redSeat.png">
                        <span>已售座位</span>
                    </div>
                    <div class="myFlex_x">
                        <img src="<%=basePath%>img/greenSeat.png">
                        <span>已选座位</span>
                    </div>
                </div>
                <div class="screen myFlex_y">
                    <img src="<%=basePath%>img/screen.png">
                    <div>银幕中央</div>
                </div>
                <div class="seat">
                    <table>
                        <c:forEach items="${requestScope.graph}" var="row" varStatus="r">
                            <tr>
                                <c:forEach items="${row}" var="e" varStatus="c">
                                    <td data-r="${r.index}" data-c="${c.index}" data-type="${e}">
                                        <c:if test="${e eq 0}">
                                            <img src="<%=basePath%>img/blankSeat.png">
                                        </c:if>
                                        <c:if test="${e eq 1}">
                                            <img src="<%=basePath%>img/redSeat.png">
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="content">
                <div class="title">
                    <img src="<%=basePath%>img/${requestScope.movie.movieImg}">
                    <div class="outer">
                        <div class="title">${requestScope.movie.movieName}</div>
                        <div style="margin-bottom: 5px">
                            <span class="tagTitle">类型：</span>
                            <c:forEach items="${requestScope.movie.type.split(',')}" var="tag">
                                <span>${tag} </span>
                            </c:forEach>
                        </div>
                        <div><span class="tagTitle">时长：</span>${requestScope.movie.lonTime}分钟</div>
                    </div>
                </div>
                <div class="details">
                    <div><span class="tagTitle">影院：</span>${requestScope.cinema.name}</div>
                    <div><span class="tagTitle">影厅：</span>${requestScope.room.roomName}</div>
                    <div><span class="tagTitle">版本：</span>国语2D</div>
                    <div><span class="tagTitle">场次：</span>${requestScope.showtime.startTime}</div>
                    <div><span class="tagTitle">票价：</span><span id="price"></span></div>
                </div>
                <div class="info">
                    <div class="seats">
                        <span>座位：</span>
                        <span id="remindMaxSix">一次做多选择4个座位</span>
                    </div>
                    <div class="myFlex_x" id="remind">请<span style="color: red">点击左侧</span>座位图选座</div>
                    <div id="totalPriceContent" style="margin-top: 40px;display: none">
                        <span>总价：</span>
                        <span style="color: red">￥</span>
                        <span id="totalPrice" style="font-size: 40px;color: red"></span>
                    </div>
                </div>
                <div class="button myFlex_x">
                    <button class="confirm" data-movieId="${requestScope.movie.id}" data-movieName="${requestScope.movie.movieName}">确认选座</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        var price = ${requestScope.movie.price * requestScope.cinema.discount * requestScope.showtime.discount};
        var roundPrice = parseFloat(price.toFixed(0));
        document.querySelector("#price").innerHTML = roundPrice + "元";


        var seatTotal = 0;
        var showtimeId = $(".selectSeat_page").attr("data-showtimeId");
        $("table td").click(function (){
            var type = $(this).attr("data-type");
            if(type == 0){
                if(seatTotal < 6){
                    $(this).children().attr("src","<%=basePath%>img/greenSeat.png");
                    $(this).attr("data-type",2);
                    seatTotal++;
                }else{
                    alert("最多选取6个座位");
                }
            }else if(type == 2){
                $(this).children().attr("src","<%=basePath%>img/blankSeat.png");
                $(this).attr("data-type",0);
                seatTotal--;
            }
            var totalPrice = roundPrice * seatTotal;
            $(".ticket").remove();
            if(totalPrice == 0){
                document.querySelector("#totalPriceContent").style.display = "none";
                document.querySelector("#remind").style.display = "flex";
                document.querySelector("#remindMaxSix").style.display = "inline";
            }else{
                document.querySelector("#totalPriceContent").style.display = "block";
                document.querySelector("#totalPrice").innerHTML = totalPrice+"";
                document.querySelector("#remind").style.display = "none";
                document.querySelector("#remindMaxSix").style.display = "none";

                var seats = getSeats();
                for (let i = 0; i < seats.length; i+=2) {
                    console.log(seats);
                    var seatPosition = document.createElement("span");
                    seatPosition.innerHTML = (parseInt(seats[i]) + 1) + "排" + (parseInt(seats[i+1]) + 1) + "坐";
                    seatPosition.style.border = "2px solid red";
                    seatPosition.style.padding = "10px";
                    seatPosition.style.borderRadius = "2px";
                    seatPosition.style.color = "red";
                    seatPosition.style.width = "150px";
                    seatPosition.style.marginRight = "10px";
                    seatPosition.className = "ticket myFlex_X";
                    document.querySelector(".seats").appendChild(seatPosition);
                }
            }
        })
        function getSeats() {
            // 初始化一个数组来存储结果
            var seats = new Array(seatTotal * 2);
            var temp = 0;
            // 使用选择器找到所有含有 data-type="2" 的 td 元素
            $("td[data-type='2']").each(function () {
                // 获取当前 td 元素的其他两个自定义属性值
                var row = parseInt($(this).attr("data-r"));
                var col = parseInt($(this).attr("data-c"));

                // 将结果存入数组
                seats[temp++] = row;
                seats[temp++] = col;
            });
            return seats;
        }
        $(".confirm").click(function (){
            var seats = getSeats();
            console.log(seats);
            if(seatTotal > 0){
                var movieId = $(".confirm").attr("data-movieId");
                var totalPrice = $("#totalPrice").text();
                var subject = $(".confirm").attr("data-movieName");
                window.location.href =
                    "<%=basePath%>payPage?method=doPay" +
                    "&showtimeId=" + showtimeId +
                    "&movieId=" + movieId +
                    "&totalPrice=" + totalPrice +
                    "&subject=" + subject +
                    "&seats=" + encodeURI(JSON.stringify(seats));



                <%--$.ajax({--%>
                <%--    url: "<%=basePath%>payPage?method=doPayTx",--%>
                <%--    data: {--%>
                <%--        showtimeId: showtimeId,--%>
                <%--        seats: JSON.stringify(seats),--%>
                <%--        movieId: movieId,--%>
                <%--        totalPrice: totalPrice,--%>
                <%--        subject: subject--%>
                <%--    },--%>
                <%--    success: function (response) {--%>
                <%--        // 处理成功响应--%>
                <%--        var result = JSON.parse(response);--%>
                <%--        console.log(result);--%>
                <%--        if(result === true){--%>
                <%--            alert("是否确认去支付？");--%>
                <%--            window.open("<%=basePath%>payPage?method=doPay" +--%>
                <%--                "&movieId=" + movieId +--%>
                <%--                "&totalPrice=" + totalPrice +--%>
                <%--                "&subject=" + subject);--%>
                <%--            setTimeout(function() {--%>
                <%--                alert("Message");--%>
                <%--                location.reload();--%>
                <%--            }, 2000);--%>
                <%--        }else{--%>
                <%--            alert("购买座位失败！");--%>
                <%--        }--%>
                <%--    },--%>
                <%--})--%>
            }else{
                alert("请先选择座位！");
            }
        })
    </script>
</body>
</html>