			


			<!-- 移动端发帘发块产品详情 ，属性。列表部分 -->
			<?php  if($product_id){?>
			<div class="ydh_hide form-product" id="products" >
				<div class="yd_close">
					<div class="yd_close_a"><img src="catalog/view/theme/default/img/png/yd_img3.png"></div>
					<div class="yd_close_b"><img src="catalog/view/theme/default/img/png/yd_img2.png"></div>
				</div>
				<input type="hidden" name="product_id" value="<?=$product_id?>">
				<input type="hidden" name="value_status" value="<?=$value_status?>">
				<div class="yd_bur">
					<div class="yd_bur_a">
						<span><img src="<?php echo $thumb?>"></span>
						<div class="yd_bur_list">
							<p><?php echo $heading_title; ?></p>
								<?php if ($price) { ?>
										<?php if(isset($special)){ ?>
										<span class="money"><?php echo $special; ?></span>
										<?php }else{ ?>
										<span class="money"><?=$price?></span>
										<?php } ?>
								<?php } ?>
						</div>
					</div>
						<div class="yd_bur_each">
							
							<?php if ($options) { ?>
								<?php foreach ($options as $option) { ?>	
								<?php if ($option['product_option_value']) { ?>
								<?php if ($option['type'] == 'select') { ?> 

								<div class="yd_bur_b">
									<p><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</p>
									

									<ul id="input-option<?php echo $option['product_option_id']; ?>" class="attr_ul yd_length ">
									<input class="li_2" type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" />
									<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
										<li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'yd_on';} else if($k==0) echo 'yd_on'; ?> <?php echo $option_value['quantity']==0 ?'yd_hui':''?>" value="<?php echo $option_value['product_option_value_id']; ?>" ><?php echo $option_value['name']; ?></li>
									<?php } ?>
									
									</ul>
								</div>

								<?php }elseif ($option['type'] == 'radio') { ?>
								<div class="yd_bur_b">
									<p><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</p>

									

									<ul id="input-option<?php echo $option['product_option_id']; ?>" class="attr_ul yd_way ">
									<input class="li_1" type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" />
										<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
										<li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'yd_on';} else if($k==0) echo 'yd_on'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></li>
										<?php } ?>
									</ul>
								</div>
							<?php }?><?php }}} ?>
							<div class="yd_bur_c">
								<p>Quantity:</p>
								<div class="yd_dl">
									<span class="num-jian sub">-</span>
									<input type="text" class="input-num num" name="quantity" value="1"  />
									<span class="num-jia add">+</span>
								</div>
							</div>
						</div>
					
				</div>
				<div class="yd_bur_d">
					<?php if (!isset($logins)) { ?>
					<a href="<?php echo $login; ?>">PLEASE LOGIN FIRST</a>
					<?php }else{ ?>
					<a href="javascript:;" id="buttonon-customized">CONFIRM</a>
					<?php  }?>
				</div>
			</div>
			<?php  }?>
	<script>
	$(function(){
		//替换图片
	    var win = $(window).width();
		if(win<=992){
			// yd
			$(".yd_close_b").click(function(){
				$(this).parents('.ydh_sern').fadeOut();
				$("body").css("overflow","");
			})
			$(".yd_close_a").click(function(){
				$(this).parents('.ydh_sern').fadeOut();
				$("body").css("overflow","");
			})
		}else{
			// pc
		}

		// 数量
		function in_num() {
			$("input.num").each(function(){
				if($(this).val()<=1){
					$(this).siblings(".sub").addClass("active");
				}else{
					$(this).siblings(".sub").removeClass("active");
					
				}
			})
		}
		$(".sub").click(function(){
			var num  = $(this).siblings(".num").val();
			if(num>1){
				num--;
				$(this).siblings(".num").val(num);
				in_num();
			}
		})
		$(".add").click(function(){
			var num  = $(this).siblings(".num").val();
			num++;
			$(this).siblings(".num").val(num);
			in_num();
		})

		 $('#buttonon-customized').on('click', function() {
	    	// if($(".cart_tc").hasClass("active")){
	    		$.ajax({
	            url: 'index.php?route=information/selecatalogproduct/addproduct',
	            type: 'post',
	             dataType: 'json',
	            data: $('#products input[type=\'text\'], #products input[type=\'hidden\'], #products input[type=\'radio\']:checked, #products input[type=\'checkbox\']:checked, #products select, #products textarea'),
	           
	     
	            success: function(data) {
	            	if (data.success) {

	            		// tips('Successfully joined','');
	            		alert('Successfully joined');
	            		getydaddproduct();
	            	}
	            },
	            error: function(xhr, ajaxOptions, thrownError) {
	                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	            }
	        });
	    	// }
        
    	});

		 $(".attr_ul>li").click(function(){
		 	if(!$(this).hasClass("yd_hui")){
			 	$(this).addClass("yd_on").siblings().removeClass("yd_on");
			 
				let li_val = $(this).attr("value");
				$(this).siblings('input').val(li_val);
				changeprices();
				}
			})
		 	// 变化价格
			 function changeprices() {

		        $.ajax({
		            url: 'index.php?route=information/selecatalogproduct/getprice&product_id=<?php echo $product_id; ?>',
		            type: 'post',
		            dataType: 'json',
		            data: $(".form-product input"),

		            success: function(json) {
		                $('.money').html(json['html']);
		            }
		        });
	    	}

	})
	</script>	