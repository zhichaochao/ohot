 <div class="yd_hide"><?php echo $header; ?></div>
<div class="new_nav pc_hide clearfix">
                <a class="fh" href="<?php echo $home?>"></a>
                <p>MY ORDERS</p>
            </div>

<!--内容-->
    <div class="orderlist in_content peo_center yd_hide" >
      <div class="content clearfix">
        
        <div class="left clearfix">
          <h1>MY ACCOUNT</h1>
          <ol>
    
            <?php echo $account_left; ?>
          </ol>
        </div>
        <?php if ($orders) { ?>
        <div class="right m_or_det clearfix" >
          <ul class="order_ul clearfix">
          
          <?php foreach ($orders as $order) { ?>
          

            <li class="clearfix">
              <div class="top clearfix">
                <ol class="top_ol clearfix">
                  <li>
                    <p>Order Date:<?php echo $order['date_added']; ?></p>
                  </li>
                  <li>
                    <p>Order Number: <?php echo $order['order_no']; ?></p>
                  </li>
                  <li>
                    <p>Order Status: <?php echo $order['status']; ?></p>
                  </li>
                </ol>
                <div class="close" onclick="javascript:order_remove('<?php echo $order['order_id']; ?>');"></div>
              </div>
              
              <div class="bot clearfix">
                <div class="left clearfix">
                  <ol class="bot_ol clearfix">
                  <?php if ($order['products']) { ?>
                    <?php foreach ($order['products'] as $product) { ?>
                    <li class="clearfix">
                      <div class="pic_img">
                       <a href="<?php echo $order['view']; ?>"> <img src="<?php echo $product['image']; ?>"  /></a>
                      </div>
                      <p><a href="<?=$order['view'];?>"><?php echo $product['name']; ?></a></p>
                      <a href="<?=$order['view'];?>">
                      <div class="type">
                        <p>Quantity:<?php echo $product['quantity']; ?></p>    
                    <?php if ($product['options']) { ?>
                    <?php foreach ($product['options'] as $option) { ?>     
                      <p><?php echo $option['name']; ?>:<?php echo $option['value']; ?></p>    

                    <?php } }?>  
                      </div>
                      </a>
                      <p class="price"><?php echo $product['price']; ?></p>
                    </li>
                        <?php } }?>
                  </ol>
                </div>
                <a href=" <?php echo $order['view']; ?>">
                <div class="total">
                  <p class="p1">Shipping<span class="fr"><?php echo $order['shipping_total']; ?></span></p>
                  <p class="p2">Total <span class="fr"><?php echo $order['total']; ?></span></p>
                </div>
                </a>
                <div class="btn_div">
                  <!-- <a class="return" href="###">Return</a>
                  <a class="" href="###">View</a> -->
                  <a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-primary btn-view">
                view
                </a>
                
                <?php if($order['status'] == 'Pending'){ ?>
                  &nbsp;&nbsp;<a href="javascript:;" data-toggle="tooltip" onclick="cancel_order('<?php echo $order['cancel_href'];?>')" href="<?php echo $order['cancel_href'];?>" title="Cancel Order"  class="btn btn-cancel">Cancel</a>

                  <?php if($order['payment_code'] == 'pp_standard' || $order['payment_code'] == 'pp_express') { ?>
                    &nbsp;&nbsp;<a data-toggle="tooltip" href="<?php echo $order['repay'];?>" title="Pay"  class="red">Pay</a>
                  <?php } ?>
                <?php } ?>
                </div>
                
                <div class="return_modal">
                  <div class="text">
                    <span><em></em></span>
                    <p>Please choose the following ways  to contact us for your return</p>
                    <a class="whatapp fl" target="_blank" href="whatsapp://send?phone=<?=$whatappphone;?>">What app</a>
                    <a class="skype fr" target="_blank"  href="skype:<?=$skype;?>?chat">Skype</a>
                    <div class="close"></div>
                  </div>
                </div>
              </div>
            </li>
             
            <?php } ?>
            

            
            
          </ul>
        
        </div>
        <?php } else { ?>
        <div class="right  or_null clearfix">
          
          <!-- <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/img/png/new_5_.png"/> -->
          <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/new_5_.png"/>
          <p> You haven't placed order yet, start now~</p>
          <a class="a_btn" href="<?php echo $goshopping?>">GO SHOPPING &nbsp;&nbsp;&nbsp;></a>
          
        </div>
          <?php } ?>
        
      </div>
      
      
    </div>

    <!-- yd -->

       
        <div class="content in_content new_order new_in_content clearfix pc_hide">
      <div class="nav_t clearfix">
        <ol class="clearfix">
          <li class="<?=$status=='' ?'active':'';?>"><a href="<?php echo $sortorders?>">All</a></li>
          <li class="<?=$status==1 ?'active':'';?>"><a href="<?php echo $sortorders?>&status=1">Pending</a></li>
          <li class="<?=$status==2 ?'active':'';?>"><a href="<?php echo $sortorders?>&status=2">Processing</a></li>
          <li class="<?=$status==3 ?'active':'';?>"><a href="<?php echo $sortorders?>&status=3">Shipped</a></li>
          <li class="<?=$status==5 ?'active':'';?>"><a href="<?php echo $sortorders?>&status=5">Completedl</a></li>
        </ol>
      </div>
       <?php if ($orders) { ?>
      <div class="text clearfix">
        <ul class="zt_ul">
      <?php foreach ($orders as $order) { ?>
          <li class="clearfix">
            <p class="top_p clearfix"><em><?php echo $order['date_added']; ?></em> <span><?php echo $order['status']; ?></span></p>
            <ol class="zt_ol">

              <?php foreach ($order['products'] as $product) { ?>
              <li class="clearfix">
                <a href="<?php echo $order['view']; ?>">
                  <div class="pic_img"><img src="<?=$product['image'];?>"/></div>
                  <div class="text">
                    <p><?=$product['name'];?></p>
                     <?php if ($product['options']) { ?>
                    <?php foreach ($product['options'] as $option) { ?>     
                      <em><?php echo $option['name']; ?>:<?php echo $option['value']; ?></em>    
                    <?php } }?> 
                    <span class="num">x<?php echo $product['quantity']; ?></span>
                    <span class="price"><?php echo $product['price']; ?></span>
                  </div>
                </a>
              </li>
             <?php } ?>
            </ol>
            <p class="p_slide">Total <?php echo $order['count']; ?> Pieces <i></i></p>
            <div class="total">
              <p>Total <?php echo $order['count']; ?> Pieces</p>
              <span>Total: <em><?php echo $order['total']; ?></em></span>
            </div>
            <ol class="btn_ol clearfix">

            <?php if($order['status'] == 'Pending'){ ?> 
                <?php if($order['payment_code'] == 'pp_standard' || $order['payment_code'] == 'pp_express') { ?>
                    <li><a data-toggle="tooltip" href="<?php echo $order['repay'];?>" title="Pay"  class="pay">Pay</a></li>
                  <?php } ?>
                <li> <button  data-toggle="tooltip" onclick="cancel_orders('<?php echo $order['cancel_href'];?>')" href="<?php echo $order['cancel_href'];?>" title="Cancel Order"  class="Cancel">Cancel</button></li>

                <li><button class="del" type="button" onclick="javascript:order_removes('<?php echo $order['order_id']; ?>');">Delete</button></li>

                 
                <?php } ?>

                <?php if($order['status'] == 'Processing'){ ?> 
                <li><button class="" type="button">Remind Seller to Ship</button></li>
              <!-- <li><a class="tk_order" href="###">Tracking Order</a></li> -->
              <?php } ?>

              <?php if($order['status'] == 'Canceled' || $order['status'] == 'Complete'){ ?> 
              <li><button class="del" type="button" onclick="javascript:order_removes('<?php echo $order['order_id']; ?>');">Delete</button></li>
               <?php } ?>
                 <?php if($order['status'] !== 'Pending' && $order['status'] !== 'Canceled'){ ?> 
                  <li><button class="contact" type="button">Contact Us</button></li>
                 <?php } ?>
            </ol>
          </li>
           <?php } ?>
        </ul>
      </div>
        <?php }else{ ?>
          <div class="right  or_null clearfix pc_hide">
              <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/new_5_.png"/>
              <p> You haven't placed order yet, start now~</p>
              <a class="a_btn" href="###">GO SHOPPING &nbsp;&nbsp;&nbsp;></a>
            </div>
        <?php }?>
    </div>
<div class="new_lxwm_tc clearfix">
      <div class="text clearfix">
        <div class="close"></div>
        <p>Please choose the following ways to contact us</p>
        
        <div class="btn clearfix">
          <a class="wh_a" target="_blank" href="whatsapp://send?phone=<?=$whatappphone;?>"><span>WhatsApp</span></a>
          <a class="sk_a" target="_blank" href="skype:<?=$skype;?>?chat"><span>Skype</span></a> 
        </div>
      </div>
    </div>

      <!--弹窗确定取消-->
    <div class="choice_tc clearfix pc_hide">
      <div class="text">
        <p><span>Are you sure?</span></p>
        <div class="btn">
          <button class="qd_btn">Yes</button>
          <button class="qx_btn">No</button>
        </div>
      </div>
    </div>


<script>
function cancel_order(url){
	if(confirm('Are You Sure?')){
		location.href=url;
	}
}
// $(".choice_tc .qx_btn").click(function(){
//       $(".choice_tc").fadeOut();
//       $("body").css("overflow","");
//     })
//  $(".choice_tc").click(function(e){
//       var close = $('.choice_tc .text'); 
//         if(!close.is(e.target) && close.has(e.target).length === 0){
//           $(".choice_tc").fadeOut();
//           $("body").css("overflow","");
//       }
//     })
//       $(".choice_tc .qd_btn").click(function(){
//       $(".choice_tc").fadeOut();
//       $("body").css("overflow","");
//       location.href="http://www.baidu.com";
//     })
function cancel_orders(url){
    location.href=url;
}
  // 联系
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
function order_remove(order_id){
// alert(order_id);
if(confirm('Are you sure?')){

           $.ajax({
            url: 'index.php?route=account/order/delete',
            type: 'post',
            data: {order_id:order_id},
            dataType: 'json',
     
            success: function(json) {
              // alert(json);
              // if (json['link']) { }
               location.reload();
            }
        })
      
    }
}
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
               location.reload();
            }
        })
      
    // }
}
</script>

<div class="yd_hide"><?php echo $footer; ?></div>

