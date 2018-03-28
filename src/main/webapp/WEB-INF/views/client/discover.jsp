<%--
  Created by IntelliJ IDEA.
  User: zbc
  Date: 2018/3/25
  Time: 13:20
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
    <title>发现</title>
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
    <div class="container-fluid" style="position: relative;">
        <div class="container-fluid" id="mapContainer" style="min-height: 320px;margin-top: -20px;">

        </div>

        <div style="position: absolute;top: 0;left: 85px;">
            <div class="form-inline">
                <div class="form-group" style="width:150px;">
                    <input type="text" class="form-control" id="addressTxt" placeholder="请输入地点" style="width: 100%;">
                    <div id="searchResultPanel" style="border: 1px solid #C0C0C0;width: 100%;height: auto;display: none;"></div>
                </div>
                <button type="button" class="btn btn-primary" id="relocation">确定</button>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/zeroModal/js/zeroModal.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Z6Sjk1PdxeUdExaBh3s56HDm2pTNSYhm"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/client/common.js"></script>
    <script>
        $(function () {
            // 设置地图的高度，匹配可显示区域
            var $mapContainer = $("#mapContainer");
            $mapContainer.css("height",window.innerHeight - 50 + "px");
            $(window).resize(function () {
                $mapContainer.css("height",window.innerHeight - 50 + "px");
            });

            var map = new BMap.Map("mapContainer"); // 创建地图实例
            var point = new BMap.Point(117.300061, 39.068119); // 创建点坐标
            map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别
            var bottom_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});// 左上角，添加比例尺
            var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
            map.addControl(bottom_left_control);
            map.addControl(top_left_navigation);


            // 构造信息窗口的内容
            var getMContent = function (id,subject,src) {
                var mItem = "<a href='/content?id=" + id + "' style='color: #000;'><p>" + subject + "</p></a>";
                var mContent = "<div style='text-align: center'><img src='" + src + "' style='' title='11' width='100' height='66' /></div>" +
                    "<div style='text-align: center'>" + mItem + "</div>";
                return mContent;
            };
            // 从服务器获得附近的定位信息
            var loadNearby = function (point) {
                var params = {
                    lng : point.lng,
                    lat : point.lat
                };
                $.post("/loadNearby?time=" + new Date().getTime(),params,function (result) {
                    var res = JSON.parse(result);
                    for (var i = 0; i<res.length; i++){
                        if (res[i].cover === ""){
                            res[i].cover = "/images/interestshare.jpg";
                        }
                        var point = new BMap.Point(res[i].lng, res[i].lat); // 创建点坐标
                        var marker = new BMap.Marker(point);
                        map.addOverlay(marker);    //添加标注
                        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                        addClickHandler(getMContent(res[i].id,res[i].subject,res[i].cover),marker);
                    }
                });
            };
            var opts = {
                width : 100,     // 信息窗口宽度
                height: 86     // 信息窗口高度
            };
            // 为覆盖物添加事件
            function addClickHandler(content,marker){
                marker.addEventListener("click",function(e){
                    openInfo(content,e)}
                );
            }
            function openInfo(content,e){
                var p = e.target;
                var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
                var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
                map.openInfoWindow(infoWindow,point); //开启信息窗口
            }


            // 浏览器定位对象，不支持的浏览器将无法使用
            var geolocation = new BMap.Geolocation();
            // 浏览器定位
            var nowLocation = function () {
                geolocation.getCurrentPosition(function (r) {
                    if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                        map.panTo(r.point);
//                        var marker = new BMap.Marker(r.point);
//                        map.addOverlay(marker);    //添加标注
//                        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
//                        var circle = new BMap.Circle(r.point,5000,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.1}); //创建圆
//                        map.addOverlay(circle);

//                        var mItem = "<a href='#' style='color: #000;'><p>标题</p></a>";
//                        var mContent = "<div style='text-align: center'><img src='/images/dog.gif' style='' title='11' width='66' height='44' /></div>" +
//                            "<div style='text-align: center'>" + mItem + "</div>";
//                        var infoWindow = new BMap.InfoWindow(mContent);
//                        marker.addEventListener("click",function () {
//                            this.openInfoWindow(infoWindow);
//                        });
                        loadNearby(r.point); // 加载附近内容
                    }
                    else {
                        alert('failed' + this.getStatus());
                    }
                });
            };

            var $addressTxt = $("#addressTxt"); // 搜索地点使用的文本框
            var $searchResultPanel = $("#searchResultPanel"); // 搜索结果面板
            // 建立一个自动完成的对象
            var autocomplete = new BMap.Autocomplete({"input": "addressTxt", "location": map});
            // 鼠标放在下拉列表上的事件
            autocomplete.addEventListener("onhighlight", function (e) {
                var str = "";
                var _value = e.fromitem.value;
                var value = "";
                if (e.fromitem.index > -1) {
                    value = _value.province + _value.city + _value.district + _value.street + _value.business;
                }
                str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

                value = "";
                if (e.toitem.index > -1) {
                    _value = e.toitem.value;
                    value = _value.province + _value.city + _value.district + _value.street + _value.business;
                }
                str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
                $searchResultPanel.html(str);
            });
            var myValue;
            // 鼠标点击下拉列表后的事件
            autocomplete.addEventListener("onconfirm", function (e) {
                var _value = e.item.value;
                myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
                $searchResultPanel.html("onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue);
                setPlace();
            });
            var setPlace = function () {
                map.clearOverlays();    //清除地图上所有覆盖物
                function myFun() {
                    var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                    map.centerAndZoom(pp, 15);
                    loadNearby(pp); // 加载附近内容
                }
                var local = new BMap.LocalSearch(map, { //智能搜索
                    onSearchComplete: myFun
                });
                local.search(myValue);
            };


            nowLocation();


            // 这里放置按钮等事件绑定
            $("#relocation").click(function () {
                map.clearOverlays();
                if ($addressTxt.val() === "") {
                    nowLocation();
                } else {
                    var city = $addressTxt.val();
                    if (city !== "") {
                        map.centerAndZoom(city, 15); // 用城市名设置地图中心点
                        loadNearby(map.getCenter()); // 加载附近内容
                    }
                }
            });

        });
    </script>
</body>
</html>
