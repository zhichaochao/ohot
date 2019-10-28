

<!-- PC端 发帘发块产品 列表 -->
<?php  if($products){?>
<div class="hwm_hide">
				<div class="close"></div>
				<p>All Hair Weft Collections > <a href="###">Super Double Drawn Funmi Hair</a></p>
				<div class="hwm_over">
					<ul class="hwm_ul">

					<?php foreach ($products as $product) { ?>
						<li data="<?php echo $product['product_id']; ?>" value="<?php echo $value_status; ?>">
							<i><img src="catalog/view/theme/default/img/png/close2.png"></i>
							<span><img src="<?php echo $product['thumb']; ?>"></span>
							<div class="hwm_super">
								<p><?php echo $product['name']; ?></p>
								<div class="hwm_sele <?=$value_status==6 ?'hwm_text':'';?>">
									<?php if ($product['options']) { ?>
									<?php foreach ($product['options'] as  $option_values) { ?>

									<?php if ($option_values['type'] == 'select') { ?> 

										<input class="li_1" type="hidden" name="option[<?php echo $option_values['product_option_id']; ?>]" value="<?php echo $option_values['product_option_value'][0]['product_option_value_id']; ?>" />

										<select class="selecttext" id="input-option<?php echo $option_values['product_option_id']; ?>">
										<?php foreach ($option_values['product_option_value'] as  $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['option_name']; ?></option>
										<?php  }?>
										</select>

										
									<?php  }else if($option_values['type'] == 'radio'){?>

										<input class="li_2" type="hidden" name="option[<?php echo $option_values['product_option_id']; ?>]" value="<?php echo $option_values['product_option_value'][0]['product_option_value_id']; ?>" />

										<select class="radiotext" id="input-option<?php echo $option_values['product_option_id']; ?>">
										<?php foreach ($option_values['product_option_value'] as  $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['option_name']; ?></option>
										<?php  }?>
										</select>

										
									<?php  }?>

									<?php  }?>
									<?php  }?>
									<div class="price_input clearfix">
										<span class="sub active"></span>
										<input class="num" type="text" value="1" readonly="readonly" name="quantity">
										<span class="add"></span>
									</div>
								</div>
							</div>
							<div class="hwm_drawn">
							<?php if($product['special']) { ?>
			                  	 <p> <?php echo $product['special']; ?></p>
			                     
			                  <?php }else{ ?>
			                     <p><?php echo $product['price']; ?></p>
			                  <?php } ?>

								<button id="confirmproduct" data="<?php echo $product['product_id']; ?>">CONFIRM</button>
							</div>
						</li>
					<?php  }?>
					
						
					
					</ul>
				</div>
			</div>
<?php  }?>
	<script>
	$(function(){
		//替换图片
	    var win = $(window).width();
		if(win<=992){
			// yd
		}else{
			// pc 关闭子分类弹窗
			$(".close").click(function(){
		  	$(this).parents('.hwm_pc').fadeOut();
		  	})
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

		$('#confirmproduct').on('click', function() {
			
			console.log($(this).attr('data'));
		});

  //                   alert('你选了第' + $('.selecttext option:selected') .val()+ '个选项');
  //               })
		// $('.radiotext').change(function(){
  //                   alert('你选了第' + $('.radiotext option:selected') .val() + '个选项');
  //               })
              
	})
	</script>	