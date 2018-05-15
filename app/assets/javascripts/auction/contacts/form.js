function tel(num) {
  var i = /1[3-8]+\d{9}/;
  return i.test(num);
};

function ident(num) {
  var i = /^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)?$/;
  return i.test(num);
};

$(document).on("blur", ".address-new form input.required-field:visible:not(.address-new-name, .address-new-id-number), .address-edit form input.required-field:visible:not(.address-edit-name, .address-new-id-number)", function(){
  var val = $(this).val().trim();
  $(this).hasClass("tel-field") ? 11 == val.length && tel(val) ? $(this).next("span.show-error-msg").hide() :
                                                                 $(this).next("span.show-error-msg").show() :
                                   0 == val.length ? $(this).next("span.show-error-msg").show() :
                                                     $(this).next("span.show-error-msg").hide();
});

$(document).on("blur", ".address-new form input.address-new-name, .address-edit form input.address-edit-name", function(){
  var val = $(this).val().trim();
  0 == val.length ? $(this).next("span.address-msg-truer").addClass("msg-danger") : $(this).next("span.address-msg-truer").removeClass("msg-danger");
});

$(document).on("blur", ".address-new form input.address-new-id-number, .address-edit form input.address-edit-id-number", function(){
  var val = $(this).val().trim();
  ident(val) ? $(this).next("span.address-msg-truer").removeClass("msg-danger") : $(this).next("span.address-msg-truer").addClass("msg-danger");
});

var bindOneEventToForm = function(){
  $(".address-new form [type=submit], .address-edit form [type=submit]").removeClass("submitting");
  $(document).one("click", ".address-new form [type=submit], .address-edit form [type=submit]", formChecked);
};

var formChecked = function(e){
  $(".address-new form [type=submit], .address-edit form [type=submit]").addClass("submitting");
  if ($("#auction_contact_id_number").val() != ""){
    if(!ident($("#auction_contact_id_number").val().trim())){
      $("#auction_contact_id_number").next("span.address-msg-truer").addClass("msg-danger");
      bindOneEventToForm();
      return false
    }
  }

  for(var i = 0; i < $(".required-field").length; ++i){
    var field = $($(".required-field")[i]), val = field.val();
    if(val == undefined || val == null){
      bindOneEventToForm();
      e.preventDefault();
      return false;
    };
    if( 0 == val.length || (field.hasClass("tel-field") && (11 !== val.length || !tel(val))) || (field.hasClass("id-number-field") && ( ! ident(val) )) ){
      field.next("span.show-error-msg").length > 0 ? field.next("span.show-error-msg").show() : field.next("span.address-msg-truer").addClass("msg-danger");
      bindOneEventToForm();
      e.preventDefault();
      return false;
    };
  };
};

bindOneEventToForm();

$(function(){
  var getCitiesURL = function(params){
    return "/auction/contacts/get_cities?" + params;
  };
  
  var getTownsURL = function(params){
    return "/auction/contacts/get_towns?" + params;
  };
  
  var setResult = function(mainSelector, subSelector, sleepingVal, data, afterCallback){
    if (data.constructor !== Array) return;
    if (data.length <= 0) return;
    if(mainSelector != undefined && mainSelector != null && mainSelector != ""){
      if($(mainSelector).val() == "" || $(mainSelector).val() == undefined || $(mainSelector).val() != sleepingVal){
        hideSelector([subSelector]);
        return;
      };
    };
    var options = ["<option value>- 请选择 -</option>"];
    $.each(data, function(i, res){
      options.push("<option value='" + res.name + "'>" + res.name + "</option>");
    });
    if (subSelector != undefined && subSelector != null && subSelector != "")
      $(subSelector).html(options);
    if (typeof afterCallback == "function") afterCallback();
  };
  
  // ajax请求
  var getResult = function(url, beforeCallback, successCallback){
    if (typeof beforeCallback === "function") beforeCallback();
    $.ajax({
      url: url,
      type: "GET",
      dataType: "JSON",
      success: function(data){
        if (typeof successCallback === "function") successCallback(data);
      },
      error: function(msg){
        try{
          uxuan.alert("出错了-_-!");
        }catch(e){};
      }
    });
  };
  
  var bindChangeEvents = function(arrs){
    try{
      $.each(arrs, function(i, arr){
        $(arr[0]).on("change", arr[1]);
      });
    }catch(e){};
  };
  
  var hideSelector = function(selectorArr){
    try{
      $.each(selectorArr, function(i, selector){
        $(selector).addClass("logic-hidden").empty().next("span.show-error-msg").hide();
      });
    }catch(e){};
  };
  
  // 请选择省
  var provinceSelectCallback = function(){
    var val = $(this).val();
    if(val == ""){
      hideSelector([".city-selector", ".town-selector"]);
      $(this).next("span.show-error-msg").show();
      return;
    };
    $(this).next("span.show-error-msg").hide();
    var url = getCitiesURL("province_name=" + val);
    getResult(url, function(){
      hideSelector([".city-selector", ".town-selector"]);
    }, function(data){
      setResult(".province-selector", ".city-selector", val, data, function(){
        $(".city-selector").removeClass("logic-hidden");
      });
    });
  };
  
  // 请选择市
  var citySelectCallback = function(){
    var val = $(this).val();
    if(val == ""){
      hideSelector([".town-selector"]);
      $(this).next("span.show-error-msg").show();
      return;
    };
    $(this).next("span.show-error-msg").hide();
    var url = getTownsURL("city_name=" + val);
    getResult(url, function(){
      hideSelector([".town-selector"]);
    }, function(data){
      setResult(".city-selector", ".town-selector", val, data, function(){
        $(".town-selector").removeClass("logic-hidden");
      });
    });
  };
  
  // 请选择区县
  var townSelectCallback = function(){
    $(this).val() == "" ? $(this).next("span.show-error-msg").show() : $(this).next("span.show-error-msg").hide();
  };
  
  bindChangeEvents([[".province-selector", provinceSelectCallback], [".city-selector", citySelectCallback], [".town-selector", townSelectCallback]]);
  
});