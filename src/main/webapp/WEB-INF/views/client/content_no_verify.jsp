<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/4/17
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>不是验证通过的兴趣组</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond./min.js"></script>
    <![endif]-->
</head>
<script src="/js/jquery.min.js"></script>
<script src="/zeroModal/js/zeroModal.min.js"></script>
<script>
    $(function () {
        zeroModal.alert({
            content : "只有通过验证的兴趣组才可以查看！",
            okFn : function () {
                window.location.href = "/";
            },
            cancel : false,
            top : document.body.scrollTop + 'px'
        })
    });
</script>
<body>

</body>
</html>
