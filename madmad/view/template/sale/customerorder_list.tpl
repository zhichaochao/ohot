<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
    <div class="pull-right">
    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="取消" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      
    </div>
  </div>
  <div class="container-fluid">


    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">

        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-order-status">订单状态</label>
            
                  <?php foreach ($order_statuses as $order_status) { ?>
                  
                  <?php
                      $orderstatus=array("Pending","Shipped","Paid","Complete","Canceled","Refunded");  
                      if( in_array($order_status['name'],$orderstatus) ){    
                  ?>
                  
                  <?php if ($order_status['order_status_id'] == $filter_order_status|| in_array($order_status['order_status_id'],$filter_order_status)  ) { ?>

                   <input class='order_status_ids' type="checkbox" name="id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked">
                  <em ><?php echo $order_status['name']; ?></em>
                <?php } else { ?>
                     <input class='order_status_ids' type="checkbox" name="id[]"  value="<?php echo $order_status['order_status_id']; ?>">
                  <em ><?php echo $order_status['name']; ?></em>
                  <?php } ?>
                  
                  <?php } ?> 
                  <?php } ?>
              </div> 
              
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added">查询开始日期<em style="color: red;">**</em></label>
                <div class="input-group date">
                  <input type="text" name="filter_orderdate_added" value="<?php echo $filter_orderdate_added; ?>" placeholder="开始日期" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                  </div>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added">查询结束日期<em style="color: red;">**</em></label>
                <div class="input-group date">
                  <input type="text" name="filter_orderdate_end" value="<?php echo $filter_orderdate_end; ?>" placeholder="结束日期" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                  </div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> 筛选器</button>
            </div>
          </div>
        </div>
        
        <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                 
                  <td class="text-center"><?php echo $column_order_id; ?></td>
                  <td class="text-left"><?php echo $column_order_no; ?></td>
                  <td class="text-left"><?php echo $column_customer; ?></td>
                  
                  <td class="text-left"><?php echo $column_status; ?></td>
                  <td class="text-left"><?php echo $entry_payment_method; ?></td>
                  <td class="text-right"><?php echo $column_total; ?></td>
                  <td class="text-left"><?php echo $column_date_added; ?></td>
                  <td class="text-left"><?php echo $column_date_modified; ?></td>
                  <td class="text-left">阅览</td>
                  <td class="text-right"> <?php if ($orders) { ?><span style="color: red;">总额:<?php echo $zquantitys; ?>美元</span><?php } ?>&nbsp&nbsp&nbsp&nbsp<?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
				          
                  <td class="text-center"><?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['order_no']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  
                  <td class="text-left"><?php echo $order['status']; ?></td>
                  <td class="text-left"><?php echo $order['payment_method']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['date_modified']; ?></td>
                  <td class="text-left">
                  <?php if($order['reading']==0){?> <em style="color: red;">未读</em><?php }else{ ?><em>已读</em><?php } ?>
                  </td>
                  <td class="text-right">
                      <a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="查看" class="btn btn-info"><i class="fa fa-eye"></i></a>
                  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        
      </div>
    </div>
  </div><script type="text/javascript"><!--

$('#button-filter').on('click', function() {
  url = 'index.php?route=sale/customer/edit&token=<?php echo $token; ?>'+'<?php echo $url; ?>';


  var k=0;
  var status='';
   $('.order_status_ids').each( function( ) {
    $(this).val();
    if ($(this).is(":checked")) {
      if (k==0) {status+=$(this).val();}else{
        status+=','+$(this).val();
      }
      k++;
     }
   }
   )

  if (status) {
    url += '&filter_order_status=' + encodeURIComponent(status);
  }   
  var filter_orderdate_added = $('input[name=\'filter_orderdate_added\']').val();
  
  if (filter_orderdate_added) {
    url += '&filter_orderdate_added=' + encodeURIComponent(filter_orderdate_added);
  }
  var filter_orderdate_end = $('input[name=\'filter_orderdate_end\']').val();
  
  if (filter_orderdate_end) {
    url += '&filter_orderdate_end=' + encodeURIComponent(filter_orderdate_end);
  }
  location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});
//--></script>
 </div>
<?php echo $footer; ?> 