// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// alert
(function(){
  window.uxuan = new (function(){
    var popupHandler = function(msg){
      $(".uxuan-popup").remove();
      var popup = $("<div class='uxuan-popup'>" + msg +"</div>");
      $('body').append(popup);
      setTimeout(function(){
        try{
          popup.fadeOut(function(){ $(".uxuan-popup").remove(); });
        }catch(e){};
      }, 3000);
    };
    this.alert = function(msg){
      popupHandler(msg);
    };
  })();
})();

// 下拉刷新
var scrollHandler = function(){
  this.current_page = 1;
  this.onScroll = function(callback){
    $(window).on('scroll', callback);
  };
  this.offScroll = function(){
    $(window).off('scroll');
  };
  this.url = "";
  this.params = {};

  (function(){
    var pathname = window.location.pathname,
        search = window.location.search, q, p, url, params = {}, current_page = 1;

    if (pathname.indexOf(".") !== -1) pathname = pathname.substr(0, pathname.indexOf("."));

    while (/\/$/.test(pathname)) pathname = pathname.substr(0, pathname.length - 1);

    url = pathname + ".js";

    if(search.length > 0){
      if (search.indexOf("?") !== -1) q = search.indexOf("?") + 1;
      if (search.indexOf("#") !== -1) p = search.indexOf("#") + 1;
      if(q !== undefined){
        if (p === undefined) p = search.length;
        search = search.substr(q, p);
        $.each(search.split("&"), function(i, s){
          var arr = s.split("=");
          params[arr[0].toString()] = arr[1];
        });
      };
    };

    this.url = url;
    this.params = $.extend({ page: current_page }, params);
    this.params.page = parseInt(this.params.page);
    this.current_page = this.params.page;
  }).call(this);
};

$.fn.scrollPaginate = function(total_pages){
  var $this = $(this);
  (function(){
    if (total_pages == undefined) throw new Error('wrong arguments');

    total_pages = parseInt(total_pages);

    var handler = new scrollHandler();
    handler.offScroll();

    var scrollCallback = function(){
      if(total_pages === handler.current_page){
        handler.offScroll();
        return;
      };

      if($(document).scrollTop() >= $(document).height() - $(window).height()){
        handler.offScroll();
        $(".loading").remove();
        $this.after("<div class='loading'>" +
                      "<div class='loading-container loading-container1'>" +
                        "<div class='loading-circle1'></div>" +
                        "<div class='loading-circle2'></div>" +
                        "<div class='loading-circle3'></div>" +
                        "<div class='loading-circle4'></div>" +
                      "</div>" +
                      "<div class='loading-container loading-container2'>" +
                        "<div class='loading-circle1'></div>" +
                        "<div class='loading-circle2'></div>" +
                        "<div class='loading-circle3'></div>" +
                        "<div class='loading-circle4'></div>" +
                      "</div>" +
                      "<div class='loading-container loading-container3'>" +
                        "<div class='loading-circle1'></div>" +
                        "<div class='loading-circle2'></div>" +
                        "<div class='loading-circle3'></div>" +
                        "<div class='loading-circle4'></div>" +
                      "</div>" +
                    "</div>");
        var search_arr = [];
        $.extend(handler.params, { page: handler.current_page + 1 });
        $.each(handler.params, function(k, v){
          search_arr.push(k.toString() + "=" + v.toString());
        });

        $.get(handler.url + "?" + search_arr.join("&")).done(function(){
          handler.current_page++;
          $(".loading").remove();
          handler.onScroll(scrollCallback);
        }).error(function(msg){
          $(".loading").remove();
          window.scrollTo(0, window.scrollY - 1);
          uxuan.alert("加载失败=_=...");
          handler.onScroll(scrollCallback);
        });
      };
    };
    handler.onScroll(scrollCallback);
  })();
};
// 格式化数字，加千位分隔符
function addCommas(nStr) {
  nStr += '';
  nStr = nStr.replace(/,/g, "");
  if(nStr.replace(/\d+\.?\d*/, "") != ""){ // 有数字逗号小数点以外的字符
    return 0;
  };
  var x = nStr.split('.');
  var x1 = x[0];
  var x2 = x.length > 1 ? '.' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
    x1 = x1.replace(rgx, '$1' + ',' + '$2');
  };
  return x1 + x2;
};
