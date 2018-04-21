<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>兴趣共享 (๑¯∀¯๑)</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
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
    <%@include file="client/header.jsp"%>
    <div class="container banner" style="position: relative;">
        <img src="/images/500305956_banner.jpg" class="shards-shadow" style="height: 400px;width: 98%;position: absolute;top: 0;left: 1%;z-index: -1;">
        <div class="row clearfix">
            <div class="col-md-12" style="height: 150px;"></div>
            <div class="col-md-4 col-md-offset-4" style="z-index: 10;">
                <h2 class="text-center"><small style="font-size: 1.1em;color: #666;">兴趣分享</small></h2>
            </div>
            <div class="col-md-4 col-md-offset-4" style="z-index:10;">
                <div>
                    <div class="input-group" style="max-width: 500px;margin: 0 auto;">
                        <input type="search" id="indexSearchText" class="form-control search-control" style="border-right: none;" placeholder="搜索">
                        <span class="input-group-btn">
                        <a href="javascript:void(0)" class="btn btn-default search-control" role="button" id="indexSearchBtn" style="border-left: none;">
                            &nbsp;<span class="glyphicon glyphicon-search"></span>&nbsp;
                        </a>
                    </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top: 60px;">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center paddingAll"><strong>---推荐---</strong></h5>
            </div>
        </div>
        <div class="row clearfix recommend-lists">
            <c:choose>
                <c:when test="${r_lists.size() > 0}">
                    <c:forEach items="${r_lists}" var="list">
                        <div class="col-md-6 col-xs-12 recommend-item">
                            <div class="thumbnail clear-border clear-padding clear-radius shards-shadow">
                                <a href="/content?id=${list.recommendId}" target="_blank">
                                    <c:choose>
                                        <c:when test="${list.substanceInfoPO.cover == '' || list.substanceInfoPO.cover == null}">
                                            <img src="/images/interestshare.jpg" alt="${list.substanceInfoPO.subject}" style="height: 150px;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${list.substanceInfoPO.cover}" alt="${list.substanceInfoPO.subject}" style="height: 150px;width: 100%">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="caption">
                                        <p>${list.substanceInfoPO.subject}</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning" role="alert">所有推荐都丢了</div>
                </c:otherwise>
            </c:choose>




            <%--<div class="col-md-6 col-xs-12 recommend-item">--%>
                <%--<div class="thumbnail clear-border clear-padding clear-radius shards-shadow">--%>
                    <%--<a href="#">--%>
                        <%--<img src="/images/interestshare.jpg" alt="cat" style="height: 150px;">--%>
                        <%--<div class="caption">--%>
                            <%--<p>Test</p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-6 col-xs-12 recommend-item">--%>
                <%--<div class="thumbnail clear-border clear-padding clear-radius shards-shadow">--%>
                    <%--<a href="#">--%>
                        <%--<img src="/images/interestshare.jpg" alt="cat" style="height: 150px;">--%>
                        <%--<div class="caption">--%>
                            <%--<p>Test</p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center paddingAll"><strong>---最新---</strong></h5>
            </div>
        </div>
        <div class="row clearfix latest-lists" id="masonry">
            <c:choose>
                <c:when test="${lists.size() > 0}">
                    <c:forEach items="${lists}" var="list">
                        <div class="col-md-3 col-xs-12 latest-item">
                            <div class="thumbnail clear-border clear-padding shards-shadow">
                                <a href="/content?id=${list.id}" target="_blank">
                                    <c:choose>
                                        <c:when test="${list.cover == '' || list.cover == null}">
                                            <img src="/images/interestshare.jpg" alt="${list.subject}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${list.cover}" alt="${list.subject}">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="caption">
                                        <h3>${list.subject}</h3>
                                        <p>${list.summary}</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-xs-12">
                        <div class="alert alert-warning" role="alert">没有找到任何内容</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="row clearfix">
            <div class="col-md-4 col-md-offset-4">
                <a href="/allcontent?p=1&c=default" class="btn btn-link" style="width: 100%">更多</a>
            </div>
        </div>
    </div>
    <div class="hidden" id="isHomePage">1</div>
    <footer style="padding-top: 50px;padding-bottom: 50px;margin-top: 50px; color: rgb(153, 151, 156);background-color: rgb(42, 39, 48);text-align: center;">
        EMAIL:&nbsp;<a href="mailto:#"><abbr title="zoubaicai@126.com">zbc</abbr></a>
    </footer>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/masonry.pkgd.min.js"></script>
    <script src="/js/imagesloaded.pkgd.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
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

            // 主页搜索按钮
            $("#indexSearchBtn").click(function () {
                var s = window.decodeURIComponent($("#indexSearchText").val());
                if (s === "" || s === undefined){
                    zmAlert("搜索内容不能为空");
                    return;
                }
                window.location.href = "/search?p=1&s=" + s;
            });

        });
    </script>
</body>
</html>