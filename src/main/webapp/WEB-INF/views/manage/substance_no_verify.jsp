<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/16
  Time: 14:47
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
    <title>未审核内容</title>
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
                    未审核内容
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                    <li>发布管理</li>
                    <li class="active">未审核</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">以下显示未审核的用户发布内容</h3>

                                <div class="box-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search" id="tableSearchStr">

                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-default" id="tableSearchBtn"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <th>编号</th>
                                            <th>主题</th>
                                            <th>简介</th>
                                            <th>是否添加地点</th>
                                            <th>地点信息</th>
                                            <th>是否具有匿名限制</th>
                                            <th>是否具有邀请码</th>
                                            <th>邀请码</th>
                                            <th>创建时间</th>
                                            <th>审核状态</th>
                                            <th>审核结果描述</th>
                                            <th>操作</th>
                                        </tr>
                                        <c:choose>
                                            <c:when test="${lists.size() > 0}">
                                                <c:forEach items="${lists}" var="list">
                                                    <tr>
                                                        <td>${list.id}</td>
                                                        <td>${list.subject}</td>
                                                        <td>${list.summary}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.isRealistic == 1}">
                                                                    <i class="fa fa-circle text-green"></i>是
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-circle text-gray"></i>否
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.locale == '' || null == list.locale}">
                                                                    空
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${list.locale}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.isAnonymousPermit == 1}">
                                                                    <i class="fa fa-circle text-green"></i>是
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-circle text-gray"></i>否
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.isRestricted == 1}">
                                                                    <i class="fa fa-circle text-green"></i>是
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-circle text-gray"></i>否
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.joinCode == '' || null == list.joinCode}">
                                                                    空
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${list.joinCode}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${list.gmtCreate}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.isVerified == 1}">
                                                                    <i class="fa fa-circle text-green"></i>以通过
                                                                </c:when>
                                                                <c:when test="${list.isVerified == 2}">
                                                                    <i class="fa fa-circle text-red"></i>未通过
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-circle text-gray"></i>未审核
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.unverifiedFactor == '' || null == list.unverifiedFactor}">
                                                                    空
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${list.unverifiedFactor}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-success btn-flat btn-sm">查看</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <th colspan="11">
                                                        <i class="fa fa-close text-red"></i> 没有记录
                                                    </th>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
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
                        <!-- /.box -->
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
    <script>
        $(function () {
            // 得到当前页数
            var getCurrentPageNum = function () {
                var regex = /p=[0-9]+/i;
                var p = "1";
                try {
                    p = regex.exec(location.search)[0].substr(2);
                } catch (e){
                    // do nothing
                }
                return p;
            };
            // 得到当前查询字符串
            var getCurrentSearchStr = function () {
                var regex = /s=.+$/i;
                var s = "";
                try {
                    s = regex.exec(location.search)[0].substr(2);
                } catch (e){
                    // do nothing
                }
                return s;
            };
            // 跳转按钮
            $("#jumpPageBtn").click(function () {
                var sumPage = parseInt($("#sumPage").text());
                var selectPage = $("#selectPage").val();
                if (selectPage === "" || selectPage === undefined){
                    alert("请输入页码");
                    return;
                }
                try {
                    selectPage = parseInt(selectPage);
                    if (selectPage < 1 || selectPage > sumPage){
                        throw "error";
                    }
                } catch (e){
                    alert("请输入正确的页码");
                    return;
                }
                window.location.href = location.protocol + "//" +  location.host + "/manage/substance_no_verify?p=" + selectPage + "&s=" + getCurrentSearchStr();
            });
            // 上一页
            $("#previousPage").click(function () {
                var currentPage = parseInt($("#currentPage").text());
                if (currentPage === 1){
                    alert("已经是第一页了");
                } else {
                    currentPage--;
                    window.location.href = location.protocol + "//" +  location.host + "/manage/substance_no_verify?p=" + currentPage + "&s=" + getCurrentSearchStr();
                }
            });
            // 下一页
            $("#nextPage").click(function () {
                var currentPage = parseInt($("#currentPage").text());
                var sumPage = parseInt($("#sumPage").text());
                if (currentPage === sumPage){
                    alert("已经是最后一页了");
                } else {
                    currentPage++;
                    window.location.href = location.protocol + "//" +  location.host + "/manage/substance_no_verify?p=" + currentPage + "&s=" + getCurrentSearchStr();
                }
            });
            // 表搜索
            $("#tableSearchBtn").click(function () {
                var s = $("#tableSearchStr").val();
                if (s === "" || s === undefined){
                    alert("请输入要搜索的内容");
                    return;
                }
                var p = parseInt(getCurrentPageNum());
                s = encodeURIComponent(s);
                window.location.href = location.protocol + "//" +  location.host + "/manage/substance_no_verify?p=" + p + "&s=" + s;
            });
        });
    </script>
</body>
</body>
</html>
