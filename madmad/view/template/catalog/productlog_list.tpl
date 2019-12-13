<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  
  <div class="container-fluid">
    
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name">修改内容</label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="修改内容" id="input-name" class="form-control" />
              </div>
            <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
            </div>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                 
                  <td class="text-center">序号</td>
                  <td class="text-center">修改人</td>
                  <td class="text-center">ip</td>
                  <td class="text-center">产品ID</td>
                  <td class="text-center">修改内容</td>
                  <td class="text-center">修改时间</td>
                </tr>
              </thead>
              <tbody>
                <?php if ($productslog) { ?>
                <?php foreach ($productslog as $product) { ?>
                <tr>
                  <td class="text-left"><?php echo $product['id']; ?></td>
                  <td class="text-left"><?php echo $product['username']; ?></td>
                  <td class="text-left"><?php echo $product['ip']; ?></td>
                  <td class="text-left"><?php echo $product['product_id']; ?></td>
                  <td class="text-left"><?php echo $product['content']; ?></td>
                  <td class="text-left"><?php echo $product['data_added']; ?></td>
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
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--


$('#button-filter').on('click', function() {
	var url = 'index.php?route=catalog/productlog&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	
	location = url;
});
//--></script>
 </div>
<?php echo $footer; ?>