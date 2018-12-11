

<div class="yd_hide"><!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
         <meta name="google-translate-customization" content="108d9124921d80c3-80e20d618ff053c8-g4f02ec6f3dba68b7-c"></meta>
    <!--      <link rel="stylesheet" href="catalog/view/theme/default/css/ttf.css" />
        <link rel="stylesheet" href="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/css/common.css" />
        <link rel="stylesheet" href="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/css/index.css" />
        <link rel="stylesheet" href="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/css/swiper.min.css" />
        <script type="text/javascript" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/js/jquery.min.js" ></script>
        <script type="text/javascript" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/js/common.js" ></script>
        <script type="text/javascript" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/js/swiper.js" ></script> -->
         <link rel="stylesheet" href="catalog/view/theme/default/css/ttf.css" />
        <link rel="stylesheet" href="catalog/view/theme/default/css/common.css" />
        <link rel="stylesheet" href="catalog/view/theme/default/css/index.css" />
        <link rel="stylesheet" href="catalog/view/theme/default/css/swiper.min.css" />
        <script type="text/javascript" src="catalog/view/theme/default/js/jquery.min.js" ></script>
        <script type="text/javascript" src="catalog/view/theme/default/js/common.js" ></script>
        <script type="text/javascript" src="catalog/view/theme/default/js/swiper.js" ></script>
        <title>Checkout</title>
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="bookmark" href="/favicon.ico" />
        <base href="https://o.hotbeautyhairmall.com/" />
                        

        
        
        


    <!-- Google Tag Manager -->
  <!--   <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                })(window,document,'script','dataLayer','GTM-5NZ6HB');</script> -->
    <!-- End Google Tag Manager -->
    <!-- Google Tag Manager (noscript) -->
<!-- <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5NZ6HB"
               height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>  -->
<!-- End Google Tag Manager (noscript) -->
<!-- 购物车 AJAX -->
<script type="text/javascript">
    // 购物车开关 
 $(function(){
    var win = $(window).innerWidth();

     if(win>=920){
$(".img_ol .cart_li").click(function(){
        $(".nav_cart").fadeIn();
        $.ajax({
            url: 'index.php?route=common/cart/info',
            dataType: 'html',
            success: function(html) {
                $('.nav_cart').html(html);
                 $(".nav_cart .close").click(function(){
                     $(".nav_cart").fadeOut();
                    });
                 
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });  
    })
}   
});

</script>
 <script type="text/javascript">
function googleTranslateElementInit() {
new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');

$("body").css("top","auto").css("min-height","inherit").css("position","inherit");
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"> </script>
    </head>

<body>
<!--头部-->
        <div class="big_nav">
            <!-- <div class="nav yd_hide content clearfix"> -->
            <div class="nav  content clearfix">

                 <!--货币切换-->

                <div class="mn_type">
                  <form action="https://o.hotbeautyhairmall.com/index.php?route=common/currency/currency" method="post" enctype="multipart/form-data" id="form-currency">
                    <div class="top clearfix">
                        <p class="currency_USD">USD</p>
                        <div class="pic_img">
                            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/down.png" alt="" />
                        </div>
                    </div>
                    <div class="bot">
                        <span><em></em></span>
                        <ul class="ul_type">
                                                          <li class="currency_select_EUR"><a onclick="submit_currency(this.name);"  name="EUR">EUR</a></li>
                                                           <li class="currency_select_NGN"><a onclick="submit_currency(this.name);"  name="NGN">NGN</a></li>
                                                           <li class="currency_select_GBP"><a onclick="submit_currency(this.name);"  name="GBP">GBP</a></li>
                                                           <li class="currency_select_USD"><a onclick="submit_currency(this.name);"  name="USD">USD</a></li>
                                                       </ul>
                    </div>
                      <input type="hidden" id="currency_code" name="code" value="" />
                      <input type="hidden" name="redirect" value="https://o.hotbeautyhairmall.com/checkout-checkout?cart_ids=2883%2C2893%2C2883%2C2893" />
                  </form>
                </div>
                
<script type="text/javascript">
  function submit_currency(name) {
    $('#currency_code').val(name);
    $('#form-currency').submit();
  }
</script>


                
               <div id="google_translate_element" class="fanyi"></div>
                <!--logo-->
                <div class="logo">
                    <!-- href="http://o.hotbeautyhairmall.com/" -->
                    <a href="https://o.hotbeautyhairmall.com/" >
                        <img class="changeimage" title="Hot Beauty Hair Mall" alt="Hot Beauty Hair Mall" data-image="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/logo.png" data-mimage="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/yd_logo.png"  src='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/logo.png'  />
                    </a>
                </div>  
                
                <!--whatApp-->
                <p class="whatapp"><a  target="_blank"  href="https://api.whatsapp.com/send?phone=8613411191912"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/phone.png"/>WhatsApp:+8613411191912</a></p>
                
                <!--pc导航-->
                <ul class="nav_ul clearfix">
                    <li  ><a href="https://o.hotbeautyhairmall.com/common-home">Home</a></li>
                                           <li class="">
                        <a  href="https://o.hotbeautyhairmall.com/all_hair_weft_collection.html"   >All Hair Weft Collections</a>
                                                  <div class="text clearfix">
                            <ol class="clearfix">
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/superdouble_drawn_funmihair.html">Super Double Drawn Funmi Hair</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/virgin_brazilian_hair.html">Virgin Brazilian Hair (Raw Hair)</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/virgin_peruvianhair_normalfull.html">Virgin Peruvian Hair (Normal Full)</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/virgin_peruvainhair_veryfull.html">Virgin Peruvian Hair (Very Full)</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/colorfulhair_humanhair.html">Colorful Hair (100% Human Hair)</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/virginindianhair_normalfull.html">Virgin Indian Hair (Normal Full)</a></li>
                                                             </ol>
                        </div>
                                                 </li>
                                          <li class="">
                        <a  href="https://o.hotbeautyhairmall.com/closure_frontal_wig.html"   >Closure &amp; Frontal &amp; Wig</a>
                                                  <div class="text clearfix">
                            <ol class="clearfix">
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/lace_closure.html">Lace Closure</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/lacefrontal.html">Lace Frontal</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/360frontal.html">360 Frontal</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/stocklacewig_frontlacewig.html">Stock Front Lace Wig</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/stocklacewig_fulllacewig.html">Stock Full Lace Wig</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/stockwig_360frontalwig.html">Stock 360 Frontal Wig</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/customized_bundleswig.html">Customized Bundles Wig</a></li>
                                                             </ol>
                        </div>
                                                 </li>
                                          <li class="">
                        <a  href="https://o.hotbeautyhairmall.com/promotion.html"   >Christmas Promotion</a>
                                                  <div class="text clearfix">
                            <ol class="clearfix">
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/promotion_hair.html">Promotion Wigs</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/christmassale_dailysales.html">Daily Sales</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/christmassale_freeshipping_combinationsale.html">Free Shipping Combination Sales</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/christmassale_singleitemsale.html">Single Item Sales</a></li>
                                                                  <li><a   href="https://o.hotbeautyhairmall.com/flashsales.html">Flash Sales</a></li>
                                                             </ol>
                        </div>
                                                 </li>
                                          <li class="">
                        <a  href="https://o.hotbeautyhairmall.com/hairclub.html "   >Hair Club</a>
                                              </li>
                                          <li class="">
                        <a  href="https://o.hotbeautyhairmall.com/aboutus.html"   >Company Profile</a>
                                              </li>
                                      </ul>   
                
                <!--导航图标-->
                <div class="right">
                    <ol class="img_ol clearfix fl">
                        <li class="search_li"><i>Search</i></li>
                                                 <li class="login_li">   <a href="https://o.hotbeautyhairmall.com/account-dashboard"></a>qweqw qweqw</li>
                                                <li><a href="https://o.hotbeautyhairmall.com/account-wishlist"><span id='wishlist_count'>0</span></a>Wish List</li>
                        <li class="cart_li"><span  id='cart_count'>3</span>Cart</li>
                    </ol>
                                          <div class="lg_hover clearfix">
                        <div class="text clearfix">
                          <em></em>
                          <i><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/vip1.png"/></i>
                          <p><a href="https://o.hotbeautyhairmall.com/account-vip">VIP </a></p>
                         <a href="https://o.hotbeautyhairmall.com/account-logout"> <button>Logout</button></a>
                        </div>
                      </div>
                                         </div>
                
                <!--搜索框-->
            <form method='post' action='https://o.hotbeautyhairmall.com/product-search'  class="search fl" >
                    <input class="btn_in" type="submit" value="">
                    <input class="text_in"  type="text" name="new_search" placeholder="Search">
                    <img class="close" src="catalog/view/theme/default/img/png/close2.png"/>
             </form>
             <!-- <form class="search fl">
              <input id="header-search" value="" type="" name="new_search" placeholder="Search">
                <img class="close" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/close2.png"/>
              </form>
 -->                
                <!--导航购物车-->
                <div class="nav_cart">
               
                    
              
                </div>
                
                <!--导航开关-->
                <div class="nav_off"></div>
                
                <!--移动导航-->
                <div class="yd_nav">
                    <div class="top">
                        <img class="menu" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/menu.png"  />
                        <img class="close" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/close2.png"/>
                    </div>
                    
                    <ul>
                                            <li class="clearfix">
                            <a  href="https://o.hotbeautyhairmall.com/all_hair_weft_collection.html"   >All Hair Weft Collections   </a><img class="slide_img" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao.png'/>                                                          <ol class="yd_nav_ol clearfix">
                    
                                                               <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/superdouble_drawn_funmihair.html">Super Double Drawn Funmi Hair</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/virgin_brazilian_hair.html">Virgin Brazilian Hair (Raw Hair)</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/virgin_peruvianhair_normalfull.html">Virgin Peruvian Hair (Normal Full)</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/virgin_peruvainhair_veryfull.html">Virgin Peruvian Hair (Very Full)</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/colorfulhair_humanhair.html">Colorful Hair (100% Human Hair)</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/virginindianhair_normalfull.html">Virgin Indian Hair (Normal Full)</a></li>
                                                             </ol>
                                                     </li>
                                               <li class="clearfix">
                            <a  href="https://o.hotbeautyhairmall.com/closure_frontal_wig.html"   >Closure &amp; Frontal &amp; Wig   </a><img class="slide_img" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao.png'/>                                                          <ol class="yd_nav_ol clearfix">
                    
                                                               <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/lace_closure.html">Lace Closure</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/lacefrontal.html">Lace Frontal</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/360frontal.html">360 Frontal</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/stocklacewig_frontlacewig.html">Stock Front Lace Wig</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/stocklacewig_fulllacewig.html">Stock Full Lace Wig</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/stockwig_360frontalwig.html">Stock 360 Frontal Wig</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/customized_bundleswig.html">Customized Bundles Wig</a></li>
                                                             </ol>
                                                     </li>
                                               <li class="clearfix">
                            <a  href="https://o.hotbeautyhairmall.com/promotion.html"   >Christmas Promotion   </a><img class="slide_img" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao.png'/>                                                          <ol class="yd_nav_ol clearfix">
                    
                                                               <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/promotion_hair.html">Promotion Wigs</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/christmassale_dailysales.html">Daily Sales</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/christmassale_freeshipping_combinationsale.html">Free Shipping Combination Sales</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/christmassale_singleitemsale.html">Single Item Sales</a></li>
                                                                  <li class="clearfix"><a class="right_img"   href="https://o.hotbeautyhairmall.com/flashsales.html">Flash Sales</a></li>
                                                             </ol>
                                                     </li>
                                               <li class="clearfix">
                            <a  href="https://o.hotbeautyhairmall.com/hairclub.html "   >Hair Club   </a>                                                    </li>
                                               <li class="clearfix">
                            <a  href="https://o.hotbeautyhairmall.com/aboutus.html"   >Company Profile   </a>                                                    </li>
                                              
                    </ul>
                </div>
                
            </div>
          <!--   <div class="new_nav pc_hide clearfix">
                <a class="fh" href="###"></a>
                <p>PRODUCT DETAILS</p>
            </div> -->
        
        </div>

        <!--pc搜索弹窗-->
        <div class="ss_modal clearfix">
            <div class="bg_f clearfix">
                <div class="text clearfix">
                    <div class="close"><img src="catalog/view/theme/default/img/png/close2.png" alt="" /></div>
                    <form method='post' action='https://o.hotbeautyhairmall.com/product-search' >
                    <label class="clearfix" for="">
                        <span class="ss_img">
                            <input type="submit"/> 
                        </span>
                        <input class="in_text" type="text" placeholder="Search  keyword" name="search"/>
                        <img class="in_close" src="catalog/view/theme/default/img/png/close5.png" alt="" />
                    </label>
                     </form>
                    
                    <div class="con clearfix">
                        <h1>Trending Searches</h1>
                        <ol>
                                                                                   <li class="active">
                                <a  onclick="javascript:selsearch('360');">360</a>
                                
                              </li>
                                                            <li class="active">
                                <a  onclick="javascript:selsearch('Double');">Double</a>
                                
                              </li>
                                                                                    </ol>
                    </div>
                    
                    <div class="con clearfix">
                        <h1>Your Recent Searches
                            <i class="del">
                                <svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" onclick="del('201')">
                                    <path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#999999"></path>
                                    <path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#999999"></path>
                                    <path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#999999"></path>
                                </svg>  
                            </i>
                        </h1>
                        <ul class="ls_ul clearfix">
                                                </ul>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://mad.hotbeautyhairmall.com/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
 <script>
 function del(id){
                     $.ajax({
                      url: 'https://o.hotbeautyhairmall.com/common-header-delete',
                      type: 'post',
                      data: {id:id},
                      dataType: 'json',
                      success: function(json) {
                        $('#count').html('');
                      }
                  })   
          }
 function selsearch(value) {
          // alert(value);die;
          url = 'https://o.hotbeautyhairmall.com/product-search';
                if (value) {
                    url += '&search=' + encodeURIComponent(value);
                }
                location = url;
        }
        $(document).ready(function() {
            /* Search */
            // $('.search_li ').click(function() {
            //    // alert(1111);die;
            //    if ($(this).hasClass('on')) {
            //     url = 'https://o.hotbeautyhairmall.com/product-search';
            //     var value = $("input[name='new_search']").val();

            //     if (value) {
            //         url += '?search=' + encodeURIComponent(value);
            //     }
            //     location = url;
            // }else{
            //     $(this).addClass('on');
            //     $('input[name="new_search"]').focus();

            // }
            // });

            $('#header-search').keydown(function(e){
                if(e.keyCode==13){
                    $('.search_li').click();
                }
            })
        });
    </script> </div>
<div class="new_nav pc_hide clearfix">
        <a class="fh" href="https://o.hotbeautyhairmall.com/index.php?route=checkout/shipping_method/wap&cart_ids=2883,2893,2883,2893"></a>
        <p>SHIPPING METHOD</p>
      </div>
 <link rel="stylesheet" href="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/js/select2/css/select2.css" />
        <script type="text/javascript" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/js/select2/js/select2.js" ></script>
    <!--pc内容-->
        <div class="address yd_hide clearfix">
            <div class="content in_content address_content clearfix">
                
                <div class="left clearfix">
                    
                    <div class="text clearfix" >
                        <input id="same_as_shipping" name="same_as_shipping" value="1"  type="hidden">
                        <div class="payment_next bg_gif" id="payment_next" >
                        <div class="shipping_address bg_fff bg_gif" id="shipping_address">
                            <h2>Select the shipping address</h2>
                     
                        </div>
                                                 <a class="btn240 addrres butbtn" onclick="toselectAddress()">SAVE AND CONTINUE &nbsp;&nbsp;&nbsp;></a>
                                                 <div class="shipping_method bg_fff bg_gif" id="shipping_method" style="display: none;" >
                            <h3>Shipping Method</h3>
                        </div>
                        </div>
                    </div>
                   
                </div>
            
                <div class="right clearfix right_shop ">
                    <div class="collapse-checkout bg_fff" id='collapse-checkout-confirm'><h2>SUMMARY</h2></div>
                  
                </div>
            
            </div>
        </div>
<!-- yd nreirong -->
        <!--移动内容1-->
        <div class="content in_content zf_1 new_in_content clearfix pc_hide">
            <div class="zf_con clearfix">
               <!--  <div class="zfbt clearfix">
                    <span>1</span>
                    <h1>Shipping Address</h1>
                </div> -->
                
                <ol class="zf_1_ol clearfix">
                        <input id="same_as_shipping" name="same_as_shipping" value="1"  type="hidden">
                        <div class="payment_next bg_gif" id="payment_next" >
                        <div class="shipping_address bg_fff bg_gif" id="shipping_addresss">
                            <h2>Select the shipping address</h2>
                     
                        </div>
                        <div class="shipping_method bg_fff bg_gif" id="shipping_methods" style="display: none;" >
                            <h3>Shipping Method</h3>
                        </div>
                        </div>

                </ol>
                
            </div>
        </div>

<script type="text/javascript">
function toselectAddress(){

tips('Please Select Shipping Address','gantan');
 // $('.addrres').css('display','none');

}
    $(function(){
        //单选
        $(".dx_label input").click(function(){
            if($(this).prop("checked")){
                $(this).siblings(".check_i").addClass("active");
                
            }else{
                $(this).siblings(".check_i").removeClass("active");
            }
        })
        
        $(".address_ul>li").click(function(){
            $(this).addClass("active").siblings("li").removeClass("active");
        })
        
        //搜索
        $(".shop_search input").focus(function(){
            $(".shop_search button").css("display","block");
        })
        //yd选择支付地址
        $(".zf_1 .zf_1_ol>li").click(function(){
            $(this).addClass("active").siblings().removeClass("active");
        })

    })
</script>
<style type="text/css">
    @media (max-width:920px) {
        .yd_footer{display: none !important;}
        .yd_footer2{display: block !important;}
    }
    
</style>        
<script type="text/javascript"><!--
//浏览器窗口从pc/yd改变的时候刷新页面
  var old_w = $(window).width();
  $(window).resize(function(){
    var new_w = $(window).width();
    (old_w>920) ? (new_w <=920)?location.href="/index.php?route=checkout/checkout&cart_ids=2883,2893,2883,2893":0 : (new_w >920)?location.href="/index.php?route=checkout/checkout&cart_ids=2883,2893,2883,2893":0 ;
  })

$(document).ready(function() {
    getShippingAddress();
    
  
});



// Get Shipping Address
function getShippingAddress(address_id)
{

    $.ajax({
        url: 'index.php?route=checkout/shipping_address&address_id='+address_id,
        dataType: 'html',
        success: function(html) {
            $('#shipping_address').html(html);
        $('.address_ul li').removeClass('active');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
        // getShippingMethod();
}
// Get Shipping Address

var win = $(window).width();
 if(win<920){
function getShippingAddress(address_id)
{

    $.ajax({
        url: 'index.php?route=checkout/shipping_address&address_id='+address_id,
        dataType: 'html',
        success: function(html) {
            $('#shipping_addresss').html(html);
        $('.zf_1_ol li').removeClass('active');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
        // getShippingMethod();
}
}


// Get Shipping Method
function getShippingMethod()
{
     $('#shipping_method').show();

    $.ajax({
        url: 'index.php?route=checkout/shipping_method',
        dataType: 'html',
        success: function(html) {
            $('#shipping_method').html(html);
            getOrder();
          
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
var win = $(window).width();
 if(win<920){
    function getShippingMethod()
{
     $('#shipping_methods').show();

    $.ajax({
        url: 'index.php?route=checkout/shipping_method',
        dataType: 'html',
        success: function(html) {
            $('#shipping_methods').html(html);
            getOrder();
          
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
 }


// Get Payment Method
function getPaymentMethod()
{
     $('#payment_next').html('<h2>3.Select a payment method</h2>');
    $.ajax({
        url: 'index.php?route=checkout/payment_method',
        dataType: 'html',
        success: function(html) {
            $('#payment_next').html(html);
            $('.liucheng').removeClass('ol_2').addClass('ol_2');
            $('.address').addClass('pay');
            getOrder();
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Get Order Info
function getOrder(){
//    console.log();
    $.ajax({
        url: 'index.php?route=checkout/confirm&cart_ids=' + "2883,2893,2883,2893",
        dataType: 'html',
        success: function(html) {
//            console.log(html);die;
            $('#collapse-checkout-confirm').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
// var win = $(window).width();
//  if(win>920){
// echo $footer;
//  }
//--></script>
<!-- <div class="yd_hide"> -->
<!--返回顶部-->
    <div class="xf_right">
      <a href="https://o.hotbeautyhairmall.com/account-vip"><div class="vip"><span>VIP</span></div></a>
      <div class="top"><span>TOP</span></div>
    </div>





    
    <!--底部-->
    <div class="footer clearfix" >
      <div class="content clearfix">
        <div class="left clearfix">
          <ul class="clearfix">
                    <li class="li">
            <h4>INFORMATION</h4>
             
              <p><a href="https://o.hotbeautyhairmall.com/aboutus.html">About Us</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-information/after_sale_service.html">After Sale Service</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-information/Terms &amp; Conditions">Terms & Conditions</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/hairclub.html ">Hair Club</a></p>
                      </li>
                  <li class="li">
            <h4>BUYER INSTRUCTION</h4>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-information?information_id=1">How To Order</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-information?information_id=9">FAQ</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-information?information_id=3">Delivery Time&Bank Infor</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-information?information_id=4">Return Policy</a></p>
                      </li>
                  <li class="li">
            <h4>MY ACCOUNT</h4>
             
              <p><a href="https://o.hotbeautyhairmall.com/account-account">My Account</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/account-order">My Order</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/account-wishlist">My Wish List</a></p>
             
              <p><a href="https://o.hotbeautyhairmall.com/information-sitemap">Site Map</a></p>
                      </li>
                              <li>
                    <h4>CONTACT INFO</h4>
                          <p><span>Call Us:</span> +8613411191912</a></p>
                          <p><span>Whatsapp:</span>+8613411191912</p>
                          <p><span>Email:</span><a href="mailto:melisha@hotbeautyhair.com">melisha@hotbeautyhair.com</a></p>
                        <p style="max-width:260px;line-height: 18px;margin-top: 3px;margin-bottom: 0;">
                          <span>Address:</span>R6403, Jiahe Creative Industry Park, No.63 of North Huangbian Road,Baiyun District, Guangzhou, China.                          </p>
                      </li>
                      <li>
                        <h4>SUBSCRIBE</h4>

                    <p>Be the first to know about our latest products.</p>
                    <!-- <input value="" placeholder="Your Email Address"> -->
                    <input type="email" name="txtemail" id="txtemail" value="" placeholder="Your Email Address" class="text1">
                    <button type="submit" class="btn1" onClick="return subscribe();">SUBMIT</button>

                    <ol class="clearfix">
                      <li><a target="_blank"  href="https://www.facebook.com/hotbeautymelisha"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/fot_1.png" alt=""></a></li>
                      <li><a target="_blank"  href="https://www.instagram.com/hotbeautyhairofficial"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/fot_2.png" alt=""></a></li>
                      <li><a target="_blank"  href="https://api.whatsapp.com/send?phone=8613411191912"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/fot_3.png" alt=""></a></li>
                    </ol>
                      </li>
              </ul>
        </div>
      </div>
      <div class="bot clearfix">
        
        <p>Copyright Notice &copy; 2009-2018 o.hotbeautyhairmall.com  All rights reserved </p>
      </div>
    </div>
    
    <!--yd底部-->
    <div class="yd_footer  clearfix" >
      <div class="top" >
        <ul class="ul_ydfot clearfix">
                         <li>
                  <h4>INFORMATION <div class="pic_img"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao_white.png'/></div></h4>
                  <div class="slide_div">
                    <ol>     
                      <li><a href="https://o.hotbeautyhairmall.com/aboutus.html">About Us</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/information-information/after_sale_service.html">After Sale Service</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/information-information/Terms &amp; Conditions">Terms & Conditions</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/hairclub.html ">Hair Club</a></li>
                                             
                    </ol>
                  </div>
                    </li>
                   <li>
                  <h4>BUYER INSTRUCTION <div class="pic_img"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao_white.png'/></div></h4>
                  <div class="slide_div">
                    <ol>     
                      <li><a href="https://o.hotbeautyhairmall.com/information-information?information_id=1">How To Order</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/information-information?information_id=9">FAQ</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/information-information?information_id=3">Delivery Time&Bank Infor</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/information-information?information_id=4">Return Policy</a></li>
                                             
                    </ol>
                  </div>
                    </li>
                   <li>
                  <h4>MY ACCOUNT <div class="pic_img"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao_white.png'/></div></h4>
                  <div class="slide_div">
                    <ol>     
                      <li><a href="https://o.hotbeautyhairmall.com/account-account">My Account</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/account-order">My Order</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/account-wishlist">My Wish List</a></li>
                        
                      <li><a href="https://o.hotbeautyhairmall.com/information-sitemap">Site Map</a></li>
                                             
                    </ol>
                  </div>
                    </li>
               
                    <li>
                      <h4>CONTACT<div class="pic_img"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png" data-img='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jiahao_white.png' data-imgs='https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/jianhao_white.png'/></div></h4>
                      <div class="slide_div">
                        <ol>
                      <li><a target="_blank" href="https://tel://+8613411191912"><span>Call Us:</span>+8613411191912</li></a>  
                      <li><a target="_blank" href="https://api.whatsapp.com/send?phone=8613411191912"><span>Whatsapp:</span> +8613411191912</a></li>
                      <li><a target="_blank" href="https://mailto:melisha@hotbeautyhair.com"><span>Email:</span>melisha@hotbeautyhair.com</a></li>
                      <li>                       
                          <a ><span>Address:</span>R6403, Jiahe Creative Industry Park, No.63 of North Huangbian Road,Baiyun District, Guangzhou, China.</a>                  
                      </li>
                    </ol>
                  </div>
                    </li>
                    <li>
                      <h4>SUBSCRIBE</h4>
                      <div class="slide_div" style="display: block !important;">
                        <p>Be the first to know about our latest products.</p>
                    <input type="email" name="txtemail" id="txtemail" value="" placeholder="Your Email Address" class="text1">
                    <button type="submit" class="btn1" onClick="return subscribe();">SUBMIT</button>
                    <ol class="fot_img clearfix">
                      <li><a href="https://www.facebook.com/hotbeautymelisha"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/yd_fot1.png" alt=""></a></li>
                      <li><a href="https://www.instagram.com/hotbeautyhairofficial"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/yd_fot2.png" alt=""></a></li>
                      <li><a href="https://api.whatsapp.com/send?phone=8613411191912"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/yd_fot3.png" alt=""></a></li>
                      <li><a href="skype:hotbeautymelisha?chat" target="blank"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/yd_fot4.png" alt=""></a></li>
                    </ol>
                      </div>
                    </li>
        </ul>
      </div>
      <p class="clearfix">Copyright Notice &copy; 2009-2018 o.hotbeautyhairmall.com  All rights reserved</p>
    </div>
    <div class="yd_footer2" >
      <ol class="ol_ydfot clearfix">
                  <li class="">
          <a href="https://o.hotbeautyhairmall.com/common-home">
         <!--    <img class="active" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/home-1.png" alt="" />
            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/home-2.png" alt="" /> -->
            <span class="img"></span>
            <p>HOME</p>
          </a>
        </li>
                <li class="">
          <a href="https://o.hotbeautyhairmall.com/product-allcategory">
      <!--       <img class="active" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/fenlei-1.png" alt="" />
            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/fenlei-2.png" alt="" /> -->
            <span class="img"></span>
            <p>ALL HAIR</p>
          </a>
        </li>
        <li>
          <a class="contact" href="javascript:0;"  onclick="return false">
           <!--  <img class="active" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/contact-1.png" alt="" />
            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/contact-2.png" alt="" /> -->
            <span class="img"></span>
            <p>CONTACT</p>
          </a>
          <div class="a_text">
            <a href="tel://+8613411191912"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/jpg/fot_con1.jpg"/></a>
            <a href="skype:hotbeautymelisha?chat"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/jpg/fot_con2.jpg"/></a>
            <a href="mailto:melisha@hotbeautyhair.com"><img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/jpg/fot_con3.jpg"/></a>
          </div>
        </li>
       <!--  <li>
          <a href="###">
            <img class="active" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/contact-1.png" alt="" />
            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/contact-2.png" alt="" />
            <p>CONTACT</p>
          </a>
        </li> -->
        <li class="active">
          <a href="https://o.hotbeautyhairmall.com/checkout-cart">
           <!--  <img class="active" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/cart-1.png" alt="" />
            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/cart-2.png" alt="" /> -->
            <span class="img"></span>
            <!-- <p><span class='cart_count'>3</span>CART</p> -->
            <p>CART</p>
          </a>
        </li>
        <li class="">
          <a href="https://o.hotbeautyhairmall.com/account-inquiry">
           <!--  <img class="active" src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/account-1.png" alt="" />
            <img src="https://mad.hotbeautyhairmall.com/catalog/view/theme/default/img/png/account-2.png" alt="" /> -->
            <span class="img"></span>
            <p>ACCOUNT</p>
          </a>
        </li>
      </ol>
    </div>


  </body>
</html>
<script>
function subscribe()
{
    var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var email = $('#txtemail').val();
    if(email != "")
    {
        if(!emailpattern.test(email))
        {
            alert("Invalid Email");
            return false;
        }
        else
        {
            $.ajax({
                url: 'index.php?route=module/newsletters/news',
                type: 'post',
                data: 'email=' + $('#txtemail').val(),
                dataType: 'json',

                success: function(json) {
                    alert(json.message);
                }
            });
            return false;
        }
    }
    else
    {
        alert("Email Is Require");
        $(email).focus();
        return false;
    }
}
</script>
<!-- </div> -->