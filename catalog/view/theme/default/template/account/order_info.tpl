 <div class="yd_hide"><?php echo $header; ?></div>
 <div class="new_nav pc_hide clearfix">
                <a class="fh" href="<?php echo $home?>"></a>
                <p>ORDERS DETAILS</p>
            </div>
<!--内容-->
    <div class="view_order yd_hide">
      <div class="content in_content clearfix">
        <div class="text_con clearfix">
          <h1>Order Information</h1>
          <div class="top clearfix">
            <div class="hui_div clearfix">
              <p><span>Order Date: </span><?php echo $date_added; ?></p>
              <?php if ($order_no) { ?>
               <p><span>Order Number: </span><?php echo $order_no; ?></p>
              <?php } ?>
              <?php if ($order_status) { ?>
              <p><span>Order Status: </span><?php echo $order_status; ?></p>
              <?php } ?>
            </div>
            <div class="ship active clearfix">

              <div class="left clearfix">
                <span class="h2_span">Shipping Address</span>
                <div class="text clearfix">
                <?php if ($shipping_address) { ?>
                <p><?php echo $shipping_address; ?></p>
                <?php } ?> 

                  <?php if($order_status == 'Pending'){ ?>
                  <button class="editadd">Edit Address</button>
                  <?php } ?>
                </div>
              </div>

              <div class="right clearfix">
                <span class="h2_span">Shipping Method</span>
                <div class="text clearfix">
                <?php if ($payment_method) { ?>
              <p><?php echo $text_payment_method; ?></p> <p><?php echo $payment_method; ?></p><br />
              <?php } ?>

              <?php if ($shipping_method) { ?>
              <p><?php echo $text_shipping_method; ?></p> <p><?php echo $shipping_method; ?></p><br />
              <?php } ?>

              <?php if ($shippingNumber) { ?>
              <p>Shipping Number:</p> <p><?php echo $shippingNumber; ?></p>
              <?php } ?>
                  <!-- <p>Nigeria Local Express <span>$0.00</span></p>
                  <p>（Weight: 200.00g）</p> -->
                <?php if($order_status == 'Pending'){ ?>
                  <!-- <button class="editship">Edit Shipping Method</button> -->
                 <?php } ?> 
                </div>
              </div>
              <?php if(isset($payment_method_attributes)) { ?>
            <?php if($payment_code !== 'pp_express' || $payment_code !== 'pp_standard') { ?>
              <div class="right clearfix" style="margin:0 0 20px 20px;">
                <span class="h2_span">Payment Information</span>
                <div class="text clearfix">
                  <?php foreach($payment_method_attributes as $attribute) { ?>     
                        <p>
                         <?php echo $attribute['text']; ?>:
                         <?php echo $attribute['value']; ?>
                        </p>
                    <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php } ?>
              
            </div>
          </div>
          
          <div class="bot clearfix">
            <div class="hui_div clearfix">
              <p>Product Information</p>
            </div>
            <div class="text clearfix">
              <div class="span_div clearfix">
                <span>Subtotal</span>
                <span>Quantity</span>
                <span class="cl_len">Lace Closure/Color/Length</span>
                <span>Unit  Price</span>
              </div>              
              
              <ul class="order_ul clearfix">
              <?php foreach ($products as $product) { ?>
                <li class="clearfix">
                <a href="<?php echo $product['href']; ?>">
                  <div class="pic_img">
                    <img src="<?php echo $product['order_image']; ?>" alt="" />                   
                  </div>
                  <p class="ov_text"><?php echo $product['name']; ?>
                  </p>
                  <span class="d_price"><?php echo $product['total']; ?></span>
               
                  <span class="num"><i class="yd_i">X</i><?php echo $product['quantity']; ?></span>
                  <span class="length">
                   <?php foreach ($product['option'] as $option) { ?>
                    <?php echo $option['value']; ?>
                  <?php } ?>
                  </span>
                    <span class="z_price"><?php echo $product['price']; ?></span>
                </li>
               </a>
               <?php } ?>
              </ul>
              <div class="total clearfix">
                <p class="clearfix"><span class="fl">Shipping </span><span class="fr"><?php echo $shipping_total; ?></span></p>
                <?php if($totals){?>
                 <?php if($totals[2]['code']=='poundage'){?>
                <p class="clearfix">
                <span class="fl">Poundage </span>
                <span class="fr"><?php echo $totals[2]['text']; ?></span>
                </p>
                <?php }elseif($totals[2]['code']=='coupon'){?>
                <p class="clearfix">
                <span class="fl">Poundage </span>
                <span class="fr"><?php echo $totals[3]['text']; ?></span>
                </p>
                <p class="clearfix">
                <span class="fl">Discounts </span>
                <span class="fr"><?php echo $totals[2]['text']; ?></span>
                </p>
                <?php }?>
                <?php }?>

                <p class="clearfix"><span class="p_span fl">Total </span><span class="fr"><?php echo $total; ?></span></p>
                <?php if (isset($pricereduction)) { ?>
                <p class="clearfix"><span class="fl">Price reduction</span><span class="fr">-<?php echo $pricereduction; ?></span></p>
                <p class="clearfix"><span class="p_span fl">Total price</span><span class="fr"><?php echo $pricereductiontotal; ?></span></p>
                 <?php }?>
              </div>
            </div>

          </div>
           <?php if($comment){?>
          <p class="comment" style="font-size: 18px;">Comment  : <span><?php echo $comment; ?></span></p>
           <?php }?>
          
          <!-- <a class="a_btn" href="###">Continue to pay</a>
          <a class="qx_btn" href="###">Cancel</a> -->
            <?php if($order_status == 'Pending'){ ?>
                 
                  <?php if($payment_code == 'pp_standard' || $payment_code == 'pp_express') { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay;?>" title="Pay"  class="a_btn">Continue to pay</a>
                  <?php } ?>
                  <?php if($bank_receipt) { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay_receipt;?>" title="Pay"  class="a_btn">Re Submit Receipt</a>
                  <?php }elseif(!($payment_code == 'pp_standard' || $payment_code == 'pp_express')){ ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $repay_receipt;?>" title="Pay"  class="a_btn">Continue to pay</a>
                <?php } ?>

                  &nbsp;&nbsp;<a  title="Cancel Order"  onclick="cancel_order('<?=$cancel_href?>')" class="qx_btn">Cancel</a>
                <?php } ?>

          <?php if ($histories) { ?>
          <div class="order_hty">
            <h1>Order History</h1>
            <ul>
              <li><span>Dateline</span><span>Status</span></li>
          <?php if ($histories) { ?>
          <?php foreach ($histories as $history) { ?>
              <li>
              <span><?php echo $history['date_added']; ?></span>
              <span><?php echo $history['status']; ?></span>
              </li>
              <?php } ?>
          <?php }  ?>
            </ul>
          </div>
          
         <?php } ?>
          <?php if($order_status !== 'Pending'){ ?>
           <a class="a_btn" href="<?php echo $continue?>">GO BACK</a>
         <?php } ?>
              <?php if($order_status == 'Paid'){ ?>
                 <?php if($payment_code !== 'pp_express' || $payment_code !== 'pp_standard') { ?>
                       <a data-toggle="tooltip" href="<?php echo $repay_receipts;?>" title="Pay"  class="a_btn">Re Submit Receipt</a>
                  <?php } ?>
              <?php } ?>
           <?php if($bank_receipt) { ?>
           <div class="bot clearfix" style="margin-top: 70px;">
            <div class="hui_div clearfix">
              <p>Bank Receipt</p>
            </div>
            <div class="text clearfix">
 <div class="bank_receipt" style="text-align: center; background: #fff; margin-top: 20px;">
          <?php foreach ($bank_receipt as $k=>$bankvalue) { ?>
        <img style="margin:0 auto;max-width: 100%;" src="<?php echo $bankvalue['bank_receipt'];?>" />
        <?php } ?>
      </div>
    </div>
  </div>         <?php } ?>
        </div>
       
      </div>
    </div>
    <!-- yd -->
    <!--内容-->
    <div class="content in_content new_order new_in_content clearfix pc_hide">
      <div class="nav_t clearfix">
      </div>
      
      <div class="text clearfix">
        <ul class="zt_ul">
          <li class="clearfix">
            <p class="top_p clearfix"><em>Product information</em> <span><?php echo $order_status; ?></span></p>
            <ol class="zt_ol">

       
            <?php foreach ($products as $product) { ?>
              <li class="clearfix">
                <a href="<?php echo $product['href']; ?>">
                  <div class="pic_img"><img src="<?php echo $product['order_image']; ?>"/></div>
                  <div class="text">
                    <p><?php echo $product['name']; ?></p>
                     <?php foreach ($product['option'] as $option) { ?>
                   <em> <?php echo $option['value']; ?></em>
                  <?php } ?>
                   <!--  <em>#1B Natural Black</em>
                    <em>10inch 100g</em>
                    <em>Free Parting</em> -->
                    <span class="num">x<?php echo $product['quantity']; ?></span>
                    <span class="price"><?php echo $product['price']; ?></span>
                  </div>
                </a>
              </li>
              <?php }  ?>
            </ol>
            <p class="p_slide">Total <?php echo $count?> Pieces <i></i></p>
            <div class="totals">
             <?php if (isset($pricereduction)) { ?>
             <span>Total price: <em><?php echo $pricereductiontotal; ?></em></span>
              <p>Shipping <em><?php echo $shipping_total; ?></em></p>
              <p>Price reduction <em>-<?php echo $pricereduction; ?></em></p>
              <?php }else{?>
              <span>Total: <em><?php echo $total; ?></em></span>
              <p>Shipping <em><?php echo $shipping_total; ?></em></p>
              <?php }?>
               <?php if($totals){?>
                 <?php if($totals[2]['code']=='poundage'){?>
                 <p>Poundage <em><?php echo $totals[2]['text']; ?></em></p>
                <?php }elseif($totals[2]['code']=='coupon'){?>
                  <p>Poundage <em><?php echo $totals[3]['text']; ?></em></p>
                    <p>Discounts <em><?php echo $totals[2]['text']; ?></em></p>
                <?php }?>
                <?php }?>

              <!-- <p>Discounts <em>-$10.00</em></p> -->
            </div>
          </li>
          <li class="clearfix">
            <p class="top_p clearfix"><em>Shipping Address:</em></p>
            <div class="address clearfix">
              <?php if ($shipping_address) { ?>
                <p><?php echo $shipping_address; ?></p>
                <?php } ?> 
            </div>
          </li>
          <li class="clearfix">
            <div class="order_num clearfix">
              <p>Order Number: <span><?php echo $order_no; ?></span></p>
              <p>Payment Date: <span><?php echo $date_added; ?></span></p>
              <hr />
              <p>Shipping Method: <span><?php echo $shipping_method; ?></span></p>
               <?php if($comment){?>
              <p>Comment : <span><?php echo $comment; ?></span></p>
               <?php }?>
            </div>
          </li>
        <?php if($bank_receipt) { ?>
          <li class="clearfix" style="padding: 0;">
            <div class="zf_img clearfix">
              <!-- <a class="zf_a" href="###">Re Submit Receipt</a> -->
              <img src="<?=$bank_receipt;?>" alt="" />  
               <?php foreach ($bank_receipt as $k=>$bankvalue) { ?>
              <img src="<?php echo $bankvalue['bank_receipt'];?>" alt="" /> 
              <?php } ?>           
            </div>
          </li>
        <?php } ?> 
      <?php if ($histories) { ?>
        <li class="clearfix">
            <div class="table clearfix">
              <p>Order History</p>
              <table>
                <tr>
                  <td>Dateline</td>
                  <td>Status</td>
                </tr>
              <?php foreach ($histories as $history) { ?>
                <tr>
                  <td><?php echo $history['date_added']; ?></td>
                  <td><?php echo $history['status']; ?></td>
                </tr>
                <?php } ?> 
              </table>
            </div>
            
          </li>
          <?php } ?> 
          <li class="clearfix" style="padding: 0;">
            <ol class="btn_ol ol_details clearfix">

              <?php if($order_status == 'Pending'){ ?>
               <?php if($payment_code == 'pp_standard' || $payment_code == 'pp_express') { ?>
              <li><a class="pay" href="<?php echo $repay;?>">Pay</a></li>
              <?php } ?> 

              <?php if($payment_code !== 'pp_express' || $payment_code !== 'pp_standard') { ?>
               <li><a class="pay" href="<?php echo $repay_receipt;?>">ReSubmit Receipt</a></li>
               <?php } ?> 

              <li><button class="Cancel" onclick="cancel_order('<?=$cancel_href?>')" type="button">Cancel</button></li>
               <?php } ?> 

               <?php if($order_status == 'Paid'){ ?>
                  <li><button class="" type="button" onclick="addemail('<?php echo $order_id?>');">Remind Seller to Ship</button></li>
                <?php } ?> 

               <?php if($order_status == 'Shipped'){ ?>
                <li><button class="contact" type="button">Contact Us</button></li>
               <?php } ?> 
               <?php if($order_status == 'Completed'){ ?>
                <li><button class="contact" type="button">Contact Us</button></li>
               <?php } ?> 
               <?php if($order_status == 'Paid'){ ?>
                <li><button class="contact" type="button">Contact Us</button></li>
               <?php } ?> 

               <?php if($order_status == 'Canceled' || $order_status == 'Completed' ){ ?>
               <li><button class="del" type="button" onclick="javascript:order_removes('<?php echo $order_id;?>');">Delete</button></li>
               <?php } ?> 

               <?php if($order_status == 'Paid'){ ?>
                 <?php if($payment_code !== 'pp_express' || $payment_code !== 'pp_standard') { ?>
               <li><a class="pay" href="<?php echo $repay_receipts;?>">Re Submit Receipt</a></li>
                  <?php } ?>
              <?php } ?>
               
            </ol>
          </li>
          
        </ul>
      </div>
      
      
      
    </div>

    <div class="new_lxwm_tc clearfix">
      <div class="text clearfix">
        <div class="close"></div>
        <p>Please choose the following ways to contact us</p>
        
        <div class="btn clearfix">
          <a class="wh_a" href="whatsapp://send?phone=<?=$whatappphone;?>"><span>WhatsApp</span></a>
          <a class="sk_a" href="skype:<?=$skype;?>?chat"><span>Skype</span></a> 
           <a class="em_a" target="_blank"  href="mailto:<?php echo $email; ?>"><span>Email</span></a> 
        </div>
      </div>
    </div>
    <!-- end -->
    
    <div class="edit_add_md" <?=!$address_error?"":"style='display:block'";?>>
      <div class="text">
        <form method="post" action="<?=$edit_address_url;?>"  class="clearfix" id="collapse-shipping-address">
          <div class="form_div clearfix">
            <div class="close"></div>
            <h1>Edit the address</h1>
            <p>* Required fields</p>
            <div class="label clearfix">
              <label for="">
                <span>Frist Name *</span>
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <p class="ts_p" style="color: #fd4f57;font-size: 14px;"><?php echo $error_firstname; ?></p>
              <?php } ?>
               <!--  <p class="ts_ps">This field is required</p> -->
              </label>
              <label class="mr_no" for="">
                <span>Last Name *</span>
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <p class="ts_p" style="color: #fd4f57;font-size: 14px;"><?php echo $error_lastname; ?></p>
              <?php } ?>
                <!-- <p class="ts_ps">This field is required</p> -->
              </label>
              <label class="add" for="">
                <span>Address*</span>
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
              <?php if ($error_address_1) { ?>
              <p class="ts_ps" style="color: #fd4f57;font-size: 14px;"><?php echo $error_address_1; ?></p>
              <?php } ?>
                <!-- <p class="ts_ps">This field is required</p> -->
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
              </label>
              <label for="">
                <span>Country *</span>
                <select name="country_id" id="input-country" class="form-control" disabled="">
                <option value=""><?php echo $replace['country']; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <p class="ts_ps" style="color: #fd4f57;font-size: 14px;"><?php echo $error_country; ?></p>
              <?php } ?>
                <!-- <p class="ts_ps">This field is required</p> -->
              </label>
              <label class="mr_no" for="">
                <span>Post Code *</span>
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
              <?php if ($error_postcode) { ?>
             <p class="ts_ps" style="color: #fd4f57;font-size: 14px;"><?php echo $error_postcode; ?></p>
              <?php } ?>
               <!--  <p class="ts_ps">This field is required</p> -->
              </label>
              <label for="">
                <span>City *</span>
               <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
              <?php if ($error_city) { ?>
              <p class="ts_ps" style="color: #fd4f57;font-size: 14px;"><?php echo $error_city; ?></p>
              <?php } ?>
                <!-- <p class="ts_ps">This field is required</p> -->
              </label>
              <label class="mr_no" for="">
                <span>State *</span>
                <select  disabled="" name="zone_id" id="input-zone" class="form-control" >
              </select>
              <?php if ($error_zone) { ?>
              <p class="ts_ps" style="color: #fd4f57;font-size: 14px;"><?php echo $error_zone; ?></p>
              <?php } ?>
                <!-- <p class="ts_ps">This field is required</p> -->
              </label>
              <label for="">
                <span>Phone *</span>
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if (!empty($error_telephone)) { ?>
             <p class="ts_ps" style="color: #fd4f57;font-size: 14px;"><?php echo $error_telephone; ?></p>
              <?php } ?>
                <!-- <p class="ts_ps">This field is required</p> -->
              </label>
            </div>
            
            <button type="submit" class="bc_btn clearfix" >SAVE ADDRESS&nbsp;&nbsp;&nbsp;></button>
            <button type="button" onclick="cancel_address();" class="qx_btn clearfix">CANCEL&nbsp;&nbsp;&nbsp;></button>
            <input type="hidden" name="edit_address" value="true" />
          </div>
        </form>
      </div>
     
    </div>


    
<style type="text/css">
    @media (max-width:920px) {
        .yd_footer{display: none !important;}
        .yd_footer2{display: block !important;}
        body{margin-bottom: 1.8rem;background-color: #f5f5f5;}
    }
    
</style> 


 <!-- <div class="yd_hide"> -->
 <?php echo $footer; ?> 
 <!-- </div> -->
<script>
function addemail(order_id) { 
   $.ajax({
            url: 'index.php?route=account/order/addemail',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
     
            success: function(json) {
              tips('Remind Success',''); 
            }
        })
  // body...
}
  function cancel_order(url){
  if(confirm('Are You Sure?')){
    location.href=url;
  }
}
  function cancel_address() {
    $('.edit_add_md').fadeOut();
       $("body").css("overflow","");
       return false;
  }
  $(function(){
    $(".editadd").click(function(){
      $(".edit_add_md").fadeIn();
      $("body").css("overflow","hidden");
    })
    $(".edit_add_md .form_div .close").click(function(){
      $(".edit_add_md").fadeOut();
      $("body").css("overflow","");
    })
    
    $(".editship").click(function(){
      $(".edit_method_md").fadeIn();
      $("body").css("overflow","hidden");
    })
    $(".edit_method_md .close").click(function(){
      $(".edit_method_md").fadeOut();
      $("body").css("overflow","");
    })
    
    //单选
    $(".dx_label input").click(function(){
      $(".check_i").removeClass("active");
      $(this).siblings(".check_i").addClass("active");
    })
  })
</script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
  $.ajax({
    url: 'index.php?route=account/account/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
            html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name=\'country_id\']').trigger('change');


//--></script>
<?php if($success){?>
    <script type="text/javascript">
alert('<?php echo $success; ?>');
</script>
<?php }?>
<script>
function order_removes(order_id){
// tips(order_id);
// if(confirm('Are you sure?')){

           $.ajax({
            url: 'index.php?route=account/order/delete',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
     
            success: function(json) {
              // alert(json);
              // if (json['link']) { }
               // location.href('<?php echo $continue?>');
               window.location.href="<?php echo $continue?>";
            }
        })
      
    // }
}
  $(function(){
    //联系
      $(".contact").click(function(){
        $(".new_lxwm_tc").fadeIn();
        $("body").css("overflow","hidden");
      })
      
      //关闭弹窗
      $(".new_lxwm_tc .close").click(function(){
        $(".new_lxwm_tc").fadeOut();
        $("body").css("overflow","");
      })
      $(".new_lxwm_tc").click(function(e){
        var close = $('.new_lxwm_tc .text'); 
          if(!close.is(e.target) && close.has(e.target).length === 0){
            $(".new_lxwm_tc").fadeOut();
            $("body").css("overflow","");
        }
      })
    
    window.onload = function(){
      var li_hei = $(".zt_ol>li").eq(0).outerHeight(true);
      $(".zt_ol").each(function(){
        if($(this).find("li").length>=3){
           $(this).height(li_hei*3);
           $(this).siblings(".p_slide").addClass("off");
        }
      })
      
      //查看更多订单items
      $(".p_slide").click(function(){
        if($(this).hasClass("active")){
          $(this).siblings(".zt_ol").animate({height: li_hei*3+"px"},300);
          $(this).removeClass("active");
        }else{
          $(this).addClass("active");
          let len = $(this).siblings(".zt_ol").find("li").length;
          $(this).siblings(".zt_ol").animate({height: len*li_hei+"px"},500);
        }
      });
      
    }
  });
</script>
