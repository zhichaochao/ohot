			<?php if(!empty($resultdata))  { ?>
				<p class="scur_p">Customized Wig</p>
					<div class="scur_div">
						<ul class="scur_ul">


							<?php foreach ($resultdata as $key => $productcart) {   ?>
							<li class="scur_one clearfix">
								<div class="scur_li1 clearfix">
									<label for="" class="dx_label">
										<input class="check_input" value="" type="checkbox">
										<i class="check_i"></i>
									</label>
									<span>Wig <?php echo $key+1; ?></span>
								</div>
								<div class="scur_li2">
									<ul class="hop">
										
										<?php foreach ($productcart['product_value'] as $key => $productvalue) {   ?>
											<li>
												<div class="hop1">
													<a href="<?php echo $productvalue['href']; ?>"><img src="<?php echo $productvalue['product_thumb']; ?>"></a>
												</div>
												<div class="hop2">
													<p><?php echo $productvalue['product_name']; ?></p>
													<p>
													<?php foreach ($productvalue['product_option_value'] as $key => $option_value) {   ?>
													<span><?php echo $option_value['option_value']; ?></span>
													<?php  }?>
													</p>
												</div>
												<div class="hop3">
													<div class="price_input clearfix">
														<span class="sub active"></span>
														<input class="num" type="text" value="<?php echo $productvalue['quantity']; ?>" readonly="readonly">
														<span class="add"></span>
													</div>
												</div>
												<div class="hop4">
													<span><?php echo $productvalue['total']; ?></span>
												</div>
											</li>
										<?php  }?>


									</ul>
									<div class="scur_list">
										<p>Select Wig Cap Size: <?php echo $productcart['custom_sise']; ?></p>
										<p>Way of Parting: <?php echo $productcart['custom_parting']; ?></p>
										<p>Re-Color: <?php echo $productcart['color']; ?>   <span><?php echo $productcart['colortotal']; ?> ( <?php echo $productcart['single_price']; ?> * <?php echo $productcart['qty']; ?> pcs )</span></p>
										<p>Leave us a msg: <?php echo $productcart['message']; ?></p>
										<p>Wig Making Fee: <span><?php echo $productcart['custom_total']; ?></span></p>
										<div class="file">
											<img src="<?php echo $productcart['image']; ?>">
										</div>
									</div>
									<div class="scur_total">
										<p>Total:<span><?php echo $productcart['zongtotal']; ?></span></p>
										<!-- <a href="###">Re-select</a> -->
									</div>
								</div>

								<div class="scur_li3">
									<div class="cure">
										<div class="shop_close">
											<svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" onclick="javascript:cart_custom_remove('<?php echo $productcart['cart_id']; ?>');">
												<path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#333"></path>
												<path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#333"></path>
												<path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#333"></path>
											</svg>	
										</div>
									</div>
								</div>

							</li>
						<?php  }?>


					</ul>
				</div>
				<?php  }?>