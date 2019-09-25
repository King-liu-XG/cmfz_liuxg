<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">
<!-- 引入 echarts.js -->
<script src="${path}/js/echarts.min.js"></script>
<script src="${path}/js/jquery.min.js"></script>
<!--代码测试-->
<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>


<script>
    $(function () {
        $.ajax({
            url: "${path}/UserzAction/registerUser",
            dataType: "JSON",
            success: function (data) {
                //alert(data);
                //ss = data.monthz;
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '近6个月用户注册量'
                    },
                    tooltip: {},
                    legend: {
                        data: ['男孩', '女孩']
                    },
                    xAxis: {
                        data: data.monthz
                    },
                    yAxis: {},
                    series: [{
                        name: '男孩',
                        type: 'bar',
                        data: data.boy
                    },
                        {
                            name: '女孩',
                            type: 'bar',
                            data: data.girl
                        }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        });


    });

</script>

<div id="main" style="width: 600px;height:400px;"></div>


<script>
    var goEasy = new GoEasy({
            appkey: "BC-d9c93f073b14425c87d94b9ecc790efa"
        }
    );
    goEasy.subscribe({
        channel: "liuKing",
        onMessage: function (message) {
            alert("haha");

            var data = JSON.parse(message.content);

            //alert("Channel:" + message.channel + " content:" + message.content);

            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '近6个月用户注册量'
                },
                tooltip: {},
                legend: {
                    data: ['男孩', '女孩']
                },
                xAxis: {
                    data: data.monthz
                },
                yAxis: {},
                series: [{
                    name: '男孩',
                    type: 'bar',
                    data: data.boy
                },
                    {
                        name: '女孩',
                        type: 'bar',
                        data: data.girl
                    }]

            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

        }
    });

</script>