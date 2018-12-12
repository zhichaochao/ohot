<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/common.css" />
    <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/index.css" />
    <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/jquery.min.js" ></script>
    <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/common.js" ></script>
     <?php if(!empty($eaddress)){?>
    <div class="new_nav pc_hide clearfix">
        <a class="fh" href="<?php echo $home?>"></a>
        <p>EDIT SHIPPING ADDRESS</p>
      </div>
<?php }else{?>
<div class="new_nav pc_hide clearfix">
        <a class="fh" href="<?php echo $home?>"></a>
        <p>ADD SHIPPING ADDRESS</p>
      </div>
<?php }?>
<div class="content  zf_13  ">
      
      <div class="zf_con clearfix">
        <div class="zfbt clearfix">
          <span>1</span>
          <h1>Shipping Address</h1>
          <?php if(!empty($eaddress)){?>

          <div class="del clearfix">
            <svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" onclick="delAddress('<?=$address_id?>',this)">
              <path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#333"></path>
              <path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#333"></path>
              <path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#333"></path>
            </svg>  
          </div>
          <?php }?>
        </div>
        
        <form method="post" id="collapse-shipping-address">
          <div class="form_div">

                <label for="input-shipping-firstname" class="clearfix">
                <!-- <span><?php echo $entry_firstname; ?> *</span> -->
                <input type="text" name="firstname" value="<?php echo ($eaddress ? $eaddress['firstname'] : ''); ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-shipping-firstname"  class=" clear" />
              </label>
            <!-- <label class="true clearfix" for="">
              <em class="gx"></em>
              <input type="text" value="BIHUI"/>
              <p class="ts_ps">please enter your  </p>
            </label> -->

            <label for="input-shipping-lastname" class="clearfix">
                <!-- <span><?php echo $entry_lastname; ?> *</span> -->
                <input type="text"  name="lastname" value="<?php echo ($eaddress ? $eaddress['lastname'] : ''); ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-shipping-lastname" class="form-control clear" />
              </label>
            <!-- <label class="clearfix" for="">
              <input type="text" value="Last Name"/>
              <p class="ts_ps off">please enter your Last Name</p>
            </label> -->
            <label class="add_label" for="input-shipping-address-1" class="clearfix" >
                <!-- <span><?php echo $entry_address_1; ?> *</span> -->
                <input type="text" name="address_1" value="<?php echo ($eaddress ? $eaddress['address_1'] : ''); ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-shipping-address-1" class="form-control clear" />
                <!-- <input  type="text" name="address_2" value="<?php echo ($eaddress ? $eaddress['address_2'] : ''); ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control clear"/> -->
              </label>

               <label class="add_label" for="input-shipping-address-1" class="clearfix" >
                <!-- <span><?php echo $entry_address_1; ?> *</span> -->
               
                <input  type="text" name="address_2" value="<?php echo ($eaddress ? $eaddress['address_2'] : ''); ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control clear"/>
              </label>

          <!--   <label class="clearfix" for="">
              <input type="text" value="Address1"/>
              <p class="ts_ps">please enter your Last Name</p>
            </label>
            <label class="clearfix" for="">
              <input type="text" value="Address2"/>
              <p class="ts_ps">please enter your Last Name</p>
            </label> -->
            <label class="w_48 fl clearfix" for="">
            <input  type="text" name="city" value="<?php echo ($eaddress ? $eaddress['city'] : ''); ?>" placeholder="<?php echo $entry_city; ?>" id="input-shipping-city" class="form-control clear" />
             <!--  <input type="text" value="City"/>
              <p class="ts_ps">please enter your Last Name</p> -->
            </label>
            <label class="w_48 fr clearfix" for="">
              <input  type="text" name="postcode" value="<?php echo $eaddress ? $eaddress['postcode'] : $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="form-control" />
             <!--  <input type="text" value="Post Code"/>
              <p class="ts_ps">please enter your Last Name</p> -->
            </label>

             <label for="input-shipping-country" class="w_48 fl clearfix">
                <!-- <span><?php echo $entry_country; ?> *</span> -->
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

           <!--  <label class="w_48 fl clearfix" for="">
              <select name="">
                <option value="">State</option>
                <option value="">State2</option>
                <option value="">State3</option>
                <option value="">State4</option>
              </select>
              <p class="ts_ps">please enter your Last Name</p>
            </label> -->
              <label class="w_48 fr clearfix" >
                <!-- <span><?php echo $entry_zone; ?> *</span> -->
                <select name="zone_id" id="input-shipping-zone" class="form-control">
      
                </select>
              </label>

            <!-- <label class="w_48 fr clearfix" for="">
              <select name="">
                <option value="">Country</option>
                <option value="">Country2</option>
                <option value="">Country3</option>
                <option value="">Country4</option>
              </select>
              <p class="ts_ps">please enter your Last Name</p>
            </label> -->
            <label class="clearfix" for="">
            <input type="text" name="telephone" value="<?php echo (isset($eaddress['telephone']) ? $eaddress['telephone'] : ''); ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-shipping-telephone" class="form-control clear">
              <!-- <input type="text" value="+2345601634559"/> -->
              <!-- <p class="ts_ps">please enter your Last Name</p> -->
            </label>
            <!-- <div class="def_kg clearfix">
              <p>Set default address</p>
              <span class="kg " id=""></span>
            </div> -->
            <a class="tj_a clear"  id="btnSaveAddress" aid="<?php echo ($eaddress ? $eaddress['address_id'] : 0); ?>" onclick="saveAddress(this);"  />SAVE   ></a>
             <input  type="hidden" value="" name="company" />
          </div>
        </form>
      </div>
    </div>
    <script>
    // $(function(){
    $(".def_kg .kg").click(function(){
      if($(this).hasClass("active")){
        $(this).removeClass("active");
      }else{
        $(this).addClass("active");

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
    })

  // }
  // Delete Address
function delAddress(address_id){
  // console.log(address_id);
    // if(!confirm('Are You Sure ?')) return false;
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/delete&address_id='+address_id,
        dataType: 'json',
        // beforeSend: function() {
        //     $(e).button('loading');
        // },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                // $(e).button('reset');
                alert(json['error']);
            } else {
              location = '<?=$checkout?>';
                // getShippingAddress();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
    // Save Shipping Address
function saveAddress(e) {
    // console.log(e);
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
              location='<?=$checkout?>'
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
function getShippingAddress(address_id)
{

    $.ajax({
        url: 'index.php?route=checkout/shipping_address&address_id='+address_id,
        dataType: 'html',
        success: function(html) {
            $('#shipping_address').html(html);
        $('.address_ul li').removeClass('active');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
        // getShippingMethod();
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
$('#collapse-shipping-address select[name=\'country_id\']').trigger('change');
    </script>
