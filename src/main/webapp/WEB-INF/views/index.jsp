<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>自由分享ლ(╹◡╹ლ)</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond./min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px;">
    <%--<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="border-bottom: none;background-color: rgba(2,2,2,0.85);">--%>
        <%--<div class="container-fluid">--%>
            <%--<div class="navbar-header">--%>
                <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">--%>
                    <%--<span class="sr-only">Toggle navigation</span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                <%--</button>--%>
                <%--<a class="navbar-brand" href="#">--%>
                    <%--<img src="/images/myweb/isharing.png" alt="ISharing" height="25" width="40" style="margin-top: -2px;">--%>
                <%--</a>--%>
            <%--</div>--%>

            <%--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
                <%--<ul class="nav navbar-nav">--%>
                    <%--<li>--%>
                        <%--<a href="#">首页</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<div class="navbar-form navbar-right" role="login or register">--%>
                    <%--<a href="/client/register" class="btn btn-danger">注册</a>--%>
                    <%--&nbsp;--%>
                    <%--<a href="/client/login" class="btn btn-default">登录</a>--%>
                    <%--&nbsp;--%>
                <%--</div>--%>
                <%--<div class="navbar-form navbar-right" role="search">--%>
                    <%--<div class="input-group">--%>
                        <%--<input type="text" class="form-control" placeholder="搜索你感兴趣的内容"/>--%>
                        <%--<span class="input-group-btn">--%>
                                <%--<button class="btn btn-default" type="button" aria-label="search button">--%>
                                    <%--&nbsp;<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;--%>
                                <%--</button>--%>
                            <%--</span>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</nav>--%>
    <%@include file="client/header.jsp"%>
    <div class="container-fluid banner" role="banner">
        <div class="row clearfix">
            <div class="col-md-12" style="height: 80px;"></div>
            <div class="col-md-4 col-md-offset-4">
                <h2 class="text-center"><small style="color: #fff;">搜索</small></h2>
            </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="input-group">
                    <input type="search" class="form-control search-control" style="border-right: none;" placeholder="搜索">
                    <span class="input-group-btn">
                        <a href="#" class="btn btn-default search-control" role="button" style="background-color: rgba(0,0,0,0.1);border-left: none;">
                            &nbsp;<span class="glyphicon glyphicon-search"></span>&nbsp;
                        </a>
                    </span>
                </div>
            </div>
        </div>
        <img src="/images/gradual_green.jpg" class="banner-bg" style="z-index: -10;" aria-label="banner image">
        <div class="banner-bg" style="z-index: -9;background: #000;filter: alpha(Opacity=30);opacity: 0.3;" aria-label="bg mask"></div>
    </div>

    <div class="container" style="display: none">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" style="height: 300px;" role="listbox">
                <a href="#" class="item active listBox-item">
                    <img src="/images/cat.jfif" class="img-responsive">
                    <div class="carousel-caption">
                        nihao
                    </div>
                </a>
                <a href="#" class="item listBox-item clearfix">
                    <img src="/images/queen.jfif">
                    <div class="carousel-caption">
                        ...
                    </div>
                </a>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="container" style="margin-top: 20px;" aria-label="latest contents">
        <div class="row">
            <div class="col-md-12">
                <p class="text-center paddingAll"><strong>---推荐---</strong></p>
            </div>
        </div>
        <div class="row clearfix recommend-lists">
            <div class="col-md-3 col-xs-12 recommend-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/cat.jfif" alt="cat" style="width: 100%;height: 150px;">
                        <div class="caption">
                            <p>catdfsdfddddddddddddddddddddddddddfsfsdfsdfsd</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 recommend-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/cat.jfif" alt="cat" style="width: 100%;height: 150px;">
                        <div class="caption">
                            <p>catdfsdfddddddddddddddddddddddddddfsfsdfsdfsd</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 recommend-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/queen.jfif" alt="cat" style="width: 100%;height: 150px;">
                        <div class="caption">
                            <p>catdfsdfddddddddddddddddddddddddddfsfsdfsdfsd</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 recommend-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/iu.jfif" alt="cat" style="width: 100%;height: 150px;">
                        <div class="caption">
                            <p>catdfsdfddddddddddddddddddddddddddfsfsdfsdfsd</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p class="text-center paddingAll"><strong>---最新---</strong></p>
            </div>
        </div>
        <div class="row clearfix latest-lists" id="masonry">
            <div class="col-md-3 col-xs-12 latest-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/cat.jfif" alt="cat">
                        <div class="caption">
                            <h3>CAT</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 latest-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/queen.jfif" alt="cat">
                        <div class="caption">
                            <h3>CAT</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 latest-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/iu.jfif" alt="cat">
                        <div class="caption">
                            <h3>CAT</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 latest-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <img src="/images/cat.jfif" alt="cat">
                        <div class="caption">
                            <h3>CAT</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 latest-item">
                <div class="thumbnail clear-border clear-padding shards-shadow">
                    <a href="#">
                        <div class="caption">
                            <h3>CAT11111</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-4 col-md-offset-4">
                <button type="button" class="btn btn-link" style="width: 100%">加载更多</button>
            </div>
        </div>
    </div>

    <footer style="padding-top: 50px;padding-bottom: 50px;margin-top: 50px; color: rgb(153, 151, 156);background-color: rgb(42, 39, 48);text-align: center;">
        EMAIL:&nbsp;<a href="mailto:#"><abbr title="zoubaicai@126.com">zbc</abbr></a>
    </footer>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/masonry.pkgd.min.js"></script>
    <script src="/js/imagesloaded.pkgd.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        $(function () {
            // 这里是iamgeloaded和masonry
            var $masonry = $("#masonry");
            $masonry.imagesLoaded(function () {
                $masonry.masonry({
                    itemSelector : ".latest-item"
                });
            });

        });
    </script>
</body>
</html>