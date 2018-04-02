<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/9
  Time: 14:16
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
    <title>我的消息</title>
    <link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zeroModal/css/zeroModal.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/message.css" rel="stylesheet">
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
            <div class="col-md-8 col-md-offset-2 white-back" style="min-height: 420px;">
                <h4>消息</h4>
                <hr>
                <div class="msg-lists">
                    <%--<div class="col-sm-12 well well-sm msg-item">--%>
                        <%--<div class="col-sm-11">--%>
                            <%--<p class="msgShow">欢迎注册“兴趣共享团”，<a href="/client/personal">我的主页</a></p>--%>
                            <%--<small>2018-1-9 14:27</small>--%>
                        <%--</div>--%>
                        <%--<div class="col-sm-1">--%>
                            <%--<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <c:choose>
                        <c:when test="${lists.size() > 0}">
                            <c:forEach items="${lists}" var="list">
                                <c:choose>
                                    <c:when test="${list.isRead == 1}">
                                        <div class="col-sm-12 well well-sm msg-item" style="color: #aaa;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-sm-12 well well-sm msg-item">
                                    </c:otherwise>
                                </c:choose>
                                    <div class="col-sm-11" aria-label="${list.isRead}">
                                        <p class="msgShow" aria-label="${list.id}">${list.msgContent}</p>
                                        <small><i class="fa fa-clock-o"></i> ${list.gmtCreate}</small>
                                    </div>
                                    <div class="col-sm-1">
                                        <button type="button" class="close" aria-label="${list.id}"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-info" role="alert">没有更多消息了</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-md-8 col-md-offset-2 white-back">
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
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="msgDialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">消息</h4>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        $(function () {
            // 使用模态框显示消息
            $(".msgShow").click(function () {
                var $this = $(this);
                $.post("/client/reverseState?time="+ new Date().getTime(),{id : $this.attr("aria-label"),isRead : $this.parent().attr("aria-label")},function (result) {
                    if (result === "1"){
                        $(".modal-body").html($this.html());
                        $("#msgDialog").modal("show");
                    } else {
                        zmAlert("发生了异常");
                    }
                });
            });

            // 删除消息
            $(".close").click(function () {
                var $this = $(this);
                $.post("/client/deleteMsg?time=" + new Date().getTime(),{id : $this.attr("aria-label")},function (result) {
                    if (result === "1"){
                        $parent = $($this.parent().parent());
                        $parent.remove();
                        if ($(".msg-item").length < 1){
                            $(".msg-lists").html("<div class=\"alert alert-info\" role=\"alert\">没有更多消息了</div>");
                        }
                        zmAlert("删除成功");
                    } else {
                        zmAlert("删除过程中发生了异常");
                    }
                });
            });

            // 得到当前页数
            var getCurrentPageNum = function () {
                var regex = /p=[0-9]+/i;
                return regex.exec(location.search)[0].substr(2);
            };
            // 加载当前的第几页
            $("#currentPage").text(getCurrentPageNum());
            // 上一页
            $(".previous").click(function () {
                var nowPage = parseInt(getCurrentPageNum());
                if (nowPage <= 1){
                    zmAlert("已经是第一页了");
                } else {
                    nowPage--;
                    window.location.href = location.protocol + "//" + location.host + location.pathname + "?p=" + nowPage;
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
                    window.location.href = location.protocol + "//" + location.host + location.pathname + "?p=" + nowPage;
                }
            })
        });
    </script>
</body>
</html>
