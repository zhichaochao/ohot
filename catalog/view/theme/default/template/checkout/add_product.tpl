					
	<?php if($products)  {foreach ($products as $key => $product) { ?>
					<li>
							<div class="close" data="<?=$product['product_id'];?>"></div>
							<a href="<?=$product['href'];?>">
								<img alt="<?=$product['name'];?>" src="<?=$product['image'];?>"  >
							</a>
							<div class="hg_tetx">
								<div>
									<span class="sp1"><?=$product['option_name']['name'];?></span>
								</div>
								<span class="sp2"><?=$product['price']['addprice_format'];?></span>
								<span class="sp3"><?=$product['price']['originalprice_format'];?></span>
								<span class="sp4">x<?=$product['quantity'];?></span>
							</div>
							<hr>
						</li>
		<?php } }?>