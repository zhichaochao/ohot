<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="catalog/view/theme/default/css/common.css" />
    <link rel="stylesheet" href="catalog/view/theme/default/css/index.css" />
    <script type="text/javascript" src="catalog/view/theme/default/js/jquery.min.js" ></script>
    <script type="text/javascript" src="catalog/view/theme/default/js/common.js" ></script>
 <link rel="stylesheet" href="catalog/view/theme/default/js/select2/css/select2.css" />
        <script type="text/javascript" src="catalog/view/theme/default/js/select2/js/select2.js" ></script>
<div class="new_nav pc_hide  clearfix">
        <a class="fh" href="<?php echo $home?>"></a>
        <p>SHIPPING METHOD</p>
      </div>
<?php if ($shipping_methods) { ?>
   <div class="content in_content zf_21  new_in_content clearfix pc_hide" >
 <!-- <h3>Shipping Method</h3> -->
 <div class="zf_con clearfix">
 <p class="no_sel" style="color: #f00;"></p>
                        <ul class="pay_ul clearfix" id='collapse-shipping-method'>
                        <div class="zfbt clearfix">
                        <span>2</span><h1>Shipping Method</h1></div>
                             <?php foreach ($shipping_methods as $quote) { ?>
                             <li class="clearfix ">
                             <input class="check_input"  name="shipping_method" type="checkbox" value="<?php echo $quote['code']; ?>" <?php if ($quote['code'] == $code) { ?><?php } ?> class="s_method_expedited"  />
                                <span>Shipping Method</span>
                                <label class="gx clearfix" for="" >
                                        <?php if($quote['code'] == 'DHL'){ ?>
                                          <img src="https://devb.besthairbuy.com/skin/frontend/default/theme560-desktop-new/images/dh/sfr_method.jpg">
                                          <?php } ?>
                                    <!-- <img src="img/png/new_9.png" alt="" /> -->
                                    <p><?php echo $quote['title']; ?> </p>
                                </label>
                                <!-- <p class="ts_p"></p> -->
                                <hr />
                                <span>Expected delivery time</span>
                                <label class="clearfix" for="">
                                    <p><?php echo @$quote['desc']; ?></p>
                                </label>
                                <hr />
                                <span>Shipping Cost</span>
                                <label class="red clearfix" for="">
                                    <p>
                                    <?php if($quote['code'] == 'weight.weight_10'){  ?>
                                          Shipping cost will be paid by buyer when collect goods from shipping agent.
                                         <?php }else{ ?>
                                        <?php echo $quote['text']; ?>
                                     <?php } ?>
                                    <!-- $24.00 -->
                                    </p>
                                </label>
                            </li>
                             <?php } ?>
                        </ul>

<a class="tj_a" onclick="saveMethods()">SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;&gt;</a>
</div>
   </div>

<?php }else{?>
<div class="bg_fff" style="min-height: 300px;">
 <h3>Shipping Method</h3>

 <p>Please Select Address</p>
</div>
<?php } ?>
<style type="text/css">
    @media (max-width:920px) {
        .yd_footer{display: none !important;}
        .yd_footer2{display: block !important;}
    }
    
</style> 

<script type="text/javascript"><!--
// //浏览器窗口从pc/yd改变的时候刷新页面
  var old_w = $(window).width();
  $(window).resize(function(){
    var new_w = $(window).width();
    (old_w>920) ? (new_w <=920)?location.href="<?=$checkoutdas?>":0 : (new_w >920)?location.href="<?=$checkoutdas?>":0 ;
  })

// $(document).ready(function() {
//     getShippingAddress();
    
  
// });
        //    支付方式选择
    $(".pay_ul>li").click(function(){
      $(this).addClass("active").siblings().removeClass("active");
      $(".pay_ul input").removeAttr("checked");
      $(".pay_ul>li .ts_p").hide();
      $(this).find("input").attr("checked","checked");
      // $(this);
      // var e=$(this);
   
      // saveMethods(e);
    })
// function toselectPayment(){

// tips('Please Select Shipping Method','gantan');
//  $('#no_sel').html('Please Select Shipping Method');

// }
function toselectPayment(){

tips('Please Select Shipping Method','gantan');
 $('.ts_p').html('Please Select Shipping Method');

}

var win = $(window).width();
 if(win<920){
  function saveMethods() {

    // console.log(e)
    // var address_id=$('#shipping-existings ul li.active').attr('aid');
    // console.log(address_id);
    // if (address_id>0) {
        
      $.ajax({
          url: 'index.php?route=checkout/shipping_method/save',
          type: 'post',
          data: $('#collapse-shipping-method input[type=\'checkbox\']:checked'),
          dataType: 'json',
          success: function(json) {
            // console.log(json);
                  // getOrder();
                  // getPaymentMethod();
                  location='<?=$payment_method_url;?>';
                 
          },
          error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
      });
    // }else{
    //      $('#no_sel').html('Please Select Shipping Address');
    //      alert('Please Select Shipping Address');
    // }
}
 }
 function getOrder(){
//    console.log();
    $.ajax({
        url: 'index.php?route=checkout/confirm&cart_ids=' + "<?php echo $cart_ids ?>",
        dataType: 'html',
        success: function(html) {
//            console.log(html);die;
            $('#collapse-checkout-confirm').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
// Get Payment Method
function getPaymentMethod()
{
     $('#payment_next').html('<h2>3.Select a payment method</h2>');
    $.ajax({
        url: 'index.php?route=checkout/payment_method',
        dataType: 'html',
        success: function(html) {
            $('#payment_next').html(html);
            $('.liucheng').removeClass('ol_2').addClass('ol_2');
            $('.address').addClass('pay');
            getOrder();
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

//--></script>
<style type="text/css">
    /*@media (max-width:920px) {*/

      body{margin-bottom: 1.2rem;}
      .new_nav{height: 0.88rem;background: #fff;border-bottom: 1px solid #e5e5e5;position: fixed;top: 0;left: 0;width: 100%;z-index: 99;}
  .new_nav p{font-size: 0.28rem;font-family: helvetica;font-weight: bold; text-align: center;display: block;line-height: 0.88rem;}
  .new_nav a.fh{width: 0.77rem;height: 0.88rem;display: block;position: absolute;left: 0;top: 0;
  background: url(catalog/view/theme/default/img/png/new_4.png) no-repeat center/0.17rem 0.32rem;}
      .footer {display: none !important;}
        .yd_footer{display: none !important;}
        .yd_footer2{display: block !important;}
    /*}*/
    
</style> 
<?php echo $footer; ?>