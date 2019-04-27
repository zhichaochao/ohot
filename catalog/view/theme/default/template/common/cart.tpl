  <?php if ($products || $vouchers) { ?>
  <h1>MY SHOPPING CART(<span id="count"><?=$total_items;?></span>) <div class="close"><img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/close2.png"></div></h1>
          
          <div class="has">
            <ul class="cart_ul">

                      <?php foreach($products as $product){ ?>
              <li class="clearfix">
                <div class="li_dle" onclick="javascript:cart_remove('<?php echo $product['cart_id']; ?>');"></div>
                <a href="<?php echo $product['href']; ?>" class="pic_img clearfix">
                <?php if ($product['thumb']) { ?>
                
                         <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                           
                     <?php } ?>
                 </a>     
                  <div class="text">
                    
                      <h2><a href="<?php echo $product['href']; ?>" class="clearfix" style="font-size: 0.73vw;color: #333;"><?php echo $product['name']; ?>  </a> </h2>
                    <?php if ($product['option']) { ?>                         
                               <?php foreach ($product['option'] as $option) { ?>             
                                <p>
                                 <?php if( !empty($option['name']) ){ ?>
                                   <?php echo $option['name'].': '; ?><?php echo $option['value']; ?>
                                 <?php } ?> 
                                </p>                        
                               <?php } ?>                         
                              <?php } ?>   
                    <span>  <?php echo $product['price']; ?></span>
                   
                    <div class="price_input clearfix">
                      <span class="sub active" onclick="javascript:updateQtys(this,1);"></span>
                      <input class="num" type="text" aid="<?php echo $product['cart_id']; ?>"  value="<?php echo $product['quantity']; ?>" readonly onchange="updateQtys(this,0);">
                      <span class="add" onclick="javascript:updateQtys(this,2);"></span>
                    </div>
                    <!-- <p><span>x <?php echo $product['quantity']; ?></span></p> -->
                    
                  </div>
             <!--    </a> -->
              </li>
               <?php } ?>
            </ul>
            <hr>
            
            <div class="bot totalcount">
            
            
            <?php foreach ($totals as $total) { ?>
                   <p class="p_top"><?php echo $total['title']; ?> <span><?php echo $total['text']; ?></span></p>
                    
                      <?php } ?>
      
              <a class="a_btn" href="<?=$checkout;?>">GO TO SHOPPING CART&nbsp;&gt;</a>
            </div>
          </div>

    <?php } else { ?>

<h1>MY SHOPPING CART(<span>0</span>) <div class="close"><img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/close2.png"></div></h1>
<div class="null">
<p>Your shopping cart is empty</p>
</div>



    <?php } ?>

<script type="text/javascript">
     $('.cart_ul').scrollTop($('.cart_ul').scrollHeight);
  function updateQtys(obj,type){
  var cart_id= $(obj).parent().find('input').attr('aid');
      switch(type){
          case 0:
           // console.log(11111222);
              break;
          case 1:
              qty = $(obj).next('input[type="text"]').val() - 1;
              if(qty == 0){tips('At least 1 product','gantan'); return false;};
            
              $('.input_'+cart_id).val(qty);
              break;
          case 2:
              qty = parseInt($(obj).prev('input[type="text"]').val()) + 1;
         
              $('.input_'+cart_id).val(qty);
              break;
      }

       $.ajax({
        url: 'index.php?route=checkout/cart/edit_ajaxsx',
        type: 'post',
        data: {cart_id:cart_id,num:qty},
        dataType: 'json',
 
        success: function(json) {
        let len = json.atotals.length;
          var result="";
          for (i=0;i<len;i++) {
            result+='<p class="p_top">'+json.atotals[i].title+'<span>'+json.atotals[i].text+'</span>'+'</p>';
          }
          result+= '<a class="a_btn" href="<?=$checkout;?>">GO TO SHOPPING CART&nbsp;&gt;</a>';
          $('.totalcount').html(result);
          $('#count').html(json['text_cart_items']);
          $('#cart_count').html(json['text_cart_items']);
        }
    })
      $(obj).siblings(".num").val(qty);
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
</script>


