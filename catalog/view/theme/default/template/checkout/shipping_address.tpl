
 <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/select2/css/select2.css" />
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/select2/js/select2.js" ></script>
  <div class="bg_fff yd_hide" id="shipping-existing" style="display: <?php echo ($eaddress||empty($addresses) ? 'none' : 'block'); ?>;">

                 <h2><span>1</span>Select the shipping address</h2>
                        <ul class="address_ul clearfix">
                      <?php foreach ($addresses as $address) { ?>
                          <?php 
                              $custom_field = '';
                              if(!empty($address['custom_field']) && is_array($address['custom_field'])){
                                  foreach($address['custom_field'] as $c_val){
                                      $custom_field .= $custom_field ? ',' . $c_val : $c_val;
                                  }
                              }
                          ?>
                            <li aid="<?=$address['address_id']?>" class=" <?php if ($address['address_id'] == $address_id) echo ''; ?> clearfix">
                                <div class="text_li">
                                <span> <?php echo $address['firstname'] .' '. $address['lastname']; ?> </span>
                                <p><?php echo $address['telephone']; ?>  <?php 
                    if(mb_strlen($address['address_1'],'UTF8')>15){ 
                      echo mb_substr($address['address_1'],0,15).'...';
                    }else{ 
                      echo $address['address_1'];
                    }; 
                  ?>
                  </p>
                                <p><?php echo $address['city']; ?>, <?php echo $address['zone']; ?>,<?php echo $custom_field ? ',' . $custom_field : ''; ?></p>
                                <span><?php echo $address['postcode']; ?></span>
                                <span><?php echo $address['country']; ?></span>
                                <a class="a_btn" onclick="getShippingAddress('<?php echo $address['address_id']; ?>')">Edit</a>
                              

                              <a class="def" href="">Default</a>
                                <!-- <a class="go_btn"  onclick="setDefault('<?php echo $address['address_id']; ?>', this)" >sent to this address&nbsp;&nbsp;&nbsp;></a> -->
                              </div>
                            </li>
                           <?php } ?>
                           <li class="clearfix">
                        <a class="add_a" id='show-shipping-new'><span>Add new address</span></a>
                      </li>
                        </ul>
                        


    
       

   

  </div>
    <div class="bg_fff pc_hide" id="shipping-existing" style="display: <?php echo ($eaddress||empty($addresses) ? 'none' : 'block'); ?>;">

                
                   <div class="zfbt clearfix"><span>1</span><h1>Shipping Address</h1></div>
                        <ul class="zf_1_ol clearfix">
                      <?php foreach ($addresses as $address) { ?>
                          <?php 
                              $custom_field = '';
                              if(!empty($address['custom_field']) && is_array($address['custom_field'])){
                                  foreach($address['custom_field'] as $c_val){
                                      $custom_field .= $custom_field ? ',' . $c_val : $c_val;
                                  }
                              }
                          ?>
                            <li aid="<?=$address['address_id']?>" class=" <?php if ($address['address_id'] == $address_id) echo ''; ?>">
                                <!-- <div class="text_li"> -->
                                <p> <?php echo $address['firstname'] .' '. $address['lastname']; ?> </p>
                                <p><?php echo $address['telephone']; ?>  <?php 
                                  if(mb_strlen($address['address_1'],'UTF8')>15){ 
                                    echo mb_substr($address['address_1'],0,15).'...';
                                  }else{ 
                                    echo $address['address_1'];
                                  }; 
                                ?>
                                </p>
                                <p><?php echo $address['city']; ?>, <?php echo $address['zone']; ?>,<?php echo $custom_field ? ',' . $custom_field : ''; ?></p>
                                <p><?php echo $address['postcode']; ?></p>
                                <p><?php echo $address['country']; ?></p>
                                <!-- <a class="a_btn" onclick="getShippingAddress('<?php echo $address['address_id']; ?>')">Edit</a> -->
                                <?php if($address['address_id'] == $address_id){ ?>
                                <span class="<?php if ($address['address_id'] == $address_id) echo ''; ?>">Default</span><?php } ?>
                               <!-- <a class="edit" onclick="getShippingAddress('<?php echo $address['address_id']; ?>')">Edit</a> -->
                               
                                <a class="edit" href="index.php?route=checkout/shipping_address/wap&address_id=<?php echo $address['address_id']; ?>">Edit</a>
                                <!-- <a class="go_btn"  onclick="setDefault('<?php echo $address['address_id']; ?>', this)" >sent to this address&nbsp;&nbsp;&nbsp;></a> -->
                              <!-- </div> -->
                            </li>
                           <?php } ?>
                           
                        </ul>
                        <li class="clearfix">
                        <a class="add_a" href="<?=$address_add?>"><span>Add new address</span></a>
                      </li>
                       <a class="btn240 addrres" onclick="toselectAddress()">SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;></a>


    
       

   

  </div>


  <div id="shipping-new" class="bg_fff" style="display: <?php echo ($eaddress||empty($addresses) ? 'block' : 'none'); ?>;">

  <p class="form_p">* Required fields111</p>
            <form class="add_form clearfix" id="collapse-shipping-address">
              <label for="input-shipping-firstname">
                <span><?php echo $entry_firstname; ?> *</span>
                <input type="text" name="firstname" value="<?php echo ($eaddress ? $eaddress['firstname'] : ''); ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-shipping-firstname"  class=" clear" />
              </label>
              <label for="input-shipping-lastname">
                <span><?php echo $entry_lastname; ?> *</span>
                <input type="text"  name="lastname" value="<?php echo ($eaddress ? $eaddress['lastname'] : ''); ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-shipping-lastname" class="form-control clear" />
              </label>
              <label class="add_label" for="input-shipping-address-1">
                <span><?php echo $entry_address_1; ?> *</span>
                <input type="text" name="address_1" value="<?php echo ($eaddress ? $eaddress['address_1'] : ''); ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-shipping-address-1" class="form-control clear" />
                <input  type="text" name="address_2" value="<?php echo ($eaddress ? $eaddress['address_2'] : ''); ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control clear"/>
              </label>
              
              <label for="input-shipping-country">
                <span><?php echo $entry_country; ?> *</span>
                 <select name="country_id" id="input-shipping-country" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == ($eaddress ? $eaddress['country_id'] : $country_id)) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </label>
              <label  for="input-shipping-postcode">
                <span><?php echo $entry_postcode; ?> *</span>
                <input  type="text" name="postcode" value="<?php echo $eaddress ? $eaddress['postcode'] : $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="form-control" />
              </label>
              <label for="input-shipping-city">
                <span><?php echo $entry_city; ?>*</span>
                <input  type="text" name="city" value="<?php echo ($eaddress ? $eaddress['city'] : ''); ?>" placeholder="<?php echo $entry_city; ?>" id="input-shipping-city" class="form-control clear" />
              </label>
              <label  for="input-shipping-zone">
                <span><?php echo $entry_zone; ?> *</span>
                <select name="zone_id" id="input-shipping-zone" class="form-control">
      
                </select>
              </label>
              <label for="input-shipping-telephone">
                <span><?php echo $entry_telephone; ?> *</span>
                <input type="text" name="telephone" value="<?php echo (isset($eaddress['telephone']) ? $eaddress['telephone'] : ''); ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-shipping-telephone" class="form-control clear">
              </label>
            <?php if(!empty($addresses)){ ?>  <button class="qx_btn" type="reset"  id='show-shipping-existing'>cancel</button>   <?php } ?>
              
        
                 <a class="btn240 clearfix clear" id="btnSaveAddress" aid="<?php echo ($eaddress ? $eaddress['address_id'] : 0); ?>" onclick="saveAddress(this);">SAVE ADDRESS   ></a>
                   <input  type="hidden" value="" name="company" />
            </form>
            



  </div>
  
<script type="text/javascript"><!--

<?php if(!empty($payment_address)){ ?>
    $('.new-checkout-pay-method').show();
<?php } ?>
<?php if(!empty($shipping_address)){ ?>
    $('.new-checkout-ship-method').show();
<?php } ?>
$('#show-shipping-new').on('click', function() {
  $('.address_ul li').removeClass('active');
    $('#btnSaveAddress').attr('aid', 0);
		$('#shipping-existing').hide();
		$('#shipping-new').show();
});
$('#show-shipping-existing').on('click', function() {
  
    $('input.clear').val('');
    $('#shipping-existing').show();
    $('#shipping-new').hide();
});
$('#shipping-existing').on('mouseenter','td',function(){
	$(this).parent().siblings().children('.new-checkout-address-rig').css('visibility','hidden');
	$(this).siblings('.new-checkout-address-rig').css('visibility','visible');
});
$('#shipping-existing').on('mouseleave','tr',function(){
	$(this).children('.new-checkout-address-rig').css('visibility','hidden');
});
$('.address_ul li').on('click', function() {
   $(this).addClass('active').siblings().removeClass('active');
   $('.addrres').css('display','none');
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/changeAddress&address_id='+$(this).attr('aid'),
        dataType: 'json',
    
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
         
                alert(json['error']);
            } else {
                getShippingMethod();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

});
//yd
$('.zf_1_ol li').on('click', function() {
   $(this).addClass('active').siblings().removeClass('active');
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/changeAddress&address_id='+$(this).attr('aid'),
        dataType: 'json',
    
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
         
                alert(json['error']);
            } else {
                // getShippingMethod();
                location ='index.php?route=checkout/shipping_method/wap';
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

});

// Set Default Address
function setDefault(address_id, e){
    if(!confirm('Are You Sure ?')) return false;
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/setDefault&address_id='+address_id,
        dataType: 'json',
        beforeSend: function() {
            $(e).button('loading');
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $(e).button('reset');
                alert(json['error']);
            } else {
                getShippingAddress();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Delete Address
function delAddress(address_id, e){
    if(!confirm('Are You Sure ?')) return false;
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/delete&address_id='+address_id,
        dataType: 'json',
        beforeSend: function() {
            $(e).button('loading');
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $(e).button('reset');
                alert(json['error']);
            } else {
                getShippingAddress();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Save Shipping Address
function saveAddress(e) {
    var address_id = $(e).attr('aid');
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/save&address_id='+address_id,
        type: 'post',
        data: $('#collapse-shipping-address input[type=\'hidden\'], #collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
        dataType: 'json',
      
        success: function(json) {
        
          console.log(json);
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
            


                for (i in json['error']) {
                    var element = $('#input-shipping-' + i.replace('_', '-'));

                    if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<p class="ts_ps">' + json['error'][i] + '</p>');
                    } else {
                        $(element).after('<p class="ts_ps">' + json['error'][i] + '</p>');
                    }
                }

            
            } else{
               getShippingAddress();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Edit Country
$('#input-shipping-country').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',

		success: function(json) {
		

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo ($eaddress?$eaddress['zone_id']:$zone_id); ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#input-shipping-zone').html(html).trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#input-shipping-country').trigger('change');

$(document).ready(function() {

<?php if($payment_type=="Express" && empty($addresses)) { ?>
    setTimeout(function(){
        $.ajax({
            url: 'index.php?route=checkout/shipping_address/save',
            type: 'post',
            data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
            dataType: 'json',
            success: function(json) {
                $('#collapse-shipping-address .alert, #collapse-shipping-address .text-danger').remove();
                checkSAStatus = 1;
                if (json['error']) {
                    checkSAStatus = 0;
                    if (json['error']['warning']) {
                        $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                    for (i in json['error']) {
                        var element = $('#input-shipping-' + i.replace('_', '-'));
                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }
                    // Highlight any found errors
                    $('.text-danger').parent().parent().addClass('has-error');
                }
            }
        });
    }, 1000);
<?php } ?>



});
//为国家地区下拉列表添加二级搜索框
$(document).ready(function(){
  $("#input-shipping-country").select2();
  $("#input-shipping-zone").select2();
});


//--></script>
<script type="text/javascript">
  $(function(){
//    yd选择支付地址
    $(".zf_1 .zf_1_ol>li").click(function(){
      $(this).addClass("active").siblings().removeClass("active");
    })
    
//    pc选择支付地址
    $(".address_ul>li").click(function(){
      let li_len = $(".address_ul>li").length;
      if($(this).index()+1 != li_len){
        $(this).addClass("active").siblings("li").removeClass("active");
      }
    })
    
    //点击下一步操作按钮
    $(".address_content .btn240").click(function(){
      
      //展开第二步操作的内容
      $(".div_two").slideDown();
    })
    
    //第二步操作的单选
    $(".dx_label input").click(function(){
      if($(this).prop("checked")){
        $(this).siblings(".check_i").addClass("active");
        
      }else{
        $(this).siblings(".check_i").removeClass("active");
      }
    })
    
  })
</script>