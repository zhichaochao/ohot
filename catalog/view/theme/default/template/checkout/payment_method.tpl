<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>

  <div class="bg_fff" id='collapse-payment-methoda'>
            <h2><span>3</span>Select a payment method</h2>
                <input type="hidden" name="is_paypal_creditcard" id="is_paypal_creditcard" value="<?php echo $is_paypal_creditcard; ?>"/>
                <input type="hidden" name="payment_method" id="is_payment_method" value=""/>
              <!--   <p class="ts" style="display: block;">Click “save and continue” to make paypal payments</p>
                <p class="jg" id="ts_jg"><span>i</span>Please choose the payment method</p> -->
             <ul class="pay_ul clearfix">
                 <?php foreach ($payment_methods as $payment_method) { ?>
       
                <li class="clearfix">
                 <label class="gx clearfix" for="">
                  <input class="pay_dx"   type="checkbox"  value="<?php echo $payment_method['code']; ?>" aid='0'   />

              <?php if($payment_method['code'] == 'pp_express'){ ?>
                <div class="img" ><img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/new_10_2.png" /></div> 
                  <p >PayPal</p>
                <?php } else { ?>
                  <?php if (isset($payment_method['image']) && !empty($payment_method['image'])) { ?>
                  <div class="img"><img src="<?php echo $payment_method['image']; ?>"  /></div> 
                    <p>   <?php echo $payment_method['title']; ?></p>
                  <?php } else { ?>
                 <p>   <?php echo $payment_method['title']; ?></p>
                  <?php } ?>
                <?php } ?>
                   </label>
                </li>

                  <?php if($payment_method['code'] == 'pp_express'){ ?>
                  <li class="clearfix">
                  <label class="gx clearfix" for="">
                  <input class="pay_dx"    type="checkbox" value="<?php echo $payment_method['code']; ?>"  aid='1'  />
                 <div class="img" ><img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/new_10_3.png"  /></div> 
                  <p>Processed by</p>
                  </label>
                </li>
                    <?php } ?>
              <?php } ?>
              </ul>
            </div>
            
            <a class="btn240" onclick="checkout()" >SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;></a>



 
<?php } ?>
 <!-- <a  href="<?=$checkout;?>" class="step">Previous Step&nbsp;&nbsp;&nbsp;></a> -->
<script>
$(function( ){
  //单选
    $(".pay_dx").click(function(){
      if($(this).prop("checked")){
        $(".pay_dx").removeClass("active");
        $(this).addClass("active");
        $(this).parents("li").addClass("active").siblings("li").removeClass("active");
      }else{
        $(".pay_dx").addClass("active");
        $(this).removeClass("active");
        $(this).parents("li").removeClass("active").siblings("li").addClass("active");
      }
    })
})

</script>
<script type="text/javascript"><!--
  // 支付方式选择
    $(".pay_ul>li").click(function(){
      $(this).addClass("active").siblings().removeClass("active");
      $(".pay_ul>li .ts_p").hide();
      $(".pay_ul input").removeAttr("checked");
      $(this).find("input").attr("checked","checked");
      var val=$(this).find("input").val();
      $('#is_payment_method').val(val);
       var in_this = $(this);
       var in_id = $(this).find(".pay_dx").attr("aid");
      changePayment(in_id,in_this);



    })

function changePayment(flag, e){
    // console.log(e);
    // console.log(flag)
    
    $('#is_paypal_creditcard').val(flag);
    savePaymentMethod(e);
}

// Save savePayment Method
function savePaymentMethod(e) {


    $.ajax({
        url: 'index.php?route=checkout/payment_method/save',
        type: 'post',
        data: $('#collapse-payment-methoda input[type=\'hidden\']'),
        dataType: 'json',
 
        success: function(json) {
          // alert(json);die;
            $('#collapse-payment-method .alert, #collapse-payment-method .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#ts_jg').html(json['error']['warning'] );
                }
                // Highlight any found errors
             
            } else {
              getOrder();

             $(document).scrollTop(600);

            }
      
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
            
}

//--></script>