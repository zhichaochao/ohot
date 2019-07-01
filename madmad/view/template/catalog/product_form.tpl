<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; echo $language_default_id;?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
        <!-- 被舍去的字段 -->
          <input type="hidden" name="sku" value="" />
          <input type="hidden" name="upc" value="" />
          <input type="hidden" name="ean" value="" />
          <input type="hidden" name="jan" value="" />
          <input type="hidden" name="isbn" value="" />
          <input type="hidden" name="mpn" value="" />
          <input type="hidden" name="location" value="" />
          <input type="hidden" name="price" value="" />
          <input type="hidden" name="relation_product" value="" />
          <input type="hidden" name="is_main" value="" />
          <input type="hidden" name="is_home" value="" />
          <input type="hidden" name="discount_percentage" value="" />
            <!-- //被舍去的字段 -->
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-option" data-toggle="tab">价格</a></li>
            <li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
            <?php if($product_additionals){?>
            <li><a href="#tab-rewards" data-toggle="tab">加购价</a></li>
            <?php }?>
          </ul>
         
          <div class="tab-content">
            <div class="tab-pane active" id="tab-option">
              <div class="row">
                <div class="col-sm-2" style="width: 10%; position: relative;">
                  <ul class="nav nav-pills nav-stacked" id="option">
                    <?php $option_row = 0; ?>
                    <?php  foreach ($product_options as $product_option) { ?>
                    <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"></i> <?php echo $product_option['name']; ?></a></li>
                    <?php $option_row++; ?>
                    <?php } ?>
                  </ul>
                </div>
                <div class="col-sm-10" style="width:90%;">
                  <div class="tab-content">
                    <?php $option_row = 0; ?>
                    <?php $option_value_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
					   <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
                    <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                        <div class="col-sm-10">
                          <select name="product_option[<?php echo $option_row; ?>][required]" id="input-required<?php echo $option_row; ?>" class="form-control" readonly="readonly">
                            <?php if ($product_option['required']) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <?php if ($product_option['type'] == 'text') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" readonly="readonly"/>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'textarea') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <textarea name="product_option[<?php echo $option_row; ?>][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" readonly="readonly"><?php echo $product_option['value']; ?></textarea>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'file') { ?>
                      <div class="form-group" style="display: none;">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" readonly="readonly"/>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'date') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-3">
                          <div class="input-group date">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value<?php echo $option_row; ?>" class="form-control" readonly="readonly"/>
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'time') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group time">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" readonly="readonly"/>
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'datetime') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group datetime">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" readonly="readonly" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
                      <div class="table-responsive">
                        <table id="option-value<?php echo $option_row; ?>" class="table table-striped table-bordered table-hover">
                          <thead>
                          <tr>
                            <td class="text-left"><?php echo $entry_option_value; ?>(正常价是所有属性价格的叠加)</td>
                            <td class="text-right"><?php echo $entry_quantity; ?></td>
                            <!-- <td class="text-left"><?php echo $entry_subtract; ?></td> -->
                            <td class="text-right"><?php echo $entry_price; ?></td>
                             <?php foreach ($customer_groups as $customer_group) { ?>
                               <td class="text-right"><?php echo $customer_group['name']; ?></td>
                             <?php } ?>
                            <td class="text-right"><?php echo $entry_option_points; ?></td>
                            <td class="text-right"><?php echo $entry_weight; ?></td>
                            <td></td>
                          </tr>
                          </thead>
                          <tbody>
                          <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                          <!-- 被舍去的字段 -->
                          <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" value=''/>
                          <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" value='+'/>
                             <!--// 被舍去的字段 -->

                          <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" />
                          <tr id="option-value-row<?php echo $option_value_row; ?>">
                            <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control"  disabled="">
                                <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                                <?php } ?>
                              </select>
                            </td>
                            <td class="text-right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" readonly="readonly"/></td>
                            <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" value='1'/>
                           <!--  <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" class="form-control">
                                <?php if ($product_option_value['subtract']) { ?>
                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <option value="0"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_yes; ?></option>
                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                              </select></td> -->

                            <td class="text-right">
                              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" readonly="readonly" /></td>
                               <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                                <td class="text-right">
                              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price<?php echo $customer_group['customer_group_id']; ?>]" value="<?php echo $product_option_value['price'.$customer_group['customer_group_id']]; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" readonly="readonly"/></td>
                               <?php } else { ?>
                               <td class="text-right">
                              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price<?php echo $customer_group['customer_group_id']; ?>]" value="<?php echo $product_option_value['price'.$customer_group['customer_group_id']]; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                             <?php } ?>
                             <?php } ?>

                            <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" class="form-control" readonly="readonly" disabled="disabled">
                                <?php if ($product_option_value['points_prefix'] == '+') { ?>
                                <option value="+" selected="selected">+</option>
                                <?php } else { ?>
                                <option value="+">+</option>
                                <?php } ?>
                                <?php if ($product_option_value['points_prefix'] == '-') { ?>
                                <option value="-" selected="selected">-</option>
                                <?php } else { ?>
                                <option value="-">-</option>
                                <?php } ?>
                              </select>
                              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" placeholder="<?php echo $entry_points; ?>" class="form-control" readonly="readonly"/></td>
                            <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" class="form-control" readonly="readonly" disabled="disabled">
                                <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                                <option value="+" selected="selected">+</option>
                                <?php } else { ?>
                                <option value="+">+</option>
                                <?php } ?>
                                <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                                <option value="-" selected="selected">-</option>
                                <?php } else { ?>
                                <option value="-">-</option>
                                <?php } ?>
                              </select>
                              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" readonly="readonly"/></td>
                            <!-- <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td> -->
                          </tr>
                          <?php $option_value_row++; ?>
                          <?php } ?>
                          </tbody>
                          <tfoot>
                          <tr>
                            <td colspan="6"></td>
                           <!--  <td class="text-left"><button type="button" onclick="addOptionValue('<?php echo $option_row; ?>');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td> -->
                          </tr>
                          </tfoot>
                        </table>
                      </div>
                      <select id="option-values<?php echo $option_row; ?>" style="display: none;">
                        <?php if (isset($option_values[$product_option['option_id']])) { ?>
                        <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      <?php } ?>
                    </div>
                    <?php $option_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-special">
              <div class="table-responsive">
              <?php if ($error_special) { ?>
                  <div class="text-danger"><?php echo $error_special; ?></div>
              <?php } ?>
              <div class="form-group" style="height: 0;overflow: hidden; padding: 0;">
                <label class="col-sm-2 control-label"><?php echo $entry_sync_percent; ?></label>
                <div class="col-sm-10" >
                  <label class="radio-inline">
                    <input type="radio" name="sync_percent" value="1" <?php if($sync_percent == 1) echo 'checked="checked"'; ?>/>
                    <?php echo $text_yes; ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="sync_percent" value="0" <?php if($sync_percent == 0) echo 'checked="checked"'; ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
                <table id="special" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">参与优惠的尺寸<br/>(如果不存在这个尺寸请先保存填写的尺寸)</td>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <!-- <td class="text-right"><?php echo $entry_priority; ?></td> -->
                      <td class="text-right">直减(正常价减去下边的价格)</td>
                      <td class="text-right"><?php echo $entry_percent; ?>（正常价的比例）（优先）<br/>0代表不使用百分比</td>
                      <td class="text-left"><?php echo $entry_date_start; ?> <span style="color:#ff0000;">*必填项</span></td>
                      <td class="text-left"><?php echo $entry_date_end; ?> <span style="color:#ff0000;">*必填项</span></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>

                    <?php $special_row = 0; ?>
                    <?php foreach ($product_specials as $product_special) { ?>
                    <input type="hidden" name="product_special[<?=$special_row?>][product_special_id]" value="<?=$product_special['product_special_id']?>"/>
                    <tr id="special-row<?php echo $special_row; ?>">
                      <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][product_option_value_id]" class="form-control">
                         <option value="0">全部尺寸都参与</option>
                          <?php if($special_options){ foreach ($special_options as $special_option) { ?>
                          <?php if ($special_option['product_option_value_id'] == $product_special['product_option_value_id']) { ?>
                          <option value="<?php echo $special_option['product_option_value_id']; ?>" selected="selected"><?php echo $special_option['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $special_option['product_option_value_id']; ?>"><?php echo $special_option['name']; ?></option>
                          <?php } ?>
                          <?php } }?>
                        </select></td>
                      <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                          <option value="0">全部客户都参与</option>
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <!-- <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td> -->
                      <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][percent]" value="<?php echo $product_special['percent']; ?>" placeholder="<?php echo $entry_percent; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $special_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="6"></td>
                      <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-rewards">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">加购区间</td>
                      <td class="text-left">加购价格</td>
                      <td class="text-left">原价</td>
                    </tr>
                  </thead>
                  <tbody>
                  <?php if($product_additionals){?>
                   <?php foreach ($product_additionals as $k=> $additional) { ?>
                    <tr>
                      <td class="text-left">满<input type="text" name="product_additionals[<?php echo $additional['additional_id']; ?>][fullprice]" value="<?php echo $additional['fullprice']; ?>" class="form-control" style="width: 50%;margin-left:20px;" readonly="readonly" /></td>
                      <td class="text-right"><input type="text" name="product_additionals[<?php echo $additional['additional_id']; ?>][addprice]" value="<?php echo $additional['addprice']; ?>" class="form-control" readonly="readonly" /></td>
                      <td class="text-right"><input type="text" name="product_additionals[<?php echo $additional['additional_id']; ?>][originalprice]" value="<?php echo $additional['originalprice']; ?>" class="form-control" readonly="readonly"/></td>
                    </tr>
                     <?php } ?>
                     <?php } ?>
                  
                  </tbody>
                </table>
              </div>
            </div>
           </div>
      
 
          </div>
        </form>
      </div>
    </div>
  </div>
  <script src="view/javascript/fileupload/jquery.ui.widget.js"></script>
  <script src="view/javascript/fileupload/jquery.iframe-transport.js"></script>
  <script src="view/javascript/fileupload/jquery.fileupload.js"></script>
  <script src="view/javascript/fileupload/jquery.xdr-transport.js"></script>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>


  <script type="text/javascript" ><!--
// Manufacturer

$('#tab-option').on('click', function() {
  $('#input-option').click();
  
})

$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val(item['label']);
		$('input[name=\'manufacturer_id\']').val(item['value']);
	}
});

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Filter
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#product-filter' + item['value']).remove();

		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
  <script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

	$('#attribute tbody').append(html);

	attributeautocomplete(attribute_row);

	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
		}
	});
}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script>
  <script type="text/javascript"><!--
      var option_row = <?php echo $option_row; ?>;

      $('input[name=\'option\']').autocomplete({
          'source': function(request, response) {
              $.ajax({
                  url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                  dataType: 'json',
                  success: function(json) {
                      response($.map(json, function(item) {
                          return {
                              category: item['category'],
                              label: item['name'],
                              value: item['option_id'],
                              type: item['type'],
                              option_value: item['option_value']
                          }
                      }));
                  }
              });
          },
          'select': function(item) {
              html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
              html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
              html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
              html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
              html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

              html += '	<div class="form-group">';
              html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
              html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
              html += '	      <option value="1"><?php echo $text_yes; ?></option>';
              html += '	      <option value="0"><?php echo $text_no; ?></option>';
              html += '	  </select></div>';
              html += '	</div>';

              if (item['type'] == 'text') {
                  html += '	<div class="form-group">';
                  html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                  html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                  html += '	</div>';
              }

              if (item['type'] == 'textarea') {
                  html += '	<div class="form-group">';
                  html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                  html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
                  html += '	</div>';
              }

              if (item['type'] == 'file') {
                  html += '	<div class="form-group" style="display: none;">';
                  html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                  html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                  html += '	</div>';
              }

              if (item['type'] == 'date') {
                  html += '	<div class="form-group">';
                  html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                  html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                  html += '	</div>';
              }

              if (item['type'] == 'time') {
                  html += '	<div class="form-group">';
                  html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                  html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                  html += '	</div>';
              }

              if (item['type'] == 'datetime') {
                  html += '	<div class="form-group">';
                  html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                  html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                  html += '	</div>';
              }

              if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
                  html += '<div class="table-responsive">';
                  html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                  html += '  	 <thead>';
                  html += '      <tr>';
                  html += '        <td class="text-left"><?php echo $entry_option_value; ?>(正常价是所有属性价格的叠加)</td>';
                  html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
                  // html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
                  html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
            
                   <?php foreach ($customer_groups as $customer_group) { ?>
                       html += '   <td class="text-right"><?php echo $customer_group["name"]; ?></td>';
                    <?php } ?>

                  html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
                  html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
                  html += '        <td></td>';
                  html += '      </tr>';
                  html += '  	 </thead>';
                  html += '  	 <tbody>';
                  html += '    </tbody>';
                  html += '    <tfoot>';
                  html += '      <tr>';
                  html += '        <td colspan="6"></td>';
                  html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
                  html += '      </tr>';
                  html += '    </tfoot>';
                  html += '  </table>';
                  html += '</div>';

                  html += '  <select id="option-values' + option_row + '" style="display: none;">';

                  for (i = 0; i < item['option_value'].length; i++) {
                      html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                  }

                  html += '  </select>';
                  html += '</div>';
              }

              $('#tab-option .tab-content').append(html);

              $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + item['label'] + '</li>');

              $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

              $('[data-toggle=\'tooltip\']').tooltip({
                  container: 'body',
                  html: true
              });

              $('.date').datetimepicker({
                  pickTime: false
              });

              $('.time').datetimepicker({
                  pickDate: false
              });

              $('.datetime').datetimepicker({
                  pickDate: true,
                  pickTime: true
              });

              option_row++;
          }
      });
      //--></script>
  <script type="text/javascript"><!--
      var option_value_row = <?php echo $option_value_row; ?>;

      function addOptionValue(option_row) {
          html  = '<tr id="option-value-row' + option_value_row + '"><input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" /><input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" value="+"/>';

          html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
          html += $('#option-values' + option_row).html();
          html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
          html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
          html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" value="1" /> ';
          // html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
          // html += '    <option value="1"><?php echo $text_yes; ?></option>';
          // html += '    <option value="0"><?php echo $text_no; ?></option>';
          // html += '  </select></td>';

          html += '  <td class="text-right">';
          html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';

           <?php foreach ($customer_groups as $customer_group) { ?>
          html += '  <td class="text-right">';
              html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price<?=$customer_group["customer_group_id"];?>]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
            <?php } ?>



          html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
          html += '    <option value="+">+</option>';
          html += '    <option value="-">-</option>';
          html += '  </select>';
          html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
          html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
          html += '    <option value="+">+</option>';
          html += '    <option value="-">-</option>';
          html += '  </select>';
          html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
          html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
          html += '</tr>';

          $('#option-value' + option_row + ' tbody').append(html);
          $('[rel=tooltip]').tooltip();

          option_value_row++;
      }
      //--></script>

  <script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tr id="discount-row' + discount_row + '">';
    html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    // html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    // html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    // html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	// html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	discount_row++;
}
//--></script>
  <script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tr id="special-row' + special_row + '">';

    html += '  <td class="text-left"><select name="product_special[' + special_row + '][product_option_value_id]" class="form-control">';
  html += '   <option value="0">全部尺寸都参与</option> ';
    <?php if(isset($special_options)){ foreach ($special_options as $special_option) { ?>
    html += '      <option value="<?php echo $special_option['product_option_value_id']; ?>"><?php echo addslashes($special_option['name']); ?></option>';
    <?php } } ?>
    html += '  </select></td>';
    html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
      html += '   <option value="0">全部客户都参与</option> ';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '<input type="hidden" name="product_special[' + special_row + '][priority]" value="0" /> ';
    // html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
  html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][percent]" value="" placeholder="<?php echo $entry_percent; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#special tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	special_row++;
}
//--></script>
  <script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
//--></script>
  
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>

<!-- option同步到data数据 -->
<script type="text/javascript">
  function dataSynchro() {
    if($('#option-Color').val()) {
      $('#data-color-id').val($('#option-Color').val());
    }
    if($('#option-Length').val()) {
      $('#data-length-id').val($('#option-Length').val());
    }
  }

  function colorSynchro() {
    $('#option-Color').val($('#data-color-id').val());
  }

  function lengthSynchro() {
    $('#option-Length').val($('#data-length-id').val());
  }

</script>

<?php echo $footer; ?>
