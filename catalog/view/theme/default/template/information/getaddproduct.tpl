					<!-- pc定制主页面内容部分 -->
					<?php if(!$resultdata){?>
						<div class="hwm_list_a hwm_posi">
							<span class="num_list">01</span>
							<button class="hwm_button hwm_obut" data="1">ADD HAIR BUNDLES</button>
							<button class="hwm_button  hwm_phide" data="6">ADD CLOSURE / FRONTAL</button>
						</div>
					<?php }else{?>

						<div class="hwm_list_c hwm_posi">
							<span class="num_list">02</span>

							<ul class="hwm_ul">	

								
								<?php foreach($resultdata as $productdata){ ?>
								<li class="<?=$productdata['status']==1 ?'lian':'kuai';?>">
									<input type="hidden" name="product_id[]" value="<?php echo $productdata['product_id']; ?>">
									<i onclick="delcustom('<?php echo $productdata['custom_product_id']; ?>',this);" ><img src="catalog/view/theme/default/img/png/close2.png"></i>
									<span><img src="<?php echo $productdata['thumb']; ?>"></span>
									<div class="hwm_super">
										<p><?php echo $productdata['name']; ?></p>

										<?php if ($productdata['option_name']) { ?>     
											<p>

					                         <?php foreach ($productdata['option_name'] as $option) { ?>						  
					                          <span>
					                           <?php if(!empty($option['name'])){ ?>
					                             <?php echo $option['value']; ?>
					                           <?php } ?> 
					                          </span>
					                          <!-- 产品属性（暂留） -->
					                          <!-- <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['product_option_value_id']; ?>">   -->                      
					                         <?php } ?>  
					                         </p> 

			                        	<?php } ?>
										
									</div>
									<div class="hwm_drawn">
										<p><?php echo $productdata['total']; ?></p>
										<div class="price_input clearfix">
											<span class="sub active" onclick="javascript:updateQty(this,1);"></span>
											<input class="num" type="text" name="quantity" aid="<?php echo $productdata['custom_product_id']; ?>" value="<?php echo $productdata['quantity']; ?>" readonly="readonly">
											<span class="add" onclick="javascript:updateQty(this,2);"></span>
										</div>
									</div>
								</li>
								<?php  }?> 


							</ul>

							<button style="margin-top: 30px;"   class="hwm_button hwm_button_a hwm_obut" data="1">CONTINUE TO ADD HAIR BUNDLES</button>
							<button style="margin-top:  30px;"  class="hwm_button  hwm_phide" data="6">ADD CLOSURE / FRONTAL</button>

							<?php if ($option_info) { ?>
							<?php foreach ($option_info as $option) { ?>

							<div class="hwm_free hwm_ty">
								<p>Select <?=$option['option_name']?>:</p>
								<ul>
									<?php foreach ($option['option_value_data'] as $k=> $option_value) { ?>
									<li class="<?php if($k==0){echo'on';}?>" data="<?=$option_value['option_value_id']?>"><?=$option_value['name']?></li>
									<?php }?>
									<input type="hidden" name="custom_option[<?=$option['option_id']?>]"  value="<?php echo $option['option_value_data'][0]['option_value_id'];?>">
								</ul>
							</div>
							
							<?php } }?>

							<div class="hwm_color hwm_ty">
								<p>Re-Color:<span><?php echo $colortotal; ?>( <?php echo $single_price; ?> * <?php echo $qty; ?> pcs )</span></p>
								<select>
								  <option value ="Orange">Orange</option>
								</select>
							</div>

							<div class="hwm_pohot hwm_ty">
								<p>Upload pictures</p>
								<span class="file">
									<input type="file" name="image" value="" />
								</span>
							</div>
							<div class="msg hwm_ty">
								<p>Leave us a msg:</p>
								<textarea name="message"></textarea>
								<p class="msg_p">Wig Making Fee: <?php echo $custom_total; ?></p>
							</div>
							<div class="hwm_bot">
								<p><span>Total:</span><span><?php echo $zongtotal; ?></span></p>
								<button id="button-sub">ADD TO SHOPPING CART</button>
							</div>
						</div>	
					<?php }?>
						
					<script>
					$(function(){
						//替换图片
						    var win = $(window).width();
							if(win<=992){
								// yd
							}else{
								// pc
							  $('.changeimage').each(function(){
								$(this).attr('src',$(this).attr('data-image'));
							  })
							  // 子分类弹窗
							  $(".hwm_button").click(function(){
							  	var catalog=$(this).attr('data');
							  	// console.log(catalog);
							  	 $.ajax({
							            url: 'index.php?route=information/selecatalog&catalog_id='+catalog,
					        			dataType: 'html',	
					        			success: function(html) {
							            		$('#hwm-sion-confirm').html(html);
							            		$(".hwm_sion").fadeIn();
							            },
							            error: function(xhr, ajaxOptions, thrownError) {
							                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							            }
					        	});
							  	
							  })
							}

					});
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
					
					 $(".hwm_free ul li").click(function(){

					 	$(this).addClass("on").siblings().removeClass("on");
					 	let li_val = $(this).attr("data");
						$(this).siblings('input').val(li_val);
					 })
					 // 删除定制产品

					function delcustom(custom_product_id,e) {
					 
					   $.ajax({
					    url:'index.php?route=information/customized/delcustom_del',
					    type:'post',
					    data:{'custom_product_id':custom_product_id},
					    dataType: 'json',
					    success:function(data){
					      if (data.success) {
					        tips('Delete successful','');
					        getaddproduct();
					      }
					              
					    }
					   })
					}
					// 获取定制产品
					function getaddproduct(){

					    $.ajax({
					        url: 'index.php?route=information/customized/getaddproduct',
					        dataType: 'html',
					        success: function(html) {
					            $('#getaddproduct-confirm').html(html);
					        },
					        error: function(xhr, ajaxOptions, thrownError) {
					            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					        }
					    });
					        
					}
					function updateQty(obj,type){
						var custom_product_id= $(obj).parent().find('input').attr('aid');
						switch(type){
					        case 0:	   
					            break;
					        case 1:
					            qty = $(obj).next('input[type="text"]').val() - 1;
					            if(qty == 0){tips('At least 1 product','gantan'); return false;};
					         
					            break;
					        case 2:
					            qty = parseInt($(obj).prev('input[type="text"]').val()) + 1;
					       
					            break;
					    }
					    console.log(qty);
					    $.ajax({
					        url: 'index.php?route=information/customized/edit_ajax',
					        type: 'post',
					        data: {custom_product_id:custom_product_id,num:qty},
					        dataType: 'json',
					 
					        success: function(json) {
					        	 getaddproduct();
					        }
					    })

					}
					// 定制产品加入购物车
					// $(document).delegate('#button-sub', 'click', function() { 

					//   });
					</script>	