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
                  <td class="text-right"><?php echo $column_action; ?></td>
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
  </div>
 </div>
<?php echo $footer; ?> 