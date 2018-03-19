$(function () {
    // 这里放置需要的dom对象
    var $addressTxt = $("#addressTxt"); // 搜索地点使用的文本框
    var $searchResultPanel = $("#searchResultPanel"); // 搜索结果面板
    var $nowLocation = $("#nowLocation"); // 当前选择的位置
    // 这里放置百度地图需要的js
    var map = new BMap.Map("mapContainer"); // 创建地图实例
    var point = new BMap.Point(117.300061, 39.068119); // 创建点坐标
    map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别
    // map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    map.addControl(new BMap.NavigationControl({type: BMAP_NAVIGATION_CONTROL_ZOOM}));// 地图平移缩放控件
    map.addControl(new BMap.ScaleControl());

    // 浏览器定位对象，不支持的浏览器将无法使用
    var geolocation = new BMap.Geolocation();
    // 浏览器定位
    var nowLocation = function () {
        geolocation.getCurrentPosition(function (r) {
            if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                map.panTo(r.point);
                addDefaultMarker(r.point);
                pointToAddress(r.point, function (str) {
                    setNowLocation(str, r.point);
                });
            }
            else {
                alert('failed' + this.getStatus());
            }
        });
    };

    // 为指定point 添加默认标注
    var addDefaultMarker = function (point) {
        var marker = new BMap.Marker(point);
        map.addOverlay(marker);    //添加标注
        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    };

    // 创建地址解析器实例
    var myGeo = new BMap.Geocoder();
    var pointToAddress = function (point, callback) {
        myGeo.getLocation(point, function (rs) {
            var addComp = rs.addressComponents;
            str = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
            callback(str, point);
        });
    };

    // 加载后调用一次定位
    var localeHidden = $("#localeHidden").text(); // 如果这个值能匹配成 string,string,string，说明已经需要加载指定位置
    if (/.+,.+,.+/i.test(localeHidden)){
        var a = localeHidden.split(",");
        var pt = new BMap.Point(parseFloat(a[1]), parseFloat(a[2]));
        map.clearOverlays();
        map.panTo(pt);
        addDefaultMarker(pt);
        pointToAddress(pt, function (str) {
            setNowLocation(a[0], pt);
        });
    } else {
        nowLocation();
    }

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
            map.centerAndZoom(pp, 18);
            addDefaultMarker(pp);
            pointToAddress(pp, function (str) {
                setNowLocation(str, pp);
            });
        }

        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    };

    // 为地图添加单击事件
    map.addEventListener("click", function (e) {
        var pt = e.point;
        map.clearOverlays();
        map.panTo(pt);
        addDefaultMarker(pt);
        pointToAddress(pt, function (str) {
            setNowLocation(str, pt);
        });
    });

    // 将指定dom显示为定位文本
    var setNowLocation = function (str, point) {
        $nowLocation.html(str);
        // console.log(point);
        globalPoint = point;// 将point赋值给全局变量globalPoint
    };

    // 这里放置按钮等事件绑定
    $("#relocation").click(function () {
        map.clearOverlays();
        if ($addressTxt.val() === "") {
            nowLocation();
        } else {
            var city = $addressTxt.val();
            if (city !== "") {
                map.centerAndZoom(city, 15);      // 用城市名设置地图中心点
                addDefaultMarker(map.getCenter());
                pointToAddress(map.getCenter(), function (str) {
                    setNowLocation(str, map.getCenter());
                });
            }
        }
    });
});