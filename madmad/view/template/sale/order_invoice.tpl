<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<!-- <link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" /> -->
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<!-- <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" /> -->
<!-- <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" /> -->
</head>
<style>
html, body {height: 100%;margin: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;
font-family: 'Open Sans', sans-serif;font-size: 12px;color: #666666;text-rendering: optimizeLegibility;}
h1, h2, h3, h4, h5, h6, p {margin-top: 0;}
.table {width: 100%;max-width: 100%;margin-bottom: 20px;}
.table > thead > tr > th,.table > tbody > tr > th,.table > tfoot > tr > th,.table > thead > tr > td,
.table > tbody > tr > td,.table > tfoot > tr > td {padding: 8px;line-height: 1.42857143;vertical-align: top;border-top: 1px solid #ddd;}
.table > thead > tr > th {vertical-align: bottom;border-bottom: 2px solid #ddd;}
.table > caption + thead > tr:first-child > th,.table > colgroup + thead > tr:first-child > th,
.table > thead:first-child > tr:first-child > th,.table > caption + thead > tr:first-child > td,
.table > colgroup + thead > tr:first-child > td,.table > thead:first-child > tr:first-child > td {border-top: 0;}
.table > tbody + tbody {border-top: 2px solid #ddd;}
.table .table {background-color: #fff;}
.table-bordered th,.table-bordered td {border: 1px solid #ddd !important;}
.table-bordered {border: 1px solid #ddd;}
.table-bordered > thead > tr > th,.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,.table-bordered > tfoot > tr > td {border: 1px solid #ddd;}
.table-bordered > thead > tr > th,.table-bordered > thead > tr > td {border-bottom-width: 2px;}
address {margin-bottom: 20px;font-style: normal;line-height: 1.42857143;}
.container {padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;max-width: 1200px;}
.container-fluid {padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
table {border-spacing: 0;border-collapse: collapse;}
td,th { padding: 0;}
.table thead td span[data-toggle="tooltip"]:after, label.control-label span:after {color: #1E91CF;margin-left: 4px;}
.table thead td {font-weight: bold;}
.table thead > tr > td, .table tbody > tr > td {vertical-align: middle;}
.table a.asc:after {font-size: 14px;}
.table a.desc:after {font-size: 14px;}
</style>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always; margin-top: 30px;">
   <!--<h1><?php echo $text_invoice; ?> #<?php echo $order['order_id']; ?></h1>-->
    <button type="button" class="dy_btn noprint" onclick=" window.print();">打印(转化为PDF)</button>
    <!-- <a type="button" class="dy_btn noprint" id="button" >导出(转化为Excel)</a> -->
    <a download="订单<?php echo $order['order_id']; ?>Excel" id="excelOut" href="#" class="dy_btns">导出(转化为Excel)</a>
    <table class="table table-bordered"  border="1" cellspacing="0" id="tableToExcel">
      <thead>
        <tr>
          <td colspan="5" align="center"><b style="font-size: 32px;">Commercial Invoice</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="2" ><address style="font-style: normal; font-size:15px;" >
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
          <td><b><?php echo $column_model; ?>&nbsp&nbsp&nbsp&nbsp</b></td>
          <td class="text-right"><b>Quantity</b></td>
          <td class="text-right"><b>Unit Price</b></td>
          <td class="text-right"><b>Amount</b></td>
        </tr>
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small style="font-size:13px;"> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
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
           <?php foreach ($order['total'] as $total) { ?>
        <tr>
          <td class="text-right" colspan="4"><b><?php echo $total['title']; ?></b></td>
          <td class="text-right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
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
<!-- <script>
        var html = "<html><head><meta charset='utf-8'  /></head><body>" + document.getElementsByTagName("table")[0].outerHTML+ document.getElementsByTagName("table")[1].outerHTML +"</body></html>";
        var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        var a = document.getElementsByTagName("a")[0];
        a.href = URL.createObjectURL(blob);
        a.download = "订单"+"<?php echo $order['order_id']; ?>"+".xlsx";
</script> -->
<script>
    window.onload = function () {
        tableToExcel('tableToExcel', '下载模板')
    };
    //base64转码
    var base64 = function (s) {
        return window.btoa(unescape(encodeURIComponent(s)));
    };
    //替换table数据和worksheet名字
    var format = function (s, c) {
        return s.replace(/{(\w+)}/g,
            function (m, p) {
                return c[p];
            });
    }
    function tableToExcel(tableid, sheetName) {
        var uri = 'data:application/vnd.ms-excel;base64,';
        var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"' +
            'xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'+ 
            '<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>'+ 
            '</x:ExcelWorkbook></xml><![endif]-->' +
            ' <style type="text/css">' +
            'html, body {height: 100%;margin: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;' +
'font-family: "Open Sans", sans-serif;font-size: 28px;color: #666666;text-rendering: optimizeLegibility;}' +
'h1, h2, h3, h4, h5, h6, p {margin-top: 0;}' +
'.table {width: 100%;max-width: 100%;margin-bottom: 20px;}' +
'.table > thead > tr > th,.table > tbody > tr > th,.table > tfoot > tr > th,.table > thead > tr > td,' +
'.table > tbody > tr > td,.table > tfoot > tr > td {padding: 8px;line-height: 1.42857143;vertical-align: top;border-top: 1px solid #ddd; font-size:20px;}' +
'.table > thead > tr > th {vertical-align: bottom;border-bottom: 2px solid #ddd;}' +
'.table > caption + thead > tr:first-child > th,.table > colgroup + thead > tr:first-child > th,' +
'.table > thead:first-child > tr:first-child > th,.table > caption + thead > tr:first-child > td,' +
'.table > colgroup + thead > tr:first-child > td,.table > thead:first-child > tr:first-child > td {border-top: 0;}' +
'.table > tbody + tbody {border-top: 2px solid #ddd;}' +
'.table .table {background-color: #fff;}' +
'.table-bordered th,.table-bordered td {border: 1px solid #ddd !important;}' +
'.table-bordered {border: 1px solid #ddd;}' +
'.table-bordered > thead > tr > th,.table-bordered > tbody > tr > th,' +
'.table-bordered > tfoot > tr > th,.table-bordered > thead > tr > td,' +
'.table-bordered > tbody > tr > td,.table-bordered > tfoot > tr > td {border: 1px solid #ddd;}' +
'.table-bordered > thead > tr > th,.table-bordered > thead > tr > td {border-bottom-width: 2px;}' +
'address {margin-bottom: 20px;font-style: normal;line-height: 1.42857143;}' +
'.container {padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;max-width: 1200px;}' +
'.container-fluid {padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}' +
'table {border-spacing: 0;border-collapse: collapse;}' +
'td,th { padding: 0;}' +
'.table thead td span[data-toggle="tooltip"]:after, label.control-label span:after {color: #1E91CF;margin-left: 4px;}' +
'.table thead td {font-weight: bold;}' +
'.table thead > tr > td, .table tbody > tr > td {vertical-align: middle;}' +
'.table a.asc:after {font-size: 18px;}' +
'.table a.desc:after {font-size: 18px;}' +
'b {font-size: 18px;}' +
            '</style>' +
            '</head><body ><table class="excelTable">{table}</table></body></html>';
        if (!tableid.nodeType) tableid = document.getElementById(tableid);
        var ctx = {worksheet: sheetName || 'Worksheet', table: tableid.innerHTML};
        document.getElementById("excelOut").href = uri + base64(format(template, ctx));
    }

</script>