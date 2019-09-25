<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    th {
        text-align: center
    }
</style>

<script type="application/javascript">
    $(function () {
        $("#bannerid").jqGrid(
            {
                url: '${path}/BannerAction/selectBanner',
                editurl: "${path}/BannerAction/operation", //增删改的路径
                datatype: "json",
                rowNum: 3, //每页展示条数
                rowList: [2, 3, 10, 20, 30], //可选展示条数
                pager: '#pjopt', //分页工具栏
                viewrecords: true, //是否显示总条数
                height: "auto",
                styleUI: "Bootstrap", //设置样式
                autowidth: true, //自动宽度

                colNames: ['id', '名称', '图片', '状态', '上传时间', '描述'],
                colModel: [
                    {name: 'id', index: 'id', width: 55, align: "center"},
                    {name: 'name', editable: true, index: 'invdate', width: 90, align: "center"},
                    {
                        name: 'path',
                        editable: true,
                        index: 'name asc, invdate',
                        width: 100,
                        align: "center",
                        edittype: "file",
                        formatter: function (cellvalue) {
                            return "<img src='${path}/BannerImg/" + cellvalue + "' style='width:100px;height:80px'>"
                        }
                    },
                    {
                        name: 'status', index: 'amount', width: 80, align: "center",
                        formatter: function (cellvalue,options,row) {
                            if (cellvalue == 1) {
                                return "<button onclick='updateStatus(\""+row.id+"\",\""+cellvalue+"\")' class='btn btn-success'>激活</button>"
                            } else {
                                return "<button class='btn btn-danger'  onclick='updateStatus(\""+row.id+"\",\""+cellvalue+"\")'>禁用</button>"
                            }
                        }
                    },
                    {
                        name: 'uploadingDate', index: 'tax', width: 80, align: "center"

                    },
                    {name: 'describez', editable: true, index: 'total', width: 80, align: "center"},
                ]
            });
        $("#bannerid").jqGrid('navGrid', '#pjopt',
            {
                edit: true,
                add: true,
                del: true,
                addtext: "添加",
                deltext: "删除",
                edittext: "修改"
            },
            {
                closeAfterEdit: true,
                afterSubmit: function (data) {
                    $.ajaxFileUpload({
                        url: "${path}/BannerAction/bannerUpload",
                        datatype: "json",
                        fileElementId: "path",//需要上传的文件域的ID
                        type: "post",
                        data: {id:data.responseText},
                        success:function (dhsad) {
                            //刷新页面
                           // $("#bannerid").jqGrid("clearGridData");
                            $("#bannerid").trigger("reloadGrid");
                        }
                    });
                    return "ss77";
                }

            }, //执行修改操作
            {
                closeAfterAdd: true,
                afterSubmit: function (data) {
                    //alert("hahah");
                    $.ajaxFileUpload({
                        url: "${path}/BannerAction/bannerUpload",
                        datatype: "json",
                        fileElementId: "path",//需要上传的文件域的ID
                        type: "post",
                        data: {id: data.responseText},
                        success:function (dsad) {
                            //刷新页面
                           // $("#bannerid").jqGrid("clearGridData");
                            $("#bannerid").trigger("reloadGrid");
                        }
                    });
                    return "ssss";
                }
            }, //执行添加操作
            {} //执行删除操作
        );
    });

    function updateStatus(id,status) {

        if(status==1){
            $.ajax({
                    url: "${path}/BannerAction/updateOne",
                    dataType:"json",
                    type:"post",
                    data:{"id":id,"status":2},
                    success:function(ss){
                        //alert("hahah");
                        $("#bannerid").trigger("reloadGrid");
                    }
                }
            );
        }else {
            $.ajax({
                    url: "${path}/BannerAction/updateOne",
                    dataType:"json",
                    type:"post",
                    data:{"id":id,"status":1},
                    success:function(ss){
                        //alert("hahah");
                        $("#bannerid").trigger("reloadGrid");
                    }
                }
            );
        }
    }
</script>

<div scripts="panel panel-info">
    <div class="panel panel-heading">
        <h2 align="center">轮播图信息</h2>
    </div>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">轮播图信息</a>
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
                    <table id="bannerid"/>
                    <div id="pjopt"/>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">...</div>
            <div role="tabpanel" class="tab-pane" id="messages">...</div>
            <div role="tabpanel" class="tab-pane" id="settings">...</div>
        </div>

    </div>
</div>