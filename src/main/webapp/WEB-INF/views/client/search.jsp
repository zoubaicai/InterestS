<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/2
  Time: 15:18
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
    <title>${searchStr} 搜索结果</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px;background-color: #eee;">
    <%@include file="header.jsp"%>

    <div class="container" style="min-height: 320px;">
        <div class="row">
            <div class="col-md-8">
                <div class="col-md-12">
                    <h3 class="result-head"><mark>${searchStr}</mark> 的搜索结果</h3>
                </div>
                <div class="col-md-12">
                    <div class="container-fluid result-lists shards-shadow clearfix">
                        <c:choose>
                            <c:when test="${lists.size() == 0}">
                                <mark>没有找到搜索结果</mark>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${lists}" var="list">
                                    <article class="result-item row">
                                        <h4 class="item-title"><a href="/content?id=${list.id}" target="_blank">${list.subject}</a> </h4>
                                        <p class="item-meta">
                                            <span class="glyphicon glyphicozn-time"></span> ${list.gmtCreate}
                                        </p>
                                        <div class="col-xs-7">
                                            <c:choose>
                                                <c:when test="${list.cover == '' || list.cover == null}">
                                                    <img class="item-img" src="/images/spaceholder.gif" alt="${list.subject}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="item-img" src="${list.cover}" alt="${list.subject}">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="col-xs-5">
                                            <p>${list.summary}</p>
                                            <a href="/content?id=${list.id}" class="btn btn-link" target="_blank">查看更多>></a>
                                        </div>
                                    </article>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        <%--<article class="result-item row">--%>
                            <%--<h4 class="item-title"><a href="#">[C91东方音乐]Re:Volte – 東方入眠抄13 太陽燦々、幽香さんが花を愛でるように愛してくれる入眠音声</a> </h4>--%>
                            <%--<p class="item-meta">--%>
                                <%--<span class="glyphicon glyphicon-user"></span>zbc--%>
                                <%--<span class="glyphicon glyphicon-time"></span>2018年1月2号--%>
                            <%--</p>--%>
                            <%--<div class="col-xs-7">--%>
                                <%--<img style="background: url(/images/queen.jfif) no-repeat center;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;"--%>
                                     <%--class="item-img" src="/images/nc-efi-placeholder-310x165.png" alt="[C91东方音乐]Re:Volte – 東方入眠抄13 太陽燦々、幽香さんが花を愛でるように愛してくれる入眠音声">--%>
                            <%--</div>--%>
                            <%--<div class="col-xs-5">--%>
                                <%--<p>東方入眠抄13 太陽燦々、幽香さんが花を愛でるように愛してくれる入眠音声 – Re:Volte 项目名称 東方入眠抄13 太陽燦々、幽香さんが花を愛でるように愛してくれる入眠音声 社团/作者 Re:Volte 项目类别 音乐CD 展会 …</p>--%>
                                <%--<a href="#" class="btn btn-link">查看更多>></a>--%>
                            <%--</div>--%>
                        <%--</article>--%>
                        <nav aria-label="lists navigation">
                            <ul class="pager">
                                <li class="previous"><a href="javascript:void(0)">上一页</a></li>
                                <li class="page-info">第 <small id="currentPage">1</small> 页,共 <small>${sum}</small> 页</li>
                                <li class="next"><a href="javascript:void(0)">下一页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="col-md-4 hidden-xs hidden-sm">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 shards-shadow" style="margin-top: 56px;background-color: white;">
                            <h4 style="text-align: center;">互动吧ヽ(●-`Д´-)ノ</h4>
                            <img class="center-block" src="/images/qrcode_for_gh_55a039d54d5f_258.jpg">
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
        $(function () {
           // 得到当前页数
           var getCurrentPageNum = function () {
               var regex = /p=[0-9]+/i;
               return regex.exec(location.search)[0].substr(2);
           };
           // 得到当前查询字符串
           var getCurrentSearchStr = function () {
               var regex = /s=.+$/i;
               var s = regex.exec(location.search)[0].substr(2);
               return window.decodeURIComponent(s);
           };
        });
    </script>
</body>
</html>
