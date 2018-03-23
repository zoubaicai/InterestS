$(function () {
    // 得到当前页数
    var getCurrentPageNum = function () {
        var regex = /p=[0-9]+/i;
        var p = "1";
        try {
            p = regex.exec(location.search)[0].substr(2);
        } catch (e){
            // do nothing
        }
        return p;
    };
    // 得到当前查询字符串
    var getCurrentSearchStr = function () {
        var regex = /s=.+$/i;
        var s = "";
        try {
            s = regex.exec(location.search)[0].substr(2);
        } catch (e){
            // do nothing
        }
        return s;
    };
    // 跳转按钮
    $("#jumpPageBtn").click(function () {
        var sumPage = parseInt($("#sumPage").text());
        var selectPage = $("#selectPage").val();
        if (selectPage === "" || selectPage === undefined){
            alert("请输入页码");
            return;
        }
        try {
            selectPage = parseInt(selectPage);
            if (selectPage < 1 || selectPage > sumPage){
                throw "error";
            }
        } catch (e){
            alert("请输入正确的页码");
            return;
        }
        window.location.href = location.protocol + "//" +  location.host +  location.pathname + "?p=" + selectPage + "&s=" + getCurrentSearchStr();
    });
    // 上一页
    $("#previousPage").click(function () {
        var currentPage = parseInt($("#currentPage").text());
        if (currentPage === 1){
            alert("已经是第一页了");
        } else {
            currentPage--;
            window.location.href = location.protocol + "//" +  location.host + location.pathname + "?p=" + currentPage + "&s=" + getCurrentSearchStr();
        }
    });
    // 下一页
    $("#nextPage").click(function () {
        var currentPage = parseInt($("#currentPage").text());
        var sumPage = parseInt($("#sumPage").text());
        if (currentPage === sumPage){
            alert("已经是最后一页了");
        } else {
            currentPage++;
            window.location.href = location.protocol + "//" +  location.host + location.pathname + "?p=" + currentPage + "&s=" + getCurrentSearchStr();
        }
    });
    // 表搜索
    $("#tableSearchBtn").click(function () {
        var s = $("#tableSearchStr").val();
        if (s === "" || s === undefined){
            alert("请输入要搜索的内容");
            return;
        }
        var p = parseInt(getCurrentPageNum());
        s = encodeURIComponent(s);
        window.location.href = location.protocol + "//" +  location.host + location.pathname +  "?p=" + p + "&s=" + s;
    });
});