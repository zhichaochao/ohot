<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
     <!--  <div class="pull-right">
        <a href="<?php echo $importComment; ?>" id="exportData" data-toggle="tooltip" title="import" class="btn btn-success">
         导入
        </a>
        <a href="<?php echo $exportComment; ?>" class="btn btn-success">导出</a>
      </div> -->
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
      <?php foreach ($url_cust as $k=>$v) { ?>
        <a class="<?=$key==$v['key'] ?'active zz':'';?>" href="<?php echo $url_key.'&key='.$v['key']; ?>" > <?php echo $v['name']; ?> </a>
        <?php }?>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-order-status">订单状态</label>
                <select name="filter_order_status" id="input-order-status" class="form-control">
                  <option value="*"></option>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  
                  <?php
                      $orderstatus=array("Pending","Paid","Shipped","Complete","Canceled","Refunded");  
                      if( in_array($order_status['name'],$orderstatus) ){    
                  ?>
                  
                  <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  
                  <?php } ?> 
                  <?php } ?>
                </select>
              </div> 
              
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added">查询开始日期</label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="开始日期" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                  </div>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added">查询结束日期</label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="结束日期" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                  </div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-customer">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                 <!--  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td> -->
                  <td class="text-left">订单ID</td>
                  <td class="text-left">用户名</td>
                  <td class="text-left">订单号</td>
                  <td class="text-left"><?php echo $column_status; ?></td>
                  <td class="text-left">下单时间</td>
                  <td class="text-left">修改时间</td>
                  <td class="text-left">订单价格</td>
                   <?php if ($salesdatas) { ?>
                  <td class="text-left" style="color: red;">总价:<?php echo $zquantitys; ?>美元||总量:<?php echo $SalesStationtotal; ?>条</td>
                   <?php } ?>
                </tr>
              </thead>
              <tbody>
                <?php if ($salesdatas) { ?>
                <?php foreach ($salesdatas as $salesdata) { ?>
                <tr>
              <!--     <td class="text-center"><?php if (in_array($customer['customer_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $customer['customer_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $customer['customer_id']; ?>" />
                    <?php } ?></td> -->
                  <td class="text-left"><?php echo $salesdata['order_id']; ?></td>
                  <td class="text-left"><?php echo $salesdata['customer']; ?></td>
                  <td class="text-left"><?php echo $salesdata['order_number']; ?></td>
                  <td class="text-left"><?php echo $salesdata['order_status']; ?></td>
                  <td class="text-left"><?php echo $salesdata['date_added']; ?></td>
                  <td class="text-left"><?php echo $salesdata['date_modified']; ?></td>
                  <td class="text-left"><?php echo $salesdata['total']; ?></td>
                  
                
                <?php } ?>

                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <style>
    a.active.zz{font-weight: bold;color:#dd2020;}
  </style>
  <script type="text/javascript"><!--
function jump(href) {
 window.location.href=href;
}
$('#button-filter').on('click', function() {
	url = 'index.php?route=sale/salesdata&token=<?php echo $token; ?>&key=<?php echo $key; ?>';

  var filter_order_status = $('select[name=\'filter_order_status\']').val();
  if (filter_order_status != '*') {
    url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
  }
		
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
	var filter_date_end = $('input[name=\'filter_date_end\']').val();
  
  if (filter_date_end) {
    url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
  }
	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
// $('input[name=\'filter_name\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
// 			dataType: 'json',			
// 			success: function(json) {
// 				response($.map(json, function(item) {
// 					return {
// 						label: item['name'],
// 						value: item['customer_id']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		$('input[name=\'filter_name\']').val(item['label']);
// 	}	
// });

// $('input[name=\'filter_email\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
// 			dataType: 'json',			
// 			success: function(json) {
// 				response($.map(json, function(item) {
// 					return {
// 						label: item['email'],
// 						value: item['customer_id']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		$('input[name=\'filter_email\']').val(item['label']);
// 	}	
// });
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?> 
