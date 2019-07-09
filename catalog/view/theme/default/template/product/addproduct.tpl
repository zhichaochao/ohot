

	<?php echo $header; ?>

<div class="new_nav pc_hide clearfix">
                <a class="fh" href="<?php echo $home?>"></a>
                <p>PRODUCT DETAILS</p>
            </div>


<div class="content product_det in_content new_in_content">

			<div class="pro_det_content clearfix">
				<div class="top clearfix">
					<div class="left clearfix">

					<div class="pro_lb_off clearfix">
							<div class="lb_text">
								<div class="swiper-container" id="swiper2">
								    <div class="swiper-wrapper">
									   <?php foreach ($images as $k => $image) {?>
										<div class="swiper-slide" <?php if($k==0 && !$video){ ?>class="on"<?php } ?>>
											<img onclick="productInfoImg(this)" data-img="<?php echo $image['thumb2']; ?>" style="cursor: pointer !important;" src="<?php echo $image['thumb']; ?>"  title='<?php echo $heading_title; ?>'>
										</div>
										<?php } ?>
							  		</div>
								</div>
							</div>
					    	<div class="swiper-button-prevs"></div>
							<div class="swiper-button-nexts"></div>
						</div>

						<!-- <ol class="pro_img_ol">
						<?php if ($images) { ?>
							<li class="li">
							<div class="more-views">
								<div class="prdimgup"> </div>
								<div class="highslide-gallery" id="prdimglist" page="0">
									<ul class="pra-list-ul">
									
										<?php foreach ($images as $k => $image) {?>
										<li <?php if($k==0 && !$video){ ?>class="on"<?php } ?>>
										<a class="highslide">
											<img onclick="productInfoImg(this)" data-img="<?php echo $image['thumb2']; ?>" style="cursor: pointer !important;" src="<?php echo $image['thumb']; ?>"  title='<?php echo $heading_title; ?>'>
										</a>
										</li>
										<?php } ?>
									</ul>
								</div>
								<div class="prdimgdown"></div>
								<div style="clear:both;"></div>
							</div>
							</li>
							<?php } ?>
						</ol> -->

						<div class="pro_big_img" style="overflow: hidden;position:relative; ">
							<div class="swiper-container" id="swiper3">
							    <div class="swiper-wrapper">
							    	<?php if ($video) { ?>
							      		<div class="swiper-slide ban_img">						      		
										<!-- 产品后台上传视频 -->
											<video class="pull-left" src='<?=$video?>' id="audio" style="width:100%;height:100%;" autoplay></video>
											<img id="Rerun" src="/image/catalog/review.png" style="display:none;width:80px;height:80px;position:relative;z-index:10;top:-288px;" onclick="playVid()"/>
											<img id="jwx_productInfoImg" src="<?php echo $image['thumb']; ?>" title='Fuller Peruvian Virgin Hair Kinky Straight 12inch to 26inch' alt='Fuller Peruvian Virgin Hair Kinky Straight 12inch to 26inch' style="display:none;" />
									 	</div>
										<!-- 产品后台上传视频 -->
										 <?php foreach ($images as $k => $image) {  if($k > 0) {?>
							    		<div class="swiper-slide ban_img">
													<img class="lazyLoad" src="" srcs="<?php echo $image['image']; ?>" title='<?php echo $heading_title; ?>'  />
										</div>
								    	<?php } } ?>
											<?php } elseif ($thumb) { ?>
									   	<?php foreach ($images as $k => $image) { ?>
								    		<div class="swiper-slide ban_img">
													<img class="lazyLoad" src="" srcs="<?php echo $image['image']; ?>" title='<?php echo $heading_title; ?>'  />
											</div>
								    	<?php } ?>
							    	<?php } ?>

							    </div>	
							    <div class="swiper-pagination"></div>
							    <div class="swiper-button-prev"></div>
								<div class="swiper-button-next"></div>
							</div>
							
						</div>
						
					</div>
				<div class="right" id="product">
					<input type="hidden" name="product_id" value="<?=$product_id?>">
						<div class="top_text">
							<a><?php echo $heading_title;?></a>
							
									<?php if ($price) { ?>
									<p class="price"  id="money" >

										<?php if(isset($special)){ ?>
										<span><?php echo $special; ?></span><i><?php echo $price; ?></i>
										<?php }else{ ?>
										<span><?=$price?> </span>
										<?php } ?>

									</p>
						
								<?php } ?>
								<div class="yd_hide clearfix">

								<label class="num_label clearfix"  >
									<span>Quantity:</span>
									<div class="price_input clearfix">
											<span class="sub" ></span>
										<input class="num" name="quantity" type="text" value="1" id="numss"  />
										<span class="add"></span>
									</div>
								</label>
								<span class="measurement">
									About Measurement
								</span>
							<div class="label_div clearfix" id="form-product">
								<?php if ($options) { ?>
								<?php foreach ($options as $option) { ?>	
								<?php if ($option['product_option_value']) { ?>
								<?php if ($option['type'] == 'radio') { ?> 
								<dl class="pro_det_dl clearfix">
					                <dt><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</dt>
					                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" />

					                <?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
					                 <dd><p class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></p></dd>
					                 <?php } ?>

					              </dl>
								<?php }elseif ($option['type'] == 'select') { ?>
								<label class="len_label" for="">
									<span><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</span>
									<div class="select_div" id="input-option<?php echo $option['product_option_id']; ?>">
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" />
										<button class="select_btn"><span></span></button>
										<div class="select_ul">
											<ul>
												<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
												<li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"   ><?php echo $option_value['name']; ?></li>
											<?php } ?>
											</ul>
										</div>
									</div>
									<ul style="display: none;" class="clearfix select_ulk">
											<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
												<li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"   ><?php echo $option_value['name']; ?></li>
											<?php } ?>
									</ul>
									
								</label>
								<?php }} ?><?php }} ?>
							
								
								<div class="meas_img">
									<img class=" changeimage" data-image='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/size_guid.jpg' data-mimage='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_size_guid.jpg'  />
									<div class="close"></div>
								</div>
								<button class="xyd_btn  <?=$wishlist==1 ?'off':'';?>" onclick="wishlist('<?php echo $product_id; ?>',this);"><span>WISHLIST</span></button>
							</div>

								<?php if (!isset($logins)) { ?>

								<a class="a_btn clearfix" href="<?php echo $login; ?>">PLEASE LOGIN FIRST&nbsp;&nbsp;&nbsp;&nbsp;></a>
								<!-- 和线上不一样 本地26线上27 -->
								<?php }else if($category_id==ADD_CART_CATEGPRY_ID){ ?> 
								<a class="a_btn clearfix">NOT FOR SALE</a>
									<?php }else{ ?>
								<a class="a_btn clearfix" id="button-cart" >ADD TO SHOPPING CART&nbsp;&nbsp;&nbsp;&nbsp;></a>
								<?php }?>

								<!--  -->
								

								<?php if($resultcoupon){?>	
								<button class="conpon_btn" type="button">GET COUPON CODE</button>
								<ul class="get_ul clearfix">

									<?php foreach ($resultcoupon as $coupons) { ?>
									<li  >
										<?php if($coupons['type']=='P') { ?>  
										<p class="p1">Spend US <?=$coupons['total'];?> to get US <?=$coupons['discountp'];?>%OFF. </p>
		                                <!-- <span class="pon_sp">US<em><?=$coupons['discountp'];?>%OFF</em></span>    -->
		                               	<?php }else{ ?> 
		                                <p class="p1">Spend US <?=$coupons['total'];?> to get US <?=$coupons['discount'];?> off. </p>
		                               	<?php } ?>
										<p class="p2">(excluding shipping costs)</p>
										<p class="p3">Expires <?=$coupons['date_end'];?></p>
										<button class="get_btn" onclick="coupon('<?=$coupons['coupon_id']?>')">Get It Now</button>
									</li>
									<?php }?>
								</ul>
									<?php }?>



							<!-- <?php if (!isset($logins)) { ?>
							<a class="a_btn clearfix" href="<?php echo $login; ?>">PLEASE LOGIN FIRST&nbsp;&nbsp;&nbsp;&nbsp;></a>
							<?php }else{ ?>
							<a class="a_btn clearfix" id="button-cart" >ADD TO SHOPPING CART&nbsp;&nbsp;&nbsp;&nbsp;></a>
							<?php }?> -->
							<!-- <button class="xyd_btn <?=$wishlist==1 ?'off':'';?>"
							 
			              onclick="wishlist('<?php echo $product_id; ?>',this);"><span>WISHLIST</span></button> -->
						</div>

						<div class="yd_show clearfix">
								<div class="cart_attr cart_modal clearfix">
									<ol class="clearfix">

									<?php if ($options) { ?>
								<?php foreach ($options as $option) { ?>	
								<?php if ($option['product_option_value']) { ?>
								<?php if ($option['type'] == 'radio') { ?> 
								<li class="clearfix">
					                <span class="bt_span"><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</span>
					               <!--  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" /> -->
									<ul class="attr_ul clearfix">
					                <?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
								
					                 <em class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></em>

					                 <?php } ?>
					                 </ul>
					              </li>
								<?php }elseif ($option['type'] == 'select') { ?>
								<li class="clearfix" for="">
									<span  class="bt_span"><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</span>
									<ul class="attr_ul clearfix" id="input-option<?php echo $option['product_option_id']; ?>">
									<!-- <div class="select_div" id="input-option<?php echo $option['product_option_id']; ?>"> -->
										<!-- <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" /> -->
										<!-- <button class="select_btn"><span></span></button> -->
										<!-- <div class="select_ul"> -->
											<!-- <ul> -->
												<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
												<em class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"   ><?php echo $option_value['name']; ?></em>
											<?php } ?>
										</ul>
									<!-- </div> -->
									<ul style="display: none;" class="clearfix select_ulk">
											<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
												<em class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"   ><?php echo $option_value['name']; ?></em>
											<?php } ?>
									</ul>
									
								</li>
								<?php }} ?><?php }} ?>

										<!-- <li class="clearfix">
											<span>Color:</span>
											<em>Black</em>
										</li>
										<li class="clearfix">
											<span>Black:</span>
											<em>10 Inch 100g</em>
										</li>
 -->
									</ol>
									<div class="price_input clearfix">
										<p>Quantity:</p>
										<div class="text clearfix">
											<span class="subs"></span>
											<input class="num" type="text" value="1" >
											<span class="adds"></span>
										</div>
									</div>
									<span class="length">Select Style&nbsp;&nbsp;></span>
									<?php if($resultcoupon){?>
									<button class="conpon_btn" type="button">GET COUPON CODE</button>
									<ul class="get_ul clearfix">

									<?php foreach ($resultcoupon as $coupons) { ?>
									<li>
										<?php if($coupons['type']=='P') { ?>  
										<p class="p1">Spend US <?=$coupons['total'];?> to get US <?=$coupons['discountp'];?>%OFF. </p>
		                                <!-- <span class="pon_sp">US<em><?=$coupons['discountp'];?>%OFF</em></span>    -->
		                               	<?php }else{ ?> 
		                                <p class="p1">Spend US <?=$coupons['total'];?> to get US <?=$coupons['discount'];?> off. </p>
		                               	<?php } ?>
										<p class="p2">(excluding shipping costs)</p>
										<p class="p3">Expires <?=$coupons['date_end'];?></p>
										<button class="get_btn"  onclick="yd_coupon('<?=$coupons['coupon_id']?>')">Get It Now</button>
									</li>
									<?php }?>
									</ul>
									<?php }?>
									<!--  -->
								</div>
							</div>



						</div>
						<div class="bot_text clear">
							<p class="text_p text_p2"><span>Hair Material:</span> <?=$material;?></p>
							<dl>
								<?=$m_description;?>
							</dl>
							<div class="share clearfix">
								<span>Share: </span>
								<ul class="share_ul">
									<li><a id="share_button_facebook" ></a></li>
									<li><a id="share_button_twitter"></a></li>
									<li><a id="share_button_linked"></a></li>
									<li><a id="share_button_google"></a></li>
									<li><a id="share_button_pinterest"></a></li>
								</ul>
							</div>
						</div>
					</div>


			
				</div>

			
				<div class="bot clearfix">
					<ol class="text_ol clearfix">
						<li class="active">PRODUCTS DETAILS <hr /></li>
						<li >DELIVERY AND PACKAGE <hr /></li>
						<li>FAQ <hr /></li>
					</ol>
					<ul class="text_ul">
						<li class="active">
							<h1 class="xxk_h1">PRODUCTS DETAILS</h1>
							<div class="xxk_text">
								<?=$description;?>
							</div>
						</li>
						<li >
							<h1 class="xxk_h1">Delivery And Package</h1>
							<div class="xxk_text">
								<div class="ul_top clearfix">
									<div class="left">
										<img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/map.jpg"/>
									</div>
									<div class="right clearfix">
										<ul class="ul_text clearfix">
											<li>
												<span>United States:</span>
												<i>2-3</i>working days
											</li>
											<li>
												<span>African:</span>
												<i>3-5</i>working days
											</li>
											<li>
												<span>Canada:</span>
												<i>2-3</i>working days
											</li>
											<li>
												<span>Australia:</span>
												<i>3-5</i>working days
											</li>
											<li>
												<span>South America:</span>
												<i>4-5</i>working days
											</li>
											<li>
												<span>Middle East:</span>
												<i>4-5</i>working days
											</li>
											<li>
												<span>Europe:</span>
												<i>3-4</i>working days
											</li>
											<li>
												<span>Asia:</span>
												<i>2-3</i>working days
											</li>
										</ul>
									</div>
								</div>
								<div class="ul_bot clearfix">
									<div class="left clearfix">
										<span>Our express</span>
										<ol class="clearfix">
											<li>
												<img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pro_det2.jpg"/>
												<p>FedEx</p>
											</li>
											<li>
												<img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pro_det3.jpg"/>
												<p>DHL</p>
											</li>
										</ol>
									</div>
									<div class="right">
										<span>Package</span>
										<ol class="clearfix">
											<li>
											<img class="changeimage" data-image='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/proo.jpg' data-mimage='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_pro.jpg'  />
												<!-- <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pro.jpg" style="height:263px;width: 298px;" /> -->
												<p>Product Packaging</p>
											</li>
											<li>
											<img class="changeimage" data-image='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pro_dett.jpg' data-mimage='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/ydpro_det.jpg'  />
												<!-- <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pro_det.jpg" style="height:263px;width: 298px;"/> -->
												<p>The Outer Packing</p>
											</li>
										</ol>
									</div>
								</div>
							</div>
						</li>
						<li>
							<h1 class="xxk_h1">FAQ</h1>
							<div class="xxk_text">
								<div class="faq_dl">
									<?=$faq;?>
								</div>
							</div>
						</li>
					</ul>
				</div>
				
				<div class="pro_det_bot swiper-container pro_big_img  clearfix" id="swiper1" style="margin-bottom: 1.6rem;">
					<h1 class="clearfix">
						<hr />
						<span>RECOMMENDED FOR YOU</span>
					</h1>

					<ul class="bot_det_ul swiper-wrapper">
					 <?php foreach ($recommend_products as $product) { ?>
							
						<li class="swiper-slide ">
							<a href="<?php echo $product['product_link']; ?>"> 
								<div class="pic_img" >
									<img src="<?php echo $product['image']; ?>"  />
								</div>
								<div class="text">
								<p class="p2"><?php echo $product['name']; ?> </p>
								<span class="price">
					                  <?php if($product['special']) { ?>
					                     <em><?php echo $product['special']; ?></em>
					                     <del style="color:#999;"><?php echo $product['price']; ?></del>
					                  <?php }else{ ?>
					                     <span class="price-single"><?php echo $product['price']; ?></span>
					                  <?php } ?>
					                </span>
									<!-- <span>$37.01</span> -->
									 <!-- <p class="p1"><?php echo $product['meta_title']; ?></p> -->
									
								</div>
							</a>
						</li>
						<?php } ?> 
					</ul>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				
				<div class="cart_fixed clearfix">
					<div class="left clearfix">
						<a class="cart_a" href="<?=$shopping_cart;?>"><span class='cart_count'><?=$text_cart_items;?></span></a>
						<button class="sc_btn <?=$wishlist==1 ?'off':'';?>" onclick="wishlist('<?php echo $product_id; ?>',this);"></button>
					</div>
					<button class="cart_btn cart_modal" >NOT FOR SALE</button>
				</div>
					<!--购物车弹窗-->
				<div class="cart_tc clearfix " id="products">

					<input type="hidden" name="product_id" value="<?=$product_id?>">
					<div class="text clearfix">
						<div class="close_tc"></div>
						<div class="img clearfix">
							<img src="<?php echo $thumb?>" alt="" />
							<!-- <span  id="money">$31.50</span> -->
							<?php if ($price) { ?>
									<span   class="money" >

										<?php if(isset($special)){ ?>
										<span><?php echo $special; ?></span><i><?php echo $price; ?></i>
										<?php }else{ ?>
										<span><?=$price?> </span>
										<?php } ?>

									</span>
						
								<?php } ?>
						</div>
						<ol class="attr_ol clearfix form-product" >
						<!-- <div class=""> -->
						<?php if ($options) { ?>
								<?php foreach ($options as $option) { ?>	
								<?php if ($option['product_option_value']) { ?>
								<?php if ($option['type'] == 'select') { ?> 
								<li class="clearfix size" for="">
									<span  class="bt_span"><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</span>
									<ul class="attr_ul clearfix" id="input-option<?php echo $option['product_option_id']; ?>">
									<!-- <div class="select_div" id="input-option<?php echo $option['product_option_id']; ?>"> -->
										<input class="li_2" type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" />
										<!-- <button class="select_btn"><span></span></button> -->
										<!-- <div class="select_ul"> -->
											<!-- <ul> -->
												<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
												<li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?> <?php echo $option_value['quantity']==0 ?'hui':''?>" value="<?php echo $option_value['product_option_value_id']; ?>"   ><?php echo $option_value['name']; ?></li>
											<?php } ?>
											<!-- </ul> -->
										<!-- </div> -->
										</ul>
									<!-- </div> -->
									<ul style="display: none;" class="clearfix select_ulk">
											<?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
												<li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?> " value="<?php echo $option_value['product_option_value_id']; ?>"   ><?php echo $option_value['name']; ?></li>
											<?php } ?>
									</ul>
									<span class="measurement">Length Guide&nbsp;&nbsp;></span>
								</li>


								
								<?php }elseif ($option['type'] == 'radio') { ?>
								<li class="clearfix">
					                <span class="bt_span"><?php if($option['required']) { ?>*<?php } ?><?=$option['name']?>:</span>
					                
									<ul class="attr_ul clearfix">
									<input class="li_1" type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php if(isset($shareoption[$option['product_option_id']])){ echo $shareoption[$option['product_option_id']];}else{ echo $option['product_option_value'][0]['product_option_value_id'];} ?>" />
					                <?php foreach ($option['product_option_value'] as $k=> $option_value) { ?>
					                 <li class="<?php if(isset($shareoption[$option['product_option_id']])){ if($shareoption[$option['product_option_id']]==$option_value['product_option_value_id']) echo 'active';} else if($k==0) echo 'active'; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></li>
					                 <?php } ?>
					                 </ul>


					              </li>
					



								
								<?php }} ?><?php }} ?>
								<!-- </div> -->

							<li class="clearfix">
								<span class="bt_span">Quantity:</span>
								<div class="price_input clearfix">
											<span class="sub" ></span>
										<input class="num" name="quantity" type="text" value="1" id="nums"  />
										<span class="add"></span>
									</div>
								<!-- <div class="price_input clearfix">
									<span class="sub"></span>
									<input class="num" type="text" value="1" readonly="readonly">
									<span class="add"></span>
								</div> -->
							</li>
						</ol>
					</div>
					<div class="meas_img">
						<img class=" changeimage" data-image='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/size_guid.jpg' data-mimage='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_size_guid.jpg'  />
						<div class="close"></div>
					</div>	
				</div>
				
			</div>
		
		</div>
				<!--优惠卷弹窗-->
		<div class="modal coupon_modal clearfix">
			<div class="text">
				<div class="close"></div>
				<h1>CONGRATULATIONS!</h1>
				<p>You’ve won</p>
				<span class="red_btn clearfix ydred_btn"></span>
				<button type="button" class="tj_btn clearfix">OK</button>
			</div>
		</div>	
<!-- 新 -->
<script>

 function wishlist(product_id,e) {
  if ($(e).hasClass('off')) {
       $.ajax({
    url:'<?php echo $delewishlist ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
      if (data.success) {
        tips('Cancel the collection','');
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })

  }else{
  //alert(product_id);die;
   $.ajax({
    url:'<?php echo $wishlist_add ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
      if (data.success) {
        tips('Collection success','');
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })
 }
}
var swiper3 = new Swiper('#swiper3', {
	loop:true,
	navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	},
	pagination: {
		el: '.swiper-pagination',
		clickable: true,
    },
    on: {
	    slideChangeTransitionStart: function(){
	      $(".pl_img_ol>li").eq(this.activeIndex).addClass("active").siblings("li").removeClass("active");
	      $(".lb_text .swiper-slide").eq(this.activeIndex).addClass("active").siblings(".swiper-slide").removeClass("active");
	    },
	 },
});

var swiper2 = new Swiper('#swiper2', {
	freeMode:false,
	slidesPerView:5,
	direction: 'vertical',
	navigation: {
	    nextEl: '.swiper-button-nexts',
	    prevEl: '.swiper-button-prevs',
	},
});
// var swiper3 = new Swiper('#swiper3', {
// 	loop:true,
// 	navigation: {
// 	    nextEl: '.swiper-button-next',
// 	    prevEl: '.swiper-button-prev',
// 	},
// 	pagination: {
// 		el: '.swiper-pagination',
// 		clickable: true,
//     },
// });
$(function(){
	    $(".pro_det_dl>dd>p").click(function(){
      $(".pro_det_dl>dd>p").removeClass("active");
      $(this).addClass("active");
      	var value= $(this).attr('value');
   //    	alert(value);
			console.log(value);
			$(this).parents('dl').find('input').val(value);
    })
		$(".pro_det_content .measurement").click(function(){
			$(".meas_img").fadeIn();
		})
		
		$(".meas_img .close").click(function(){
			$(".meas_img").fadeOut();
		})
		



		$(".pro_lb_off .swiper-slide").click(function(){
			
			$(this).addClass("active").siblings(".swiper-slide").removeClass("active");
			var this_index = $(this).index();
			$(this).addClass("active").siblings("li").removeClass("active");
			$(".swiper-pagination-clickable span").eq(this_index).trigger('click');
		})
		
		
		

		// $(".pra-list-ul>li").click(function(){
			
		// 	var this_index = $(this).index();
		
		// 	$(".swiper-pagination-clickable span").eq(this_index).trigger('click');
		// })
		
		
		$(".pro_det_content .len_label>ul>li").click(function(){

			$(this).addClass("active").siblings("li").removeClass("active");
		})
		
		
//		数量
		$(".sub").click(function(){
			var num  = $(".num").val();
			if(num>1){
				num--;
				 $(".num").val(num);
			}
		})
		$(".add").click(function(){
			var num  = $(".num").val();
			num++;
			 $(".num").val(num);
		})
		
		//xxk
		$(".pro_det_content .bot .text_ol>li").click(function(){
			$(this).addClass("active").siblings("li").removeClass("active");
			$(".pro_det_content .bot .text_ul>li").eq($(this).index()).addClass("active").siblings("li").removeClass("active");
		})
		$(".xxk_h1").click(function(){
			if($(this).hasClass("off")){
				$(this).removeClass("off");
				// $(this).css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/jiahao.png) no-repeat right center").css("background-size","0.38rem 0.38rem");
				$(this).siblings(".xxk_text").slideUp();
			}else{
				$(".xxk_h1").removeClass("off");
				// $(".xxk_h1").css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/jiahao.png) no-repeat right center").css("background-size","0.38rem 0.38rem");
				$('.xxk_text').slideUp();
				$(this).addClass("off");
				// $(this).css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/jianhao.png) no-repeat right center").css("background-size","0.38rem 0.38rem");
				$(this).siblings(".xxk_text").slideDown();
			}
		})
		
		//下拉选择
	
		$(".select_btn").each(function(){
			var tmp=$(this).parent().find('li.active').text();
			// console.log(tmp);
			$(this).find('span').text(tmp);
		})
		changeprice();
		$(".select_btn").click(function(){
			if($(this).hasClass("off")){
				$(this).removeClass("off");
				$(this).siblings(".select_ul").stop().slideUp();
		
			}else{
				$(this).addClass("off");
				$(this).siblings(".select_ul").stop().slideDown();
			
			}
		
		})
		$(".select_ul li,.select_ulk li").click(function(){
			var val = $(this).text();
			var value = $(this).attr('value');
			$(this).parents(".len_label").find(".select_btn span").text(val);
			$(this).parents(".len_label").find('input').val(value);
			changeprice();
			$(".select_btn").removeClass("off");
			$(".select_ul").stop().slideUp();
		})
	
		var win = $(window).width();
		$(".xyd_btn").click(function(){
			if(win>992){
				if($(this).hasClass("off")){
					$(this).removeClass("off");
					// $(this).css("border","1px solid #ccc").css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star.png) no-repeat right 0.83vw center").css("background-size","0.83vw");
				}else{
					$(this).addClass("off");
					// $(this).css("border","1px solid #d5af74").css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star_.png) no-repeat right 0.83vw center").css("background-size","0.83vw");
				}
			}else{
				if($(this).hasClass("off")){
					$(this).removeClass("off");
					// $(this).css("border","1px solid #ccc").css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star.png) no-repeat center").css("background-size","0.38rem 0.36rem");
				}else{
					$(this).addClass("off");
					// $(this).css("border","1px solid #d5af74").css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star_.png) no-repeat  center").css("background-size","0.38rem 0.36rem");
				}
			}
		})

var li_w=4;
var win_w = $(window).innerWidth();
if(win_w>=1080){
	li_w=4;
}else{
	li_w=2
}
var mySwiper = new Swiper('#swiper1', {
	loop:true,
	autoplay: true,
	slidesPerView : li_w,
	loopFillGroupWithBlank: true,
	slidesPerGroup: li_w,
	navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
})

	})
function productInfoImg(elm) {
        var ind = $(elm).parents("li").index();
        if(ind == 0){
            if($(".product_image video").length === 0 ){
                $("#jwx_productInfoImg").show();
                $(".pra-list-ul li").removeClass("on");
                $(elm).parents("li").addClass("on");
                $(".product_image").attr("href", jQuery(elm).attr("data-img"));
                $(".product_image").attr("target", "_blank");
            }
            else{
                $(".product_image video").show();
                $("#jwx_productInfoImg").hide();
                $(".pra-list-ul li").removeClass("on");
                $(elm).parents("li").addClass("on");
                $(".product_image").removeAttr("href");
                $(".product_image").attr("target", "_self");
            }
        }
        else{
            $(".product_image video").hide();
            $("#jwx_productInfoImg").show();
            jQuery("#jwx_productInfoImg").attr({
                src: jQuery(elm).attr("data-img"),
                jqimg: jQuery(elm).attr("jqimg")
            });
            $(".pra-list-ul li").removeClass("on");
            $(elm).parents("li").addClass("on");
            $(".product_image").attr("href", jQuery(elm).attr("data-img"));
            $(".product_image").attr("target", "_blank");
        }
    }
    function playVid() {
        Rerun.style.display="none";
        myVideo.play();
    }

</script>
<!-- 加入购物车 -->
<script type="text/javascript">
   var win =$(window).width();
   if(win>920){
var product_id = "<?php echo $product_id; ?>";
    $('#button-cart').on('click', function() {
 if($('#button-cart').html()!='SOLD OUT'){
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
             dataType: 'json',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
           
     
            success: function(json) {
            	if (json.success) {
      				var win =$(window).width();
      				if(win<920){tips("Successful Shopping Cart",'');}
        			$('#cart_count').html(json.total);
        			$('.cart_count').html(json.total);
        			  $(".cart_li").click();

                


     			 }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
         }
    });
   }
    
    var win =$(window).width();
    // $(".cart_tc").removeClass("active");
    if(win<920){
    	var product_id = "<?php echo $product_id; ?>";
    $('#buttonon-cart').on('click', function() {
    	if($(".cart_tc").hasClass("active")){
    		$.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
             dataType: 'json',
            data: $('#products input[type=\'text\'], #products input[type=\'hidden\'], #products input[type=\'radio\']:checked, #products input[type=\'checkbox\']:checked, #products select, #products textarea'),
           
     
            success: function(json) {
            	if (json.success) {
      				var win =$(window).width();
      				if(win<920){tips("Successful Shopping Cart",'');}
        			$('#cart_count').html(json.total);
        			$('.cart_count').html(json.total);
        			  $(".cart_li").click();

                


     			 }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    	}
        
    });
    }
        
    //-->
   var win =$(window).width();
    if(win>920){
		function changeprice() {
		        //console.log('first');
		//         alert($("#form-product").serialize());
		        $.ajax({
		            url: 'index.php?route=product/product/getprice&product_id=<?php echo $product_id; ?>',
		            type: 'post',
		            dataType: 'json',
		            data: $("#form-product input"),

		            success: function(json) {
		                $('#money').html(json['html']);
		                var num=parseInt($('#numss').val());
		                var quantity=parseInt(json['quantity']);
		                // console.log($('#numss').val());
		                // console.log(json['quantity']);
		                if (num<quantity) {
		                    $('#button-cart').html('ADD TO SHOPPING CART&nbsp;&nbsp;&nbsp;&nbsp;>');
		                }else{
		                   $('#button-cart').html('SOLD OUT');
		                }
		            }
		        });
		    }
    }
    

    var win =$(window).width();
    if(win<920){
    	function changeprices() {
        // console.log($);
//         alert($("#form-product").serialize());

        $.ajax({
            url: 'index.php?route=product/product/getprice&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $(".form-product input"),

            success: function(json) {
               // console.log(json);
                $('.money').html(json['html']);
            }
        });
    }
    }
    

 function coupon(coupon_id) {
            // alert(coupon_id);
               $.ajax({
            url:'<?php echo $addcoupon ;?>',
            type:'post',
            data:{'coupon_id':coupon_id},
            dataType: 'json',
            success:function(data){
            	if (data.error) {
                     window.location.href="<?php echo $login?>";
              }else{
                   $('.red_btn').html('US'+data.price);     
                
              }
            }
           })
          }   
function yd_coupon(coupon_id) {
            // alert(coupon_id);
               $.ajax({
            url:'<?php echo $addcoupon ;?>',
            type:'post',
            data:{'coupon_id':coupon_id},
            dataType: 'json',
            success:function(data){
            	if (data.error) {
                     window.location.href="<?php echo $login?>";
              }else{
                   $('.ydred_btn').html('US'+data.price);     
                
              }
            }
           })
          }           
</script>

<script type="text/javascript">
	if($(window).width()<=920){
		$(".big_nav").hide();
	}	
	    function popupwindow(url, title, w, h) {
            wLeft = window.screenLeft ? window.screenLeft : window.screenX;
            wTop = window.screenTop ? window.screenTop : window.screenY;
 
            var left = wLeft + (window.innerWidth / 2) - (w / 2);
            var top = wTop + (window.innerHeight / 2) - (h / 2);
            return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        }
   $(function(){
       	  $('#share_button_facebook').click(function(){
                var shareUrl = "http://www.facebook.com/sharer/sharer.php?u="+window.location.href;
                popupwindow(shareUrl, 'Facebook', 600, 400);
            })
             $('#share_button_twitter').click(function(){
                var shareUrl = "http://twitter.com/share?url="+window.location.href;
                popupwindow(shareUrl, 'Twitter', 600, 400);
            })
            $('#share_button_linked').click(function(){
                var shareUrl = "http://www.linkedin.com/shareArticle?url="+window.location.href;
                popupwindow(shareUrl, 'LinkedIN', 600, 400);
            })
             $('#share_button_google').click( function(){
                var shareUrl = "https://plus.google.com/share?url="+window.location.href;
                popupwindow(shareUrl, 'Google', 600, 400);
            })
            $('#share_button_pinterest').click( function(){
                var shareUrl = "https://www.pinterest.com/pin/create/button/?url="+window.location.href;
                popupwindow(shareUrl, 'Pinterest', 600, 400);
            })
       })
   		/**收藏**/
		$(".sc_btn").click(function(){
			if($(this).hasClass("off")){
				$(this).removeClass("off");
				// tips('Moved out from collection','');
			}else{
				$(this).addClass("off");
				// tips('Save to collection','');
			}
		})
		
		/***属性选择***/
		$(".attr_ul>li").click(function(){
			if(!$(this).hasClass("hui")){
				$(this).addClass("active").siblings().removeClass("active");
			}
			let li_val = $(this).attr("value");
			$(this).siblings('input').val(li_val);
			// $(".attr_ul input.li_2").val(li_val);
			// console.log(li_val)
			// $(this).parents(".attr_ul").find('li').val(value);
			// $(this).parents(".attr_ol").find(".attr_ul li").text(val);
			changeprices();
		})
		/**打开属性弹窗**/
		$(".cart_modal").click(function(){
			$(".cart_tc").animate({top:"0%"});
			$(".cart_tc").addClass("active");
			$("body").css("overflow","hidden");
		})
		/**关闭属性弹窗**/
		$(".close_tc").click(function(){
			$(".cart_tc").animate({top:"100%"});
			$(".cart_tc").removeClass("active");
			$("body").css("overflow","");
		})
		$(".cart_tc").click(function(e){
			var win = $(window).width();
			var close = $('.cart_tc .text , .cart_tc .meas_img'); 
		   	if(!close.is(e.target) && close.has(e.target).length === 0){
		   		$(".cart_tc").animate({top:"100%"});
		   		$(".cart_tc").removeClass("active");
		   		$("body").css("overflow","");
			}
		})

		//打开关闭优惠卷
		$(".conpon_btn").click(function(e){
			e.stopPropagation();
			if(!$(this).hasClass("active")){
				$(".get_ul").slideDown();
				$(this).addClass("active");
			}else{
				$(".get_ul").slideUp();
				$(this).removeClass("active");
			}
		})
		
		$(".get_btn").click(function(e){
			e.stopPropagation();
			$(".coupon_modal").fadeIn();
		})
		$(".coupon_modal .close, .coupon_modal .tj_btn").click(function(){
			$(".coupon_modal").fadeOut();
		})
</script>
<div class="yd_hide"><?php echo $footer; ?></div>

