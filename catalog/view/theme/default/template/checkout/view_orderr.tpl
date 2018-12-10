<div class="yd_hide" ><?php echo $header; ?></div>
<div class="new_nav pc_hide clearfix">
                <a class="fh" href="<?php echo $home?>"></a>
                <p>UPLOAD THE BANK ALERT</p>
            </div>

<div class="content in_content pay new_in_content">
            <div class="pay_text clearfix">
             <form action="<?=$submit_bank_receipt;?>" method="post" enctype="multipart/form-data">
                <div class="text3 clearfix">
                    <div class="pd_div clearfix">
                        <div class="file_div">
                            <img class="file_img" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/file.png"/>
                            <span class="file_span">Add More</span>
                            <input type="file" name="bank_receipt[]" id="file" multiple value="" title="Upload bank receipt" onchange="getphoto(this)" class="flie_in"/>
                              
                        </div>
                        <!-- <div class="text_div">
                            <img src="" alt="" />
                            <div class="close" onclick="del_img($(this))"></div>
                        </div> -->
                    </div>
                </div>
                <!-- <a class="a_btn" href="javascript:;">CONTINUE</a> -->
                <button type="submit" class="a_btn">SUBMIT</button>
                </form>
            </div>
        </div>
        <style type="text/css">
        .file_span{
            display: none;
            position: relative;
            width: 100px;
            margin-left: -60px;
            font-size: 18px;
            line-height: 30px;
            left:31px;
        }
    @media (max-width:920px) {
        .yd_footer{display: none !important;}
        .yd_footer2{display: block !important;}
    }
    
</style> 
<!-- <div class="yd_hide"> -->
<?php echo $footer; ?>
<!-- </div> -->
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
            // $(".text_div").css("display","inline-block");
            // $(".file_div").css("display","none");
            var html = node.outerHTML;
            $(node).hide();
            $(".file_div").append(html);
            $(".file_span").css("display","inline-block");
            // $(".flie_in:last-child").remove()
            return imgURL;
        }
     
        //上传选中的图片 显示页面
       function creatImg(imgRUL){
        const img = '<img src="'+imgRUL+'" alt="">';
        $(".pd_div").before(img);



      }
        
        //删除选中的图片
        // function del_img(obj){
        //     obj.siblings("img").attr("src","");
        //     obj.parent().css("display","none");
        //     $(".file_div").css("display","block");
        // }
</script>
