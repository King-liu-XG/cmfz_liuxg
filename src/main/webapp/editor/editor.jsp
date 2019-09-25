<%@ page import="java.util.Date" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<script charset="utf-8" src="${path}/editor/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${path}/editor/kindeditor/lang/zh-CN.js"></script>
<script>
    KindEditor.ready(function(K) {
        K.create('#editor_id', {
            uploadJson : '${path}/Editor/uploadImg', //指定文件上传的路径
            fileManagerJson : '${path}/Editor/returnPhoto',//指定浏览远程图片的路径
            allowFileManager : true, //是否展示浏览器远程图片按钮
            //filePostName:"photo", --设置文件上传的名称
        });
    });
</script>

<div align="center">
    <textarea id="editor_id" name="content" style="width:700px;height:300px;">

    </textarea>
</div>