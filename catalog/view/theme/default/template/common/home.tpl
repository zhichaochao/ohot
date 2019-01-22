<?php echo $header; ?>
   <!--banner-->
        <?=$slideshow;?>
        
        <!--内容-->
        <div class="content">

        <div class="in_coupon clearfix">
            <?php if(!empty($resultcoupon)&&$resultcoupon){?>
                <ul class="clearfix in_ul3">
                <?php foreach ($resultcoupon as $coupons) { ?>
                    <li  onclick="cuscoupon('<?=$coupons['coupon_id']?>')" >
               
                        <div class="text">
                            <div class="center">

                                <?php if($coupons['type']=='P') { ?>  
                                <span class="pon_sp">US<em><?=$coupons['discountp'];?>%OFF</em></span>   
                               <?php }else{ ?> 
                                <span class="pon_sp">US<em><?=$coupons['discount'];?></em></span>
                               <?php } ?> 
                                <p class="pon_p1">Orders of US <?=$coupons['total'];?>+</p>
                                <p class="pon_p2">Expires <?=$coupons['date_end'];?></p>
                            </div>
                        </div>
                        <p class="bot_p">GET COUPON NOW</p>
                    </li>
                 <?php } ?>
                </ul>
                 <?php } ?>
            </div>


            <div class="index_text index_text1">
                <div class="bt">
                    <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/bt1.png"  />
                    <h1>THE SELECTION OF GOOD</h1>
                </div>
                
                <ul class="ul_in1 clearfix">
                    <?php foreach ($fasts as $fast) { ?>
                    <li>
                        <?php if($fast['link']){?>
                        <a href="<?=$fast['link'];?>">
                            <div class="pic clearfix">
                               
                                <img class="changeimage" title="<?=$fast['title'];?>" alt="<?=$fast['title'];?>" data-image="<?=$fast['image'];?>" data-mimage="<?=$fast['mimage'];?>"  />
                            </div>
                            <div class="text">
                                <h2><?=$fast['title'];?></h2>
                                <p><?=$fast['mtitle'];?></p>
                            </div>
                        </a>
                        <?php }else{?>
                        <div class="pic clearfix">
                                 <img class="changeimage" title="<?=$fast['title'];?>" alt="<?=$fast['title'];?>" data-image="<?=$fast['image'];?>" data-mimage="<?=$fast['mimage'];?>" />
                            </div>
                            <div class="text">
                                <h2><?=$fast['title'];?></h2>
                                <p><?=$fast['mtitle'];?></p>
                            </div>

                        <?php }?>
                        </li>
                    <?php } ?>
                    
                </ul>
                <div class="bt2 pc_hide">
                    <h1>One Donor Raw Brazilian Hair</h1>
                </div>

                <?php if(isset($homes[0])){ ?>  
                <div class="top video_top clearfix">
                     <div class="bt2 yd_hide">
                        <h1>One Donor <?=$homes[0]['category']['name'];?></h1>
                        <a href="<?=$homes[0]['category_url'];?>" class="a_btn mr_b_no">VIEW MORE &nbsp;&nbsp;><span class="triangle"><em></em></span></a>
                    </div> 
                    <div class="video_div">
                        <video id="video" class="video" poster="<?=$homes[0]['image'];?>" src="<?=$video;?>" ></video>
                        <div class="bg_div"></div>
                    </div>
                    
                </div>
             <?php if(isset($homes[0]['child'])){ ?>
             <div class="div clearfix">
                <ol class="ol_img2 ol_img clearfix">
                    <?php   foreach ($homes[0]['child'] as $k => $val) { if($k < 3){ ?>
                    <li>
                        <a href="<?=$val['url'];?>">
                            <div class="pic">
                                <img class="changeimage" data-image="<?=$val['image'];?>"  data-mimage="<?=$val['image'];?>"  />
                                <p><?=$val['name'];?></p>
                            </div>
                            <div class="text">
                                <span><?=$val['special']?$val['special']['special']:$val['price'];?></span>
                                <p>SHOW NOW  ></p>
                            </div>
                        </a>
                    </li>
                    <?php } }?>
               
                </ol>
                <div class="bot_btn pc_hide">
                        <a href="<?=$homes[0]['category_url'];?>" class="a_btn">VIEW MORE</a>
                    </div>

                </div>
                <?php } }?>
                  <?php if(isset($homes[1])){ ?> 
                  <div class="div clearfix">  
                  <div class="top top2 clearfix">
                        <div class="bt2">
                            <h1><?=$homes[1]['title'];?></h1>
                            <div class="bt2 yd_hide" style="width: 100%;padding: 0;margin:0 0 5.62vw 0;background: transparent;">
                                <a href="<?=$homes[1]['category_url'];?>" class="a_btn" style="margin: 2.8vw auto 0 auto;">VIEW MORE &nbsp;&nbsp;&gt;<span class="triangle"><em></em></span></a>
                            </div>
                        </div>
                    <img class="top2_img changeimage" data-image="<?=$homes[1]['image'];?>"  data-mimage="<?=$homes[1]['mimage'];?>"  />
                    </div>

                
                    <?php if(isset($homes[1]['child'])){ ?>
                    
                <ol class="ol_img3 ol_img clearfix">
                     <?php   foreach ($homes[1]['child'] as $k => $val) { if($k < 4){ ?>
                    <li>
                        <a href="<?=$val['url'];?>">
                            <div class="pic">
                                <img class="changeimage" data-image="<?=$val['image'];?>"   data-mimage="<?=$val['image'];?>"  />
                                <p><?=$val['name'];?></p>
                            </div>
                            <div class="text">
                                <span><?=$val['special']?$val['special']['special']:$val['price'];?></span>
                                <p>SHOW NOW  ></p>
                            </div>
                        </a>
                    </li>
                          <?php } }?>
                </ol>
                <div class="bot_btn pc_hide">
                        <a href="<?=$homes[1]['category_url'];?>" class="a_btn">VIEW MORE</a>
                    </div>

                    </div>
                    <?php } }?>
               <?php if(isset($homes[2])){ ?> 
               <div class="div clearfix">  
                <div class="top top3 clearfix">

                <div class="bt2">
                            <h1><?=$homes[2]['title'];?></h1>
                            <div class="bt2 yd_hide" style="width: 100%;padding: 0;background: transparent;">
                                <a href="<?=$homes[2]['category_url'];?>" class="a_btn" style="margin: 2.8vw auto 0 auto;">VIEW MORE &nbsp;&nbsp;&gt;<span class="triangle"><em></em></span></a>
                            </div>
                        </div>

                   
                    <img class="top3_img changeimage" data-image="<?=$homes[2]['image'];?>"  data-mimage="<?=$homes[2]['mimage'];?>"  />
                </div>

                    <?php if(isset($homes[2]['child'])){ ?>
                <ol class="ol_img4 ol_img clearfix">
                      <?php   foreach ($homes[2]['child'] as $k => $val) { if($k < 4){ ?>
                    <li>
                       <a href="<?=$val['url'];?>">
                            <div class="pic">
                                <img class="changeimage" data-image="<?=$val['image'];?>"   data-mimage="<?=$val['image'];?>"  />
                                 <p><?=$val['name'];?></p>
                            </div>
                            <div class="text">
                                 <span><?=$val['special']?$val['special']['special']:$val['price'];?></span>
                                <p>SHOW NOW  ></p>
                            </div>
                        </a>
                    </li>
                          <?php } }?>
                </ol>
                <div class="bot_btn pc_hide">
                            <a href="<?=$homes[2]['category_url'];?>" class="a_btn">VIEW MORE</a>
                        </div>
                 </div>
                 <?php } }?>
            </div>
            <?php if(isset($homes[3])){ ?>    
            <div class="index_text index_text2">
            <div class="div clearfix">
                <div class="bt" >
                    <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/bt2.png" alt="" />
                    <h1><?=$homes[3]['category']['name'];?></h1>
                </div>
                
                <div class="top top4">
                    
                    <img class="top4_img changeimage" data-image="<?=$homes[3]['image'];?>" " data-mimage="<?=$homes[3]['mimage'];?>"  />
                </div>
                   <?php if(isset($homes[3]['child'])){ ?>
                <ol class="ol_img5 ol_img clearfix">
                      <?php   foreach ($homes[3]['child'] as $k => $val) { if($k < 5){ ?>
                    <li>
                       <a href="<?=$val['url'];?>">
                            <div class="pic">
                                <img class="changeimage" data-image="<?=$val['image'];?>"   data-mimage="<?=$val['image'];?>" />
                              <p><?=$val['name'];?></p>
                            </div>
                            <div class="text">
                              
                                  <span><?=$val['special']?$val['special']['special']:$val['price'];?></span>
                                <p>SHOW NOW  ></p>
                            </div>
                        </a>
                    </li>
                       <?php  }} ?>
                </ol>

                <div class="bot_btn pc_hide">
                        <a href="<?=$homes[3]['category_url'];?>" class="a_btn">VIEW MORE</a>
                    </div>  
                    <div class="bt2 yd_hide" style="width: 100%;padding: 0;background: transparent;">
                        <a href="<?=$homes[3]['category_url'];?>" class="a_btn" style="margin: 2.8vw auto 0 auto;">VIEW MORE &nbsp;&nbsp;&gt;<span class="triangle"><em></em></span></a>
                    </div>

                    <?php  }?>
            </div>
             </div>
              <?php  }?>
            <div class="index_text3">
                <div class="bt" style="margin:0.3rem 0;">
                    <img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/bt2.png" alt="CUSTOMER SHARE" />
                    <h1># CUSTOMER SHARE</h1>
                    <p>Customers share pictures and immediately buy the same</p>
                </div>
       
                
                <div class="product_lb clearfix">
                    <div class="swiper-container" id="swiper2">
                      <div class="swiper-wrapper">
                        <?php foreach ($gallerys as $gallery) { ?>
                            <div class="swiper-slide">
                                <a href="<?=$gallery['url']?>">
                                    <img src="<?=$gallery['image']?>" title="<?=$gallery['gallery_title']?>" alt="<?=$gallery['gallery_title']?>" />
                                </a>
                            </div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
            
        </div>

<!-- <?php foreach ($resultcoupon as $coupons) { ?> -->
        <div class="modal coupon_modal clearfix khpj_midal">

            <div class="text">
                <div class="close"></div>
                <h1>CONGRATULATIONS!</h1>
                <p>You’ve won</p>
               <!--  <?php if($coupons['type']=='P') { ?>  
                <span class="red_btn clearfix">US <?=$coupons['discountp'];?>%OFF</span>
                 <!-- <span class="pon_sp">US<em><?=$coupons['discountp'];?>%OFF</em></span>    -->
                  <!-- <?php }else{ ?>  --> 
                  <span class="red_btn clearfix" id="price_count">UC </span>
                  <!-- <span class="pon_sp">US<em><?=$coupons['discount'];?></em></span> -->
               <!-- <?php } ?>  -->
                
                <button type="button" class="tj_btn clearfix">OK</button>
            </div>
        </div>
        <!-- <?php } ?> -->
   
      
<?php echo $footer; ?>

<script>
// $(function () {
//        $(".in_ul3 .text").click(function(){
//         alert(11);
//       var index=$(this).parent().index();
//       alert(11);
//       // $('.pl_lb').removeClass('show');
//       // $('.pl_lb').eq(index).addClass('show');
//       if(!$(this).hasClass("img_null")){
//         $(".khpj_midal").eq(index).fadeIn();

//         $("body").css("overflow","hidden");
//         var swiper = new Swiper('.pl_lb', {
//             pagination: {
//               el: '.swiper-pagination',
//               type: 'fraction',
//             },
//             navigation: {
//               nextEl: '.swiper-button-next',
//               prevEl: '.swiper-button-prev',
//             },
//           });
//       }
        
//     }); 

//     $(".khpj_midal .close").click(function(){
//       $(".khpj_midal").fadeOut();
//       $("body").css("overflow","");
//     });

var login_time = setTimeout(gg_show,1000);
    function gg_show (){
        $(".img_modal").fadeIn();
    }
var login_time = setTimeout(gg_show,1000);
    function gg_show (){
        $(".img_modal").fadeIn();
    }
   
    var gb=0;   
        //关闭登陆注册
        $(".img_modal .close").click(function(){
            gb=1;
            clearTimeout(login_time);
            $(".img_modal").fadeOut();
        })
        $(".img_modal .text").hover(function(){
            clearTimeout(login_time);
            $(".img_modal").fadeIn();
        },function(){
            if(gb==0){
                gg_show ();
            }
        })
 
 var li_w=6;
    var win_w = $(window).innerWidth();
    if(win_w>=1080){
        li_w=6;
    }else{
        li_w=3
    }
    var mySwiper = new Swiper('#swiper2', {
        loop:true,
        autoplay: true,
        slidesPerView : li_w,
        loopFillGroupWithBlank: true,
        slidesPerGroup: li_w,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
    })



    $(function(){
        $('.fh_top').on('click',function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 500);
        })
        
        var myvideo = document.getElementById("video");
        $(".video_div .bg_div").click(function(){
            myvideo.play();
            $("#video").attr("controls","controls");
            $(".video_div .bg_div").css("display","none")
        })
        
     
        //替换手机端图片
        var win = $(window).width();
            if(win<=750){
              $(".video_div .video").attr("poster","<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_video_bg.jpg");
            }else{
              $(".video_div .video").attr("poster","<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/video_bg.jpg");
            }
            // if(win<=992){
            //     $(".img_modal .text").css("background"," url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_modal.jpg) no-repeat ").css("background-size","4rem 4.5rem");
            // }else{
            //         $(".img_modal .text").css("background"," url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pc_modal.jpg) no-repeat ");
            // }
        $(window).resize(function() {
            var win = $(window).width();
            if(win<=750){
              $(".video_div .video").attr("poster","<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_video_bg.jpg");
            }else{
              $(".video_div .video").attr("poster","<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/video_bg.jpg");
            }
            // if(win<=992){
            //     $(".img_modal .text").css("background"," url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/yd_modal.jpg) no-repeat ").css("background-size","4rem 4.5rem");
            // }else{
            //         $(".img_modal .text").css("background"," url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/pc_modal.jpg) no-repeat ");
            // }
        })
        
        //打开关闭优惠卷
        $(".in_coupon ul li").click(function(){
            $(".coupon_modal").fadeIn();



        })
        $(".coupon_modal .close, .coupon_modal .tj_btn").click(function(){
            $(".coupon_modal").fadeOut();
        })
        
    })
    
function cuscoupon(coupon_id) {
            // alert(coupon_id);
               $.ajax({
            url:'<?php echo $addcouponcus;?>',
            type:'post',
            data:{'coupon_id':coupon_id},
            dataType: 'json',
            success:function(data){
                // alert(data);
                if (data.error) {
                     window.location.href="<?php echo $login?>";
              }else{
                   $('.red_btn').html('US'+data.price);     
                
              }

            }

           })
          }
</script>
        