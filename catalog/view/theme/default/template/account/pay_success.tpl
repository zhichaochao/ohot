<?php echo $header; ?>
<!--内容-->
    <div class="content in_content success">
      <img class="sg_img" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/successful.png"/>
      <h1>Congratulations !</h1>
      <p>
        You have successfully uploaded your payment proof,once we receive your money,<br />
        your order will be arranged to ship in 48-72 working hours.
      </p>
      <div class="btn clearfix">
        <a class="a_btn1" href="<?php echo  $vieworder?>">ORDER REVIEW</a>
        <a class="a_btn2" href="<?php echo  $shopping?>">CONTINUE SHOPPING</a>
      </div>
    </div>
<?php echo $footer; ?>

<script type="text/javascript">
$(function(){
  $(".yd_footer , .yd_footer2").addClass("hide");
})

//触发发邮件动作
  $(document).ready(function() {
      sendEmail();
  });

  //发邮件的方法
  function sendEmail(){
    // alert(12121212);
    $.ajax({
          url: 'index.php?route=checkout/success/sendEmail_1',
          type: 'post',
      });
  }
</script>

