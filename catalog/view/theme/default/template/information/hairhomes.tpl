<?php echo $header; ?>
		<!--内容-->
		
			<div class="content in_content hairclub clearfix">
			<input type="hidden" name="allpage" value='<?=$allpage;?>' id='allpage'/>
			<input type="hidden" name="page" value='1' id='page'/>
				<h1>Video Channel</h1>
				<p>“Newest hair product launch and fantanstic video public.”</p>
				
				<ul class="video_ul clearfix prolist">
					<?php foreach ($outsidevideos['outsidevideos'] as $key => $child) {?>
					<li>
					<iframe width="100%" height="100%" src="<?=$child['out_url'];?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</li>
					
				<?php } ?>
				</ul>
				
				<div class="fy_div clearfix">
		           <?php echo $pagination; ?>  
		        </div>
				</div>
			</div>
		<?php echo $footer; ?>
<script>
    function loadmore(obj){
      var allpage=$('#allpage').val();
      var page=$('#page').val();
      var win =$(window).width();
        if(win<920){
             var scrollTop = $(obj).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(obj).height();
            if (allpage>page) {
             if (scrollHeight-scrollTop - windowHeight<=300 ) {
              page++;
              $('#page').val(page);
               $.ajax({
                          url: 'index.php?route=information/profile/loadpages&page='+page,
                          dataType: 'json',
                          success: function(data) {
                            var result="";
                            // console.log( data.videos );
                            for (var i =0; i < data.outsidevideos.outsidevideos.length ; i++) {
                               result+='<li>'
                               +'<iframe width="100%" height="100%" src="'+data.outsidevideos.outsidevideos[i].out_url+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>'
                               +'</iframe>'
                                  +'</li>';
                                   }
                           $('.prolist').append(result);
                          }
                       })
                      } 
                    }
                }
              }
    //页面滚动执行事件
    $(window).scroll(function (){
        loadmore($(this));
    });
</script>
<script>
	$(function(){
		$(".video_ul li img.bf").click(function(){
			$(this).siblings(".text_vd").css("display","none");
			
			$(".video_li").each(function(){
				this.pause();
			})
			
			$(this).siblings("video").attr("controls","controls");
			this.previousElementSibling.play();
			
			$(this).css("display","none");
		})
		
		
//		$(".video_li").each(function(){
//			this.addEventListener('play',function(){ 
//				var this_index = $(this).parents("li").index()
//				console.log(this_index)
//				$(".video_li").each(function(){
//					this.pause();
//				})
//				document.getElementsByClassName("video_li")[this_index].play()
//			});
//		})
//		for(var i=0; i<$(".video_ul li").length;i++){
//			document.getElementsByClassName("video_li")[i].addEventListener('play',function(){  
//				$(".video_li").each(function(){
//					this.pause();
//				})
//					document.getElementsByClassName("video_li")[i].play();
//			});  
//		}
		
		
	})
</script>
