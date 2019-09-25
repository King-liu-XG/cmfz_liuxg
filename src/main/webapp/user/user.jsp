<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<style type="text/css">
    th {
        text-align: center
    }
</style>
<script>
</script>

<script>
    $(function () {
        $("#userid").jqGrid({
            url: '${path}/UserzAction/selectAllUserz',
            editurl: "${path}/BannerAction/operation", //增删改的路径
            datatype: "json",
            rowNum: 3, //每页展示条数
            rowList: [2, 3, 10, 20, 30], //可选展示条数
            pager: '#pjopts', //分页工具栏
            viewrecords: true, //是否显示总条数
            height: "auto",
            styleUI: "Bootstrap", //设置样式
            autowidth: true, //自动宽度
            colNames: ['id', '头像', '手机号', '密码', '盐', '状态', '姓名', '法名', '性别', '所在地', '签名', '注册时间', '上师id'],
            colModel: [
                {name: 'id', index: 'id', width: 55, align: "center"},
                {
                    name: 'avatar', editable: true, index: 'invdate', width: 90, align: "center",
                    edittype: "file",
                    formatter: function (cellvalue) {
                        return "<img src='${path}/user/UserImg/" + cellvalue + "' style='width:100px;height:80px'>"
                    }
                },
                {name: 'phone', editable: true, index: 'name asc, invdate', width: 100, align: "center"},
                {name: 'password', index: 'amount', width: 80, align: "center"},
                {name: 'salt', index: 'tax', width: 50, align: "center"},
                {
                    name: 'status', editable: true, index: 'total', width: 80, align: "center",
                    formatter: function (cellvalue, options, row) {
                        if (cellvalue == 1) {
                            return "<button onclick='updateStatus(\"" + row.id + "\",\"" + cellvalue + "\")' class='btn btn-success'>激活</button>"
                        } else {
                            return "<button class='btn btn-danger'  onclick='updateStatus(\"" + row.id + "\",\"" + cellvalue + "\")'>禁用</button>"
                        }
                    }
                },
                {name: 'name', index: 'tax', width: 50, align: "center"},
                {name: 'lawName', index: 'tax', width: 50, align: "center"},
                {name: 'sex', index: 'tax', width: 50, align: "center"},
                {name: 'city', index: 'tax', width: 50, align: "center"},
                {name: 'sign', index: 'tax', width: 50, align: "center"},
                {name: 'creaDate', index: 'tax', width: 50, align: "center"},
                {name: 'guruId', index: 'tax', width: 50, align: "center"}
            ]
        });
        $("#userid").jqGrid('navGrid', '#pjopts',
            {edit: false, add: false, del: false}
        );
    });

    function updateStatus(id, status) {
        if (status == 1) {
            $.ajax({
                url: "${path}/UserzAction/updateOneUserz",
                dataType: "json",
                type: "post",
                data: {"id": id, "status": 2},
                success: function (ss) {
                    //alert("hahah");
                    $("#userid").trigger("reloadGrid");
                }
            });
        } else {
            $.ajax({
                url: "${path}/UserzAction/updateOneUserz",
                dataType: "json",
                type: "post",
                data: {"id": id, "status": 1},
                success: function (ss) {
                    //alert("hahah");
                    $("#userid").trigger("reloadGrid");
                }
            });
        }
    }

    function exportz() {
        $.ajax({
            url:"${path}/UserzAction/exportUser",
            type:"post",
            dataType:"JSON",
            success:function () {
                
            }
        })
        
        //document.location.href = "/UserzAction/exportUser";
    }

    function bour() {
        var phone =  $("#inputajax").val();
        alert(phone);
        $.ajax({
            url:"${path}/verification/Verificationz",
            dataType:"json",
            data:"phone="+phone,
            type:"post",
        })

    }

    //验证验证码
    function bu() {
         var yanzheng = $("#inpuanzhnge").val();
        alert(yanzheng);
        $.ajax({
            url:"${path}/verification/yanzheng",
            dataType:"json",
            data:"code="+yanzheng,
            type:"post",
            success:function (code) {
                if(code.condition==200){
                    alert(code.describe);
                    $("#myModal").modal("hide");
                }else {
                    alert(code.describe);

                }
            }
        })
    }


</script>

<div scripts="panel panel-info">
    <div class="panel panel-heading">
        <h2 align="center">用户信息</h2>
    </div>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">用户信息</a>
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
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav ">
                                <div class="navbar-right">
                                    <button type="button" onclick="exportz()" class="btn btn-info navbar-btn">导出用户信息</button>
                                    <button type="button" class="btn btn-success navbar-btn">导入用户信息</button>
                                    <button type="button" class="btn btn-danger navbar-btn">用户分布图</button>
                                </div>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <div class="col-lg-3 navbar-form navbar-left">
                                    <div class="input-group">
                                        <input id="inputajax" type="text" class="form-control" placeholder="请输手机号" aria-label="...">
                                        <div class="input-group-btn">
                                            <button onclick="bour()" type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="modal" aria-haspopup="true"
                                                    aria-expanded="false" data-target="#myModal">发送验证码
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                    </div>

                    <table id="userid"/>
                    <div id="pjopts"/>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">...</div>
            <div role="tabpanel" class="tab-pane" id="messages">...</div>
            <div role="tabpanel" class="tab-pane" id="settings">...</div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" id="doi"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <input id="inpuanzhnge" type="text" class="form-control" placeholder="请输验证码" aria-label="...">
            </div>
            <div class="modal-footer">
                <button type="button" onclick="bu()" class="btn btn-default" >提交</button>
                <button type="button" id="dsa" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>