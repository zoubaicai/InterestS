<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/14
  Time: 14:49
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
    <title>用户详细信息</title>
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
                    用户信息
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                    <li>用户管理</li>
                    <li class="active">详细信息</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">所有用户信息</h3>

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
                                <table class="table table-hover" style="font-size: 1em;">
                                    <tbody>
                                    <tr>
                                        <th>编号</th>
                                        <th>邮箱</th>
                                        <th>昵称</th>
                                        <th>是否已经验证过邮箱</th>
                                        <th>所在城市</th>
                                        <th>性别</th>
                                        <th>头像</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${lists.size() > 0}">
                                            <c:forEach items="${lists}" var="list">
                                                <tr>
                                                    <td>${list.id}</td>
                                                    <td>${list.userEmail}</td>
                                                    <td>${list.userNickname}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${list.isVerified == 1}">
                                                                <i class="fa fa-circle text-green"></i>是
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fa fa-circle text-gray"></i>否
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${list.city == '' || null == list.city}">
                                                                未添加
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${list.city}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${list.sex == '' || null == list.sex}">
                                                                未添加
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${list.sex}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${list.portrait == '' || null == list.portrait}">
                                                                未添加
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${list.portrait}" style="width: 33px;height: 22px;">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${list.gmtCreate}</td>
                                                    <td>
                                                        <a href="http://localhost:8080/personal?uid=${list.id}" target="_blank" class="btn btn-success btn-flat btn-sm">查看</a>
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
    <script src="/js/manage/substance.js"></script>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
