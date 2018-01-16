<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/16
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>头像审核</title>
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
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            这里只会显示用户最后一次上传的头像
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <!--small box-->
                        <div class="col-md-3 col-xs-6">
                            <div class="small-box bg-gray">
                                <div class="inner">
                                    <div style="background-size: 100% 100%;background-image: url(/images/dog.gif);height: 100%;width: 100%;max-height: 102px;border-radius: 2px;"></div>
                                </div>
                                <a href="#" class="small-box-footer">
                                    如不合规,请点击 <i class="fa fa-ban"></i>
                                </a>
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
</body>
</html>
