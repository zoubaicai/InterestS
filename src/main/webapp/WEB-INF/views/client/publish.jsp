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
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
         style="border-bottom: none;">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">InterestS</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">ONE</a>
                    </li>
                    <li>
                        <a href="#">TWO</a>
                    </li>
                    <li>
                        <a href="#">THREE</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">消息<span class="badge">3</span> </a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">
                            <img style="width: 24px;height: 24px;" src="data:image/jpeg;base64,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" alt="头像">
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人中心</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="navbar-form navbar-right" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="搜索你感兴趣的内容"/>
                        <span class="input-group-btn">
                                <button class="btn btn-default" type="button" aria-label="search button">
                                    &nbsp;<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
                                </button>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </nav>
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
    <footer style="padding-top: 50px;padding-bottom: 50px;margin-top: 50px; color: rgb(153, 151, 156);background-color: rgb(42, 39, 48);text-align: center;">
        EMAIL:&nbsp;<a href="mailto:#"><abbr title="zoubaicai@126.com">zbc</abbr></a>
    </footer>
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
