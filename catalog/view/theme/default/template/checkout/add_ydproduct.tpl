					
	<?php if($products)  {foreach ($products as $key => $product) { ?>
							<li class="clearfix">
								<div class="close_yg" onclick="del_add_ydproduct(<?=$product['cart_id'];?>);" data="<?=$product['product_id'];?>"></div>
								<a href="<?=$product['href'];?>">
									<img alt="<?=$product['name'];?>" src="<?=$product['image'];?>" >
								</a>
								<div class="hg_tetx">
									<div>
	<?php $name=explode("-",$product['name']); ?>
	<p><?=isset($name[0])?substr($name[0],-16):'';?></p>
										<?php if(isset($product['option_name']['name'])){ ?><span class="sp1"><?=$product['option_name']['name'];?></span><?php }?>
									<?php if($product['stock']){ ?><span class="ofs">OutofStock</span><?php }?>
									</div>
									<span class="sp2"><?=$product['price']['addprice_format'];?></span>
									<span class="sp3"><?=$product['price']['originalprice_format'];?></span>
									<span class="sp4">x<?=$product['quantity'];?></span>
								</div>
							</li>
		<?php } }?>
		<!-- 删除某个加购购物车上的产品 -->

		<script type="text/javascript">
				<?php if($outofstock){ ?>
				alert('Value+ Products Out Of Stock');
				<?php }?>
			function del_add_ydproduct(cart_id) {
				$.ajax({
		        url: 'index.php?route=checkout/cart/del_add_product',
		           type: 'post',
		           data:{cart_id:cart_id},
		 
		        dataType: 'json',
		 
		      
		        success: function(json) {
		        
		        	
		        	getAddydproduct() ;
		        	
		        }
		    })
				
			
			}
		</script>

