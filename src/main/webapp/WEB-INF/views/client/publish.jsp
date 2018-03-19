<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2017/12/22
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发布新兴趣组</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/iCheck/skins/line/blue.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/publish.css" rel="stylesheet">
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
            <div class="col-md-8 col-md-offset-2 white-back shards-shadow" style="padding-top: 10px;">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="text20px" for="caption">标题：</label>
                        <input type="text" class="form-control" id="caption" name="caption" placeholder="请输入标题" value="${substanceInfo.subject}">
                        <b><span class="text-danger"></span></b>
                        <span class="help-block">合适的标题更加吸引人，不得为空最长20个字符</span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="text20px" for="summary">简介：</label>
                        <textarea class="form-control" id="summary" name="summary" placeholder="请输入简介" aria-describedby="summary_help">${substanceInfo.subject}</textarea>
                        <b><span class="text-danger"></span></b>
                        <span class="help-block">一个合适的简介能够让别人更容易发现这里，最多120个字符</span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="text20px">主要内容：</label>
                        <div class="" id="wandEditMenu"></div>
                        <div class="form-control focusshadow" id="wangEditContent" name="wangEditContent" style="min-height: 500px;"></div>
                        <b><span class="text-danger"></span></b>
                        <span class="help-block">最多输入2000个字符</span>
                    </div>
                </div>
                <div class="hidden" id="contentHidden">
                    ${substanceInfo.substanceContentPO.content}
                </div>
                <div class="col-md-6">
                    <div class="form-inline">
                        <div class="check-box">
                            <c:choose>
                                <c:when test="${substanceInfo.isRealistic == 1}">
                                    <input type="checkbox" checked id="locationSwitch"/>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox"  id="locationSwitch"/>
                                </c:otherwise>
                            </c:choose>
                            <label class="text20px" for="locationSwitch">是否添加一个位置</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <span class="help-block">添加一个位置，将分享您指定的地理</span>
                    <hr>
                </div>
                <!--这里可能出错，出错将导致地图加载错误-->
                <div class="hidden" id="localeHidden">
                    ${substanceInfo.locale}
                </div>
                <div class="col-md-12">
                    <div class="form-inline">
                        <div class="form-group" style="position: relative;width: 60%;">
                            <label for="addressTxt" class="sr-only">输入地点搜索：</label>
                            <input type="search" class="form-control" id="addressTxt" placeholder="请输入地点" style="width: 100%;">
                            <div id="searchResultPanel" style="border: 1px solid #C0C0C0;width: 100%;height: auto;display: none;"></div>
                        </div>
                        <button type="button" class="btn btn-primary" id="relocation">定位并设置为发布地点</button>
                    </div>
                </div>
                <div class="col-md-12 paddingT-5">
                    <div class="col-md-12 thumbnail" id="mapContainer" style="min-height: 350px;margin-bottom: 5px;"></div>
                </div>
                <div class="col-md-12">
                    <p class="bg-primary rounded-box text16px">当前的选择的位置是：
                        <b id="nowLocation">天津市</b>
                    </p>
                    <hr>
                </div>
                <div class="col-md-6" style="margin-bottom: 5px;">
                    <div class="form-inline">
                        <div class="check-box">
                            <c:choose>
                                <c:when test="${substanceInfo.isRestricted == 1}">
                                    <input type="checkbox" checked id="invitationSwitch"/>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" id="invitationSwitch"/>
                                </c:otherwise>
                            </c:choose>
                            <label for="invitationSwitch">是否添加一个邀请码</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="invitationCode">请输入邀请码：</label>
                            <input type="text" class="form-control" id="invitationCode" name="invitationCode" placeholder="邀请码" value="${substanceInfo.joinCode}">
                            <b><span class="text-danger"></span></b>
                            <span class="help-block">邀请码可以限制加入，固定为8位，只能包含英文和数字</span>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="col-md-6">
                    <div class="form-inline">
                        <div class="check-box">
                            <c:choose>
                                <c:when test="${substanceInfo.isAnonymousPermit == 1}">
                                    <input type="checkbox" checked id="anonymousSwitch"/>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" id="anonymousSwitch"/>
                                </c:otherwise>
                            </c:choose>
                            <label for="anonymousSwitch">是否允许非兴趣组用户查看详细内容</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <span class="help-block">如果为'否'将阻止非兴趣组的用户看到除了标题和摘要之外的内容</span>
                    <hr>
                </div>
                <div class="col-md-6 col-md-offset-3 paddingB-5">
                    <div class="btn-group btn-group-justified" role="group" aria-label="submit">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-primary" id="sureSubmit">确认提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/wangEditor.js"></script>
    <script src="/iCheck/icheck.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        globalEditor = null;// 编辑器
        globalPoint = null;// 每次定位获得的point
        $(function () {
            // wangedit
            var oWangEditor = window.wangEditor;
            var myEditor = new oWangEditor('#wandEditMenu','#wangEditContent');
            myEditor.customConfig.uploadImgServer = '/client/publishImgUpload';// 图片上传路径
            myEditor.customConfig.showLinkImg = false;// 隐藏网络图片按钮
            myEditor.customConfig.uploadImgMaxSize = 2 * 1024 * 1024;// 图片大小限制为2M
            myEditor.customConfig.uploadImgMaxLength = 1;
            myEditor.customConfig.uploadImgHooks = {
                before: function (xhr, editor, files) {
                    // 图片上传之前触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

                    // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
                    // return {
                    //     prevent: true,
                    //     msg: '放弃上传'
                    // }
                },
                success: function (xhr, editor, result) {
                    // 图片上传并返回结果，图片插入成功之后触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
                    alert(result + "\n" + xhr.statusText);
                },
                fail: function (xhr, editor, result) {
                    // 图片上传并返回结果，但图片插入错误时触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
                    alert(result + "\n" + xhr.statusText);
                },
                error: function (xhr, editor) {
                    // 图片上传出错时触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
                    alert("error" + xhr.statusText);

                },
                timeout: function (xhr, editor) {
                    // 图片上传超时时触发
                    // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
                    alert("timeout" + xhr.statusText);
                },
                // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
                // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
                customInsert: function (insertImg, result, editor) {
                    // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
                    // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
                    console.log(result);
                    // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
                    var url = result.url;
                    insertImg(url);

                    // result 必须是一个 JSON 格式字符串！！！否则报错
                }
            };
            myEditor.customConfig.zIndex = 10;
            myEditor.customConfig.menus = [
                'head',  // 标题
                'bold',  // 粗体
                'italic',  // 斜体
                'underline',  // 下划线
                'foreColor',  // 文字颜色
                'link',  // 插入链接
                'justify',  // 对齐方式
                'image',  // 插入图片
                'video'  // 插入视频
            ];
            myEditor.create();
            globalEditor = myEditor;

            // 如果id=contentHidden 的dom内容不为空
            if ($("#contentHidden").text() !== ""){
                myEditor.txt.html($("#contentHidden").html());
            }
            // iCheck 插件
            $("input[type='checkbox']").each(function(){
                var self = $(this),
                    label = self.next(),
                    label_text = label.text();
                label.remove();
                self.iCheck({
                    checkboxClass: 'icheckbox_line-blue',
                    radioClass: 'iradio_line-blue',
                    insert: '<div class="icheck_line-icon"></div>' + label_text
                });
                self.parent().attr("id",self.attr("id"));
                self.attr("id","");
            });
        });
    </script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Z6Sjk1PdxeUdExaBh3s56HDm2pTNSYhm"></script>
    <script src="/js/client/publish_map.js"></script>
    <script src="/js/simpleValidation.js"></script>
    <script>
        $(function () {
            // 全局验证对象
            var oGlobalFlag = {
                caption : false,
                summary : false,
                wangEditContent : false,
                invitationCode : true
            };
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
                    input_obj.parent().find(".text-danger").text("");
                    input_obj.parent().addClass("has-success").removeClass("has-error");
                }
            };

            var $caption = $("#caption");
            var $summary = $("#summary");
            var $invitationCode = $("#invitationCode");
            var $locationSwitch = $("#locationSwitch");
            var $invitationSwitch = $("#invitationSwitch");
            var $anonymousSwitch = $("#anonymousSwitch");

            $("#sureSubmit").click(function () {
                var params = {
                    caption : $caption.val(),
                    summary : $summary.val(),
                    cover : "",
                    mainContent : globalEditor.txt.html(),
                    locationSwitch : $locationSwitch.hasClass("checked") ? 1 : 0,
                    location : "",
                    invitationSwitch : $invitationSwitch.hasClass("checked") ? 1 : 0,
                    invitationCode : "",
                    anonymousSwitch : $anonymousSwitch.hasClass("checked") ? 1 : 0
                };
                // 获取用户上传图片的第一张，如果没有则cover为空
                var temp_cover = $($(".upload-img")[0]).attr("src");
                if (undefined !== temp_cover && /\.(jpg|jpeg|png|bmp|gif)$/i.test(temp_cover) !== false){
                    params.cover = temp_cover;
                }
                // 获取地图的point，并拼接到location后面
                if (params.locationSwitch){
                    if (null === globalPoint){
                        alert("定位还未完成");
                        return;
                    } else {
                        params.location += $("#nowLocation").text() + "," + globalPoint.lng + "," + globalPoint.lat;
                    }
                }
                var validator = new simpleValidation();// 验证器
                validator._validate("caption","标题","required|max_length|min_length",function (results) {
                    common_callback($caption,results);
                },2,20);
                validator._validate("summary","简介","required|max_length",function (results) {
                    common_callback($summary,results);
                },0,120);
                // 判断是否添加一个邀请码
                if (params.invitationSwitch){
                    params.invitationCode = $("#invitationCode").val();
                    validator._validate("invitationCode","邀请码","required|max_length|min_length|alpha_numeric",function (results) {
                        common_callback($invitationCode,results);
                    },8,8);
                }
                var res = {
                    resultFlag : false,
                    resultMsg : ""
                };

                // 这里单独判断主要内容是否满足条件
                if (globalEditor.txt.text().trim().length < 10 || globalEditor.txt.text().trim().length > 2000){
                    res.resultMsg = "主要内容长度不能小于10且不能大于2000";
                    common_callback($("#wangEditContent"),res);
                } else {
                    res.resultMsg = "";
                    res.resultFlag = true;
                    common_callback($("#wangEditContent"),res);
                }

                var ready2submit = true,prop;
                for (prop in oGlobalFlag){
                    ready2submit = ready2submit && oGlobalFlag[prop];
                }
                if (!ready2submit){
                    // 验证失败
                } else {
                    $.post("/client/publishInfo?time=" + new Date().getTime(), params, function (result) {
                        alert(result);
                        // window.location.href = "/";
                    });

                    console.log(globalEditor.txt.html());
                    console.log("-------------------------");
                    console.log(globalEditor.txt.text());
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
