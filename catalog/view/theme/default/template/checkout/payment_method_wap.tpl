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
				<a class="fh" href="###"></a>
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
					<p>If you have coupons, please put  the code in. If not, please submit the order directly.</p>
					<label class="clearfix" for="">
						<input type="text" placeholder="Coupon Code" />
						<button class="qd_btn">CONFIRM</button>
					</label>
					
				</div>
				
				<div class="total clearfix">
					<p>Total: <span><?=$total;?></span></p>
					<span id="span"><a class="tj_btn" >SELECT PAYMENT METHMOD</a></span>
				</div>
				
			</div>
		</div>
		
		
	
		
	</body>
</html>
<script type="text/javascript">
	$(function(){
//		支付方式选择
		$(".pay_ul>li").click(function(){
			$(this).addClass("active").siblings().removeClass("active");
			$(".pay_ul>li .ts_p").hide();
		})
		
		$(".bot input").focus(function(){
			$(this).siblings(".qd_btn").css("display","block");
		})
		
		
		//提交
		$(".total .tj_btn").click(function(){
			var i=0;
			var len = $(".pay_ul>li").length;
			$(".pay_ul>li").each(function(){
				if($(this).hasClass("active")){
					

				}else{
					i++;
					if(i==len){
						tips('Please Select Shipping Method','gantan')
					}
				}
			})
		})
	})
</script>