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
                <div class="screen">

                </div>
                <div class="seat">
                    <table border="1px" cellpadding="5px">
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
                <div class="button myFlex_x">
                    <button class="confirm">确认选座</button>
                </div>
            </div>
        </div>
    </div>
    <script>
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
        })
        $(".confirm").click(function (){
            // 初始化一个数组来存储结果
            var seats = new Array(seatTotal * 2);
            var temp = 0;
            // 使用选择器找到所有含有 data-type="2" 的 td 元素
            $("td[data-type='2']").each(function () {
                // 获取当前 td 元素的其他两个自定义属性值
                var row = $(this).attr("data-r");
                var col = $(this).attr("data-c");

                // 将结果存入数组
                seats[temp++] = row;
                seats[temp++] = col;
            });
            // 使用ajax处理将座位数据更新到后端
            $.ajax({
                url: "<%=basePath%>selectSeat?method=submitSelect",
                data: {showtimeId: showtimeId, seats: JSON.stringify(seats)},
                success: function (response) {
                    // 处理成功响应
                    var result = JSON.parse(response);
                    console.log(result);
                    if(result === true){
                        alert("购买座位成功！");
                        parent.location.reload();
                    }else{
                        alert("购买座位失败！");
                    }
                },
            })

        })
    </script>
</body>
</html>