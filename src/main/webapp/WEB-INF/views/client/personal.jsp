<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2017/12/21
  Time: 15:00
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
    <title>个人中心</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/personal.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px;">
    <%@include file="header.jsp"%>
    <!--这里是主要摆放头像、名称、和导航-->
    <div class="container" style="min-height: 200px;background-color: #fff;padding: 10px;">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-2">
                    <c:choose>
                        <c:when test="${userInfo.portrait == null || userInfo.portrait == ''}">
                            <img class="img-thumbnail clear-border shards-shadow" src="/images/user.png" >
                        </c:when>
                        <c:otherwise>
                            <img class="img-thumbnail clear-border shards-shadow" src="${userInfo.portrait}" >
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="col-md-7">
                    <p class="lead" style="display: inline;padding: 6px;">${userInfo.userNickname}</p>
                </div>
                <div class="col-md-3">
                    <c:if test="${isVisitor == -1}">
                        <a href="/client/setting" class="btn btn-link pull-right">帐号设置</a>
                    </c:if>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-12" style="margin-top: 10px;">
                <ul class="nav nav-tabs" aria-describedby="#masonry is tabcontent">
                    <li role="presentation" class="active">
                        <a href="#panel-publish" data-toggle="tab" id="panelPublishBtn"><span>${publishNum}</span>发布</a>
                    </li>
                    <li role="presentation">
                        <a href="#panel-join" data-toggle="tab" id="panelJoinBtn"><span>${joinNum}</span>加入</a>
                    </li>
                    <li role="presentation">
                        <a href="#panel-collection" data-toggle="tab" id="panelCollectionBtn"><span>${collectNum}</span>收藏</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--这里是选项卡的切换面板-->
    <div class="container">
        <div class="row tab-content" id="masonry" style="min-height: 400px;background-color: #eee;padding-top: 10px;">
            <!--发布面板-->
            <div class="tab-pane active clearfix" id="panel-publish">
                <div class="col-md-3 col-xs-12 paint padding-3">
                    <div class="thumbnail clear-border shards-shadow">
                        <div style="display: table;width: 100%;">
                            <a class="btn btn-link" href="/client/publish" style="display: table-cell;width: inherit;height: 200px;text-align: center;vertical-align: middle;">
                                <span class="glyphicon glyphicon-plus" style="font-size: 30px;"></span>
                                <br>
                                添加发布
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane clearfix" id="panel-join">
                <%--<p>这里是加入面板</p>--%>
            </div>
            <div class="tab-pane clearfix" id="panel-collection">
                <%--<p>这里是收藏面板</p>--%>
            </div>
        </div>
        <span class="hidden" id="offsetPublish">0</span>
        <span class="hidden" id="offsetJoin">0</span>
        <span class="hidden" id="offsetCollect">0</span>
        <span class="hidden" id="isVisitor">${isVisitor}</span>
    </div>
    <%@include file="footer.jsp"%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/masonry.pkgd.min.js"></script>
    <script src="/js/imagesloaded.pkgd.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        $(function () {
            // 这里是iamgeloaded和masonry
            // var $masonry = $("#masonry");
            // 得到uid
            var getUid = function () {
                var regex = /uid=\w+/;
                var uid = -1;
                try {
                    uid = regex.exec(location.search)[0].substr(4);
                } catch (e){
                    uid = -1;
                }
                return uid;
            };
            // 加载发布内容
            var loadPublish = function () {
                var $panel_publish = $("#panel-publish");
                var $offsetPublish = $("#offsetPublish");
                var isVisitor = $("#isVisitor").text();
                var params = {
                    offset : $offsetPublish.text(),
                    uid : getUid()
                };
                $.post("/personal/loadPublish?time=" + new Date().getTime(),params,function (result) {
                    var jsonRes = JSON.parse(result);
                    if ($("#loadPublishBtn")){
                        $("#loadPublishBtn").parent().remove();
                        $panel_publish.children("h3:last-child").remove();
                    }
                    if (jsonRes.length === 0){
                        $panel_publish.append("<h3 class='text-center' style='margin-top: "  + ($panel_publish.height()) + "px'><small>没有更多了</small></h3>");
                    } else {
                        for (var i =0;i<jsonRes.length;i++){
                            if (jsonRes[i].cover === undefined || jsonRes[i].cover === ""){
                                jsonRes[i].cover = "/images/loadingandword.gif";
                            }
                            var div = "<div class=\"col-md-3 paint padding-3\">\n" +
                                "                    <div class=\"thumbnail clear-border clear-padding clear-radius shards-shadow\">\n" +
                                "                        <a href=\"/content?id=" + jsonRes[i].substanceId +  "\" target='_blank'>\n" +
                                "                            <img src=\"" + jsonRes[i].cover + "\" alt=\"image\">\n" +
                                "                        </a>\n" +
                                "                        <div class=\"caption\">\n" +
                                "                            <h3>" + jsonRes[i].subject + "</h3>\n" +
                                "                            <p>" + jsonRes[i].summary + "</p>\n";
                            if (isVisitor === "-1"){
                                div += "                            <p>\n" +
                                    "                                <a href=\"#\" class=\"btn btn-default width100\" role=\"button\">编辑</a>\n" +
                                    "                            </p>\n";
                            }
                            div += "                        </div>\n" +
                                "                    </div>\n" +
                                "                </div>";
                            $panel_publish.append(div);
                        }
                        $panel_publish.append("<div class='col-xs-12 text-center paint'><button id='loadPublishBtn' type='button' class='btn btn-link'>加载更多</button></div>");
                        var offset = parseInt($offsetPublish.text());
                        $offsetPublish.text(++offset);
                        $("#loadPublishBtn").click(function () {
                            loadPublish();
                        });
                    }
                    // 调用imagesLoaded
                    $panel_publish.imagesLoaded(function () {
                        $panel_publish.masonry({
                            itemSelector : ".paint"
                        });
                    });
                });
            };
            // 加载加入的兴趣组
            var loadJoin = function () {
                var $panel_join = $("#panel-join");
                var $offsetJoin = $("#offsetJoin");
                var isVisitor = $("#isVisitor").text();
                var params = {
                    offset : $offsetJoin.text(),
                    uid : getUid()
                };
                $.post("/personal/loadJoin?time=" + new Date().getTime(),params,function (result) {
                    var jsonRes = JSON.parse(result);
                    if ($("#loadJoinBtn")){
                        $("#loadJoinBtn").parent().remove();
                        $panel_join.children("h3:last-child").remove();
                    }
                    if (jsonRes.length === 0){
                        $panel_join.append("<h3 class='text-center' style='margin-top: "  + ($panel_join.height()) + "px'><small>没有更多了</small></h3>");
                    } else {
                        for (var i =0;i<jsonRes.length;i++){
                            if (jsonRes[i].cover === undefined || jsonRes[i].cover === ""){
                                jsonRes[i].cover = "/images/loadingandword.gif";
                            }
                            var div = "<div class=\"col-md-3 paint padding-3\">\n" +
                                "                    <div class=\"thumbnail clear-border clear-padding clear-radius shards-shadow\">\n" +
                                "                        <a href=\"/content?id=" + jsonRes[i].substanceId +  "\" target='_blank'>\n" +
                                "                            <img src=\"" + jsonRes[i].cover + "\" alt=\"image\">\n" +
                                "                        </a>\n" +
                                "                        <div class=\"caption\">\n" +
                                "                            <h3>" + jsonRes[i].subject + "</h3>\n" +
                                "                            <p>" + jsonRes[i].summary + "</p>\n";
                            if (isVisitor === "-1"){
                                div += "                            <p>\n" +
                                    "                                <a href=\"#\" class=\"btn btn-default width100\" role=\"button\">编辑</a>\n" +
                                    "                            </p>\n";
                            }
                            div += "                        </div>\n" +
                                "                    </div>\n" +
                                "                </div>";
                            $panel_join.append(div);
                        }
                        $panel_join.append("<div class='col-xs-12 text-center paint'><button id='loadJoinBtn' type='button' class='btn btn-link'>加载更多</button></div>");
                        var offset = parseInt($offsetJoin.text());
                        $offsetJoin.text(++offset);
                        $("#loadJoinBtn").click(function () {
                            loadJoin();
                        });
                    }
                    // 调用imagesLoaded
                    $panel_join.imagesLoaded(function () {
                        $panel_join.masonry({
                            itemSelector : ".paint"
                        });
                    });
                });
            };
            // 加载收藏内容
            var loadCollection = function () {
                var $panel_collection = $("#panel-collection");
                var $offsetCollection = $("#offsetCollect");
                var isVisitor = $("#isVisitor").text();
                var params = {
                    offset : $offsetCollection.text(),
                    uid : getUid()
                };
                $.post("/personal/loadCollection?time=" + new Date().getTime(),params,function (result) {
                    var jsonRes = JSON.parse(result);
                    if ($("#loadCollectionBtn")){
                        $("#loadCollectionBtn").parent().remove();
                        $panel_collection.children("h3:last-child").remove();
                    }
                    if (jsonRes.length === 0){
                        $panel_collection.append("<h3 class='text-center' style='margin-top: "  + ($panel_collection.height()) + "px'><small>没有更多了</small></h3>");
                    } else {
                        for (var i =0;i<jsonRes.length;i++){
                            if (jsonRes[i].cover === undefined || jsonRes[i].cover === ""){
                                jsonRes[i].cover = "/images/loadingandword.gif";
                            }
                            var div = "<div class=\"col-md-3 paint padding-3\">\n" +
                                "                    <div class=\"thumbnail clear-border clear-padding clear-radius shards-shadow\">\n" +
                                "                        <a href=\"/content?id=" + jsonRes[i].substanceId +  "\" target='_blank'>\n" +
                                "                            <img src=\"" + jsonRes[i].cover + "\" alt=\"image\">\n" +
                                "                        </a>\n" +
                                "                        <div class=\"caption\">\n" +
                                "                            <h3>" + jsonRes[i].subject + "</h3>\n" +
                                "                            <p>" + jsonRes[i].summary + "</p>\n";
                            if (isVisitor === "-1"){
                                div += "                            <p>\n" +
                                    "                                <a href=\"#\" class=\"btn btn-default width100\" role=\"button\">编辑</a>\n" +
                                    "                            </p>\n";
                            }
                            div += "                        </div>\n" +
                                "                    </div>\n" +
                                "                </div>";
                            $panel_collection.append(div);
                        }
                        $panel_collection.append("<div class='col-xs-12 text-center paint'><button id='loadCollectionBtn' type='button' class='btn btn-link'>加载更多</button></div>");
                        var offset = parseInt($offsetCollection.text());
                        $offsetCollection.text(++offset);
                        $("#loadCollectionBtn").click(function () {
                            loadCollection();
                        });
                    }
                    // 调用imagesLoaded
                    $panel_collection.imagesLoaded(function () {
                        $panel_collection.masonry({
                            itemSelector : ".paint"
                        });
                    });
                });
            };

            loadPublish();

            $("#panelJoinBtn").click(function () {
                loadJoin();
            });
            $("#panelCollectionBtn").click(function () {
               loadCollection();
            });
            $("#panelPublishBtn").click(function () {
               loadPublish();
            });

        });
    </script>
</body>
</html>
