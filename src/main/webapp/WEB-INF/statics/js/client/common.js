$(function () {
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