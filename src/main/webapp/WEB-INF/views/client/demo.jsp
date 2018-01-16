<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/3
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>demo</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond./min.js"></script>
    <![endif]-->
    <style>
        .success{background-color: #00ff00;}
        .danger{background-color: #ff0000;}
        .z-modeless{width: 40%;min-width: 120px;height: 50px;display: table-cell;vertical-align: middle;text-align: center;color: #fff;padding-left: 5px;padding-right: 5px;font-size: 16px;word-wrap: break-word;}
    </style>
</head>
<body>
    <div class="container" id="parent">

    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-default">点我</button>
            </div>
        </div>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/demo.js"></script>
    <script>
        $(function () {
           $(".btn").click(function () {
               new modelessZ({id : "parent",text : "测试"});
           });
        });
    </script>
</body>
</html>
