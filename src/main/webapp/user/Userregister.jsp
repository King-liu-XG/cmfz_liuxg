<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">

<!-- 引入 echarts.js -->
<script src="${path}/js/echarts.min.js"></script>
<!--代码测试-->
<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>

<div scripts="panel panel-info">
    <div class="panel panel-heading">
        <h2 align="center">用户统计</h2>
    </div>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">用户统计</a>
            </li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
            </li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab"
                                       data-toggle="tab">Messages</a></li>
            <li role="presentation"><a href="#settings" aria-controls="settings" role="tab"
                                       data-toggle="tab">Settings</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <div class="jumbotron">

                    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                    <div id="main" style="width: 600px;height:400px;"></div>
                    <script>
                        var goEasy = new GoEasy({
                                appkey: "BC-d9c93f073b14425c87d94b9ecc790efa"
                            }
                        );
                        goEasy.subscribe({
                            channel: "liuKing",
                            onMessage: function (message) {

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
                                        }],

                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            }
                        });
                    </script>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">...</div>
            <div role="tabpanel" class="tab-pane" id="messages">...</div>
            <div role="tabpanel" class="tab-pane" id="settings">...</div>
        </div>
    </div>
</div>
<script>
    $(function () {

        $.ajax({
            url: "${path}/UserzAction/registerUser",
            dataType: "JSON",
            success: function (data) {

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
                        }],
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        });


    });

</script>


