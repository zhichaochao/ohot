<?php echo $header; ?>
<div class="content in_content success">
	<div class="fa-content-main fixclea">
		<img class="sg_img" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/errorful.png"/>
			<h1>An Error Occured In The Process Of Payment</h1>

			<p>You may:</p>
			<p>1.Clice <a href="<?php echo $order_list; ?>">here</a> to see and re-pay the order.</p>
			<p>2.pls <a href="<?php echo $contact; ?>">contact us</a> for help enclosed your order number.</p>
			<p>3.Clice <a href="<?php echo $continue; ?>">here</a> to continue shopping.</p>

		</div>

	</div>


<?php if(isset($order) && !empty($order_no)){ ?>
<script>
// 增强电子商务代码
dataLayer.push({
	'event': 'measuringPurchases',
  'ecommerce': {
	'currencyCode':'USD',
        'purchase': {
          'actionField': {
            'id': '<?php echo $order_no;?>', 
            'affiliation': 'Hot Beauty Hair',
            'revenue': '<?php echo $order["total"];?>',
            'tax':'0',
            'shipping': '<?php echo $shipping_fee;?>',
            'coupon': ''
          },
          'products':<?php echo json_encode($gtm_products);?> 
        }
  }
});
</script>
<?php } ?>
<?php echo $footer; ?>