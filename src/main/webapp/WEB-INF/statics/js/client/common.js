$(function () {
    // 判断是否为首页，先择是否显示导航上搜索
    if ($("#isHomePage").text() !== "1"){
        $("#headerSearchArea").show();
    }

    // 查看是否存在token，判断用户是否以登录，默认cookie生存期1天
    var token = $.cookie("token");
    if (null != token && token != "undefined"){
        var nickname,portrait;
        if (typeof window.localStorage != "undefined"){
            nickname = localStorage.nickname;
            portrait = localStorage.portrait;
        } else {
            nickname = $.cookie("nickname");
            portrait = $.cookie("portrait");
        }
        // 改变header页的dom，显示用户信息
        $("#loginArea").css("display","none");
        $("#userArea").css("display","block");
        $("#userPortrait").attr("src",portrait);
        $("#userNickname").text(nickname);
    }

    // 重载 footer 的margin top
    var $footer = document.getElementsByTagName("footer")[0];
    var bottomGap = window.screen.height - ($footer.offsetHeight + $footer.offsetTop);
    if (bottomGap > 0){
        $($footer).css("margin-top",bottomGap);
    }

    // header 上面的搜索按钮
    $("#headerSearchBtn").click(function () {
        var s = window.decodeURIComponent($("#headerSearch").val());
        if (s === "" || s === undefined){
            zmAlert("搜索内容不能为空");
            return;
        }
        window.location.href = "/search?p=1&s=" + s;
    });
});
// 各种 zeroModal 弹框
// 无事件提示框
var zmAlert = function (content) {
    zeroModal.alert({
        content : content,
        overlayClose : true
    });
};
// 无事件错误提示框
var zmError = function (content) {
    zeroModal.error({
        content : content,
        overlayClose : true
    });
};
// 无事件成功提示框
var zmSuccess = function (content) {
    zeroModal.success({
        content : content,
        overlayClose : true
    });
};