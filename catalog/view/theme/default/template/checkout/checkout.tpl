
<div class="yd_hide"><?php echo $header; ?> </div>
<div class="new_nav pc_hide clearfix">
        <a class="fh" href="<?php echo $home?>"></a>
        <p>SHIPPING METHOD</p>
      </div>
 <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/select2/css/select2.css" />
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/select2/js/select2.js" ></script>
    <!--pc内容-->
        <div class="address yd_hide clearfix">
            <div class="content in_content address_content clearfix">
                
                <div class="left clearfix">
                    
                    <div class="text clearfix" >
                        <input id="same_as_shipping" name="same_as_shipping" value="1"  type="hidden">
                        <div class="payment_next bg_gif" id="payment_next" >
                        <div class="shipping_address bg_fff bg_gif" id="shipping_address">
                            <h2>Select the shipping address</h2>
                     
                        </div>
                        <?php if(!empty($addresses)){?>
                         <a class="btn240 addrres butbtn" onclick="toselectAddress()">SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;></a>
                         <?php } ?>
                        <div class="shipping_method bg_fff bg_gif" id="shipping_method" style="display: none;" >
                            <h3>Shipping Method</h3>
                        </div>
                        </div>
                    </div>
                   
                </div>
            
                <div class="right clearfix right_shop ">
                    <div class="collapse-checkout bg_fff" id='collapse-checkout-confirm'><h2>SUMMARY</h2></div>
                  
                </div>
            
            </div>
        </div>
<!-- yd nreirong -->
        <!--移动内容1-->
        <div class="content in_content zf_1 new_in_content clearfix pc_hide">
            <div class="zf_con clearfix">
               <!--  <div class="zfbt clearfix">
                    <span>1</span>
                    <h1>Shipping Address</h1>
                </div> -->
                
                <ol class="zf_1_ol clearfix">
                        <input id="same_as_shipping" name="same_as_shipping" value="1"  type="hidden">
                        <div class="payment_next bg_gif" id="payment_next" >
                        <div class="shipping_address bg_fff bg_gif" id="shipping_addresss">
                            <h2>Select the shipping address</h2>
                     
                        </div>
                        <div class="shipping_method bg_fff bg_gif" id="shipping_methods" style="display: none;" >
                            <h3>Shipping Method</h3>
                        </div>
                        </div>

                </ol>
                
            </div>
        </div>

<script type="text/javascript">
function toselectAddress(){

tips('Please Select Shipping Address','gantan');
 // $('.addrres').css('display','none');

}
    $(function(){
        //单选
        $(".dx_label input").click(function(){
            if($(this).prop("checked")){
                $(this).siblings(".check_i").addClass("active");
                
            }else{
                $(this).siblings(".check_i").removeClass("active");
            }
        })
        
        $(".address_ul>li").click(function(){
            $(this).addClass("active").siblings("li").removeClass("active");
        })
        
        //搜索
        $(".shop_search input").focus(function(){
            $(".shop_search button").css("display","block");
        })
        //yd选择支付地址
        $(".zf_1 .zf_1_ol>li").click(function(){
            $(this).addClass("active").siblings().removeClass("active");
        })

    })
</script>
<style type="text/css">
    @media (max-width:920px) {
        .yd_footer{display: none !important;}
        .yd_footer2{display: block !important;}
    }
    
</style>        
<script type="text/javascript"><!--
//浏览器窗口从pc/yd改变的时候刷新页面
  var old_w = $(window).width();
  $(window).resize(function(){
    var new_w = $(window).width();
    (old_w>920) ? (new_w <=920)?location.href="<?=$currentpage?>":0 : (new_w >920)?location.href="<?=$currentpage?>":0 ;
  })

$(document).ready(function() {
    getShippingAddress();
    
  
});



// Get Shipping Address
function getShippingAddress(address_id)
{

    $.ajax({
        url: 'index.php?route=checkout/shipping_address&address_id='+address_id,
        dataType: 'html',
        success: function(html) {
            $('#shipping_address').html(html);
        $('.address_ul li').removeClass('active');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
        // getShippingMethod();
}
// Get Shipping Address

var win = $(window).width();
 if(win<920){
function getShippingAddress(address_id)
{

    $.ajax({
        url: 'index.php?route=checkout/shipping_address&address_id='+address_id,
        dataType: 'html',
        success: function(html) {
            $('#shipping_addresss').html(html);
        $('.zf_1_ol li').removeClass('active');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
        // getShippingMethod();
}
}


// Get Shipping Method
function getShippingMethod()
{
     $('#shipping_method').show();

    $.ajax({
        url: 'index.php?route=checkout/shipping_method',
        dataType: 'html',
        success: function(html) {
            $('#shipping_method').html(html);
            getOrder();
          
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
var win = $(window).width();
 if(win<920){
    function getShippingMethod()
{
     $('#shipping_methods').show();

    $.ajax({
        url: 'index.php?route=checkout/shipping_method',
        dataType: 'html',
        success: function(html) {
            $('#shipping_methods').html(html);
            getOrder();
          
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
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

// Get Order Info
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
// var win = $(window).width();
//  if(win>920){
// echo $footer;
//  }
//--></script>
<!-- <div class="yd_hide"> -->
<?php echo $footer; ?>
<!-- </div> -->