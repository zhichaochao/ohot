			


			<!-- 移动端发帘 发块产品列表部分 -->
			<?php  if($products){?>
			<div class="ydh_hide">
				<div class="yd_close">
					<div class="yd_close_a"><img src="catalog/view/theme/default/img/png/yd_img3.png"></div>
					<div class="yd_close_b"><img src="catalog/view/theme/default/img/png/yd_img2.png"></div>
				</div>
				<div class="yd_bur">
					<ul>
					<?php foreach ($products as $product) { ?>
						<li>
							<a href="javascript:;">
								<span><img src="<?php echo $product['thumb']; ?>"></span>
								<div class="yd_bur_list">
									<p><?php echo $product['name']; ?></p>
									<?php if($product['special']) { ?>
				                  	  <span> <?php echo $product['special']; ?></span>
				                  	 <?php }else{ ?>
				                      <span><?php echo $product['price']; ?></span>
				                    <?php } ?>
									<button class="ydh_on" data="<?php echo $product['product_id']; ?>"   value="<?php echo $value_status; ?>">TO BUY</button>
								</div>
							</a>
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

			$(".ydh_on").click(function(){

				var product_id=$(this).attr('data');
			  	var value_status=$(this).attr('value');	
			  // console.log(inside_id);
			  	$.ajax({
		            url: 'index.php?route=information/selecatalogproduct/getydcatalogproduct&product_id='+product_id+'&value_status='+value_status,
        			dataType: 'html',	
        			success: function(html) {
		            		$('#ydhwm-duon-product').html(html);
		            		$(".ydh_sxu").fadeIn();
		            },
		            error: function(xhr, ajaxOptions, thrownError) {
		                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		            }
        		});
			})
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
		
	})
	</script>	