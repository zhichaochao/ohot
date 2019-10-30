			<?php if($ydresultdata)  { ?>
						<div class="yd_copt">
							<p class="copt_p">Customized Wig</p>
						</div>


						<div class="copt_div">
							<ul class="copt_ul">

							<?php foreach ($ydresultdata as $key => $productcart) {   ?>
								<li class="copt_li clearfix">
									<div class="copt_list1">
										<label for="" class="yd_label">
											<input class="check_input" value="12"  type="checkbox" />
											<i class="check_i"></i>
										</label>
									</div>
									<div class="copt_list2">
										<h6>Wig <?php echo $key+1; ?></h6>
										<div class="green">
											<ul class="greem_ul">

												<?php foreach ($productcart['product_value'] as $key => $productvalue) {   ?>
												<li class="clearfix">
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
													<div class="hop4">
														<span>X<?php echo $productvalue['quantity']; ?></span>
													</div>
													<div class="hop5">
														<span><?php echo $productvalue['total']; ?></span>
													</div>
												</li>
												<?php  }?>


											</ul>
											<div class="scur_list">
												<p>Select Wig Cap Size: <?php echo $productcart['custom_sise']; ?></p>
												<p>Way of Parting: <?php echo $productcart['custom_parting']; ?></p>
												<p>Re-Color: <?php echo $productcart['color']; ?>  <span><?php echo $productcart['colortotal']; ?> ( <?php echo $productcart['single_price']; ?> * <?php echo $productcart['qty']; ?> pcs )</span></p>
												<p>Leave us a msg: <?php echo $productcart['message']; ?></p>
												<p>Wig Making Fee: <span><?php echo $productcart['custom_total']; ?></span></p>
												<div class="file">
													<img src="<?php echo $productcart['image']; ?>">
													
												</div>
											</div>
											<div class="scur_total">
												<p>Total:<span><?php echo $productcart['zongtotal']; ?></span></p>
												
											</div>
										</div>
									</div>
								</li>
								<?php  }?>


							</ul>
						</div>
				<?php  }?>