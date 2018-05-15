var couponPay = function(coupon_id, trade_id, trade_token, ihaveu_domain, error_callback){
  var trade_show_url = function(){
    window.location.href = '/auction/trades/' + trade_id.toString();
  };
  var ihaveu_pay = function(){
    $.ajax({ 
      url: ihaveu_domain + '/auction/trades/' + trade_id.toString() + '/checkout.json?trade[payment_service]=wechat_uxuan&trade[checkout_token]=' + trade_token,
      dataType: 'JSON',
      type: 'GET',
      success: function(res){
        if(res && res.appId){
            // 调起支付
            WeixinJSBridge.invoke('getBrandWCPayRequest', {
              'appId': res['appId'],
              'timeStamp': res['timeStamp'],
              'nonceStr': res['nonceStr'],
              'package': res['package'],
              'signType': res['signType'],
              'paySign': res['paySign']
            }, function(res){
              if(res.err_msg == "get_brand_wcpay_request:ok" ) {
                window.location.href = '/auction/trades/' + trade_id.toString() + '/wechat_query';
              }else{
                trade_show_url();
              };
              //使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，
              //但并不保证它绝对可靠。
              //因此微信团队建议，当收到ok返回时，向商户后台询问是否收到交易成功的通知，若收到通知，
              //前端展示交易成功的界面；若此时未收到通知，商户后台主动
              //调用查询订单接口，查询订单的当前状态，并反馈给前端展示相应的界面。
            });
        }else{
          uxuan.alert('对不起，调起支付失败');
          $.isFunction(error_callback) ? error_callback() : trade_show_url();
        };
      },
      error: function(err){
        // window.location.href = ihaveu_domain + '/sessions.json'
        uxuan.alert('您的网络质量有点差，请多试几次');
        $.isFunction(error_callback) ? error_callback() : trade_show_url();
      }
    });
  };
  
  if(coupon_id != undefined && coupon_id != null && coupon_id != "")
  {
    $.ajax({
      url: "/g/coupons/" + coupon_id.toString() + "/rebuy_checked",
      dataType: 'JSON',
      type: 'GET',
      success: function(res){
        if(res.succ){
          ihaveu_pay();
        }else{
          uxuan.alert(res.error || "出错了");
          $.isFunction(error_callback) ? error_callback() : trade_show_url();
        };
      },
      error: function(msg){
        uxuan.alert("团购有效性检查接口调用失败");
        $.isFunction(error_callback) ? error_callback() : trade_show_url();
      }
    });
  }
  else { ihaveu_pay(); };
};