<!-- <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
		<title>PAYMENT METHOD</title>
	</head>
	<body>
	 -->
	 <?php echo $header; ?>
				
		
		
	<div class="new_nav pc_hide clearfix">
				<a class="fh" href="<?=$shipping_method_url;?>"></a>
				<p>PAYMENT METHOD</p>
		</div>
		<!--内容-->
		<div class="content in_content zf_3  new_in_content pc_hide clearfix">
			<div class="zf_con clearfix">
				<div class="zfbt clearfix">
					<span>3</span>
					<h1>Payment Method</h1>
				</div>
				
				<ul class="pay_ul clearfix">
					<?php foreach ($payment_methods as $payment_method) { ?>

						<li class=" clearfix">
						<label class="gx clearfix" for="payment_method_<?php echo $payment_method['code']; ?>">
							    <input class="pay_dx"   type="hidden" id="payment_method_<?php echo $payment_method['code']; ?>" name="payment_method" value="<?php echo $payment_method['code']; ?>"  />
							<div class="img"><img src="<?=isset($payment_method['image'])?$payment_method['image']:HTTPS_SERVERS.'catalog/view/theme/default/img/png/new_10_2.png'; ?>" /></div>
							<p> <?php echo $payment_method['title']; ?></p>
						</label>
					</li>
       
        

                  <?php if($payment_method['code'] == 'pp_express'){ ?>
                  <li class=" clearfix">
						<label class="gx clearfix" for="payment_method_<?php echo $payment_method['code']; ?>">
						  <input class="pay_dx"    type="hidden" name="payment_method" value="payment_method_<?php echo $payment_method['code']; ?>"  />
							<div class="img"><img style="width: 200px;" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/new_10_3.png" /></div>
							<p>Credit Card</p>
						</label>
					</li>
                 
                    <?php } ?>
              <?php } ?>
					
				
				
				</ul>
				
				<div class="bot clearfix">
					<p>If you have coupons, please put in the code. If not, please submit the order directly.</p>
					<label class="clearfix" for="">
					 <input type="text"  id="coupon_code" name="coupon" value="<?php echo @$coupon; ?>" placeholder="coupon code"/>
						<!-- <input type="text" placeholder="Coupon Code" /> -->
						<button class="qd_btn"  onclick="coupon_code(this)" >CONFIRM</button>
					</label>
					
				</div>
				
				<div class="total clearfix">
					<p>Total: <span id="total"><?=$total;?></span></p>
					<span id="span"><a class="tj_btn" >SUBMIT THE ORDER</a></span>
					<input type="hidden" name="url" id="url"/>
				</div>
				
			</div>
		</div>
		
		
	
		
	</body>
</html>
<script type="text/javascript">
//浏览器窗口从pc/yd改变的时候刷新页面
  var old_w = $(window).width();
  $(window).resize(function(){
    var new_w = $(window).width();
    (old_w>920) ? (new_w <=920)?location.href="<?=$checkoutdas?>":0 : (new_w >920)?location.href="<?=$checkoutdas?>":0 ;
  })
function coupon_code(e) {
    $.ajax({
        url: 'index.php?route=extension/total/coupon/jcoupon',
        type: 'post',
        data: $('input#coupon_code'),
        dataType: 'json',
      
        success: function(json) {
       

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']) {
                    $('#new-checkout-bot-code').html( json['error']);
                }
               
            } else {
                getOrder();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
function getOrder(){
//    console.log();
    $.ajax({
        url: 'index.php?route=checkout/confirm&cart_ids='+"<?php echo $cart_ids ?>",
        dataType: 'html',
        success: function(html) {
        	 getTotal();
           console.log(html);die;
            // $('#collapse-checkout-confirm').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
	 
	$(function(){
//		支付方式选择
		$(".pay_ul>li").click(function(){
			$(this).addClass("active").siblings().removeClass("active");
				var value= $(this).find('input').val();
					console.log(value);
					var is_paypal_creditcard="<?php echo $is_paypal_creditcard; ?>";
 $.ajax({
        url: 'index.php?route=checkout/payment_method/save',
        type: 'post',
        data: {payment_method:value,is_paypal_creditcard:is_paypal_creditcard},
        dataType: 'json',
 
        success: function(json) {

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                  tips(json['error']['warning'] );
                }
                // Highlight any found errors
             
            } else {

              getTotal();
            }
      
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

		$(".pay_ul>li .ts_p").hide();
		})
		
		$(".bot input").focus(function(){
			$(this).siblings(".qd_btn").css("display","block");
		})
		
		
		//提交
		$(".total .tj_btn").click(function(){

				var value=$(".pay_ul>li.active").find('input').val();
					console.log(value);
					if (value) {
						// console.log(1);
						checkout();
					}else{
			
						tips('Please Select Shipping Method','gantan')
					}
				
		
		})
	})

	function getTotal() {
		$.ajax({
        url: 'index.php?route=checkout/payment_method/total',
       
        dataType: 'json',
 
        success: function(json) {
        	$('#total').html(json['total']);
        	$('#url').val(json['url']);

        }
    })
		
	}
function checkout() {
   var url = $('#url').val();
     	console.log(url);
   if(url){

    $.ajax({
        url: url,
         type: 'post',
        data: {comment:'<?=$comment;?>'},
        dataType: 'json',
       
        success: function(json) {
       

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                   tips(json['error']['warning']);
                }
            
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
	}
}


</script>