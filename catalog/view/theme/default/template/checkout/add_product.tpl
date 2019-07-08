					
	<?php if($products)  {foreach ($products as $key => $product) { ?>
					<li>
							<div class="close" onclick="del_add_product(<?=$product['cart_id'];?>);" data="<?=$product['product_id'];?>"></div>
							<a href="<?=$product['href'];?>">
								<img alt="<?=$product['name'];?>" src="<?=$product['image'];?>"  >
							</a>
							<div class="hg_tetx">

								<div>
	<?php if(isset($product['option_name']['name'])){ ?><span class="sp1"><?=$product['option_name']['name'];?></span><?php }?>
									<?php if($product['stock']){ ?><span class="ofs">OutofStock</span><?php }?>
								</div>
								<span class="sp2"><?=$product['price']['addprice_format'];?></span>
								<span class="sp3"><?=$product['price']['originalprice_format'];?></span>
								<span class="sp4">x<?=$product['quantity'];?></span>
							</div>
							<hr>
						</li>
		<?php } }?>
		<!-- 删除某个加购购物车上的产品 -->

		<script type="text/javascript">

			function del_add_product(cart_id) {
				$.ajax({
		        url: 'index.php?route=checkout/cart/del_add_product',
		           type: 'post',
		           data:{cart_id:cart_id},
		 
		        dataType: 'json',
		 
		      
		        success: function(json) {
		        
		        	
		        	getAddproduct() ;
		        	
		        }
		    })
				
			
			}
		</script>

