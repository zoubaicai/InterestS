<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/14
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录后台</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/AdminLTE/css/AdminLTE.min.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
    <link href="/iCheck/skins/square/blue.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Interest</b>Sharing</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录</p>

        <form action="#" method="post">
            <div class="form-group has-feedback">
                <input type="email" class="form-control" placeholder="帐号" id="username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" id="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">

                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" class="btn btn-primary btn-block btn-flat" id="loginSubmit">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <%--<a href="#">忘记密码</a><br>--%>
        <%--<a href="#" class="text-center">获取帐号</a>--%>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/iCheck/icheck.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
    <script>
        $(function () {
            $username = $("#username");
            $password = $("#password");
            // 登录
            $("#loginSubmit").click(function () {
                var username = $username.val();
                var password = $password.val();
                if (username === "" || username === undefined){
                    zmAlert("帐号不能为空");
                    return;
                }
                if (password === "" || password === undefined){
                    zmAlert("密码不能为空");
                    return;
                }
                var params = {
                    username : username,
                    password : password
                };
                $.post("/manage/loginValidation",params,function (result) {
                    if (result === "1"){
                        zeroModal.success({
                            content : "登录成功",
                            okFn : function () {
                                window.location.href = "/manage/substance_no_verify";
                            }
                        });
                    } else {
                        zmAlert("帐号或密码错误");
                    }
                });
            });
        });
    </script>
</body>
</html>
