<!-- <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> -->
		    <!--      <link rel="stylesheet" href="catalog/view/theme/default/css/ttf.css" />
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/common.css" />
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/index.css" />
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/jquery.min.js" ></script>
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/common.js" ></script> -->
	<!-- 	<link rel="stylesheet" href="catalog/view/theme/default/css/common.css" />
		<link rel="stylesheet" href="catalog/view/theme/default/css/index.css" />
		<script type="text/javascript" src="catalog/view/theme/default/js/jquery.min.js" ></script>
		<script type="text/javascript" src="catalog/view/theme/default/js/common.js" ></script>
		<title>SHOPCART2</title>
		
	</head> -->

	<?php echo $header?>
	<style>
		@media (max-width:920px){
			.big_nav{display: none;}
		}
	</style>
	
	<body style="background: #f5f5f5;min-height: inherit !important; "><!--内容-->
		<div class="shopcart2 pc_hide clearfix new_in_content">
			<div class="content  shop2_content clearfix">
				<div class="shop2_text  clearfix">
					<div class="left">
						<div class="new_nav pc_hide clearfix">
							<a class="fh" href="<?php echo $continueshopping?>"></a>
							<p>MY ORDERS</p>
						</div>
						<div class="del clearfix">
							<svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32">
								<path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#333"></path>
								<path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#333"></path>
								<path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#333"></path>
							</svg>	
						</div>
						<ul class="shop2_ul">

						<?php foreach($products as $product){ ?>
							<li class="clearfix">
							<label for="" class="dx_label">
									 <input checked="checked"  pid='<?php echo $product['product_id']; ?>' class="check_input check_<?php echo $product['cart_id']; ?>" autocomplete="off" name="product" type="checkbox" value="<?php echo $product['cart_id']; ?>">
									 <i class="check_i active"></i>
							</label>
								<div class="pic_img">
									<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="" /></a>
								</div>
								<div class="text">
									<a class="a_bt" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
									<?php if ($product['option']) { ?>                         
			                         <?php foreach ($product['option'] as $option) { ?>						  
			                          <p>
			                           <?php if(!empty($option['name'])){ ?>
			                             <?php echo $option['value']; ?>
			                           <?php } ?> 
			                          </p>                        
			                         <?php } ?>                         
			                        <?php } ?>
								</div>
								<div class="price clearfix">
										<?php if($product['original_price']) { ?>
											<p><?php echo $product['price']; ?><span><?php echo $product['original_price']; ?></span></p>
				                    	<?php }else{ ?>
											<p><?php echo $product['price']; ?></p>
				                    	<?php } ?>
								</div>
								<div class="pre_div">

							<div class="num_div clearfix">
								<span class="sub active"onclick="javascript:updateQty(this,1);"></span>
								<input class="product_quantity input_<?php echo $product['cart_id']; ?>"  readonly="readonly" type="text" aid="<?php echo $product['cart_id']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" onchange="updateQty(this,0);" />
								<span class="add" onclick="javascript:updateQty(this,2);"></span>
							</div>

								</div>
								<div class="shanchu clearfix">
									<div class="del clearfix shop_close">
										<svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" onclick="javascript:cart_remove('<?php echo $product['cart_id']; ?>');">
											<path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#333"></path>
											<path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#333"></path>
											<path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#333"></path>
										</svg>	
									</div>
								</div>
							</li>
			                <?php } ?>

						</ul>
					</div>
				
				</div>
				
				<div class="total  clearfix">
					<label for="" class="qx_label">
						<span>All</span>
					<input checked="checked" class="check_input"  autocomplete="off" id="lang-checkbox-select-all" type="checkbox">
						<i class="check_i active"></i>
					</label>
				
                        <p>Total: <span class="total_price"><?php echo $cart_total; ?></span></p>
                  
					<a class="tj_btn" onclick="submitCart();" > CHECK OUT</a>
				</div>
			</div>
		</div>
		
		
		<div class="gwc_pc yd_hide clearfix in_content">
			<div class="text">
				<h1><a class="fh" href="<?php echo $continueshopping?>">Continue Shopping</a> SHOPPING CART</h1>
				
				<div class="qx">
						<!-- <label for="" class="qx_label" id="cart-tfoot">
							<span>ALL</span>
							<input checked="checked" class="check_input" onclick="getOrder()" autocomplete="off" id="lang-checkbox-select-all" type="checkbox">
							<i class="check_i active"></i>
							<!-- <input autocomplete="off" id="tfoot-checkbox-select-all" type="checkbox" class="check_i" > --> 
						<!-- </label> --> 

					<label for="" class="qx_label" id="cart-tfoot">
						<input checked="checked" class="check_input" onclick="getOrder()" autocomplete="off" id="lang-checkbox-select-all" type="checkbox">
						<i class="check_i active"></i>
						<span>All</span>
						<em class="em4">Total Prices</em>
						<em class="em3">Quantity</em>
						<em class="em2">Unit Price</em>
						<em class="em1">Product Information</em>
					</label>
				</div>
				
				<ul class="shop_ul">
					
					


					<?php foreach($products as $product){ ?>
					<li class="clearfix">
						<div class="div1 clearfix">

							<label for="" class="dx_label">
									 <input checked="checked"   pid='<?php echo $product['product_id']; ?>' class="check_input check_<?php echo $product['cart_id']; ?>" autocomplete="off" name="product" type="checkbox" value="<?php echo $product['cart_id']; ?>">
									 <i class="check_i active"></i>
									<!-- <input autocomplete="off" name="product" type="checkbox" value="<?php echo $product['cart_id']; ?>" class="check_i" > -->
							</label>
							<?php if ($product['thumb']) { ?>

							<a class="text" href="<?php echo $product['href']; ?>">
								<img class="img1" src="<?php echo $product['thumb']; ?>" alt="" />
							</a>
			                <?php } ?>

						</div>
						<div class="div2 clearfix">
							<div class="text_p">
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
								<?php if ($product['option']) { ?>                         
			                         <?php foreach ($product['option'] as $option) { ?>						  
			                          <p>
			                           <?php if(!empty($option['name'])){ ?>
			                             <?php echo $option['value']; ?>
			                           <?php } ?> 
			                          </p>                        
			                         <?php } ?>                         
			                        <?php } ?>
							</div>
						</div>
						<div class="div3">
									<?php if($product['original_price']) { ?>
					                    <span class="price"><i><?php echo $product['price']; ?></i>
					                    <em><?php echo $product['original_price']; ?></em></span>
				                    <?php }else{ ?>
				                    	<span class="price"><i><?php echo $product['price']; ?></i></span>
				                    <?php } ?>
						</div>
						<div class="div4">
							<div class="price_input clearfix">
								<span class="sub active"onclick="javascript:updateQty(this,1);"></span>
								<!-- <input class="num" type="text" value="1" readonly="readonly"> -->
								<input class="product_quantity input_<?php echo $product['cart_id']; ?>" readonly="readonly" type="text" aid="<?php echo $product['cart_id']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" onchange="updateQty(this,0);" />
								<span class="add" onclick="javascript:updateQty(this,2);"></span>
							</div>
						</div>
						<!-- <div class="pre_div">
									<div class="num_div">
										<span class="sub" onclick="javascript:updateQty(this,1);"></span>
										<input class="num" type="text" value="1" />
										<input class="product_quantity" readonly="readonly" type="text" aid="<?php echo $product['cart_id']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" onchange="updateQty(this,0);" />
										<span class="add" onclick="javascript:updateQty(this,2);"></span>
									</div>
								</div> -->

						<div class="div5">
							<span class="z_price price_<?php echo $product['cart_id']; ?>" ><?php echo $product['total']; ?></span>
						</div>
						<div class="div6">
							<div class="shop_close">
								<svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" onclick="javascript:cart_remove('<?php echo $product['cart_id']; ?>');">
									<path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#333"></path>
									<path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#333"></path>
									<path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#333"></path>
								</svg>	
							</div>
						</div>
					</li>
			     <?php } ?>
					
				</ul>
				
			</div>
			
			<div class="total">
				<div class="qx">
					<label for="" class="qx_label"  id="cart-tfoot">
						<input checked="checked" class="check_input"  autocomplete="off" id="lang-checkbox-select-all" type="checkbox">
						<i class="check_i active"></i>
						<span>All</span>

						<!-- <a class="check_a" href="###">CHECK OUT</a> -->
					<a class="check_a" onclick="submitCart();" > CHECK OUT</a>
				
                        <p class="p_price">Total: <span  class ="total_price"><?php echo $cart_total; ?></span></p>
                  
						
						<em class="delete">Delete The Selected Items</em>
						<em class="wishlist">Move To Wishlist</em>
						
							
						
					</label>
				</div>
			</div>
		</div>
				
				
			
		<!--返回顶部-->
		<div class="xf_right">
			<div class="vip"><a href="<?php echo $vip?>"><span>VIP</span></a></div>
			<div class="top"><span>TOP</span></div>
		</div>

	</body>
</html>

<script>
//判断左右滑动出现删除按钮
	$('body').on('touchstart', '.shop2_content .shop2_ul>li', function(e) {
        var touch = e.originalEvent,
    	startX = touch.changedTouches[0].pageX;
	    $(this).on('touchmove', function(e) {
	    		e.preventDefault();
	    		touch = e.originalEvent.touches[0] ||
	    		    e.originalEvent.changedTouches[0];
	    		if (touch.pageX - startX > 20) {//向左
	    			$(this).find(".shanchu").animate({right:"-0.72rem"},function(){
	    			});
	    		    $(this).off('touchmove');
	    		} else if (touch.pageX - startX < -20) {//向右
	    			$(this).find(".shanchu").animate({right:"0px"},function(){
	    			});
	    		    $(this).off('touchmove');
		    		};
		    });
 
        }).on('touchend', function() {
        $(this).off('touchmove');
    });	
// 	getOrder();
// 	function getOrder(){
// //    console.log();
//         var chk_value = '';
//         $("input:checkbox[name='product']:checked").each(function() { // 遍历name=test的多选框
//             chk_value += $(this).val() + ',';  // 每一个被选中项的值
//         });
//         chk_value = chk_value.substring(0,chk_value.length-1);
//         if (chk_value) {var url='index.php?route=checkout/confirm&cart=1&cart_ids=' + chk_value;}else {var url='index.php?route=checkout/confirm&cart=1&cart_ids=';}
//     $.ajax({
//         url: url,
//         dataType: 'html',
//         success: function(html) {
// //            console.log(html);die;
//             $('#collapse-checkout-confirm').html(html);
//         },
//         error: function(xhr, ajaxOptions, thrownError) {
//             alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
//         }
//     });
// }
function wishlist(product_id) {

   $.ajax({
    url:'<?php echo $wishlist_add ;?>',
    type:'post',
    data:{'product_id':product_id},
    dataType: 'json',
    success:function(data){
  		 console.log(data);
    
               // location.reload(); 
    }
   })
 
}

		//多个收藏
		$(".wishlist").click(function(){
			let i =0;
			let len = $(".dx_label .check_i").length;
			// alert(len);die
			for (i=0;i<=len;i++) {

			$(".dx_label .check_i").each(function(){
				if($(this).hasClass("active")){
				if ($(this).parents("li").find('.check_input').val()>0&&$(this).parents("li").find('.check_input').attr("checked")) {
					wishlist($(this).parents("li").find('.check_input').attr('pid'));
						cart_removes($(this).parents("li").find('.check_input').val());
					}
					
					$(this).parents("li").remove();
				}else{
					i++;
					if(i==len){
						tips('You haven`t select any item','gantan');
					}
				}
			})

			}
			
			
			
		})

		//多个删除
		$(".delete").click(function(){
			let i =0;
			let len = $(".dx_label .check_i").length;
			// console.log(len);
			$(".dx_label .check_i").each(function(){
				if($(this).hasClass("active")){
					if ($(this).parents("li").find('.check_input').val()>0&&$(this).parents("li").find('.check_input').attr("checked")) {
					cart_removes($(this).parents("li").find('.check_input').val());
					}
					$(this).parents("li").remove();
				}else{
					i++;
					if(i==len){
						tips('You haven`t select any item','gantan');
					}
				}
			})
			
			
		})


function cart_removes(product_key){
	   	     $.ajax({
		        url: 'index.php?route=checkout/cart/remove',
		        type: 'post',
		        data: {key:product_key},
		        dataType: 'json',
		 
		        success: function(json) {
		        	console.log(json);
		        	// if (json['link']) { location.reload();}
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
	            if(qty == 0){tips('At least 1 product','gantan'); return false;};
	          
	            $('.input_'+cart_id).val(qty);
	            console.log(cart_id);
	          // document.getElementById('cart-form').submit();
	            break;
	        case 2:
	            qty = parseInt($(obj).prev('input[type="text"]').val()) + 1;
	            // $(obj).prev('input[type="text"]').val(qty);
	       
	            $('.input_'+cart_id).val(qty);
	               console.log(cart_id);
	        //document.getElementById('cart-form').submit();
	            break;
	    }

	     $.ajax({
        url: 'index.php?route=checkout/cart/edit_ajax',
        type: 'post',
        data: {cart_id:cart_id,num:qty},
        dataType: 'json',
 
        success: function(json) {
        // 	var win =$(window).width();
      		// if(win<920){tips("Successfully Modify Shopping Cart",'');}
        	console.log(json);
        	$('.total_price').html(json['total']);
        	for (var i = json['products'].length - 1; i >= 0; i--) {
        		$('.price_'+json['products'][i].cart_id).html(json['products'][i].value);
        	}
        	// getOrder();
        	// location.reload()
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

	   // if(confirm('Are you sure?')){

	   	     $.ajax({
		        url: 'index.php?route=checkout/cart/remove',
		        type: 'post',
		        data: {key:product_key},
		        dataType: 'json',
		 
		        success: function(json) {
		        	// console.log(json);
		        	if (json['link']) { location.reload();}
		        }
		    })
		 	
	   // }     
	}
	
	//收藏
		$(".wishlist").click(function(){
			var win = $(window).width();
			if(win>992){
				if($(this).hasClass("off")){
					$(this).removeClass("off");
					// $(this).css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star.png) no-repeat left center").css("background-size","0.83vw 0.83vw").css("color","#666");
				}else{
					$(this).addClass("off");
					// $(this).css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star_.png) no-repeat left center").css("background-size","0.83vw 0.83vw").css("color","#d5af74");
				}
			}else{
				if($(this).hasClass("off")){
					$(this).removeClass("off");
					// $(this).css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star.png) no-repeat left center").css("background-size","0.16rem 0.16rem").css("color","#666");
				}else{
					$(this).addClass("off");
					// $(this).css("background","url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/shop_star_.png) no-repeat left center").css("background-size","0.16rem 0.16rem").css("color","#d5af74");
				}
			}
			
		})
	
		
		//全选
    $(".qx_label input").click(function(){
      if($(this).prop("checked")){
        $(".qx_label input").siblings(".check_i").addClass("active");
        $(".qx_label input").prop("checked",true);
        $(".dx_label input").each(function(){
          $(this).prop("checked",true);
          $(this).siblings(".check_i").addClass("active");
        })
      }else{
        $(".qx_label input").siblings(".check_i").removeClass("active");
        $(".qx_label input").prop("checked",false);
        $(".dx_label input").each(function(){
          $(this).prop("checked","");
          $(this).siblings(".check_i").removeClass("active");
        })
      }
      select_cart();
    })
    //单选
    $(".dx_label input").click(function(){
      const this_index = $(this).parents("li").index();
      
      if($(this).prop("checked")){
        $(".shop_ul>li").eq(this_index).find(".check_i").addClass("active");
        $(".shop2_ul>li").eq(this_index).find(".check_i").addClass("active");
        $(".shop_ul>li").eq(this_index).find("input").prop("checked",true);
        $(".shop2_ul>li").eq(this_index).find("input").prop("checked",true);
        
        var len = $(".dx_label .check_i").length;
        var i=0;
        $(".dx_label .check_i").each(function(){
          if($(this).hasClass("active")){
            i++;
            // console.log($(this).siblings("input").val())
          }
          return i;
        })
        if(i>=len){
          $(".qx_label input").prop("checked",true);
          $(".qx_label .check_i").addClass("active");
        }
        
      }else{
        $(".shop_ul>li").eq(this_index).find(".check_i").removeClass("active");
        $(".shop2_ul>li").eq(this_index).find(".check_i").removeClass("active");
        $(".shop_ul>li").eq(this_index).find("input").prop("checked",false);
        $(".shop2_ul>li").eq(this_index).find("input").prop("checked",false);
        
        $(".qx_label .check_i").removeClass("active");
        $(".qx_label input").prop("checked","");
      }
      select_cart();
    })


		function select_cart() {
			var a = new Array();
			$(".shop_ul input.check_input").each(function(){
    			if($(this).attr("checked")){
    				a.push($(this).val());

    		}
    		
    		});
    	$.ajax({
		        url: 'index.php?route=checkout/cart/change_cart_id',
		        type: 'post',
		        data: {cart_id:a},
		        dataType: 'json',
		 
		        success: function(json) {
		        	// console.log(json);
		        	$('.total_price').html(json['total']);
		        	
		        }
		    })

			// console.log(a);
		}


		//单选
//单选
		$(".dx_label input").click(function(){
			const this_index = $(this).parents("li").index();
			if($(this).prop("checked")){
				$(".shop_ul>li").eq(this_index).find(".check_i").addClass("active");
				$(".shop2_ul>li").eq(this_index).find(".check_i").addClass("active");
				$(".shop_ul>li").eq(this_index).find("input").prop("checked",true);
				$(".shop2_ul>li").eq(this_index).find("input").prop("checked",true);
					
				var len = $(".dx_label .check_i").length;
				var i=0;
				$(".dx_label .check_i").each(function(){
					if($(this).hasClass("active")){
						i++;
						console.log($(this).siblings("input").val())
					}
					return i;
				})
				if(i>=len){
					$(".qx_label input").prop("checked",true);
					$(".qx_label .check_i").addClass("active");
				}
			}else{
				$(".shop_ul>li").eq(this_index).find(".check_i").removeClass("active");
				$(".shop2_ul>li").eq(this_index).find(".check_i").removeClass("active");
				$(".shop_ul>li").eq(this_index).find("input").prop("checked",false);
				$(".shop2_ul>li").eq(this_index).find("input").prop("checked",false);
				$(".qx_label .check_i").removeClass("active");
				$(".qx_label input").prop("checked","");
			}
		})

</script>

<script type="text/javascript">
$(function(){
	$(".yd_footer , .yd_footer2").addClass("hide");
})

</script>