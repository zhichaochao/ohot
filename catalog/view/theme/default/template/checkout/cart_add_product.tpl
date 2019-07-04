
	<div class="texts clearfix">
					<h2>Extra Purchase Value+ Products</h2>
					<div class="close"></div>
					<p class="p1">
						<?php if(ADD_CART){?>
						Order>300$ / 1000$ / 3000$, can get extra purchase at 30% off / 37% off / 47% off price !  <br>
						Can Add 6pcs max for each order ! <br>
						<?php }else{?>
						This activity is over! <br>
						<?php }?>
						Order Time: 9th July to 19th July !
					</p>
					<?php if ($can_add){ ?>
					<ul class="hg_shop_ul">
						<?php   foreach ($products as $key => $product) { ?>
							<?php   foreach ($product['options'] as $k => $option) { ?>
						<li class="clearfix add_product" data="<?=$product['product_id'];?>">
							<div class="div1 clearfix">
								<label for="" class="dx_labels">
									<input class="check_input" value="12" type="checkbox">
									<i class="check_i"></i>
								</label>
								<a class="text" href="<?=$product['href'];?>">
									<img class="img1" src="<?=$product['image'];?>" alt="" />
								</a>
								<div class="big clearfix">
									<span></span>
								</div>
							</div>
							<div class="div_ol clearfix">
								<ol class="type_ol clearfix">
									
									<!-- class="active" -->
									<li  data-id="<?=$option['product_option_value_id'];?>" data-qyt="<?=$option['quantity'];?>"><?=$option['name'];?></li>
									
								</ol>
								<div class="price">
									<span class="sp1"><?=$product['price']['addprice_format'];?></span>
									<span class="sp2"><?=$product['price']['originalprice_format'];?></span>
								</div>
							</div>
							<div class="div4">
								<div class="price_input clearfix" >
									<span class="sub active"></span>
									<input class="num" type="text" onchange="UpdateAddcart(this);" value="<?=$option['num'];?>" >
									<span class="add"></span>
								</div>
							</div>
						</li>
						<?php }?>
					<?php }?>
						
					</ul>
					<div class="select_total clearfix" id="add_cart_total">
						<span class="sp3">Selected <?=$quantity?>/<?=ADD_CART_QUANTITY;?></span>
						<input id="most_quantity" type="hidden" name="q" value="<?=ADD_CART_QUANTITY;?>" />
						<span class="sp4">Total: <em><?=$addcart_total?></em></span>
						<a  class="btn close_btn">CANCEL</a>
						<a  class="con_btn close_btn">CONFIRM</a>
					</div>
					<?php } ?>
				</div>
				
				<div class="modal hg_img_modal clearfix">
					<div class="textss clearfix">
						<img src="" >
						<div class="closes"></div>
					</div>
				</div>


<script type="text/javascript">

	//隐藏换购弹窗
		$(".hg_modal .close,.hg_modal .close_btn").click(function(){
			$(".hg_modal").fadeOut();
			$("body").css('overflow','');
		})
	 $(function(){
	 
	 	$('.add_product .price_input .sub').click(function(){
	 		var num=$(this).siblings('.num').val();
	 		if ($(this).parents('.add_product').find('li').attr('data-id')) {
	 			if (parseInt(num)>0) {
		 		$(this).siblings('.num').val(parseInt(num)-1);
		 		UpdateAddcart($(this).siblings('.num'));
		 		}else{
		 				alert('Choose at least one product');return false;
		 		}
		 	}else{
		 		alert('Options must be selected');return false;

		 	}
	 	})
	 	$('.add_product .price_input .add').click(function(){
	 		 // console.log($(this).parents('.add_product').find('li.active').attr('data-id'));
	 		if ($(this).parents('.add_product').find('li').attr('data-id')) {
		 		var num=$(this).siblings('.num').val();
		 		num=parseInt(num)+1;
		 		var qyt=$(this).parents('.add_product').find('li').attr('data-qyt');

		 		if (num<=qyt) {
			 		$(this).siblings('.num').val(num);

// 不能超过最高数量；
			 		var most_quantity=parseInt($('#most_quantity').val());
		 			var q=0;
		 	 		$(".add_product .num").each(function(){
		 	 			q+=parseInt($(this).val());
		 			 })
		 	 		if (q>most_quantity) {
		 	 			alert('The total should not exceed '+most_quantity);
		 	 			$(this).siblings('.num').val(num-1);
		 	 			return false;
		 	 		}


			 		UpdateAddcart($(this).siblings('.num'));
		 		}else{
		 			alert('Insufficient stock');return false;

		 		}
	 		}else{
		 		alert('Options must be selected');return false;

		 	}
	 	})

	 })

	 function UpdateAddcart(th) {
	 	var most_quantity=parseInt($('#most_quantity').val());
	 	var q=0;
	 	 $(".add_product .num").each(function(){
	 	 	q+=parseInt($(this).val());
	 	 })
	 	 if (q>most_quantity) {
	 	 	alert('The total should not exceed '+most_quantity);
	 	 	return false;
	 	 }

		 	 var num=$(th).val();
		 	 var product_id=$(th).parents('.add_product').attr('data');
		 	 var product_option_value_id=$(th).parents('.add_product').find('li').attr('data-id');
	 	// 加购产品加入购物车
	 	$.ajax({
		        url: 'index.php?route=checkout/cart/add_product_to_addcart',
		        type: 'post',
		        data: {num:num,product_id:product_id,product_option_value_id:product_option_value_id},
		        dataType: 'json',
		 	
		        success: function(json) {
		        	if (json['error']) {
		        		alert(json['error']);

		        	}else{
		        			$('#add_cart_total .sp3').html('Selected '+json['quantity']+'/'+json['most']);
		        			$('#add_cart_total .sp4 em').html(json['addcart_total']);
		        			getAddproduct();
		        	}
		        	
		        }
		    })


	 }
</script>