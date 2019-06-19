<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always; margin-top: 30px;">
   <!--<h1><?php echo $text_invoice; ?> #<?php echo $order['order_id']; ?></h1>-->
    <button type="button" class="dy_btn noprint" onclick=" window.print();">打印(转化为PDF)</button>
    <a type="button" class="dy_btn noprint" id="button" >导出(转化为Excel)</a>
    <table class="table table-bordered"  border="1" cellspacing="0">
      <thead>
        <tr>
          <td colspan="5" align="center"><b style="font-size: 32px;">Commercial Invoice</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="2" ><address style="font-style: normal;">
            <strong style="font-style: normal;">From: Hot Beauty Hair Products Co., Ltd.</strong><br />
           Add: <?php echo $order['store_address']; ?>
            </address>
            <b>Phone#:</b> <?php echo $order['store_telephone']; ?><br />
            <?php if ($order['store_fax']) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
            <?php } ?>
            <b>Email:</b> <?php echo $order['store_email']; ?><br />
            <b>Website:</b> <?php echo $order['store_url']; ?></td>
          <td colspan="3"><b>Date:</b> <?php echo $order['date_added']; ?><br />
            <?php if ($order['invoice_no']) { ?>
            <b>Invoice No.:</b> <?php echo $order['invoice_no']; ?><br />
            <?php } ?>
            <b>Order No.:</b> <?php echo $order['order_id']; ?><br />
            <b>Payment Method:</b> <?php echo $order['payment_method']; ?><br />
            <?php if ($order['shipping_method']) { ?>
            <b>Shipment Method:</b> <?php echo $order['shipping_method']; ?><br />
            <?php } ?></td>
        </tr>
        <tr>
            <td colspan="2"  style="width:50%" >
              <b style="height:20px;">Payment Address:</b>
            </td>
            <td colspan="3"  style="width:50%" >
            <b>Shipping Address:</b>
            </td>
        </tr>
         <tr>
            <td  colspan="2" >
           <address style="font-style: normal;">
            <?php echo $order['payment_address']; ?>
            </address>
            </td>
            <td  colspan="3" >
            <address style="font-style: normal;">
            <?php echo $order['shipping_address']; ?>
            </address>
            </td>
        </tr>
        <tr>
          <td><b>Product Name</b></td>
          <td><b><?php echo $column_model; ?></b></td>
          <td class="text-right"><b>Quantity</b></td>
          <td class="text-right"><b>Unit Price</b></td>
          <td class="text-right"><b>Amount</b></td>
        </tr>
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['price']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['voucher'] as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td></td>
          <td class="text-right">1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>

    <table class="table table-bordered"  border="1">  
       <thead>
        <?php foreach ($order['total'] as $total) { ?>
        <tr>
          <td class="text-right" colspan="4"><b><?php echo $total['title']; ?></b></td>
          <td class="text-right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>

      </thead>
    </table>
    <style media="print">
      .noprint{display : none }
    </style>
    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php echo $text_comment; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['comment']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>
  </div>
  <?php } ?>
</div>
</body>

</html>
<script>
        var html = "<html><head><meta charset='utf-8'  /></head><body>" + document.getElementsByTagName("table")[0].outerHTML+ document.getElementsByTagName("table")[1].outerHTML +"</body></html>";
        var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        var a = document.getElementsByTagName("a")[0];
        a.href = URL.createObjectURL(blob);
        a.download = "订单"+"<?php echo $order['order_id']; ?>"+".xlsx";
</script>
