<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/17
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
     style="border-bottom: none;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
                <img src="/images/myweb/isharing.png" alt="ISharing" height="25" width="40" style="margin-top: -2px;">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="/">首页</a>
                </li>
                <li>
                    <a href="#">发现</a>
                </li>
                <li>
                    <a href="#">全部</a>
                </li>
            </ul>
            <!--用户中心-->
            <ul class="nav navbar-nav navbar-right" id="userArea" style="display: none;">
                <li>
                    <a href="#">消息<span class="badge">3</span> </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        <img id="userPortrait" style="width: 24px;height: 24px;margin-top: -5px;" width="24" height="24" src="" alt="头像" />
                        <span id="userNickname"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/personal">个人中心</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
            <!--登录/注册-->
            <div class="navbar-form navbar-right" id="loginArea" aria-label="login/register">
                <a href="/register" class="btn btn-danger">注册</a>
                &nbsp;
                <a href="/login" class="btn btn-default">登录</a>
                &nbsp;
            </div>
            <!--搜索框-->
            <div class="navbar-form navbar-right mHidden" role="search" id="headerSearchArea">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="搜索你感兴趣的内容" id="headerSearch"/>
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="headerSearchBtn" type="button" aria-label="search button">
                            &nbsp;<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
                        </button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</nav>
