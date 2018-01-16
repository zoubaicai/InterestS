(function (undefined) {
    'use strict';
    // 对象合并
    function extend(o,n,override) {
        for(var key in n){
            if(n.hasOwnProperty(key) && (!o.hasOwnProperty(key) || override)){
                o[key]=n[key];
            }
        }
        return o;
    }
    function G(id) {
        return document.getElementById(id);
    }
    function createDom(txt) {
        var div = document.createElement("div");
        div.id = "modelessZ";
        div.className = "z-modeless";
        var txt = document.createTextNode(txt);
        div.appendChild(txt);
        div.addEventListener("click",function () {
            var p = this.parentNode;
            p.removeChild(this);
        });
        return div;
    }
    function add(id,txt) {
        var div = createDom(txt);
        var parent = G(id);
        parent.appendChild(div);
    }
    function clear() {
        var div = G("modelessZ");
        if (div){
            div.click();
        }
    }
    var timeout = -1;
    function timeToClear() {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            var div = G("modelessZ");
            div.click();
        },3000);
    }
    // var inclinecss = ".success{background-color: #00ff00;}.danger{background-color: #ff0000;}.z-modeless{";
    var defaults = {
        id : "",
        css : "success",
        text : ""
    };
    var modelessZ = function (options) {
        this.init(options);
    };
    modelessZ.prototype = {
        constructor : this,
        init : function (options) {
            var config = extend(defaults,options,true);
            clear();
            add(config.id,config.text);
            G("modelessZ").className = "z-modeless " + config.css;
            //timeToClear();
        }
    };

    var global = (function(){ return this || (0, eval)('this'); }());
    if (typeof module !== "undefined" && module.exports) {
        module.exports = modelessZ;
    } else if (typeof define === "function" && define.amd) {
        define(function(){return modelessZ;});
    } else {
        !('modelessZ' in global) && (global.modelessZ = modelessZ);
    }
}());