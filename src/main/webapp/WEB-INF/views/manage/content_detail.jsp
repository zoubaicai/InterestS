<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/3/22
  Time: 21:57
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
    <title>详细内容 ${po.subject}</title>
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
                    内容详细信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                    <li>发布管理</li>
                    <li class="active">详细信息</li>
                </ol>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="row" style="font-size: 1.1em;">
                    <div class="col-xs-12">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-bookmark text-primary"></i> 主题
                            </div>
                            <div class="box-body">
                                ${po.subject}
                            </div>
                        </div>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-tag"></i> 简介
                            </div>
                            <div class="box-body">
                                ${po.summary}
                            </div>
                        </div>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-sticky-note"></i> 内容
                            </div>
                            <div class="box-body">
                               ${po.substanceContentPO.content}
                            </div>
                        </div>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-map-marker text-primary"></i> 定位地址
                            </div>
                            <div class="box-body">
                                <c:choose>
                                    <c:when test="${po.locale == '' || null == po.locale}">
                                        空
                                    </c:when>
                                    <c:otherwise>
                                        ${po.locale}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-user text-gray"></i> 是否允许匿名访问
                            </div>
                            <div class="box-body">
                                <c:choose>
                                    <c:when test="${po.isAnonymousPermit == 1}">
                                        <i class="fa fa-circle text-green"></i> 是
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa fa-circle text-gray"></i> 否
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-circle-o text-gray"></i> 审核状态
                            </div>
                            <div class="box-body">
                                <c:choose>
                                    <c:when test="${po.isVerified == 0}">
                                        <i class="fa fa-circle text-gray"></i> 未审核
                                    </c:when>
                                    <c:when test="${po.isVerified == 1}">
                                        <i class="fa fa-circle text-green"></i> 通过
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa fa-circle text-red"></i> 未通过
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                审核结果描述
                            </div>
                            <div class="box-body">
                                <c:choose>
                                    <c:when test="${po.unverifiedFactor == '' || null == po.unverifiedFactor}">
                                        空
                                    </c:when>
                                    <c:otherwise>
                                        ${po.unverifiedFactor}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <i class="fa fa-edit"></i> 操作中心
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>审核结果</label>
                                    <select class="form-control" id="stateSelect">
                                        <option value="通过">通过</option>
                                        <option value="不通过">不通过</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="stateStr">审核结果描述</label>
                                    <input type="text" class="form-control"  placeholder="请输入原因" id="stateStr">
                                </div>
                                <button class="btn btn-primary btn-flat btn-block" id="updateBen">确认更改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="main-footer.jsp"%>
    </div>

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/AdminLTE/js/adminlte.min.js"></script>
    <script src="/js/jquery.slimscroll.min.js"></script>
    <script src="/js/manage/common.js"></script>
    <script>
        $(function () {
            // 得到id
            var getSubstanceId = function () {
                var regex = /id=\w+/;
                return regex.exec(location.search)[0].substr(3);
            };

            // 提交更改
            $("#updateBen").click(function () {
                var state = $("#stateSelect").val();
                var stateStr = $("#stateStr").val();
                if (stateStr === ""){
                    alert("审核结果描述不能为空");
                    return;
                }
                var params = {
                    id : getSubstanceId(),
                    state : encodeURIComponent(state),
                    stateStr : encodeURIComponent(stateStr)
                };
                $.post("/manage/verifyContent?time=" + new Date().getTime(),params,function (result) {
                    //alert(result);
                    if (result === "1"){
                        alert("更改成功！");
                    } else if (result === "-2"){
                        alert("系统错误-2");
                    } else {
                        alert("意外的崩溃了");
                    }
                });
            });
        });
    </script>
</body>
</html>
