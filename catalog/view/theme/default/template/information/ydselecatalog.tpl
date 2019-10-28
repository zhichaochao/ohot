			


			<!-- 移动端子分类弹窗部分 -->
			<?php  if($ydres){?>
			<div class="ydh_hide">
				<div class="yd_close">
					<div class="yd_close_b"><img src="catalog/view/theme/default/img/png/yd_img2.png"></div>
				</div>
				<h5><?php  echo $ydres[0]['name']?></h5>
				<ul>
					<?php foreach ($ydres[0]['child'] as $k => $childvalue) {?>	
					<li class="ydh_fron" data="<?php  echo $childvalue['inside_id']?>" value="<?php  echo $ydres[0]['status']?>"><a href="javascript:;"><?php  echo $childvalue['names']?></a><i><img src="catalog/view/theme/default/img/png/yd_img3.png"></i></li>
					<?php  }?>
					
				</ul>
			</div>
			<?php  }?>
	<script>
	$(function(){
		//替换图片
	    var win = $(window).width();
		if(win<=992){

			$(".ydh_fron").click(function(){
				 var inside_id=$(this).attr('data');
			  var value_status=$(this).attr('value');	
			  // console.log(inside_id);
			  	$.ajax({
		            url: 'index.php?route=information/selecatalogproduct/ydselecatalogproduct&inside_id='+inside_id+'&value_status='+value_status,
        			dataType: 'html',	
        			success: function(html) {
		            		$('#ydhwm-duon-confirm').html(html);
		            		$(".ydh_faun").fadeIn();
		            },
		            error: function(xhr, ajaxOptions, thrownError) {
		                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		            }
        		});
			})

			// yd
			$(".yd_close_b").click(function(){
				$(this).parents('.ydh_sern').fadeOut();
				$("body").css("overflow","");
			})
			
			
		}else{
			// pc
		}
	})
	</script>			