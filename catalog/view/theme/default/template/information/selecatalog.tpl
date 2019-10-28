			
			<!-- PC端子分类弹窗部分 -->
			<?php  if($res){?>
			<div class="hwm_hide">
				<div class="close"></div>
				<h4><?php  echo $res[0]['name']?></h4>
				 <?php foreach ($res[0]['child'] as $k => $childvalue) {?>	
				<a href="javascript:;" class="closu" data="<?php  echo $childvalue['inside_id']?>" value="<?php  echo $res[0]['status']?>"><?php  echo $childvalue['names']?></a>
				<?php  }?>
			</div>
			<?php  }?>
	<script>
	$(function(){
		//替换图片
	    var win = $(window).width();
		if(win<=992){
			// yd
		}else{
			  $(".closu").click(function(){
			  var inside_id=$(this).attr('data');
			  var value_status=$(this).attr('value');	
			  // console.log(inside_id);
			  	$.ajax({
		            url: 'index.php?route=information/selecatalogproduct&inside_id='+inside_id+'&value_status='+value_status,
        			dataType: 'html',	
        			success: function(html) {
		            		$('#hwm-duon-confirm').html(html);
		            		$(".hwm_duon").fadeIn();
		            },
		            error: function(xhr, ajaxOptions, thrownError) {
		                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		            }
        		});
		  	})
			// pc 关闭子分类弹窗
			$(".close").click(function(){
		  	$(this).parents('.hwm_pc').fadeOut();
		  	})
		}
	})
	</script>			