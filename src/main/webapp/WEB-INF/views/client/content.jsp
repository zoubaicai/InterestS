<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2017/12/19
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>内容</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/content.css" rel="stylesheet">
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
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-9 white-back shards-shadow ">
                    <header>
                        <div class="col-md-12">
                            <h2 class="text-center">画师saihate的作品 ​</h2>
                            <blockquote aria-label="summary">
                                <p>画师saihate的作品</p>
                            </blockquote>
                        </div>
                    </header>
                    <hr>
                    <article aria-label="detailed content">
                        <div class="col-md-12" aria-label="main content" style="min-height: 200px;">
                            <p>Main Content</p>
                        </div>
                    </article>
                    <!--地址信息-->
                    <div class="col-md-12">
                        <hr>
                        <label for="mapContainer">地点：<span id="locationTxt"></span></label>
                        <div class="col-md-12 thumbnail" id="mapContainer" style="min-height: 200px;"></div>
                    </div>
                    <!--兴趣组成员-->
                    <div class="col-md-12" aria-label="participants" style="min-height: 50px;">
                        <label><span>2</span>感兴趣</label>
                        <div class="user-lists">
                            <a href="#" class="user-item"><img src="/images/user.png" class="user-item-img img-rounded"></a>
                            <a href="#" class="user-item"><img src="/images/user.png" class="user-item-img img-rounded"></a>
                        </div>
                        <div class="col-md-6 col-md-offset-3">
                            <div class="btn-group btn-group-justified marginT-10" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-primary">加入</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-primary">收藏</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" aria-label="input comment">
                        <hr>
                        <textarea class="form-control" placeholder="输入观点"></textarea>
                        <div class="paddingT-5 clearfix">
                            <button type="button" class="btn btn-primary btn-sm pull-right">发布</button>
                        </div>
                    </div>
                    <div class="col-md-12" aria-label="comment area" style="min-height: 100px;">
                        <div class="comment-lists clearfix marginT-10">
                            <div class="comment-item clearfix">
                                <div class="col-xs-2">
                                    <a href="#"><img src="/images/user.png" class="img-rounded"></a>
                                    <small>2018-1-7 15:26</small>
                                </div>
                                <div class="col-xs-10">
                                    <p>Disabled checkboxes and radios are supported, but to provide a "not-allowed" cursor on hover of the parent, you'll need to add the .disabled class to the parent .radio, .radio-inline, .checkbox, or .checkbox-inline</p>
                                </div>
                            </div>
                            <div class="comment-item clearfix">
                                <div class="col-xs-2">
                                    <a href="#"><img src="/images/user.png" class="img-rounded"></a>
                                    <small>2018-1-7 15:26</small>
                                </div>
                                <div class="col-xs-10">
                                    <p>Disabled checkboxes and radios are supported, but to provide a "not-allowed" cursor on hover of the parent, you'll need to add the .disabled class to the parent .radio, .radio-inline, .checkbox, or .checkbox-inline</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <nav aria-label="lists navigation">
                            <ul class="pager">
                                <li class="previous"><a href="#">上一页</a></li>
                                <li class="page-info">第1页,共1页</li>
                                <li class="next"><a href="#">下一页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-md-3 hidden-sm hidden-xs">
                    <div class="shards-shadow thumbnail clear-border clear-radius">
                        <h5 class="text-center">组长</h5>
                        <hr>
                        <a href="#">
                            <img src="/images/user.png" class="img-circle group-leader-img">
                            <p class="text-center group-leader-name">ZBC</p>
                        </a>
                        <hr>
                        <div class="btn-group btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default clear-radius clear-border"><span>1</span>发布</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default clear-radius clear-border"><span>0</span>加入</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default clear-radius clear-border"><span>0</span>收藏</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <%@include file="footer.jsp"%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        //百度地图API功能
        function loadJScript() {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "http://api.map.baidu.com/api?v=2.0&ak=Z6Sjk1PdxeUdExaBh3s56HDm2pTNSYhm&callback=mapInit";
            document.body.appendChild(script);
        }
        function mapInit() {
            var map = new BMap.Map("mapContainer");            // 创建Map实例
            var point = new BMap.Point(117.29119, 39.055712); // 创建点坐标
            map.centerAndZoom(point,15);
            var marker = new BMap.Marker(point);
            map.addOverlay(marker);    //添加标注
            marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        }
        $(function () {
            loadJScript();
            // ---------------------------------------------------------------------------------------------------------

        });
    </script>
</body>
</html>
