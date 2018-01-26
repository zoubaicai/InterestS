<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2017/12/22
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发布新兴趣组</title>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-switch.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
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
                        <input type="text" class="form-control" id="caption" placeholder="请输入标题">
                        <span class="help-block">合适的标题更加吸引人，最长20个字符</span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="text20px" for="summary">简介：</label>
                        <textarea class="form-control" id="summary" placeholder="请输入简介" aria-describedby="summary_help"></textarea>
                        <span id="summary_help" class="help-block">一个合适的简介能够让别人更容易发现这里，最多120个字符</span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="text20px">主要内容：</label>
                        <div class="" id="wandEditMenu"></div>
                        <div class="form-control focusshadow" id="wangEditContent" style="min-height: 500px;"></div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-inline">
                        <div class="check-box">
                            <label class="text20px" for="locationSwitch">是否添加一个位置：</label>
                            <input type="checkbox" checked id="locationSwitch"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <hr>
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
                    <div class="col-md-12 thumbnail" id="mapContainer" style="min-height: 350px;margin-bottom: 5px;">

                    </div>
                </div>
                <div class="col-md-12">
                    <p class="bg-primary rounded-box text16px">当前的选择的位置是：<b id="nowLocation">天津市</b></p>
                    <hr>
                </div>
                <div class="col-md-12">
                    <div class="form-inline">
                        <div class="check-box">
                            <label class="text20px" for="invitationSwitch">是否添加一个邀请码：</label>
                            <input type="checkbox" checked id="invitationSwitch"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="invitationCode">请输入邀请码：</label>
                            <input type="text" class="form-control" id="invitationCode" placeholder="邀请码">
                            <span id="invitation-help" class="help-block">邀请码可以限制随意的加入，固定为8位，只能包含英文和数字</span>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="col-md-12">
                    <div class="form-inline">
                        <div class="check-box">
                            <label class="text20px" for="anonymousSwitch">是否允许非兴趣组查看详细内容：</label>
                            <input type="checkbox" checked id="anonymousSwitch"/>
                            <span class="help-block">如果为'是'将阻止非加入的用户看到除了标题和摘要之外的内容</span>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="col-md-6 col-md-offset-3 paddingB-5">
                    <div class="btn-group btn-group-justified" role="group" aria-label="submit">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-primary">确认提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-switch.min.js"></script>
    <script src="/js/wangEditor.js"></script>
    <script>
        $(function () {
            // wangedit
            var oWangEditor = window.wangEditor;
            var myEditor = new oWangEditor('#wandEditMenu','#wangEditContent');
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
            // 初始化BootStrap-switch按钮
            $("#locationSwitch").bootstrapSwitch({onText:'是',offText:'否',size:'small'});
            $("#invitationSwitch").bootstrapSwitch({onText:'是',offText:'否',size:'small'});
            $("#anonymousSwitch").bootstrapSwitch({onText:'是',offText:'否',size:'small'});
        });
    </script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Z6Sjk1PdxeUdExaBh3s56HDm2pTNSYhm"></script>
    <script src="/js/client/publish_map.js"></script>

</body>
</html>
