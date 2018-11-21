<?php echo $header; ?>

<div class="content in_content pay new_in_content">
            <div class="pay_text clearfix">
             <form action="<?=$submit_bank_receipt;?>" method="post" enctype="multipart/form-data">
                <div class="text3 clearfix">
                    <div class="pd_div clearfix">
                        <div class="file_div">
                            <input type="file" name="bank_receipt" id="file" value="" title="上传照片" onchange="getphoto(this)" class="flie_in"/>
                                <img class="file_img" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/file.png"/>
                        </div>
                        <div class="text_div">
                            <img src="" alt="" />
                            <div class="close" onclick="del_img($(this))"></div>
                        </div>
                    </div>
                </div>
                <!-- <a class="a_btn" href="javascript:;">CONTINUE</a> -->
                <button type="submit" class="a_btn">SUBMIT</button>
                </form>
            </div>
        </div>
<?php echo $footer; ?>
<script>
        window.onload = function(){
            $("button.a_btn").click(function(){
               if($(".text_div>img").attr("src")==""){
                    tips("Please upload voucher.","gantan");
                    return false;
                }else{
                }
            })
        }
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
