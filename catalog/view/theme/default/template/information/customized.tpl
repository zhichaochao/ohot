<?php echo $header; ?>
	<!-- 定制主页面 -->
		<div class="hwm_back">
			<div class="hwm_conter hwm_solt">
				<!-- banner -->
				<div class="hwm_banner">
					<img class="changeimage" data-image='catalog/view/theme/default/img/banner.png' data-mimage='catalog/view/theme/default/img/yd_banner.jpg'>
				</div>
				
				<div class="hwm_num">
					<div class="num_right">
						<h3>Funmi hair can put a bit <br>more than other hair.</h3>
						<p>Please choose the reasonable <br>quantity as we <br>recommend on the left.</p>
					</div>
					<div class="num_hide">
						<h3>Funmi hair can put a bit more than other hair.</h3>
						<p>Please choose the reasonable quantity as we recommend on the left.</p>
					</div>
					<div class="hwm_num_left">
						<img src="catalog/view/theme/default/img/jpg/dz_img.jpg">
					</div>
				</div>
				<!-- pc内容 -->
				<div class="hwm_list"><div class="hwm_list_left" id="getaddproduct-confirm"></div></div>
				<!-- yd内容 -->
				<div class="ydh_care" id="getydaddproduct-confirm"></div>
			</div>
		</div>
		
	
		<!-- pc 子分类弹窗 -->
		<div class="hwm_pc hwm_sion" id="hwm-sion-confirm"></div>
		
		<!-- pc产品弹窗 -->
		<div class="hwm_pc hwm_duct hwm_duon" id="hwm-duon-confirm"></div>
		
		
		<!-- yd  子分类弹窗 -->
		<div class="ydh_sern ydh_sure" id="yd-hwm-sion-confirm"></div>

		<!-- yd 发块 弹窗 -->
		<div class="ydh_sern ydh_faun" id="ydhwm-duon-confirm"></div>

		<!-- yd 属性 弹窗  -->
		<div class="ydh_sern ydh_sxu" id="ydhwm-duon-product"></div>
		
<?php echo $footer; ?>
<script>
	$(function(){

		$(window).resize(function() {
			var win = $(window).width();
			if(win<=992){
	          $('.changeimage').each(function(){
	            $(this).attr('src',$(this).attr('data-mimage'));
	          })
	        }else{
	          $('.changeimage').each(function(){
	            $(this).attr('src',$(this).attr('data-image'));
	          })
	        }
		})
		
		
	    var win = $(window).width();
		if(win<=992){
			// yd
				getydaddproduct();
				// Get 定制 产品
				function getydaddproduct()
				{

				    $.ajax({
				        url: 'index.php?route=information/customized/getydaddproduct',
				        dataType: 'html',
				        success: function(html) {
				            $('#getydaddproduct-confirm').html(html);
				        },
				        error: function(xhr, ajaxOptions, thrownError) {
				            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				        }
				    });
				        
				}
		}else{
			// pc
			getaddproduct();
			// Get 定制 产品
			function getaddproduct()
			{

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
		}
		
		
	})
</script>