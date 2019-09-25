<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script charset="utf-8" src="${path}/editor/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/editor/kindeditor/lang/zh-CN.js"></script>
<script>
    KindEditor.create('#editor_id', {
        uploadJson: '${path}/Editor/uploadImg', //指定文件上传的路径
        fileManagerJson: '${path}/Editor/returnPhoto',//指定浏览远程图片的路径
        allowFileManager: true, //是否展示浏览器远程图片按钮
        //filePostName:"photo", --设置文件上传的名称
        afterBlur:function () { //在kindeditor失去焦点之后执行的内容
            this.sync();//将kindeditor中的内容同步到表单
        }
    });

</script>


<style type="text/css">
    th {
        text-align: center
    }

</style>

<script>

    $(function () {
        $("#sectionid").jqGrid(
            {
                url: '${path}/ArticleAction/selectAllArticle',
                editurl: "${path}/ArticleAction/delectOneArticle", //增删改的路径
                datatype: "json",
                rowNum: 3, //每页展示条数
                rowList: [2, 3, 10, 20, 30], //可选展示条数
                pager: '#pjopt', //分页工具栏
                viewrecords: true, //是否显示总条数
                height: "auto",
                styleUI: "Bootstrap", //设置样式
                autowidth: true, //自动宽度

                colNames: ['id', '标题', '作者', '内容', '发布时间', '上师id', '封面图片', '状态'],
                colModel: [
                    {name: 'id', index: 'id', width: 55, align: "center"},
                    {name: 'title', editable: true, index: 'invdate', width: 90, align: "center"},
                    { name: 'author', editable: true, index: 'name asc, invdate',
                        width: 100,
                        align: "center"

                    },
                    {name: 'content', index: 'amount', width: 80, align: "center"},
                    {name: 'creaDate', index: 'tax', width: 80, align: "center"},
                    {name: 'guruId', editable: true, index: 'total', width: 80, align: "center"},
                    { name: 'cover', editable: true, index: 'name asc, invdate', width: 100,
                        align: "center", edittype: "file",
                        formatter: function (cellvalue) {
                            return "<img src='${path}/section/sectionImg/" + cellvalue + "' style='width:100px;height:80px'>"
                        }

                    },
                    { name: 'status', index: 'amount', width: 80, align: "center",
                        formatter: function (cellvalue, options, row) {
                            if (cellvalue == 1) {
                                return "<button onclick='updateStatus(\"" + row.id + "\",\"" + cellvalue + "\")' class='btn btn-success'>激活</button>"
                            } else {
                                return "<button class='btn btn-danger'  onclick='updateStatus(\"" + row.id + "\",\"" + cellvalue + "\")'>禁用</button>"
                            }
                        }
                    },

                ]
            });

        $("#sectionid").jqGrid('navGrid', '#pjopt',
            {edit: false, add: false, del: true, deltext: "删除"},
            {} //执行删除操作
        );

    });

    function updateStatus(id, status) {
        if (status == 1) {
            $.ajax({
                url: "${path}/ArticleAction/updateOneArticle",
                dataType: "json",
                type: "post",
                data: {"id": id, "status": 2},
                success: function (ss) {
                    //alert("hahah");
                    $("#sectionid").trigger("reloadGrid");
                }
            });
        } else {
            $.ajax({
                url: "${path}/ArticleAction/updateOneArticle",
                dataType: "json",
                type: "post",
                data: {"id": id, "status": 1},
                success: function (ss) {
                    //alert("hahah");
                    $("#sectionid").trigger("reloadGrid");
                }
            });
        }
    }

    function del() {
        //id="del_sectionid"
        //alert("hahah");
        $("#del_sectionid").click();
    }

    //添加
    function addArticle() {

        //清空表单
        $("#Myform")[0].reset();
        //清空kindeditor
        KindEditor.html("#editor_id","");
        $("#imgz").html("");
        $('#myModal').modal('show');
        $("#buttonz").html("<button type='button' onclick='addArticlez()' class='btn btn-default'>添加</button>" +
            "<button type='button' class='btn btn-primary' data-dismiss='modal'>关闭</button>")

    }

    //查看以及修改
    function lookArticle() {

        var  rowI = $("#sectionid").jqGrid("getGridParam","selrow");//只读属性,最后选择行的id
        if(rowI != null){
            //根据行id获取一行数据
            var row = $("#sectionid").jqGrid("getRowData",rowI);
            //给input 框设置值
            $("#title").val(row.title);
            $("#author").val(row.author);

            //给富文本编辑器设置值
            KindEditor.html("#editor_id",row.content);

            $("#imgz").html("封面:&nbsp;&nbsp;&nbsp;&nbsp;"+row.cover);
            $('#myModal').modal('show');
            $("#buttonz").html("<button type='button' onclick='updaetArticlez(\""+rowI+"\")' class='btn btn-default'>修改</button>" +
                "<button type='button' class='btn btn-primary' data-dismiss='modal'>关闭</button>")

        }else {
            alert("请选择一行");
        }


    }
</script>


<div scripts="panel panel-info">
    <div class="panel panel-heading">
        <h2 align="center">文章信息</h2>
    </div>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">文章信息</a>
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
                                    <button type="button" onclick="lookArticle()" class="btn btn-info navbar-btn">文章信息</button>
                                    <button type="button" onclick="addArticle()" class="btn btn-success navbar-btn">
                                        添加文章
                                    </button>
                                    <button type="button" class="btn btn-danger navbar-btn" onclick="del()">删除文章
                                    </button>
                                </div>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <div class="col-lg-3 navbar-form navbar-left">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="请输搜索内容" aria-label="...">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">点击搜索<span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                    </div>


                    <table id="sectionid"/>
                    <div id="pjopt"/>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">...</div>
            <div role="tabpanel" class="tab-pane" id="messages">...</div>
            <div role="tabpanel" class="tab-pane" id="settings">...</div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" align="center" style="width:730px;">
            <!--模态框标题-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加文章</h4>
            </div>
            <!--模态框内容-->
            <div class="modal-body" >
                <form id="Myform" >

                    <div class="input-group" style="width: 300px">
                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-file"
                                                                                aria-hidden="true">标题</span></span>
                        <input id="title" type="text" name="title" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>

                    </br>
                    <div class="input-group" style="width: 300px">
                        <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-pencil"
                                                                                aria-hidden="true">作者</span></span>
                        <input id="author" type="text" name="author" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>

                    <div id="imgz" class="input-group" style="width: 300px">

                    </div>

                    <div class="form-group" style="width: 300px">
                        <label for="exampleInputFile">选择图片</label>
                        <input type="file" id="file" name="coverPhoto" id="exampleInputFile">
                    </div>

                    <div align="center">
                        <textarea id="editor_id" name="content" style="width:700px;height:300px;"></textarea>
                    </div>


                </form>
            </div>
            <!--模态框按钮-->
            <div class="modal-footer" id="buttonz">
                <%--<button type="button" onclick="addArticlez()" class="btn btn-default">添加</button>--%>
                <%--<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>--%>

            </div>
        </div>
    </div>
</div>

<script type="application/javascript">
    function addArticlez() {
        console.log("hahah");
        var formData = new FormData($("#Myform")[0]);
        $.ajax({
            url:"${path}/ArticleAction/addOneArticle",
            dataType:"Json",
            data:formData,
            type:"post",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function () {
                //关闭模态框
                $("#myModal").modal("hide");
                //刷新页面
                $("#sectionid").trigger("reloadGrid");
            }

        })
    }

    //修改
    function updaetArticlez(rowI) {
        console.log("hahah");
        var formData = new FormData($("#Myform")[0]);
        $.ajax({
            url:"${path}/ArticleAction/updateOneArticle?id="+rowI,
            dataType:"Json",
            data:formData,
            type:"post",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function () {
                //关闭模态框
                $("#myModal").modal("hide");
                //刷新页面
                $("#sectionid").trigger("reloadGrid");
            }

        })
    }

</script>