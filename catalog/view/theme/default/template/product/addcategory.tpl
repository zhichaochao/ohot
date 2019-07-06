<?php echo $header; ?>
<!--内容-->
    <div class="content in_content product promotion">
    <input type="hidden" name="allpage" value='<?=$allpage;?>' id='allpage'/>
<input type="hidden" name="page" value='1' id='page'/>
<input type="hidden" name="sort" value='<?=$sort;?>' id='sort'/>
<input type="hidden" name="order" value='<?=$order;?>' id='order'/>
<input type="hidden" name="limit" value='<?=$limit;?>' id='limit'/>
<input type="hidden" name="category_id" value='<?=$category_id;?>' id='category_id'/>
      <!-- <img class="changeimage img_bnr" data-image='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/addpro.jpg' data-mimage='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/promotions.jpg'  />  -->
       <img class="changeimage img_bnr" data-image='catalog/view/theme/default/img/jpg/addpro.jpg' data-mimage='catalog/view/theme/default/img/jpg/addpro.jpg'  />
      
      <h1>Plus Purchase Products</h1>
      <div class="pro_content clearfix">
    <div class="top clearfix"> <div class="s_page"><?php echo $pagination; ?></div></div> 
        <div class="pro_text clearfix">
          <ul class="pro_ul prolist clearfix">
            <?php foreach ($products as $product) { ?>
             <li>
              <a href="<?php echo $product['href']; ?>">
                <div class="pic_img" >
                  <img src="<?php echo $product['thumb']; ?>"   />
                </div>
                <div class="text clearfix" >
                <p><?php echo $product['name']; ?></p>
                <span class="price" style="line-height: 1.25vw;">
                  <?php if($product['special']) { ?>
                  <em> <?php echo $product['special']; ?></em>
                     <del><?php echo $product['price']; ?></del>
                  <?php }else{ ?>
                     <em class="price-single"><?php echo $product['price']; ?>
                     </em>
                  <?php } ?>
                </span> 
                <?php if($product['is_new']==0) { ?>
                     <span class="new" style="float: left;font-size: 16px;text-align: center;">NEW</span>
                      <?php } ?>
                      <?php if($product['is_sale']==1) { ?>
                     <span class="new" style="float: left;font-size: 16px;text-align: center;">SALE</span>
                      <?php } ?>
              
                </div>
              </a>
              <div class="sc_div <?=$product['wishlist']==1 ?'off':'';?>"
               onclick="wishlist('<?php echo $product['product_id']; ?>',this);" ></div>
            </li>
            <?php } ?>
          </ul>
        </div>

        <div class="bot clearfix">
        <div class="left"><?php echo $pagination; ?></div>
          <div class="right">
            <p><?php echo $results; ?></p>
          </div>
        </div>

      </div>
    </div>    
<div>
<script>
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
    url:'<?php echo $wishlist ;?>',
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
  $(function(){
    
    //sortby
    $(".sortby").click(function(){
      if($(this).hasClass("off")){
        $(this).removeClass("off");
        $(this).find("span").text("+");
        $(this).siblings(".sortby_ol").slideUp();
      }else{
        $(this).addClass("off");
        $(this).find("span").text("-");
        $(this).siblings(".sortby_ol").slideDown();
      }
    })
    
  //收藏
    $(".pro_content .pro_ul .sc_div").click(function(){
      if($(this).hasClass("off")){
        $(this).removeClass("off");
        tips('Moved out from collection','');
      }else{
        $(this).addClass("off");
        tips('Save to collection','');
      }
    })
  })
</script>

<script>
    function loadmore(obj){
      var allpage=$('#allpage').val();
      var page=$('#page').val();
      var sort=$('#sort').val();
      var category_id=$('#category_id').val();
      var limit=$('#limit').val();
      var win =$(window).width();
        if(win<920){
             var scrollTop = $(obj).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(obj).height();
            if (allpage>page) {
             if (scrollHeight-scrollTop - windowHeight<=250 ) {
              page++;
              $('#page').val(page);
               $.ajax({
                          url: 'index.php?route=product/category/loadpage&page='+page+'&sort='+sort+'&category_id='+category_id+'&limit='+limit ,
                          dataType: 'json',
                          success: function(data) {
                            var result="";
                            // console.log( data);
                           for (var i =0; i < data.products.length ; i++) {
                            var addwinst="wishlist('"+data.products[i].product_id+"'";
                               result+='<li>'
                                  +'<a href="'+data.products[i].href+'">'
                                    +'<div class="pic_img" >'
                                        +'<img src="'+data.products[i].thumb+'"   />'
                                    + '</div>'
                                      + '<div class="text clearfix" >'
                                      +'<p>'+data.products[i].name+'</p>'
                                       + '<span class="price">';
                              if (data.products[i].special) {
                                 result += '  <span>'+data.products[i].special
                                           +' <del>'+data.products[i].price
                                            +'</del>'
                                          + '</span>';
                             }else{
                                      result+= '<span class="price-single">'+data.products[i].price+'</span>';
                              }
                                

                                    result+=   '</span>'
                                    if (data.products[i].is_new==0) {
                                    result+='<span class="new" style="float: left;font-size: 16px;text-align: center;">NEW</span>';
                                    }
                                    if (data.products[i].is_sale==1) {
                                      result+='<span class="sale" style="float: left;font-size: 16px;text-align: center;">SALE</span>';
                                    }

                                    // if (data.products[i].modelling) {
                                    //   result+='<i class="modelling">'+data.products[i].modelling+' </i>';
                                    // }
                                     // result+=' <div class="fsbg_div">'
                                     //    +'<i>'+'-'+data.products[i].off+'%'    
                                     //    +'</i>' 
                                     //    + '</div>'
                                     
                                   +'</a>';
                                   if (data.products[i].wishlist==1) {
                                    result+='<div class="sc_div off" onclick="'+addwinst+',this);" >';
                                   }else{
                                    result+='<div class="sc_div" onclick="'+addwinst+',this);" >';
                                   }
                                  +'</div>'
                                  +'</li>';
                                   }
                                  // console.log(result);
                           $('.prolist').append(result);
                          }
                       })
                      } 
                    }
                    // else if(!$(".pro_text ").hasClass('over')){
                    //   $(".pro_text ").addClass('over')
                    //    $(".pro_text ").append("<p>加载完成</p>");
                    // }
                }
              }
    //页面滚动执行事件
    $(window).scroll(function (){
        loadmore($(this));
    });
</script>
<?php echo $footer; ?>
