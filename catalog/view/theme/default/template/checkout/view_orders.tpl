<div class="yd_hide" ><?php echo $header; ?></div>
<div class="new_nav pc_hide clearfix">
                <a class="fh" href="<?php echo $home?>"></a>
                <p>ORDER AMOUNT</p>
            </div>
        <div class="content in_content pay new_in_content">
            <div class="pay_text clearfix">
                <p class="p1">Please transfer to the following <?php  if($order['payment_code']=='naria_account'){?>NAIRA<?php } ?> bank account</p>

                <table class="pay_tb1 pay_tb2">
                    <?php foreach($payment_method_attributes as $attribute) { ?>     
                        <tr>
                         <td><span><?php echo $attribute['text']; ?>:</span></td>
                         <td><span> <?php echo $attribute['value']; ?></span></td>
                        </tr>
                    <?php } ?>
                </table>
                <p class="p2">
                    Notice: After you completed the payment with bank, please kindly 
                    upload the bank receipt to our website and notify your salesman 
                </p>
                
                <a class="a_btn" href="<?php echo $continue; ?>">UPLOAD THE BANK SLIP</a>
            </div>
             
        </div>

<div class="yd_hide"><?php echo $footer; ?></div>
<script>
        //调取上传框
        function getphoto(node) {
            var imgURL = "";
            try{
                var file = null;
                if(node.files && node.files[0] ){
                    file = node.files[0];
                }else if(node.files && node.files.item(0)) {
                    file = node.files.item(0);
                }
                try{
                    imgURL =  file.getAsDataURL();
                }catch(e){
                    imgRUL = window.URL.createObjectURL(file);
                }
            }catch(e){
                if (node.files && node.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        imgURL = e.target.result;
                    };
                    reader.readAsDataURL(node.files[0]);
                }
            }
            creatImg(imgRUL);
            $(".text_div").css("display","inline-block");
            $(".file_div").css("display","none");
            return imgURL;
        }
     
        //上传选中的图片 显示页面
        function creatImg(imgRUL){
            $(".text_div img").attr("src",imgRUL);
        }
        
        //删除选中的图片
        function del_img(obj){
            obj.siblings("img").attr("src","");
            obj.parent().css("display","none");
            $(".file_div").css("display","block");
        }
</script>
