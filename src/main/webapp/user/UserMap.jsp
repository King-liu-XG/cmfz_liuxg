<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<meta charset="utf-8">
<!-- 引入 echarts.js -->
<script src="${path}/js/echarts.min.js"></script>
<script type="text/javascript" src="${path}/js/china.js"></script>

<!--代码测试-->
<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>

<div scripts="panel panel-info">
    <div class="panel panel-heading">
        <h2 align="center">用户分布</h2>
    </div>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">用户分布</a>
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
                            channel: "liuKings",
                            onMessage: function (message) {

                                var data = JSON.parse(message.content);
                                // 基于准备好的dom，初始化echarts实例
                                var myChart = echarts.init(document.getElementById('main'));
                                var option = {
                                    title: {
                                        text: '每月用户注册量',
                                        subtext: '纯属虚构',
                                        left: 'center'
                                    },
                                    tooltip: {
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
                                        text: ['高', '低'],           // 文本，默认为数值文本
                                        calculable: true
                                    },
                                    toolbox: {
                                        show: true,
                                        orient: 'vertical',
                                        left: 'right',
                                        top: 'center',
                                        feature: {
                                            mark: {show: true},
                                            dataView: {show: true, readOnly: false},
                                            restore: {show: true},
                                            saveAsImage: {show: true}
                                        }
                                    },
                                    series: [{
                                        name: "五月",
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
                                            name: "六月",
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
                                            name: "七月",
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
                                            name: "八月",
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
                                            name: "九月",
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
                                            name: "十月",
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
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">...</div>
            <div role="tabpanel" class="tab-pane" id="messages">...</div>
            <div role="tabpanel" class="tab-pane" id="settings">...</div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${path}/UserzAction/mapUser",
            dataType: "json",
            success: function (sss) {
              console.log(sss);
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                var option = {
                    title: {
                        text: '每月用户注册量',
                        subtext: '纯属虚构',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: sss.months
                    },
                    visualMap: {
                        min: 0,
                        max: 10,
                        left: 'left',
                        top: 'bottom',
                        text: ['高', '低'],           // 文本，默认为数值文本
                        calculable: true
                    },
                    toolbox: {
                        show: true,
                        orient: 'vertical',
                        left: 'right',
                        top: 'center',
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    series: [{
                        name: "五月",
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
                        data: sss.listz.Mayz
                    },
                        {
                            name: "六月",
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
                            data: sss.listz.June
                        },
                        {
                            name: "七月",
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
                            data: sss.listz.July
                        },
                        {
                            name: "八月",
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
                            data: sss.listz.August
                        },
                        {
                            name: "九月",
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
                            data: sss.listz.Sep
                        },
                        {
                            name: "十月",
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
                            data: sss.listz.Oct
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        });
    });
</script>


