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
      <div class="panel-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right">总价</td> 
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><a href="<?php echo $product['href']; ?>  " target="_blank"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right">
                <?php if ($product['price'] == $product['original_price'] ) { ?>
                  <?php echo $product['price']; ?>
                <?php } else { ?>
                  <?php if(empty($product['original_price'])) { ?>
                    <?php echo $product['price']; ?>
                  <?php } else { ?>
                    <?php echo $product['price']; ?>
                    <del><?php echo $product['original_price']; ?></del>
                  <?php } ?>
                <?php } ?>
              </td>
              <td class="text-right"><?php echo $product['total']; ?>
              </td>
            </tr>
            <?php } ?>

             <tr>
          <td class="text-left"></td>
          <td class="text-left"></td>
          <td class="text-right"> Total Quantity: <?php echo $zquantitys?></td>
          <td class="text-right"></td>
          <td class="text-left">Total Price: <?php echo $zquantotal?></td>

        
            </tr>
            

          </tbody>
        </table>
      </div>
    </div>  </div></div>
 

<?php echo $footer; ?> 
