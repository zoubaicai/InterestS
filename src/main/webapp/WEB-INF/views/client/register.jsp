<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/9
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
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
            <div class="col-md-12 hidden-sm hidden-xs" style="height: 30px;"></div>
            <div class="col-md-4 col-md-offset-4" style="margin-top: 30px;">
                <div class="col-md-12">
                    <h1 class="text-center">ISharing<br><small>兴趣共享</small></h1>
                    <br>
                </div>
                <div class="col-md-12 white-back" style="margin-top: 10px;margin-bottom: 10px;">
                    <p style="line-height: 40px;margin: 0px;">在这个站点注册</p>
                </div>
                <div class="col-md-12 white-back clearfix input-area">
                    <div class="form-group">
                        <label for="userEmail">电子邮箱</label>
                        <input type="email" class="form-control input-color" id="userEmail" name="userEmail">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <p class="help-block">注册后将会发送一封邮件给您</p>
                    <div class="form-group">
                        <label for="userNickname">昵称</label>
                        <input type="text" class="form-control input-color" id="userNickname" name="userNickname">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <div class="form-group">
                        <label>验证码</label>
                        <div style="height: 40px;width: 132px;background-color: #eee">
                            <img src="/client/captcha" width="132" height="40" alt="验证码" title="看不清，换一张" id="captchaImg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="captchaCode">请输入上面显示的文本</label>
                        <input type="text" class="form-control input-color" id="captchaCode" name="captchaCode">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <div class="form-group">
                        <label for="userPwd">密码</label>
                        <input type="password" class="form-control input-color" id="userPwd" name="userPwd">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <div class="form-group">
                        <label for="userPwdAgain">重复密码</label>
                        <input type="password" class="form-control input-color" id="userPwdAgain" name="userPwdAgain">
                        <b><span class="text-danger"></span></b>
                    </div>
                    <button type="button" class="btn btn-primary pull-right" id="registerSubmit">注册</button>
                </div>
                <div class="col-md-12">
                    <br>
                    <a href="#">登录</a>&nbsp;|&nbsp;<a href="#">忘记密码?</a>
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
            // 验证码图片
            $("#captchaImg").click(function () {
               $(this).hide().attr("src","/captcha?time=" + new Date().getTime()).fadeIn();
            });

            var $input = $("input"); // 所有input对象
            var oGlobalFlag = {}; // 全局验证对象，包含所有如 input[name]:boolean
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
                if (!results.resultFlag){
                    reverseFlag(input_obj.attr("name"),false);
                    input_obj.parent().addClass("has-error");
                    input_obj.parent().find(".text-danger").text(results.resultMsg);
                } else {
                    reverseFlag(input_obj.attr("name"),true);
                    input_obj.parent().addClass("has-success").removeClass("has-error");
                }
            };
            // 提交注册
            $("#registerSubmit").click(function () {
                var $userEmail = $("#userEmail");
                var $userNickname = $("#userNickname");
                var $captchaCode = $("#captchaCode");
                var $userPwd = $("#userPwd");
                var $userPwdAgain = $("#userPwdAgain");
                var params = {
                    userEmail : $userEmail.val(),
                    userPwd : $userPwd.val(),
                    userNickname : $userNickname.val(),
                    captchaCode : $captchaCode.val()
                };
                var validator = new simpleValidation();// 验证器
                validator._validate("userEmail","电子邮箱","required|valid_email",function (results) {
                    common_callback($userEmail,results);
                });
                validator._validate("userNickname","昵称","required|max_length",function (results) {
                    common_callback($userNickname,results);
                },3,15);
                validator._validate("captchaCode","验证码","required|max_length|min_length",function (results) {
                    common_callback($captchaCode,results);
                },5,5);
                validator._validate("userPwd","密码","required|min_length|max_length|noIdeograph",function (results) {
                    common_callback($userPwd,results);
                },8,30);
                validator._validate("userPwdAgain","重复密码","required|min_length|max_length|noIdeograph",function (results) {
                    if ($userPwd.val() != $userPwdAgain.val()){
                        results.resultMsg = "两次密码输入不一致";
                        results.resultFlag = false;
                    }
                    common_callback($userPwdAgain,results);
                },8,30);
                var ready2submit = true,prop;
                for (prop in oGlobalFlag){
                    ready2submit = ready2submit && oGlobalFlag[prop];
                }
                if (!ready2submit){
                    // 验证失败
                } else {
                    $.post("/registerValidate?time=" + new Date().getTime(), params, function (result) {
                        var res = JSON.parse(result);
                        console.log(result);
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
                        // window.location.href = "/";
                    });
                }
            });

            // 输入框获取焦点时恢复原始状态
            $(".form-control").focus(function () {
                var $this = $(this);
                $this.parent().removeClass("has-error has-success");
                $this.parent().find(".text-danger").text("");
            });

        });
    </script>
</body>
</html>
