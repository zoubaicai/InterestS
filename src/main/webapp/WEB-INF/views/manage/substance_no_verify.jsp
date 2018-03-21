<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/16
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>未审核内容</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/datatables-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
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
<body>
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
                                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tbody><tr>
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
                                        <th>审核结果</th>
                                    </tr>
                                    <tr>
                                        <td>183</td>
                                        <td>John Doe</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-success">Approved</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    <tr>
                                        <td>219</td>
                                        <td>Alexander Pierce</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-warning">Pending</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    <tr>
                                        <td>657</td>
                                        <td>Bob Doe</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-primary">Approved</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    <tr>
                                        <td>175</td>
                                        <td>Mike Doe</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-danger">Denied</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <div class="row">
                                    <div class="col-xs-3" style="display: table;">
                                        <span style="vertical-align: middle;display: table-cell;">第<small>1</small>页 共<small>1</small>页</span>
                                        <div class="col-xs-6">
                                            <input type="text" class="form-control">
                                        </div>
                                        <a href="#" class="btn btn-primary btn-flat">跳转</a>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <a href="#" class="btn btn-default btn-flat">上一页</a>
                                        <a href="#" class="btn btn-default btn-flat">下一页</a>
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
    <script src="/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/datatables-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="/AdminLTE/js/adminlte.min.js"></script>
    <script src="/js/jquery.slimscroll.min.js"></script>
    <script src="/js/manage/common.js"></script>
    <script>
        $(function () {
            $('#example').DataTable({
                "language" : {
                    url : "/datatables/zh_CH.json"
                }
            });
        });
    </script>
</body>
</body>
</html>
