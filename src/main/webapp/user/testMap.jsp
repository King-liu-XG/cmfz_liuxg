<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">
<!-- 引入 echarts.js -->
<script src="${path}/js/echarts.min.js"></script>
<script type="text/javascript" src="${path}/js/china.js"></script>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>


<!--代码测试-->
<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>

<%--<script>--%>
    <%--$(function () {--%>
        <%--$.ajax({--%>
            <%--url: "${path}/UserzAction/mapUser",--%>
            <%--dataType: "json",--%>
            <%--success: function (sss) {--%>
                <%--// 基于准备好的dom，初始化echarts实例--%>
                <%--var myChart = echarts.init(document.getElementById('main'));--%>
                <%--var option = {--%>
                    <%--title: {--%>
                        <%--text: '每月用户注册量',--%>
                        <%--subtext: '纯属虚构',--%>
                        <%--left: 'center'--%>
                    <%--},--%>
                    <%--tooltip: {--%>
                        <%--trigger: 'item'--%>
                    <%--},--%>
                    <%--legend: {--%>
                        <%--orient: 'vertical',--%>
                        <%--left: 'left',--%>
                        <%--data: sss.months--%>
                    <%--},--%>
                    <%--visualMap: {--%>
                        <%--min: 0,--%>
                        <%--max: 10,--%>
                        <%--left: 'left',--%>
                        <%--top: 'bottom',--%>
                        <%--text: ['高', '低'],           // 文本，默认为数值文本--%>
                        <%--calculable: true--%>
                    <%--},--%>
                    <%--toolbox: {--%>
                        <%--show: true,--%>
                        <%--orient: 'vertical',--%>
                        <%--left: 'right',--%>
                        <%--top: 'center',--%>
                        <%--feature: {--%>
                            <%--mark: {show: true},--%>
                            <%--dataView: {show: true, readOnly: false},--%>
                            <%--restore: {show: true},--%>
                            <%--saveAsImage: {show: true}--%>
                        <%--}--%>
                    <%--},--%>
                    <%--series: [{--%>
                        <%--name: "五月",--%>
                        <%--type: 'map',--%>
                        <%--mapType: 'china',--%>
                        <%--roam: false,--%>
                        <%--label: {--%>
                            <%--normal: {--%>
                                <%--show: false--%>
                            <%--},--%>
                            <%--emphasis: {--%>
                                <%--show: true--%>
                            <%--}--%>
                        <%--},--%>
                        <%--data: sss.listz.Mayz--%>
                    <%--},--%>
                        <%--{--%>
                            <%--name: "六月",--%>
                            <%--type: 'map',--%>
                            <%--mapType: 'china',--%>
                            <%--label: {--%>
                                <%--normal: {--%>
                                    <%--show: false--%>
                                <%--},--%>
                                <%--emphasis: {--%>
                                    <%--show: true--%>
                                <%--}--%>
                            <%--},--%>
                            <%--data: sss.listz.June--%>
                        <%--},--%>
                        <%--{--%>
                            <%--name: "七月",--%>
                            <%--type: 'map',--%>
                            <%--mapType: 'china',--%>
                            <%--label: {--%>
                                <%--normal: {--%>
                                    <%--show: false--%>
                                <%--},--%>
                                <%--emphasis: {--%>
                                    <%--show: true--%>
                                <%--}--%>
                            <%--},--%>
                            <%--data: sss.listz.July--%>
                        <%--},--%>
                        <%--{--%>
                            <%--name: "八月",--%>
                            <%--type: 'map',--%>
                            <%--mapType: 'china',--%>
                            <%--label: {--%>
                                <%--normal: {--%>
                                    <%--show: false--%>
                                <%--},--%>
                                <%--emphasis: {--%>
                                    <%--show: true--%>
                                <%--}--%>
                            <%--},--%>
                            <%--data: sss.listz.August--%>
                        <%--},--%>
                        <%--{--%>
                            <%--name: "九月",--%>
                            <%--type: 'map',--%>
                            <%--mapType: 'china',--%>
                            <%--label: {--%>
                                <%--normal: {--%>
                                    <%--show: false--%>
                                <%--},--%>
                                <%--emphasis: {--%>
                                    <%--show: true--%>
                                <%--}--%>
                            <%--},--%>
                            <%--data: sss.listz.Sep--%>
                        <%--},--%>
                        <%--{--%>
                            <%--name: "十月",--%>
                            <%--type: 'map',--%>
                            <%--mapType: 'china',--%>
                            <%--label: {--%>
                                <%--normal: {--%>
                                    <%--show: false--%>
                                <%--},--%>
                                <%--emphasis: {--%>
                                    <%--show: true--%>
                                <%--}--%>
                            <%--},--%>
                            <%--data: sss.listz.Oct--%>
                        <%--}--%>
                    <%--]--%>
                <%--};--%>
                <%--// 使用刚指定的配置项和数据显示图表。--%>
                <%--myChart.setOption(option);--%>


            <%--}--%>

        <%--});--%>
    <%--});--%>

<%--</script>--%>

    <div id="main" style="width: 600px;height:400px;"></div>
    <script>
            var goEasy = new GoEasy({
                    appkey: "BC-d9c93f073b14425c87d94b9ecc790efa"
                }
            );
            goEasy.subscribe({
                channel: "liuKings",
                onMessage: function (message) {
                    var data = JSON.parse(message.content);
                    // alert(data.list.June);
                    // 基于准备好的dom，初始化echarts实例
                    console.log(data);
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main'));

                    var option = {
                        title : {
                            text: '每月用户注册量',
                            subtext: '纯属虚构',
                            left: 'center'
                        },
                        tooltip : {
                            trigger: 'item'
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: data.months
                        },
                        visualMap: {
                            min: 0,
                            max: 10,
                            left: 'left',
                            top: 'bottom',
                            text:['高','低'],           // 文本，默认为数值文本
                            calculable : true
                        },
                        toolbox: {
                            show: true,
                            orient : 'vertical',
                            left: 'right',
                            top: 'center',
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },

                        series : [
                            {
                                name: '五月',
                                type: 'map',
                                mapType: 'china',
                                roam: false,
                                label: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data: data.listz.Mayz
                            },
                            {
                                name: '六月',
                                type: 'map',
                                mapType: 'china',
                                label: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data: data.listz.June
                            },
                            {
                                name: '七月',
                                type: 'map',
                                mapType: 'china',
                                label: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data: data.listz.July
                            },
                            {
                                name: '八月',
                                type: 'map',
                                mapType: 'china',
                                label: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data: data.listz.August
                            },
                            {
                                name: '九月',
                                type: 'map',
                                mapType: 'china',
                                label: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data: data.listz.Sep
                            },
                            {
                                name: '十月',
                                type: 'map',
                                mapType: 'china',
                                label: {
                                    normal: {
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                data: data.listz.Oct
                            }
                        ]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                }
            });

   </script>





