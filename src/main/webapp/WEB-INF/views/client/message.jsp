<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/9
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的消息</title>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/message.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px;">
    <%@include file="header.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 white-back" style="min-height: 420px;">
                <h4>消息</h4>
                <hr>
                <div class="msg-lists">
                    <div class="col-sm-12 well well-sm msg-item">
                        <div class="col-sm-11">
                            <p>欢迎注册“兴趣共享团”，<a href="/client/personal">我的主页</a></p>
                            <small>2018-1-9 14:27</small>
                        </div>
                        <div class="col-sm-1">
                            <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
