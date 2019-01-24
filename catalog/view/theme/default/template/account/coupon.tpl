<?php echo $header; ?>
<!--内容-->
    
    <div class=" in_content peo_center my_vip">
      <div class="content clearfix">
        
        <div class="left clearfix">
          <h1>MY ACCOUNT</h1>
          <ol>
           <?php echo $column_left; ?>

          <li class="active"><?php if ($column_left && $account_left) { ?>
          <?php $class = 'col-sm-6'; ?>
          <?php } elseif ($column_left || $account_left) { ?>
          <?php $class = 'col-sm-9'; ?>
          <?php } else { ?>
          <?php $class = 'col-sm-12'; ?>
          <?php } ?></li>

          <?php echo $account_left; ?>
          </ol>
        </div>

        <div class="right m_coupon clearfix">
          <p>
            To add a coupon to your account, simply input the code from the coupon
             and click ‘add’. Your account will be credited with the value on the coupon, 
            and the amount will be deducted from your next order.
          </p>
          <!-- <input type="text" placeholder="enter a Coupon Code" /> -->
            <input type="text"  id="coupon_code" name="coupon" value="<?php echo @$coupon; ?>" placeholder="enter a Coupon Code"/>
          <a class="a_btn"  onclick="coupon_code(this)">ADD COUPON&nbsp;&nbsp;&nbsp;></a>
        </div>



        <div class="mycoupon clearfix">
<?php if(isset($rescoupons)){ ?> 
          <ul class="valid">
    <?php foreach ($rescoupons as $coupon) { ?>
            <li>
              <div class="text">
                <div class="center">
                  <span class="pon_sp">US<em><?php echo $coupon['discount']; ?></em></span>
                  <p class="pon_p1">Orders of US <?php echo $coupon['total']; ?>+</p>
                </div>
              </div>
              <p class="bot_p">Expires <?php echo $coupon['date_end']; ?></p>
            </li>
            <?php } ?>
          </ul>
<?php } ?>

<?php if(isset($rescouponsun)){ ?> 
          <ul class="expired">
<?php foreach ($rescouponsun as $coupon) { ?>
            <li>
              <div class="text">
                <div class="center">
                  <span class="pon_sp">US<em><?php echo $coupon['discount']; ?></em></span>
                  <p class="pon_p1">Orders of US <?php echo $coupon['total']; ?>+</p>
                </div>
              </div>
              <p class="bot_p">Expires <?php echo $coupon['date_end']; ?></p>
            </li>
<?php } ?>
          </ul>
<?php } ?>
        </div>
        
  
        
      </div>
      
      
    </div>


<?php echo $footer; ?>
<script>
function coupon_code(e) {
    $.ajax({
        url: 'index.php?route=extension/total/coupon/jcoupon',
        type: 'post',
        data: $('input#coupon_code'),
        dataType: 'json',
      
        success: function(json) {
          // alert(json);
       

            if (json=='') {
              tips('Your coupon discount has been applied!','');
              $('#coupon_code').val('');
                // location.href='<?php echo $coupons ;?>';
            } else if (json['error']) {
                if (json['error']) {
                   
                   tips( json['error'],'gantan');
                }
               
            } else {
                // getOrder();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
	//动态显示会员积分情况
	$(function(){
		var vipPoint = Number($('.vip-level-top').data('point'));
		var $vipPg = $('.vip-level-pg');
		if(0 <= vipPoint && vipPoint < 20000){
			var vipLeft = vipPoint/500*258;
			$vipPg.css({'left':vipLeft+'px'});
		}else if(500 <= vipPoint && vipPoint < 50000){
			var vipLeft = (vipPoint-500)/7500*279+258;
			$vipPg.css({'left':vipLeft+'px'});
		}else if(8000 <= vipPoint && vipPoint < 100000){
			var vipLeft = (vipPoint-8000)/12000*298+537;
			$vipPg.css({'left':vipLeft+'px'});
		}else{
			$vipPg.css({'left':835+'px'});
		}
		$vipPg.show();
	});
</script>