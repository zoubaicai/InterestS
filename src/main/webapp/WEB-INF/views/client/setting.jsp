<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/setting.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
    <link href="/webuploader/css/webuploader.css" rel="stylesheet">
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
                        <p>${userInfo.userNickname}</p>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userInfo" aria-expanded="false" aria-controls="userInfo">编辑</button>
                    </div>
                    <div class="collapse col-sm-12 paddingT-5" id="userInfo">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="nickname" class="col-sm-2 control-label">昵称:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="nickname" value="${userInfo.userNickname}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="city" class="col-sm-2 control-label">所在城市:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="city" value="${userInfo.city}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别:</label>
                                <div class="col-sm-6">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sexOptions1" value="男" <c:if test="${userInfo.sex == '男'}">checked</c:if> > 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sexOptions2" value="女" <c:if test="${userInfo.sex == '女'}">checked</c:if> > 女
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sexOptions3" value="保密" <c:if test="${userInfo.sex == '保密'}">checked</c:if>> 保密
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="button" class="btn btn-primary" id="savePersonalInfo">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="setting-item clearfix">
                    <div class="col-sm-3">
                        <p>头像</p>
                    </div>
                    <div class="col-sm-7">
                        <img src="${userInfo.portrait}" class="small-img">
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userImg" aria-expanded="false" aria-controls="userImg">编辑</button>
                    </div>
                    <div class="collapse col-sm-12" id="userImg">
                        <div class="col-sm-offset-2">
                            <div id="fileList" class="uploader-list" style="max-width: 140px;"></div>
                            <span style="margin-right: 10px;" id="filePicker">选择图片</span>
                            <button class="btn btn-default" id="uploadBtn" style="margin-top: -27px;">确认上传</button>
                        </div>
                    </div>
                </div>
                <div class="setting-item clearfix">
                    <div class="col-sm-3">
                        <p>邮箱</p>
                    </div>
                    <div class="col-sm-7">
                        <p>${userInfo.userEmail}</p>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" role="button" data-toggle="collapse" data-target="#userEmail" aria-expanded="false" aria-controls="userEmail">编辑</button>
                    </div>
                    <div class="collapse col-sm-12" id="userEmail">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="nowEmail" class="col-sm-2 control-label">当前邮箱:</label>
                                <div class="col-sm-6">
                                    <p class="form-control-static" id="nowEmail">${userInfo.userEmail}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="captchaCode" class="col-sm-2 control-label">验证码:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="captchaCode" placeholder="验证码">
                                    <button type="button" class="btn btn-link" id="sendCaptchaCode">发送验证码</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newEmail" class="col-sm-2 control-label">新邮箱:</label>
                                <div class="col-sm-6">
                                    <input type="email" class="form-control" id="newEmail">
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="button" class="btn btn-primary" id="sureModifyEmail">确认修改</button>
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
                                <button type="button" class="btn btn-primary" id="sureModifyPwd">确认修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/webuploader/js/webuploader.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        // 初始化Web Uploader
        var uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: false,
            // swf文件路径
            swf: '/webuploader/Uploader.swf',
            // 文件接收服务端。
            server: '/client/savePortrait',
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/gif,image/jpeg,image/jpg,image/png,image/bmp'
            },
            // 限制大小为2M
            fileSingleSizeLimit : 1024 * 1024 * 2
        });
        // 文件加入队列之前
        uploader.on('beforeFileQueued', function ( file ) {
            // 清空队列
            uploader.reset();
            if (file.size > 1024 * 1024 * 2){
                alert("大小限制位2M");
                return false;
            }
        });
        var thumbnailWidth = 140;
        var thumbnailHeight = 140;
        var oldFile = null;
        // 当有文件添加进来的时候
        uploader.on( 'fileQueued', function( file ) {
            var $preview = $("#fileList").find(".thumbnail");
            if ($preview){
                $preview.remove();
            }
            $preview = $(
                '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '</div>'
            );
            var $img = $preview.find('img');
            $("#fileList").append($preview);

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    console.log(error);
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                $percent = $li.find('.progress-bar');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $(
                    '<div class="progress" style="margin-top: 5px;">' +
                    '<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 0;"> ' +
                    '0%' +
                    '</div></div>'
                ).appendTo( $li ).find('.progress-bar');
            }

            $percent.css( 'width', percentage * 100 + '%' ).text( percentage * 100 + '%');
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file , response ) {
            var des = response;
            alert("上传成功" + des);
            console.log(file);
            console.log(response);
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            var $li = $( '#'+file.id ),
                $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text('上传失败');
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress').remove();
        });

        $("#uploadBtn").click(function () {
            uploader.upload();
        });
        // uploader end |||||||||||||||||||||
        $("#userImg").on("shown.bs.collapse",function () {
            uploader.refresh();
        });
    </script>
    <script>
        $(function () {

            var $userNickname = $("#nickname");
            var $userCity = $("#city");
            var $nowEmail = $("#nowEmail");
            var $captchaCode = $("#captchaCode");
            var $newEmail = $("#newEmail");
            var $nowPwd = $("#nowPwd");
            var $newPwd = $("#newPwd");
            var $newPwdAgain = $("#newPwdAgain");
            // 保存个人信息
            $("#savePersonalInfo").click(function () {
                var params = {
                    userNickname: $userNickname.val(),
                    userCity: $userCity.val(),
                    userSex: $("input[name='sex']:checked").val()
                };
                $.post("/client/savePersonalInfo?time" + new Date().getTime(), params, function (result) {
                    alert(result);
                });
            });

            //

            // 发送邮箱验证码
            $("#sendCaptchaCode").click(function () {
                var $this = $(this);
                var forbidClick = function () {
                    $this.attr("disabled",true);
                    var time = 60;
                    var t;
                    function timeSubtract() {
                        var s = "请等待: " + time + "秒";
                        $this.text(s);
                        time--;
                        if (time <= 0){
                            clearTimeout(t);
                            $this.text("发送验证码").attr("disabled",false);
                        } else {
                            t = setTimeout(function () {
                                timeSubtract();
                            },1000);
                            console.log(time);
                        }
                    }
                    timeSubtract();
                };

                forbidClick();

                var params = {
                   userEmail : $nowEmail.text()
                };
                $.post("/client/sendCaptchaCode?time" + new Date().getTime(),params,function (result) {
                    var res = JSON.parse(result);
                    console.log(res.des);
                });
            });
            // 提交邮箱修改
            $("#sureModifyEmail").click(function () {
                var params = {
                    captchaCode : $captchaCode.val(),
                    newEmail : $newEmail.val()
                };
                $.post("/client/modifyEmail?time" + new Date().getTime(),params,function (result) {
                    alert(result);
                });


            });
            // 修改密码
            $("#sureModifyPwd").click(function () {
                var params = {
                    nowPwd : $nowPwd.val(),
                    newPwd : $newPwd.val()
                };
                $.post("/client/modifyPwd?time" + new Date().getTime(),params,function (result) {
                    alert(result);
                });
            });
        });
    </script>
</body>
</html>
