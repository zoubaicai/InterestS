<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/1/14
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height: auto;">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/images/dog.gif" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>zbc</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu tree" data-widget="tree">
            <li class="header">导航</li>
            <%--<li>--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-dashboard"></i>--%>
                    <%--<span>操控版</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <li class="treeview" id="userManage">
                <a href="#">
                    <i class="fa fa-user-circle"></i>
                    <span>用户管理</span>
                    <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/manage/user_detail_info"><i class="fa fa-circle-o"></i> 详细信息</a>
                    </li>
                    <li><a href="/manage/user_portrait_validate"><i class="fa fa-circle-o"></i> 头像审核</a></li>
                </ul>
            </li>
            <li class="treeview" id="publishManage">
                <a href="#">
                    <i class="fa fa-th"></i>
                    <span>发布管理</span>
                    <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/manage/substance_no_verify"><i class="fa fa-circle-o"></i> 未审核
                        <span class="pull-right-container">
                          <span class="label label-primary pull-right">13</span>
                        </span>
                    </a></li>
                    <li><a href="/manage/substance_verified"><i class="fa fa-circle-o"></i> 已通过</a></li>
                    <li><a href="/manage/substance_fail_verified"><i class="fa fa-circle-o"></i> 未通过</a></li>
                </ul>
            </li>
            <%--<li>--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-info"></i>--%>
                    <%--<span>通知</span>--%>
                    <%--<span class="pull-right-container">--%>
                      <%--<span class="label label-primary pull-right">13</span>--%>
                    <%--</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <%--<li class="header">记录</li>--%>
            <%--<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>严重</span></a></li>--%>
            <%--<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>警告</span></a></li>--%>
            <%--<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>普通</span></a></li>--%>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
