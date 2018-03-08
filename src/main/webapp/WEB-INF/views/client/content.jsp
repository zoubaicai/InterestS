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
                        <span class="hidden" id="locale">${substanceInfo.locale}</span>
                        <%--<hr>--%>
                        <%--<label for="mapContainer">地点：<span id="locationTxt"></span></label>--%>
                        <%--<div class="col-md-12 thumbnail" id="mapContainer" style="min-height: 200px;"></div>--%>
                    </div>
                    <!--兴趣组成员-->
                    <div class="col-md-12" aria-label="participants" style="min-height: 50px;">
                        <hr>
                        <label><span>${listGroupInfo.size()}</span>感兴趣</label>
                        <div class="user-lists">
                            <c:forEach items="${listGroupInfo}" var="item" varStatus="status">
                                <a href="#" class="user-item"><img src="${item.userInfoPO.portrait}" class="user-item-img img-rounded"></a>
                            </c:forEach>
                            <c:if test="${listGroupInfo.size() < 1}">
                                等待用户加入...!_!
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="btn-group btn-group-justified marginT-10" role="group">
                            <div class="btn-group btn-group-sm" role="group">
                                <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ok-circle"></span> 加入</button>
                            </div>
                            <div class="btn-group btn-group-sm" role="group">
                                <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-star"></span> 收藏</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" aria-label="input comment">
                        <hr>
                        <textarea class="form-control" placeholder="输入观点" id="userComment"></textarea>
                        <div class="paddingT-5 clearfix">
                            <button type="button" class="btn btn-primary btn-sm pull-right" id="commentSubmit">发布</button>
                        </div>
                    </div>
                    <!--评论区域-->
                    <div class="col-md-12" aria-label="comment area" style="min-height: 100px;">
                        <div class="comment-lists clearfix marginT-10">
                            <div style="background-color: #fff">
                                <img class="center-block" src="/images/loadingandword.gif">
                            </div>
                            <%--<div class="comment-item clearfix">--%>
                                <%--<div class="col-xs-2">--%>
                                    <%--<a href="#"><img src="/images/user.png" class="img-rounded"></a>--%>
                                    <%--<small>2018-1-7 15:26</small>--%>
                                <%--</div>--%>
                                <%--<div class="col-xs-10">--%>
                                    <%--<p>Disabled checkboxes and radios are supported, but to provide a "not-allowed" cursor on hover of the parent, you'll need to add the .disabled class to the parent .radio, .radio-inline, .checkbox, or .checkbox-inline</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="comment-item clearfix">--%>
                                <%--<div class="col-xs-2">--%>
                                    <%--<a href="#"><img src="/images/user.png" class="img-rounded"></a>--%>
                                    <%--<small>2018-1-7 15:26</small>--%>
                                <%--</div>--%>
                                <%--<div class="col-xs-10">--%>
                                    <%--<p>Disabled checkboxes and radios are supported, but to provide a "not-allowed" cursor on hover of the parent, you'll need to add the .disabled class to the parent .radio, .radio-inline, .checkbox, or .checkbox-inline</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <nav aria-label="lists navigation">
                            <ul class="pager">
                                <li class="previous"><a href="#">上一页</a></li>
                                <li class="page-info">第 <small id="offset">0</small> 页,共 <small id="sumPage">0</small> 页</li>
                                <li class="next"><a href="#">下一页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
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
            // 加载地图
            if ($("#isRealistic").text() === "1"){
                loadBaiduMap();
            }
            // 提交评论
            $("#commentSubmit").click(function () {
                if ($.cookie("token") === undefined){
                    alert("请先登录0");
                    return;
                }
                var regex = /id=\w+/;
                var substanceId = regex.exec(location.search)[0].substr(3);
                var commentContent = $("#userComment").val();
                if (commentContent.length < 3){
                    alert("评论内容不能小于3");
                    return;
                }
                var params = {
                    substanceId : substanceId,
                    commentContent : commentContent
                };
                $.post("/content/addComment?time" + new Date().getTime(),params,function (result) {
                    if (result === "-1"){
                        alert("请先登录1");
                    } else if (result === "-2"){
                        alert("系统错误");
                    } else if (result === "1"){
                        // 刷新评论区
                        alert("success");
                        $("#userComment").val("");
                    } else {
                        // 没有处理
                    }
                });
            });
            // 加载评论内容
            var loadComments = function (offset,rows) {
                var regex = /id=\w+/;
                var substanceId = regex.exec(location.search)[0].substr(3);
                var params = {
                    substanceId : substanceId,
                    offset : offset,
                    rows : rows
                };
                $.post("/content/loadComments?time=" + new Date().getTime(),params,function (result) {
                    var res = JSON.parse(result);
                    $("#sumPage").text(res.sumPage);// 总页数
                    var items = res.items;
                    for (var i=0; i<items.length; i++){
                        console.log(items[i].portrait + "-" + items[i].gmtCreate + "-" + items[i].content + "\n");
                    }
                });
            };
            loadComments($("#offset").text() - 1,10); // 页面初始化调用
        });
    </script>
</body>
</html>
