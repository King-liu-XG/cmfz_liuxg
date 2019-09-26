<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/js/jquery.min.js"></script>
<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>持明法州后台管理系统</title>
    <link rel="icon" href="${path}/bootstrap/img/arrow-up.png" type="image/x-icon">
    <link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css">

    <%--引入jqgrid中主题css--%>
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/css/css/hot-sneaks/jquery-ui-1.8.16.custom.css">
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/boot/css/trirand/ui.jqgrid-bootstrap.css">
    <%--引入js文件--%>
    <script src="${path}/bootstrap/js/jquery.min.js"></script>
    <script src="${path}/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/bootstrap/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script src="${path}/bootstrap/jqgrid/boot/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="${path}/bootstrap/js/ajaxfileupload.js"></script>

    <style type="text/css">
        body{
            background-image: url("${path}/bootstrap/img/1216326c2f6d37a4157614454a686a2b.jpg");
        }


    </style>
    <script type="application/javascript">

    </script>
</head>
<body>
<%--<h1 align="center">什么都没有了,全靠你们造啦O(∩_∩)O哈哈~</h1>--%>

<!--顶部导航-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">持名法洲管理系统</a>
        </div>


        <ul class="nav navbar-nav navbar-right">
            <li id="ii" onclick="">
                <audio id="ddas" controls  src='${path}/mp3/般禅梵唱妙音组-大悲咒.mp3' />
            </li>
            <li><a href="#">欢迎:小黑</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">退出登入<span class="glyphicon glyphicon-log-out"></span>
                </a>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!--栅格系统-->
<div class="container-fluid">
    <div class="row">
        <!--左边手风琴部分-->
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">



            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-info">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title" align="center">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne"
                               aria-expanded="true" aria-controls="collapseOne">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse " role="tabpanel"
                         aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" class="active"><a align="center" href="javascript:$('#mianId').load('${path}/user/user.jsp')">用户信息</a></li>
                                <li role="presentation" class="active"><a align="center" href="javascript:$('#mianId').load('${path}/user/Userregister.jsp')">用户统计</a></li>
                                <li role="presentation" class="active"><a align="center" href="javascript:$('#mianId').load('${path}/user/UserMap.jsp')">用户分布</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <nr/>
                </div>


                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title" align="center">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                轮播图管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse " role="tabpanel"
                         aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" class="active"><a align="center" href="javascript:$('#mianId').load('${path}/banner/banner.jsp')">轮播图信息</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <nr/>
                </div>

                <div class="panel panel-warning">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title" align="center">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                专辑管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" class="active"><a align="center" href="javascript:$('#mianId').load('${path}/album/album.jsp')">专辑信息</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <nr/>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="heading4">
                        <h4 class="panel-title" align="center">
                            <a class="collapsed " role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse4" aria-expanded="false"
                               aria-controls="collapse4">
                                文章管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="heading4">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" class="active"><a align="center" href="javascript:$('#mianId').load('${path}/section/section.jsp')">文章信息</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <nr/>
                </div>

                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="heading5">
                        <h4 class="panel-title" align="center">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse5" aria-expanded="false" aria-controls="collapse5">
                                上师管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapse5" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="heading5">
                        <div class="panel-body">
                            Anim pariatur cliche reprehenderit,
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <nr/>
                </div>

                <div class="panel panel-warning">
                    <div class="panel-heading" role="tab" id="heading6">
                        <h4 class="panel-title" align="center">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse6" aria-expanded="false" aria-controls="collapse6">
                                管理员管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapse6" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="heading6">
                        <div class="panel-body">
                            Anim pariatur cliche reprehenderit,
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--栅格系统-->
        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10" id="mianId">
            <!--巨幕开始-->

            <div class="jumbotron">
                <h2>欢迎来到持名法洲后台管理系统</h2>
                <p>...</p>
            </div>

            <!--右边轮播图部分-->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="${path}/bootstrap/img/shouye.jpg" alt="...">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/bootstrap/img/2.png " height="800%" width="57.7%" alt="...">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/bootstrap/img/1.png " width="536px" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <img src="${path}/bootstrap/img/3.png " width="536px" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="${path}/bootstrap/img/4.png" height="1072" width="536px" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <h5 align="center">&copy;百知教育cmfz@xiuxg.com</h5>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button"
                   data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button"
                   data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>


            </div>
        </div>
    </div>
</div>


<!--页脚-->
<script type="application/javascript">
    $("#ddas").attr("autoplay","autoplay");
    $("#ddas").click();
</script>






</body>
</html>
