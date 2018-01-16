$(function () {
    var sidebarLoad = function () {
        var href = window.location.href;
        var name = href.substr(href.lastIndexOf("/") + 1);
        var reverseCss = function (id,index) {
            $(id).addClass("active menu-open")
                .find(".treeview-menu")
                .attr("display","block")
                .children("li:eq(" + index + ")")
                .addClass("active");
        };
        switch (name){
            case "user_detail_info":
                reverseCss("#userManage",0);
                break;
            case "user_portrait_validate":
                reverseCss("#userManage",1);
                break;
            case "substance_no_verify":
                reverseCss("#publishManage",0);
                break;
            case "substance_verified":
                reverseCss("#publishManage",1);
                break;
            case "substance_fail_verified":
                reverseCss("#publishManage",2);
                break;
        }
    };
    sidebarLoad()
});