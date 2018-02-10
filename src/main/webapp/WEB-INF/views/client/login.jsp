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
                        <input type="email" class="form-control input-color" id="userEmail" name="userEmail">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <div class="form-group">
                        <label for="userPwd">密码</label>
                        <input type="password" class="form-control input-color" id="userPwd" name="userPwd">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <button type="button" class="btn btn-primary pull-right" id="loginSubmit">登录</button>
                </div>
                <div class="col-md-12">
                    <br>
                    <a href="/client/register">注册</a>&nbsp;|&nbsp;<a href="#">忘记密码?</a>
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
    <script src="/js/simpleValidation.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script>
        $(function () {
            var $input = $("input"); // 所有input对象
            var oGlobalFlag = {}; // 全局验证对象，包含所有如 username:false
            //-----转换json str
            var i,jsonStr = '{';
            for (i = 0;i<$input.length;i++){
                jsonStr += '"' + $input[i]["name"] + '":false';
                if (i < $input.length -1){
                    jsonStr += ',';
                } else {
                    jsonStr += '}';
                }
            }
            // 转换json str结束
            oGlobalFlag = JSON.parse(jsonStr);
            jsonStr = null;
            $input = null;
            // 改变#oGlobalFlag#指定名称的属性值
            var reverseFlag = function (name,flag) {
                if (typeof oGlobalFlag == "object" && oGlobalFlag.hasOwnProperty(name)){
                    oGlobalFlag[name] = flag;
                } else {
                    console.log("error#" + oGlobalFlag);
                }
            };
            // input的通用callback
            var common_callback = function (input_obj,results) {
                if (results.resultFlag == false){
                    reverseFlag(input_obj.attr("name"),false);
                    input_obj.parent().addClass("has-error");
                    input_obj.parent().find(".text-danger").text(results.resultMsg);
                } else {
                    reverseFlag(input_obj.attr("name"),true);
                    input_obj.parent().addClass("has-success").removeClass("has-error");
                }
            };
            // 提交按钮
            $("#loginSubmit").click(function () {
                var $username = $("#userEmail");
                var $password = $("#userPwd");
                var params = {
                    userEmail : $username.val(),
                    userPwd : $password.val()
                };
                var validator = new simpleValidation();
                validator._validate("userEmail","电子邮箱","required|valid_email",function (results) {
                    common_callback($username,results);
                });
                validator._validate("userPwd","密码","required|noIdeograph",function (results) {
                    common_callback($password,results);
                });
                var ready2submit = true,prop;
                for (prop in oGlobalFlag){
                    ready2submit = ready2submit && oGlobalFlag[prop];
                }
                if (!ready2submit){
                    // 验证失败
                } else {
                    $.post("/loginValidate?time=" + new Date().getTime(), params, function (result) {
                        var res = JSON.parse(result);
                        if (res.hasOwnProperty("error_des")){
                            if (res.hasOwnProperty("error_id")){
                                var r = {
                                    resultFlag : false,
                                    resultMsg : res.error_des
                                };
                                common_callback($("#" + res.error_id),r);
                                return;
                            } else {
                                alert(res.error_des);
                                return;
                            }
                        }
                        res.des != ""?alert(res.des):"";
                        $.cookie("token",res.token,{expires : 1,path : '/'});
                        if (typeof window.localStorage != "undefined"){
                            localStorage.nickname = res.nickname;
                            localStorage.portrait = res.portrait;
                        } else {
                            $.cookie("nickname",res.nickname,{expires : 1,path : '/'});
                            $.cookie("portrait",res.portrait,{expires : 1,path : '/'});
                        }
                        window.location.href = "/";
                    });
                }
            });
            // 输入框获取焦点时恢复原始状态
            $("#userEmail,#userPwd").focus(function () {
                var $this = $(this);
                $this.parent().removeClass("has-error has-success");
                $this.parent().find(".text-danger").text("");
            });
        });
    </script>
</body>
</html>
