<?php echo $header; ?>
<!--内容-->
    <div class=" in_content peo_center">
      <div class="content clearfix"> 
        <div class="left yd_mycenter clearfix">
          <h1>MY ACCOUNT</h1>
          <ol>
            <?php echo $column_left; ?>
            
            <?php echo $account_left; ?>
          </ol>
        </div>        
      </div>   
    </div>
<?php echo $footer; ?>
<script type="text/javascript">
// //浏览器窗口从pc/yd改变的时候刷新页面
  var old_w = $(window).width();
      // var win =$(window).width();

  // $(window).resize(function(){
  //   var new_w = $(window).width();
      if(old_w>920){
        location.href="<?=$account_order?>";
      }
</script>