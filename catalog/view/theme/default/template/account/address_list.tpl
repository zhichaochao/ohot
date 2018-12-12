<?php echo $header; ?>
<!--内容-->
    <div class=" in_content peo_center">


      <div class="content clearfix">
        
        <div class="left clearfix">
          <h1>MY ACCOUNT</h1>
          <ol>

            <?php echo $account_left; ?>
          </ol>
        </div>
          <?php if ($addresses) { ?>
        <div class="right m_add clearfix">        
          <ul class="clearfix">
         
           <?php foreach ($addresses as $result) { ?>
          <?php if($result['isshowdelete']==1){ ?>
            <li>           
              <div class="text">
                <p><?php echo $result['address']; ?></p>
                 
                <div class="close" onclick="del_address('<?php echo $result['delete'];?>')" class="btn btn-danger"></div>
                  <span style="display: block;font-size: 0.83vw;position: absolute;bottom: 10px;left: 15px" onclick="javascript:default_address('<?php echo $result['address_id']; ?>');">Set As Default Address</span>
                <a class="a_img" href="<?php echo $result['update']; ?>"></a>
              </div>
            </li>
            <?php }else{ ?>
            <li class="active">
              <div class="text">
                <p><?php echo $result['address']; ?></p>
                <span>Default Address</span>
                <a class="a_img" href="<?php echo $result['update']; ?>"></a>
              </div>
            </li>

            <?php } }?>
          </ul>
          <a class="a_btn clearfix" href="<?php echo $add; ?>">Add New Address</a>
        </div> 

            <?php }else{?>  
            <div class="right m_account clearfix">
          
              <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/address.png"/>
              <p>You currently have no addresses saved </p>
              <a class="a_btn" href="<?php echo $add; ?>">ADD ADDRESS &nbsp;&nbsp;&nbsp;></a>
              
            </div>

            <?php } ?>
      </div>  
    </div>
<script>
function default_address(address_id){
     $.ajax({
     url: 'index.php?route=account/address/edit_default',
     type: 'post',
     data: {address_id:address_id},
     dataType: 'json',     
     success: function(json) {
       location.reload();
      }
   })
}
function del_address(url){
	if(confirm('Are You Sure?')){
		location.href=url;
	}
}
</script>
<script>
  // $(function(){
  //   $(".m_add>ul>li").click(function(){
  //     $(this).addClass("active").siblings("li").removeClass("active");
  //   })
  // })
</script>
<?php echo $footer; ?>
<?php if ($success) { ?>

    <script type="text/javascript">
alert('<?php echo $success; ?>');
</script>

  <?php } ?>

  <?php if ($error_warning) { ?>

    <script type="text/javascript">
alert('<?php echo $error_warning; ?>');
</script>
  <?php } ?>