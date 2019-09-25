<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style type="text/css">
    th {
        text-align: center
    }

    .btn-audio{
        margin: 90px auto;
        width: 186px;
        height: 186px;
        /*background:url("<span class='glyphicon glyphicon-step-backward btn-lg' aria-hidden='true'/>") no-repeat center bottom;*/
        background-size:cover;
    }
</style>
<script type="application/javascript">
    $(function () {
        $("#albunid").jqGrid(
            {
                url: '${path}/AlbumAction/selectAlbum',
                editurl: "${path}/AlbumAction/addOneAlbum", //增删改的路径
                autowidth: true, //自动宽度
                datatype: "json",
                height: "auto",
                rowNum: 4,
                rowList: [4, 8, 10, 20, 30],
                pager: '#pjoptz',
                viewrecords: true,//展示总条数
                styleUI: "Bootstrap", //设置样式
                subGrid: true, //是否开启子表格
                colNames: ['id', '标题', '封面', '作者', '评分', '播音', '集数', '内容', '发布时间'],
                colModel: [
                    {name: 'id', width: 55, align: "center"},
                    {name: 'title', editable: true, align: "center", width: 90},
                    {
                        name: 'cover', editable: true, align: "center", width: 100, edittype: "file",
                        formatter: function (cellvalue) {
                            return "<img src='${path}/AlbumImg/" + cellvalue + "' style='width:100px;height:80px'>"
                        }
                    },
                    {name: 'author', editable: true, align: "center", width: 80},
                    {name: 'score', editable: true, align: "center", width: 80},
                    {name: 'broadcast', editable: true, align: "center", width: 80},
                    {name: 'count', align: "center", width: 50, sortable: false},
                    {name: 'content', editable: true, align: "center", width: 150, sortable: false},
                    {name: 'creaDate', align: "center", width: 80}

                ],                 //subgrid_id是在表数据中创建的div标签的id
                subGridRowExpanded: function (subgrid_id, row_id) { //subgrid_id 子表格ID  row_id 每行的ID
                    //开启子表格
                    addSubGrid(subgrid_id, row_id);
                }
            });
        //处理增删该查的方法
        $("#albunid").jqGrid('navGrid','#pjoptz',
            {edit: true,add: true,del: true,
                addtext: "添加",
                deltext: "删除",
                edittext: "修改"
            },
            {
                closeAfterEdit: true,
                afterSubmit: function (data) {
                    //alert(data);
                    $.ajaxFileUpload({
                        url: "${path}/AlbumAction/updatePaperss",
                        datatype: "json",
                        fileElementId: "cover",//需要上传的文件域的ID
                        type: "post",
                        data: {id: data.responseText},
                        success: function (dhsad) {
                            //刷新页面
                            // $("#bannerid").jqGrid("clearGridData");
                            //alert("hahah");
                            $("#albunid").trigger("reloadGrid");
                        }
                    });
                    return "ss77";
                }
            },
            {
                closeAfterAdd: true,
                afterSubmit: function (data) {
                    //alert(data);
                    $.ajaxFileUpload({
                        url: "${path}/AlbumAction/updatePaperss",
                        datatype: "json",
                        fileElementId: "cover",//需要上传的文件域的ID
                        type: "post",
                        data: {id: data.responseText},
                        success: function (dhsad) {
                            //刷新页面
                            // $("#bannerid").jqGrid("clearGridData");
                            $("#albunid").trigger("reloadGrid");
                        }
                    });
                    return "ss77";
                }//添加方法
            },
            {}//修改方法
        );//删除方法
    });

    //子表格
    function addSubGrid(subgridId, rowId) {
        //table的Id
        var subgridTableId = subgridId + "table";
        //工具栏的ID
        var pagerId = subgridId + "page";
        //在子表格中创建一个表单table，创建一个工具栏
        $("#" + subgridId).html("<table id='" + subgridTableId + "'></table><div id='" + pagerId + "'></div>");

        //初始子表格
        $("#" + subgridTableId).jqGrid({
            url: "${path}/ChapterAction/selectAllChapter?id=" + rowId,
            editurl: "${path}/ChapterAction/addOneChapter?albumId=" + rowId,
            datatype: "json",
            rowNum: 4,
            rowList: [4, 8, 10, 20, 30],
            pager: "#" + pagerId,
            autowidth: true, //自动宽度
            styleUI: "Bootstrap", //设置样式
            height: 'auto',
            colNames: ['id', '名字', '路径', '大小', '时长', '上传时间', '专辑id', '操作'],
            colModel: [
                {name: "id", width: 60, key: true, align: "center"},
                {name: "name", width: 80, align: "center", editable: true},
                {
                    name: "url", width: 70, align: "center", editable: true, edittype: "file"

                },
                {name: "size", width: 70, align: "center"},
                {name: "duration", width: 70, align: "center", sortable: false},
                {name: "upDatez", width: 70, align: "center", sortable: false},
                {name: "albumId", width: 70, align: "center", sortable: false},
                {
                    name: "url", width: 70, align: "center",
                    formatter: function (cellvalue) {
                        return "<a id='play' href='#' onclick='player(\"" + cellvalue + "\")'><span class='glyphicon glyphicon-play-circle'/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id='' onclick='updateStatus(\"" + cellvalue + "\")'><span class='glyphicon glyphicon-download'/></a>";
                    }

                }
            ]
        });

        //子表格增删改
        $("#" + subgridTableId).jqGrid('navGrid', "#" + pagerId, {
                edit: true,
                add: true,
                del: true,
                addtext: "添加",
                deltext: "删除",
                edittext: "修改"
            },
            {},
            {
                closeAfterAdd: true,
                afterSubmit: function (data) {
                    //alert("hahah");
                    $.ajaxFileUpload({
                        url: "${path}/ChapterAction/updateOneChapter",
                        datatype: "json",
                        fileElementId: "url",//需要上传的文件域的ID
                        type: "post",
                        data: {id: data.responseText},
                        success: function (dhsad) {
                            //刷新页面
                            $("#" + subgridTableId).trigger("reloadGrid");
                        }
                    });
                    return "ss77";
                }//添加方法
            },
            {}
        );
    }

    function player(fileName) {
        $("#mp3Btn").attr("autoplay","autoplay");
        $("#mp3Btn").attr("src","${path}/ChapterMp3/"+fileName)
        $("#dd").append("<nav class='navbar navbar-default navbar-fixed-bottom'>" +
            "<div class='navbar-collapse collapse' style='text-align: center;'>" + //\"" + fileName + "\",\""+2+"\"
            "<span class='glyphicon glyphicon-step-backward btn-lg' aria-hidden='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span onclick='bof()' class='glyphicon glyphicon-pause btn-lg' aria-hidden='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-step-forward btn-lg' aria-hidden='true'/></div></nav>")

    }

    function updateStatus(fileName) {
        document.location.href = "${path}/ChapterAction/download?fileName=" + fileName;
    }

    $('#mp3Btn').on('ended', function() {
        console.log("音频已播放完成");
    })

    function bof(){
        //播放器控制
        var audio = document.getElementById('mp3Btn');
        audio.volume = .3;
        event.stopPropagation();//防止冒泡
        if(audio.paused){ //如果当前是暂停状态

            audio.play(); //播放
            $("#dd").append("<nav class='navbar navbar-default navbar-fixed-bottom'>" +
                "<div class='navbar-collapse collapse' style='text-align: center;'>" +
                "<span class='glyphicon glyphicon-step-backward btn-lg' aria-hidden='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span onclick='bof()' class='glyphicon glyphicon-pause btn-lg' aria-hidden='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-step-forward btn-lg' aria-hidden='true'/></div></nav>")
            return;
        }else{//当前是播放状态
            audio.pause(); //暂停

            $("#dd").append("<nav class='navbar navbar-default navbar-fixed-bottom'>" +
                "<div class='navbar-collapse collapse' style='text-align: center;'>" +
                "<span class='glyphicon glyphicon-step-backward btn-lg' aria-hidden='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span onclick='bof()' class='glyphicon glyphicon-play btn-lg' aria-hidden='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-step-forward btn-lg' aria-hidden='true'/></div></nav>")

        }

    }




</script>

<div scripts="panel panel-info" >
    <div class="panel panel-heading">
        <h2 align="center">专辑信息</h2>
    </div>
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">专辑信息</a>
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

                    <table id="albunid"/>
                    <div id="pjoptz"/>

                </div>
            </div>
        </div>
    </div>
</div>


<div class="btn-audio">
    <audio id="mp3Btn">
        <source src="${path}/mp3/般禅梵唱妙音组-大悲咒.mp3" type="audio/mpeg" />
    </audio>
</div>



<span id="ss"></span>
<div id="div"></div>

<audio id="bb" />
<div id="dd"></div>


