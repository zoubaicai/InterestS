<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/3/30
  Time: 17:53
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
    <title>所有内容 ヾ(o◕∀◕)ﾉヾ</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px;">
    <%@include file="header.jsp"%>
        <div class="container" style="padding: 5px;">

            <div class="row" style="background-color: #fff;padding-bottom: 10px;padding-top: 10px;">
                <div class="col-xs-12">
                    <ul class="nav nav-pills" id="classificationSelect">
                        <li role="presentation" class="active"><a href="javascript:void(0)">默认</a></li>
                        <li role="presentation"><a href="javascript:void(0)">具有位置信息</a></li>
                        <li role="presentation"><a href="javascript:void(0)">没有限制</a></li>
                    </ul>
                </div>
            </div>

            <div class="row  clearfix latest-lists" style="background-color: #eee;padding-top: 10px;padding-bottom: 10px;min-height: 500px;" id="masonry">
                <c:choose>
                    <c:when test="${lists.size() > 0}">
                        <c:forEach items="${lists}" var="list">
                            <div class="col-md-2 col-sm-4 col-xs-12 latest-item">
                                <div class="thumbnail clear-border clear-padding shards-shadow">
                                    <a href="/content?id=${list.id}">
                                        <c:choose>
                                            <c:when test="${''.equals(list.cover) || null == list.cover}">
                                                <img src="/images/interestshare.jpg" alt="兴趣共享">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${list.cover}" alt="兴趣共享">
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="caption">
                                            <h4>${list.subject}</h4>
                                            <p>${list.summary}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <nav>
                        <ul class="pager">
                            <li class="previous"><a href="javascript:void(0)">上一页</a></li>
                            <li class="page-info">第 <small id="currentPage">1</small> 页,共 <small id="sumPage">${sum}</small> 页</li>
                            <li class="next"><a href="javascript:void(0)">下一页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    <%@include file="footer.jsp"%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
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

            // 得到当前页数
            var getCurrentPageNum = function () {
                var regex = /p=[0-9]+/i;
                return regex.exec(location.search)[0].substr(2);
            };
            // 得到当前查询字符串
            var getClassification = function () {
                var regex = /c=.+$/i;
                return regex.exec(location.search)[0].substr(2);
            };

            // 根据查询字符串 c 判断那个分类按钮为活动状态
            var $btns = $("#classificationSelect>li");
            $btns.removeClass("active");
            switch (getClassification()){
                case "default":
                    $($btns[0]).addClass("active");
                    break;
                case "hasLocation":
                    $($btns[1]).addClass("active");
                    break;
                case "noRestrict":
                    $($btns[2]).addClass("active");
                    break;
            }
            // 为所有分类选择按钮绑定单击事件
            $btns.click(function () {
                var url = location.protocol + "//" + location.host + location.pathname;
                switch ($(this).find("a").text()){
                    case "默认":
                        window.location.href = url + "?p=" + getCurrentPageNum() + "&c=default";
                        break;
                    case "具有位置信息":
                        window.location.href = url + "?p=" + getCurrentPageNum() + "&c=hasLocation";
                        break;
                    case "没有限制":
                        window.location.href = url + "?p=" + getCurrentPageNum() + "&c=noRestrict";
                        break;
                }
            });

            // 加载当前的第几页
            $("#currentPage").text(getCurrentPageNum());
            // 上一页
            $(".previous").click(function () {
                var nowPage = parseInt(getCurrentPageNum());
                if (nowPage <= 1){
                    zmAlert("已经是第一页了");
                } else {
                    nowPage--;
                    window.location.href = location.protocol + "//" + location.host + location.pathname + "?p=" + nowPage + "&c=" + getClassification();
                }
            });
            // 下一页
            $(".next").click(function () {
                var nowPage = parseInt(getCurrentPageNum());
                var sumPage = parseInt($("#sumPage").text());
                if (nowPage >= sumPage){
                    zmAlert("已经是最后一页了");
                } else {
                    nowPage++;
                    window.location.href = location.protocol + "//" + location.host + location.pathname + "?p=" + nowPage + "&c=" + getClassification();
                }
            })

        });
    </script>


</body>
</html>
