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