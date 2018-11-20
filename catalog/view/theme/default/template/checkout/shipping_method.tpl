

<?php if ($shipping_methods) { ?>

<div class="bg_fff yd_hide">
 <!-- <h3>Shipping Method</h3> -->
 <p id="no_sel" style="color: #f00;"></p>
                        <ul class="express_ul" id='collapse-shipping-method'>
                        <h2>2.Select the Shipping Method</h2>
                             <?php foreach ($shipping_methods as $quote) { ?>
                            <li class="clearfix">
                                <dl>
                                    <dt>Shipping Method</dt>
                                    <label  class="dx_label">
                                            <input class="check_input"  name="shipping_method" type="checkbox" value="<?php echo $quote['code']; ?>" <?php if ($quote['code'] == $code) { ?>checked="checked"<?php } ?> class="s_method_expedited" onclick="saveMethod(this)" />
                                            <i class="check_i"></i>
                                        </label>
                                    <dd>
                                        
                                        <span>   <?php if($quote['code'] == 'DHL'){ ?>
                                          <img src="https://devb.besthairbuy.com/skin/frontend/default/theme560-desktop-new/images/dh/sfr_method.jpg">
                                          <?php } ?>
                                          <?php echo $quote['title']; ?> </span>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>Expected delivery time</dt>
                                    <dd>
                                        <span>   <?php echo @$quote['desc']; ?></span>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>Shipping Cost</dt>
                                    <dd>
                                    <?php if($quote['code'] == 'weight.weight_10'){  ?>
                                          <span>Shipping cost will be paid by buyer when collect goods from shipping agent.</span>
                                         <?php }else{ ?>
                                        <span><?php echo $quote['text']; ?></span>
                                        <?php } ?>
                                    </dd>
                                </dl>
                            </li>
                             <?php } ?>
                        </ul>

<a class="btn240" onclick="toselectPayment()">SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;&gt;</a>
   </div>

   <div class="bg_fff pc_hide">
 <!-- <h3>Shipping Method</h3> -->
 <p class="no_sel" style="color: #f00;"></p>
                        <ul class="pay_ul clearfix" id='collapse-shipping-methods'>
                        <h2>2.Select the Shipping Method</h2>
                             <?php foreach ($shipping_methods as $quote) { ?>





                                          <!--       <label  class="dx_label">
                                            <input class="check_input"  name="shipping_method" type="checkbox" value="<?php echo $quote['code']; ?>" <?php if ($quote['code'] == $code) { ?>checked="checked"<?php } ?> class="s_method_expedited" onclick="saveMethod(this)" />
                                            <i class="check_i"></i>
                                            </label> -->
                             <li class="clearfix " value="<?php echo $quote['code']; ?>" name="shipping_method" <?php if ($quote['code'] == $code) { ?>checked="checked"<?php } ?> class="s_method_expedited" onclick="saveMethods(this)">
                           <!--   <label  class="dx_label">
                                            <input class="check_input"  name="shipping_method" type="checkbox" value="<?php echo $quote['code']; ?>" <?php if ($quote['code'] == $code) { ?>checked="checked"<?php } ?> class="s_method_expedited" onclick="saveMethod(this)" />
                                            <i class="check_i"></i>
                                            </label> -->
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

<a class="tj_a" onclick="toselectPayment()">SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;&gt;</a>
   </div>

<?php }else{?>
<div class="bg_fff" style="min-height: 300px;">
 <h3>Shipping Method</h3>

 <p>Please Select Address</p>
</div>
<?php } ?>

<script type="text/javascript"><!--
        //    支付方式选择
    $(".pay_ul>li").click(function(){
      $(this).addClass("active").siblings().removeClass("active");
      $(".pay_ul>li .ts_p").hide();
    })
function toselectPayment(){

tips('Please Select Shipping Method','gantan');
 $('#no_sel').html('Please Select Shipping Method');

}
function toselectPayment(){

tips('Please Select Shipping Method','gantan');
 $('.ts_p').html('Please Select Shipping Method');

}
// Save Shipping Method
function saveMethod(e) {

    var address_id=$('#shipping-existing ul li.active').attr('aid');
    if (address_id>0) {
        // console.log(address_id);
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: $('#collapse-shipping-method input[type=\'radio\']:checked'),
        dataType: 'json',
        success: function(json) {
                getOrder();
                getPaymentMethod();
               
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
    }else{
         $('#no_sel').html('Please Select Shipping Address');
         alert('Please Select Shipping Address');
    }
}
var win = $(window).width();
 if(win<920){
  function saveMethods(e) {
console.log(e);
    var address_id=$('#shipping-existings ul li.active').attr('aid');
    if (address_id>0) {
        // console.log(address_id);
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: $('#collapse-shipping-methods input[type=\'radio\']:checked'),
        dataType: 'json',
        success: function(json) {
                getOrder();
                getPaymentMethod();
               
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
    }else{
         $('#no_sel').html('Please Select Shipping Address');
         alert('Please Select Shipping Address');
    }
}
 }

//--></script>