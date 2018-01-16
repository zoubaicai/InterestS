<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/9
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/login.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 hidden-sm hidden-xs" style="height: 70px;"></div>
            <div class="col-md-4 col-md-offset-4" style="margin-top: 30px;">
                <div class="col-md-12">
                    <h1 class="text-center">ISharing<br><small>兴趣共享</small></h1>
                    <br>
                </div>
                <div class="col-md-12 white-back clearfix input-area">
                    <div class="form-group">
                        <label for="userEmail">电子邮箱</label>
                        <input type="email" class="form-control input-color" id="userEmail">
                    </div>
                    <div class="form-group">
                        <label for="userPwd">密码</label>
                        <input type="password" class="form-control input-color" id="userPwd">
                    </div>
                    <button type="button" class="btn btn-primary pull-right">登录</button>
                </div>
                <div class="col-md-12">
                    <br>
                    <a href="#">注册</a>&nbsp;|&nbsp;<a href="#">忘记密码?</a>
                </div>
                <div class="col-md-12">
                    <br>
                    <a href="/">← 返回到ISharing</a>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>