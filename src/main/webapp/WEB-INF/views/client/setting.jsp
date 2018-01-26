<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/8
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>帐号设置</title>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/setting.css" rel="stylesheet">
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
            <div class="col-md-8 col-md-offset-2 white-back shards-shadow paddingAll clearfix">
                <h3 class="text-center">帐号设置</h3>
                <hr>
                <div class="setting-item clearfix">
                    <div class="col-sm-3">
                        <p>个人资料</p>
                    </div>
                    <div class="col-sm-7">
                        <p>ZBC</p>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userInfo" aria-expanded="false" aria-controls="userInfo">编辑</button>
                    </div>
                    <div class="collapse col-sm-12 paddingT-5" id="userInfo">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="nickname" class="col-sm-2 control-label">昵称:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="nickname" value="ZBC">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="city" class="col-sm-2 control-label">所在城市:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="city">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别:</label>
                                <div class="col-sm-6">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sexOptions1" value="男"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sexOptions2" value="女"> 女
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sexOptions3" value="保密" checked> 保密
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="button" class="btn btn-primary">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="setting-item clearfix">
                    <div class="col-sm-3">
                        <p>头像</p>
                    </div>
                    <div class="col-sm-7">
                        <img src="/images/user.png" class="small-img">
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userImg" aria-expanded="false" aria-controls="userImg">编辑</button>
                    </div>
                    <div class="collapse col-sm-12" id="userImg">
                        <div class="col-sm-offset-2">
                            <img src="/images/user.png" class="big-img">
                            <button type="button" class="btn btn-default">上传头像</button>
                        </div>
                    </div>
                </div>
                <div class="setting-item clearfix">
                    <div class="col-sm-3">
                        <p>邮箱</p>
                    </div>
                    <div class="col-sm-7">
                        <p>zoubaicai@126.com</p>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userEmail" aria-expanded="false" aria-controls="userEmail">编辑</button>
                    </div>
                    <div class="collapse col-sm-12" id="userEmail">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="nowEmail" class="col-sm-2 control-label">当前邮箱:</label>
                                <div class="col-sm-6">
                                    <p class="form-control-static" id="nowEmail">zoubaicai@126.com</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="validationCode" class="col-sm-2 control-label">验证码:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="validationCode" placeholder="验证码">
                                    <button type="button" class="btn btn-link">发送验证码</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newEmail" class="col-sm-2 control-label">新邮箱:</label>
                                <div class="col-sm-6">
                                    <input type="email" class="form-control" id="newEmail">
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="button" class="btn btn-primary">确认修改</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="setting-item clearfix">
                    <div class="col-sm-3">
                        <p>密码</p>
                    </div>
                    <div class="col-sm-7">
                        <p>********</p>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userPwd" aria-expanded="false" aria-controls="userPwd">编辑</button>
                    </div>
                    <div class="collapse col-sm-12" id="userPwd">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="nowPwd" class="col-sm-2 control-label">当前密码:</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="nowPwd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newPwd" class="col-sm-2 control-label">新密码:</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="newPwd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newPwdAgain" class="col-sm-2 control-label">再次输入新密码:</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="newPwdAgain">
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="button" class="btn btn-primary">确认修改</button>
                            </div>
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
