<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/16
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>头像审核</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/AdminLTE/css/AdminLTE.min.css" rel="stylesheet">
    <link href="/AdminLTE/css/skins/skin-blue.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <%@include file="main-header.jsp"%>
        <%@include file="main-sidebar.jsp"%>
        <div class="content-wrapper" style="min-height: 916px;overflow-y: auto;">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    头像审核
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                    <li>用户管理</li>
                    <li class="active">头像审核</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-info alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            这里只会显示用户最后一次上传的头像
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <!--small box-->
                        <c:choose>
                            <c:when test="${lists.size() > 0}">
                                <c:forEach items="${lists}" var="list">
                                    <c:if test="${list.portrait != '' && null != list.portrait}">
                                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                                            <div class="box box-default">
                                                <div class="box-header with-border">
                                                    <i class="fa fa-envelope-o"></i> ${list.userEmail}
                                                    <div class="pull-right"><button class="btn btn-default btn-flat btn-sm banBtn"  aria-label="${list.id}"><i class="fa fa-ban text-red"></i>不合规</button></div>
                                                </div>
                                                <div class="box-body">
                                                    <c:choose>
                                                        <c:when test="${list.portrait == '' || null == list.portrait}">
                                                            <img src="/images/spaceholder.gif" style="width: 100%;height: 150px;">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${list.portrait}" style="width: 100%;height: 150px;">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <i class="fa fa-close text-red"></i> 没有记录
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-xs-12">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                分页查询
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-3" style="display: table;">
                                        <span style="vertical-align: middle;display: table-cell;">第<small id="currentPage">1</small>页 共<small id="sumPage">${sum}</small>页</span>
                                        <div class="col-xs-6">
                                            <input type="text" class="form-control" id="selectPage">
                                        </div>
                                        <button class="btn btn-primary btn-flat" id="jumpPageBtn">跳转</button>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <button class="btn btn-default btn-flat" id="previousPage">上一页</button>
                                        <button class="btn btn-default btn-flat" id="nextPage">下一页</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
        <%@include file="main-footer.jsp"%>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/AdminLTE/js/adminlte.min.js"></script>
    <script src="/js/jquery.slimscroll.min.js"></script>
    <script src="/js/manage/common.js"></script>
    <script src="/js/manage/substance.js"></script>
    <script>
        $(function () {
            $(".banBtn").click(function () {
                var flag = confirm("确认删除改头像吗？");
                if (flag === true){
                    var id = $(this).attr("aria-label");
                    var params = {
                        id : id
                    }
                    $.post("/manage/deletePortrait?time=" + new Date().getTime(),params,function (result) {
                        //alert(result);
                        if (result === "1"){
                            alert("删除成功！");
                        } else if (result === "-2"){
                            alert("系统错误-2");
                        } else {
                            alert("意外的崩溃了");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
