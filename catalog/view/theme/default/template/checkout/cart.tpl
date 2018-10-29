<?php echo $header; ?>
<!--内容-->
<style>
  @media only screen and (min-width: 1px) and (max-width: 920px) {
    .cart_count{display: none;}
  }
</style>
		<div class="shopcart2 clearfix">
			<div class="content in_content shop2_content clearfix new_in_content" >
				<!-- <div class="top clearfix">
					<h1>SHOPPING CART</h1>
					<a href="<?php echo $url?>">Continue Shopping</a>
				</div> -->
			
				<div class="shop2_text clearfix">
				
					<div class="left">
						<!-- <label for="" class="qx_label" id="cart-tfoot">
							<span>ALL</span>
							<input checked="checked" class="check_input" onclick="getOrder()" autocomplete="off" id="lang-checkbox-select-all" type="checkbox">
							<i class="check_i active"></i>
							<!-- <input autocomplete="off" id="tfoot-checkbox-select-all" type="checkbox" class="check_i" > -->
						<!-- </label> --> 
						<div class="del clearfix">
							<svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32">
								<path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#333"></path>
								<path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#333"></path>
								<path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#333"></path>
							</svg>	
						</div>
						<ul class="shop2_ul" id="cart_table">
							 <?php foreach($products as $product){ ?>
							<li class="clearfix">

								<label for="" class="dx_label">
									 <input checked="checked" onclick="getOrder()" class="check_input" autocomplete="off" name="product" type="checkbox" value="<?php echo $product['cart_id']; ?>">
									 <i class="check_i active"></i>
									<!-- <input autocomplete="off" name="product" type="checkbox" value="<?php echo $product['cart_id']; ?>" class="check_i" > -->
								</label>	
								<?php if ($product['thumb']) { ?>
									<div class="pic_img">
			                        <a href="<?php echo $product['href']; ?>">
			                   <img src="<?php echo $product['thumb']; ?>"  title="<?php echo $product['name']; ?>" class="pic_img" />
			                        </a>
			                        </div>
			                      <?php } ?>
								<!-- <div >
									<a href="###"><img src="img/jpg/pro_det1.jpg" alt="" /></a>
								</div> -->
								<div class="text">
									<a class="a_bt" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
									<!-- <p><span>Color:</span> Natural Black</p> -->
									<!-- <p> -->
									<?php if ($product['option']) { ?>                         
			                         <?php foreach ($product['option'] as $option) { ?>						  
			                          <p>
			                           <?php if(!empty($option['name'])){ ?>
			                             <?php echo $option['value']; ?>
			                           <?php } ?> 
			                          </p>                        
			                         <?php } ?>                         
			                        <?php } ?>
			                        <!-- </p> -->

									<p><?=$product['model'];?></p>
									<!-- <p class="ts_ps"><?=$product['stock']?'':'Lack of stock';?></p> -->
									
								</div>
								<div class="price clearfix">

									<!-- <p>$35.65<span>$35.65</span></p> -->
									<?php if($product['original_price']) { ?>
					                    <p ><?php echo $product['price']; ?>
					                    <span><?php echo $product['original_price']; ?></span></p>
				                    <?php }else{ ?>
				                    	<p><?php echo $product['price']; ?></p>
				                    <?php } ?>
								</div>
								<div class="pre_div">
									<div class="num_div">
										<span class="sub" onclick="javascript:updateQty(this,1);"></span>
										<!-- <input class="num" type="text" value="1" /> -->
										<input class="product_quantity" readonly="readonly" type="text" aid="<?php echo $product['cart_id']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" onchange="updateQty(this,0);" />
										<span class="add" onclick="javascript:updateQty(this,2);"></span>
									</div>
								</div>
			
								<!-- <div class="close" onclick="javascript:cart_remove('<?php echo $product['cart_id']; ?>');"></div>
								<span class="wishlist <?=$product['wishlist']==1 ?'off':'';?>" 
									
								 onclick="wishlist('<?php echo $product['product_id']; ?>',this);cart_removes('<?php echo $product['cart_id']; ?>')">Move to Wishlist</span> -->
							</li>
							<?php } ?>
						</ul>
					</div>	

                <div class="right clearfix right_shop  bg_gif yd_hide">
                    <div class="collapse-checkout bg_fff" id='collapse-checkout-confirm'><h2>SUMMARY</h2></div>
                  
                </div>		
				
				</div>
		
				<div class="bot clearfix">
					<dl>
						<dt>Delivery dates</dt>
						<dd class="pc_dd">
							We ship by FedEx, DHL express and local express.<br />
							You can expect to get these items within <br />
							5-7 days. <a href="<?=$information?>">More information&nbsp;&nbsp;>></a>
						</dd>
						<dd class="yd_dd">
							Shopping on Hot Beauty Hair.com is safe and secure 
							- guaranteed!
						</dd>
						
					</dl>
					<dl>
						<dt>Satisfaction Guaranteed </dt>
						<dd>
							Hot Beauty Hair.com cares about your complete 
							satisfaction. We offer a comprehensive return policy 
							on all items, allowing you to shop with confidence.
						</dd>
					</dl>
					<dl>
						<dt>Privacy Policy</dt>
						<dd class="pc_dd">
							Hot Beauty Hair.com respects your privacy.<br />
							We do NOT share or in any way distribute 
							any personal, business or contact information 
							you may provide. <a href="<?=$return?>">See Our Return Policy&nbsp;&nbsp;>></a>
						</dd>
						<dd class="yd_dd">
							Hot Beauty Hair.com respects your privacy.We do NOT share 
							or in any way distribute any personal, business or contact 
							information you may provide.
						</dd>
					</dl>
				</div>	

				<div class="total clearfix">
					<label for="" class="qx_label">
						<span>All</span>
						<input checked="checked" class="check_input" onclick="getOrder()" autocomplete="off" id="lang-checkbox-select-all" type="checkbox">
							<i class="check_i active"></i>
						<!-- <i class="check_i"></i> -->
					</label>

					<?php foreach ($totals as $k => $total) { ?>
                       <?php if($total['title']=='Total') { ?>
                        <p >Total:  <span ><?php echo $total['text']; ?></span></p>
                        <?php } ?>
                            <p >Total:  <span ><?php echo $total['text']; ?></span></p>
                        <?php } ?>
                    <?php }  ?>


					<!-- <p>Total: <span>$119.59</span></p> -->
					<a class="tj_btn" href="<?php echo $total['text']; ?>"> CHECK OUT</a>
				</div>

			</div>
		</div>
<script>
	getOrder();
	function getOrder(){
//    console.log();
        var chk_value = '';
        $("input:checkbox[name='product']:checked").each(function() { // 遍历name=test的多选框
            chk_value += $(this).val() + ',';  // 每一个被选中项的值
        });
        chk_value = chk_value.substring(0,chk_value.length-1);
        if (chk_value) {var url='index.php?route=checkout/confirm&cart=1&cart_ids=' + chk_value;}else {var url='index.php?route=checkout/confirm&cart=1&cart_ids=';}
    $.ajax({
        url: url,
        dataType: 'html',
        success: function(html) {
//            console.log(html);die;
            $('#collapse-checkout-confirm').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
function wishlist(product_id,e) {
  if ($(e).hasClass('off')) {
       $.ajax({
    url:'<?php echo $delewishlist ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
      if (data.success) {
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
        $('#wishlist_count').html(data.total);
      }
               // location.reload(); 
    }
   })
 }
}


function cart_removes(product_key){
	   	     $.ajax({
		        url: 'index.php?route=checkout/cart/remove',
		        type: 'post',
		        data: {key:product_key},
		        dataType: 'json',
		 
		        success: function(json) {
		        	console.log(json);
		        	if (json['link']) { location.reload();}
		        }
		    }) 	  
	}
	function submitCart() {
	    console.log('in');
        var chk_value = '';
        $("input:checkbox[name='product']:checked").each(function() { // 遍历name=test的多选框
            chk_value += $(this).val() + ',';  // 每一个被选中项的值
        });
        chk_value = chk_value.substring(0,chk_value.length-1);
//        alert(chk_value);die;
        window.location='index.php?route=checkout/checkout&cart_ids=' + chk_value;
    }
	function updateQty(obj,type){
	// var num= $(obj).parent().find('input').val();
	var cart_id= $(obj).parent().find('input').attr('aid');
	// console.log(num);
	    switch(type){
	        case 0:
	        	//document.getElementById('cart-form').submit();
	            // document.getElementById('cart-form').submit();
	            break;
	        case 1:
	            qty = $(obj).next('input[type="text"]').val() - 1;
	            if(qty == 0){alert('At least 1 product'); return false;};
	            $(obj).next('input[type="text"]').val(qty);
	          // document.getElementById('cart-form').submit();
	            break;
	        case 2:
	            qty = parseInt($(obj).prev('input[type="text"]').val()) + 1;
	            $(obj).prev('input[type="text"]').val(qty);
	        //document.getElementById('cart-form').submit();
	            break;
	    }

	     $.ajax({
        url: 'index.php?route=checkout/cart/edit_ajax',
        type: 'post',
        data: {cart_id:cart_id,num:qty},
        dataType: 'json',
 
        success: function(json) {
        	console.log(json);
        	getOrder();
        }
    })


			var num=0;
	     $(".product_quantity").each(function(){

			    num += parseInt($(this).val());
			    //你的代码写在这里。
			});
	     $('#cart_count').html(parseInt(num));

	    
	}
	function cart_remove(product_key){
		//alert(product_key);
	   if(confirm('Are you sure?')){

	   	     $.ajax({
		        url: 'index.php?route=checkout/cart/remove',
		        type: 'post',
		        data: {key:product_key},
		        dataType: 'json',
		 
		        success: function(json) {
		        	console.log(json);
		        	if (json['link']) { location.reload();}
		        }
		    })
		 	
	   }     
	}
	
	//收藏
		$(".wishlist").click(function(){
			var win = $(window).width();
			if(win>992){
				if($(this).hasClass("off")){
					$(this).removeClass("off");
					// $(this).css("background","url(/catalog/view/theme/default/img/png/shop_star.png) no-repeat left center").css("background-size","0.83vw 0.83vw").css("color","#666");
				}else{
					$(this).addClass("off");
					// $(this).css("background","url(/catalog/view/theme/default/img/png/shop_star_.png) no-repeat left center").css("background-size","0.83vw 0.83vw").css("color","#d5af74");
				}
			}else{
				if($(this).hasClass("off")){
					$(this).removeClass("off");
					// $(this).css("background","url(/catalog/view/theme/default/img/png/shop_star.png) no-repeat left center").css("background-size","0.16rem 0.16rem").css("color","#666");
				}else{
					$(this).addClass("off");
					// $(this).css("background","url(/catalog/view/theme/default/img/png/shop_star_.png) no-repeat left center").css("background-size","0.16rem 0.16rem").css("color","#d5af74");
				}
			}
			
		})
	
		//全选
		$(".qx_label input").click(function(cart_id){
			if($(this).prop("checked")){
					$(this).siblings(".check_i").removeClass("active");
				$(".dx_label input").each(function(){
					$(this).prop("checked","");
					$(this).siblings(".check_i").removeClass("active");
				})				
			}else{
				$(this).siblings(".check_i").addClass("active");
				$(".dx_label input").each(function(){
					$(this).prop("checked",true);
					$(this).siblings(".check_i").addClass("active");
				})
			}
		})
		//单选
		$(".dx_label input").click(function(cart_id){
			//alert($cart_id);
			if($(this).prop("checked")){
				$(this).siblings(".check_i").addClass("active");
				var len = $(".dx_label .check_i").length;
				var i=0;
				$(".dx_label .check_i").each(function(){
					if($(this).hasClass("active")){
						i++
					}
					return i;
				})
				if(i>=len){
					$(".qx_label input").prop("checked",true);
					$(".qx_label .check_i").addClass("active");
				}
				
			}else{
				$(this).siblings(".check_i").removeClass("active");
				$(".qx_label .check_i").removeClass("active");
				$(".qx_label input").prop("checked","");
			}
		})
 		// alert(1);
 		// $(".yd_footer").addClass("hide");

</script>
<?php echo $footer; ?>

<script type="text/javascript">
$(function(){
	$(".yd_footer , .yd_footer2").addClass("hide");
})

</script>