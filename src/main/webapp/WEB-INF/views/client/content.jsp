<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2017/12/19
  Time: 12:35
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
    <title>内容</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
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
    <div class="container" id="mainContainer">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-9 white-back shards-shadow ">
                    <header>
                        <div class="col-md-12">
                            <h2 class="text-center">${substanceInfo.subject}</h2>
                            <blockquote aria-label="summary">
                                <p>${substanceInfo.summary}</p>
                            </blockquote>
                            <p class="text-right"><small><span class="glyphicon glyphicon-time"></span> ${substanceInfo.gmtCreate}</small></p>
                        </div>
                    </header>
                    <hr>
                    <article aria-label="detailed content">
                        <div class="col-md-12" aria-label="main content" style="min-height: 200px;">
                            <p>${substanceInfo.substanceContentPO.content}</p>
                        </div>
                    </article>
                    <!--地址信息-->
                    <div class="col-md-12" id="locationInfo">
                        <span class="hidden" id="isRealistic">${substanceInfo.isRealistic}</span>
                        <c:if test="${isAnonymous == 1}">
                            <span class="hidden" id="locale">${substanceInfo.locale}</span>
                        </c:if>
                        <%--<hr>--%>
                        <%--<label for="mapContainer">地点：<span id="locationTxt"></span></label>--%>
                        <%--<div class="col-md-12 thumbnail" id="mapContainer" style="min-height: 200px;"></div>--%>
                    </div>
                    <!--兴趣组成员-->
                    <div class="col-md-12" aria-label="participants" style="min-height: 50px;">
                        <hr>
                        <c:if test="${isAnonymous == 1}">
                            <label><span>${listGroupInfo.size()}</span>感兴趣</label>
                            <div class="user-lists">
                                <c:forEach items="${listGroupInfo}" var="item" varStatus="status">
                                    <a href="#" class="user-item"><img src="${item.userInfoPO.portrait}" class="user-item-img img-rounded"></a>
                                </c:forEach>
                                <c:if test="${listGroupInfo.size() < 1}">
                                    等待加入...!_!
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-md-12">
                        <div class="btn-group btn-group-justified marginT-10" role="group">
                            <div class="btn-group btn-group-sm" role="group">
                                <button type="button" class="btn btn-primary" id="personJoin"><span class="glyphicon glyphicon-ok-circle"></span> 加入</button>
                            </div>
                            <div class="btn-group btn-group-sm" role="group">
                                <button type="button" class="btn btn-primary" id="personCollect"><span class="glyphicon glyphicon-star"></span> 收藏</button>
                            </div>
                        </div>
                    </div>
                    <!--评论区域-->
                    <c:choose>
                        <c:when test="${isAnonymous == 1}">
                            <div class="col-md-12" aria-label="input comment">
                                <hr>
                                <textarea class="form-control" placeholder="输入观点" id="userComment"></textarea>
                                <div class="paddingT-5 clearfix">
                                    <button type="button" class="btn btn-primary btn-sm pull-right" id="commentSubmit">发布</button>
                                </div>
                            </div>
                            <div class="col-md-12" aria-label="comment area" style="min-height: 100px;">
                                <div class="comment-lists clearfix marginT-10" id="commentLists">
                                    <div style="background-color: #fff">
                                        <img class="center-block" src="/images/loadingandword.gif">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <nav aria-label="lists navigation">
                                    <ul class="pager">
                                        <li class="previous"><a href="javascript:void(0)" id="commentPrevious" disabled >上一页</a></li>
                                        <li class="page-info">第 <small id="offset">1</small> 页,共 <small id="sumPage">1</small> 页</li>
                                        <li class="next"><a href="javascript:void(0)" id="commentNext">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-md-12 marginT-10">
                                <p class="well well-lg">该兴趣组设置匿名访问限制，加入该兴趣组之后显示所有信息(o゜▽゜)o☆</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <span class="hidden" id="isAnonymous">${isAnonymous}</span><!--匿名标志，防君子-->
                <span class="hidden" id="isRestricted">${substanceInfo.isRestricted}</span>
                <!--发布者性息-->
                <div class="col-md-3 hidden-sm hidden-xs">
                    <div class="shards-shadow thumbnail clear-border clear-radius">
                        <h5 class="text-center">组长</h5>
                        <hr>
                        <a href="#">
                            <img src="${userInfo.portrait}" class="img-circle group-leader-img">
                            <p class="text-center group-leader-name">${userInfo.userNickname}</p>
                        </a>
                        <hr>
                        <div class="btn-group btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default clear-radius clear-border"><span>${publishCount}</span>发布</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default clear-radius clear-border"><span>${joinCount}</span>加入</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default clear-radius clear-border"><span>${collectCount}</span>收藏</button>
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
    <script src="/zeroModal/js/zeroModal.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        //百度地图API功能
        function loadBaiduMap() {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "http://api.map.baidu.com/api?v=2.0&ak=Z6Sjk1PdxeUdExaBh3s56HDm2pTNSYhm&callback=mapInit";
            document.body.appendChild(script);
        }
        function mapInit() {
            var localeArray = $("#locale").text().split(",");
            var $locationInfo = $("#locationInfo");
            $locationInfo.append("<hr>");
            $locationInfo.append("<label for='mapContainer'>所在位置： " + localeArray[0] + "</label>");
            $locationInfo.append("<div class='col-md-12 thumbnail' id='mapContainer' style='min-height: 200px;'></div>");
            var longitude = localeArray[1];
            var latitude = localeArray[2];
            var map = new BMap.Map("mapContainer");            // 创建Map实例
            var point = new BMap.Point(longitude, latitude); // 创建点坐标
            map.centerAndZoom(point,15);
            map.addControl(new BMap.NavigationControl({type: BMAP_NAVIGATION_CONTROL_ZOOM}));// 地图平移缩放控件
            var marker = new BMap.Marker(point);
            map.addOverlay(marker);    //添加标注
            marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        }
        $(function () {
            // 加载地图，匿名标志为 1 时
            if ($("#isRealistic").text() === "1" && $("#isAnonymous").text() === "1"){
                loadBaiduMap();
            }
            // 得到id
            var getSubstanceId = function () {
                var regex = /id=\w+/;
                var substanceId = regex.exec(location.search)[0].substr(3);
                return substanceId;
            };
            // 提交评论
            $("#commentSubmit").click(function () {
                if ($.cookie("token") === undefined){
                    zmAlert("请先登录0");
                    return;
                }
                var commentContent = $("#userComment").val();
                if (commentContent.length < 3){
                    zmAlert("评论内容不能小于3");
                    return;
                }
                var params = {
                    substanceId : getSubstanceId(),
                    commentContent : commentContent
                };
                $.post("/content/addComment?time" + new Date().getTime(),params,function (result) {
                    if (result === "-1"){
                        zmAlert("登录信息失效了，请重新登录！-1");
                    } else if (result === "-2"){
                        zmError("系统错误2");
                    } else if (result === "1"){
                        // 刷新评论区
                        zmSuccess("添加评价成功！");
                        $("#userComment").val("");
                        if ($("#offset").text() !== "1"){
                            loadComments($offset.text() - 1,10);
                        } else {
                            loadComments(0,10);
                        }
                    } else {
                        // 没有处理
                        zmError("意外的崩溃了(╯﹏╰)，请刷新页面重试！");
                    }
                });
            });
            // 加载评论内容
            var loadingDiv = "<div style=\"background-color: #fff\">\n" +
                "<img class=\"center-block\" src=\"/images/loadingandword.gif\">\n" +
                "</div>";
            var loadComments = function (offset,rows) {
                // 如果匿名标志为 1 就加载评论内容
                if ($("#isAnonymous").text() === "1"){
                    var $commentLists = $("#commentLists");
                    $commentLists.html(loadingDiv);
                    var params = {
                        substanceId : getSubstanceId(),
                        offset : offset,
                        rows : rows
                    };
                    $.post("/content/loadComments?time=" + new Date().getTime(),params,function (result) {
                        var res = JSON.parse(result);
                        var sumPage = res.sumPage;
                        var nowPosition = $("#offset").text();
                        if (sumPage == 0){
                            $commentLists.html("<p class='text-center'>还没有评论(⊙ˍ⊙)</p>");
                        } else {
                            var itemsDiv = "";
                            $("#sumPage").text(parseInt(sumPage / 10) + 1);// 总页数
                            var items = res.items;
                            for (var i=0; i<items.length; i++){
                                // console.log(items[i].portrait + "-" + items[i].gmtCreate + "-" + items[i].content + "\n");
                                itemsDiv += "<div class=\"comment-item clearfix\">" +
                                    "<div class=\"col-xs-3 text-center\">" +
                                    "<a href=\"#\"><img src=\"" + items[i].portrait + "\" class=\"img-rounded\"></a>" +
                                    "<small>" + items[i].gmtCreate.substr(0,19) + "</small>" +
                                    "</div>" +
                                    "<div class=\"col-xs-9\">" +
                                    "<p>" + items[i].content + "</p>" +
                                    "</div>" +
                                    "</div>";
                            }
                            $commentLists.html(itemsDiv);
                        }
                    });
                }
            };
            var $offset = $("#offset");
            var $sumPage = $("#sumPage");
            loadComments(0,10); // 页面初始化调用
            // 上一页
            $("#commentPrevious").click(function () {
                if ($offset.text() - 1 == 0){
                    zmAlert("已经是第一页了");
                } else {
                    loadComments($offset.text() - 1,10);
                }
            });
            // 下一页
            $("#commentNext").click(function () {
                if ($offset.text() == $sumPage.text()){
                    zmAlert("已经是最后一页了");
                } else {
                    loadComments($offset.text(),10);
                }
            });
            // 加入/收藏
            $("#personJoin").click(function () {
                if ($.cookie("token") === undefined){
                    zmAlert("请先登录！");
                    return;
                }
                var params = {};

                if ($("#isRestricted").text() === "1"){
                    zeroModal.show({
                        title : "该用户组有加入限制\n请输入邀请码，可以通过组长获得",
                        content : "<div class='from-group form-group-lg'><input class='form-control' type='text' id='invitationCode' placeholder='邀请码'></div>",
                        overlayClose : true,
                        ok : true,
                        cancel : true,
                        okFn : function () {
                            params = {
                                substanceId : getSubstanceId(),
                                invitationCode : $("#invitationCode").val()
                            };
                            personJoinPost(params);
                        }
                    });
                } else {
                    params = {
                        substanceId : getSubstanceId()
                    };
                    personJoinPost(params);
                }
                // 加入ajax提交
                var personJoinPost = function (params) {
                    $.post("/content/personJoin?time" + new Date().getTime(),params,function (result) {
                        switch (result){
                            case "1":
                                zmAlert("加入成功！");
                                break;
                            case "-1":
                                zmAlert("登录信息失效了，请重新登录！-1");
                                break;
                            case "-2":
                                zmAlert("您已经加入该兴趣组了");
                                break;
                            case "-4":
                                zmAlert("不是正确的邀请码");
                                break;
                            default:
                                zmError("意外的崩溃了(╯﹏╰)，请刷新页面重试！");
                                break;
                        }
                    });
                };
            });

            $("#personCollect").click(function () {
                if ($.cookie("token") === undefined){
                    zmAlert("请先登录！");
                    return;
                }
                var params = {
                    substanceId : getSubstanceId()
                };
                $.post("/content/personCollect?time" + new Date().getTime(),params,function (result) {
                    switch (result){
                        case "1":
                            zmAlert("收藏成功！");
                            break;
                        case "-1":
                            zmAlert("登录信息失效了，请重新登录！-1");
                            break;
                        case "-2":
                            zmAlert("您已经收藏过该兴趣组了");
                            break;
                        default:
                            zmError("意外的崩溃了(╯﹏╰)，请刷新页面重试！");
                            break;
                    }
                });
            });
        });
    </script>
</body>
</html>
