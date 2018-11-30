<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
         <meta name="google-translate-customization" content="108d9124921d80c3-80e20d618ff053c8-g4f02ec6f3dba68b7-c"></meta>
    <!--      <link rel="stylesheet" href="catalog/view/theme/default/css/ttf.css" />
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/common.css" />
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/index.css" />
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/swiper.min.css" />
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/jquery.min.js" ></script>
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/common.js" ></script>
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/swiper.js" ></script> -->
         <link rel="stylesheet" href="catalog/view/theme/default/css/ttf.css" />
        <link rel="stylesheet" href="catalog/view/theme/default/css/common.css" />
        <link rel="stylesheet" href="catalog/view/theme/default/css/index.css" />
        <link rel="stylesheet" href="catalog/view/theme/default/css/swiper.min.css" />
        <script type="text/javascript" src="catalog/view/theme/default/js/jquery.min.js" ></script>
        <script type="text/javascript" src="catalog/view/theme/default/js/common.js" ></script>
        <script type="text/javascript" src="catalog/view/theme/default/js/swiper.js" ></script>
        <title><?php echo $title; ?></title>
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="bookmark" href="/favicon.ico" />
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>


        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>

        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>

        <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
        <?php } ?>



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
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"> </script>
    </head>

<body>
<!--头部-->
        <div class="big_nav">
            <!-- <div class="nav yd_hide content clearfix"> -->
            <div class="nav  content clearfix">

                <?php echo $currency; ?>
                
               <div id="google_translate_element" class="fanyi"></div>
                <!--logo-->
                <div class="logo">
                    <!-- href="<?php echo $root_home; ?>" -->
                    <a href="<?=HTTPS_SERVER;?>" >
                        <img class="changeimage" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" data-image="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/logo.png" data-mimage="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/yd_logo.png"  src='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/logo.png'  />
                    </a>
                </div>  
                
                <!--whatApp-->
                <p class="whatapp"><a  target="_blank"  href="https://api.whatsapp.com/send?phone=<?=$whatappphone;?>"><img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/phone.png"/>WhatsApp:+<?=$whatappphone;?></a></p>
                
                <!--pc导航-->
                <ul class="nav_ul clearfix">
                    <li  <?php if($is_home=='/index.php?route=common/home'||$is_home=='/'||$is_home=='/index.php'||$is_home=='/common-home'){ ?>class="active"<?php } ?>><a href="<?php echo $home; ?>">Home</a></li>
                       <?php if($navs){ foreach ($navs as $k => $nav) { ?>
                    <li class="<?php if($nav['this_page']){ ?>active<?php } ?>">
                        <a  href="<?php echo $nav['url']; ?>"  <?=$nav['is_target']==1?'target="_blank"':''; ?> ><?=$nav['name'];?></a>
                          <?php if($nav['child']){?>
                        <div class="text clearfix">
                            <ol class="clearfix">
                                 <?php foreach ($nav['child'] as $key => $child) { ?>
                                 <li><a  <?=$child['is_target']==1?'target="_blank"':''; ?> href="<?php echo $child['url']; ?>"><?=$child['name']?></a></li>
                                 <?php } ?>
                            </ol>
                        </div>
                             <?php } ?>
                    </li>
                      <?php } }?>
                </ul>   
                
                <!--导航图标-->
                <div class="right">
                    <ol class="img_ol clearfix fl">
                        <li class="search_li"><i>Search</i></li>
                         <?php if ($logged) { ?>
                        <li class="login_li">   <a href="<?php echo $account; ?>"></a><?php echo $account_email; ?></li>
                        <?php }else{ ?>
                        <li class="login_li"><a href="<?php echo $login_li?>"></a>Account</li>
                        <?php } ?>
                        <li><a href="<?=$wishlist;?>"><span id='wishlist_count'><?php echo $text_wishlist; ?></span></a>Like</li>
                        <li class="cart_li"><span  id='cart_count'><?=$text_cart_items;?></span>Cart</li>
                    </ol>
                      <?php if ($logged) { ?>
                    <div class="lg_hover clearfix">
                        <div class="text clearfix">
                          <em></em>
                          <i><img src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/vip1.png"/></i>
                          <p><a href="<?=$vip;?>"><?=$account_vip;?></a></p>
                         <a href="<?=$logout;?>"> <button>Logout</button></a>
                        </div>
                      </div>
                         <?php } ?>
                </div>
                
                <!--搜索框-->
            <form method='post' action='<?php echo $search_url;?>'  class="search fl" >
                    <input class="btn_in" type="submit" value="">
                    <input class="text_in"  type="text" name="new_search" placeholder="Search">
                    <img class="close" src="catalog/view/theme/default/img/png/close2.png"/>
             </form>
             <!-- <form class="search fl">
              <input id="header-search" value="" type="" name="new_search" placeholder="Search">
                <img class="close" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/close2.png"/>
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
                        <img class="menu" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/menu.png"  />
                        <img class="close" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/close2.png"/>
                    </div>
                    
                    <ul>
                    <?php if($navs){ foreach ($navs as $k => $nav) { ?>
                        <li class="clearfix">
                            <a  href="<?php echo $nav['url']; ?>"  <?=$nav['is_target']==1?'target="_blank"':''; ?> ><?=$nav['name'];?>   </a><?php if($nav['child']){?><img class="slide_img" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/jiahao.png" data-img='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/jiahao.png' data-imgs='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/png/jianhao.png'/>  <?php } ?>
                            <?php if($nav['child']){?>
                            <ol class="yd_nav_ol clearfix">
                    
                              <?php foreach ($nav['child'] as $key => $child) { ?>
                                 <li class="clearfix"><a class="right_img"  <?=$child['is_target']==1?'target="_blank"':''; ?> href="<?php echo $child['url']; ?>"><?=$child['name']?></a></li>
                                 <?php } ?>
                            </ol>
                             <?php } ?>
                        </li>
                       <?php } }?>
                       
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
                    <form method='post' action='<?php echo $search_url;?>' >
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
                         <?php if(isset($hotsearched)){?>
                            <?php foreach($hotsearched as $key => $hotsearstory) { ?>
                              <li class="active">
                                <a  onclick="javascript:selsearch('<?php echo $hotsearstory['url']; ?>');"><?php echo $hotsearstory['content']; ?></a>
                                
                              </li>
                              <?php } ?>
                              <?php } ?>
                        </ol>
                    </div>
                    
                    <div class="con clearfix">
                        <h1>Your Recent Searches
                            <i class="del">
                                <svg t="1539766974948" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5269" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" onclick="del('<?php echo $customer_id; ?>')">
                                    <path d="M793.6 998.4H220.16c-51.2 0-97.28-40.96-97.28-97.28V261.12c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v645.12c0 25.6 20.48 46.08 46.08 46.08h573.44c25.6 0 46.08-20.48 46.08-46.08v-563.2c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v563.2c0 46.08-46.08 92.16-97.28 92.16z" p-id="5270" fill="#999999"></path>
                                    <path d="M51.2 266.24c-10.24 0-20.48-10.24-25.6-25.6 0-15.36 10.24-25.6 25.6-25.6l916.48-81.92c15.36 0 25.6 10.24 25.6 25.6s-10.24 25.6-25.6 25.6L51.2 266.24c5.12 0 0 0 0 0z" p-id="5271" fill="#999999"></path>
                                    <path d="M343.04 230.4c-10.24 0-20.48-10.24-25.6-25.6l-5.12-76.8C307.2 87.04 337.92 51.2 378.88 46.08l225.28-20.48c20.48 0 40.96 5.12 56.32 15.36 15.36 10.24 25.6 30.72 25.6 51.2l5.12 81.92c0 15.36-10.24 25.6-25.6 25.6s-25.6-10.24-25.6-25.6l-5.12-81.92c0-10.24-10.24-20.48-25.6-20.48l-225.28 25.6c-5.12 0-10.24 5.12-15.36 10.24-5.12 0-5.12 10.24-5.12 15.36L368.64 204.8c0 10.24-10.24 25.6-25.6 25.6 5.12 0 0 0 0 0zM435.2 768c-15.36 0-25.6-15.36-25.6-30.72V399.36c0-15.36 10.24-40.96 25.6-40.96s25.6 25.6 25.6 35.84v337.92c0 15.36-10.24 35.84-25.6 35.84zM588.8 768c-15.36 0-25.6-15.36-25.6-30.72V465.92c0-15.36 10.24-25.6 25.6-25.6s25.6 10.24 25.6 25.6v271.36c0 15.36-10.24 30.72-25.6 30.72z" p-id="5272" fill="#999999"></path>
                                </svg>  
                            </i>
                        </h1>
                        <ul class="ls_ul clearfix">
                        <?php if(isset($searchhistory)){?>
                            <?php foreach($searchhistory as $key => $searstory) { ?>
                              <li id="count">
                                <a onclick="javascript:selsearch('<?php echo $searstory['url']; ?>');"><?php echo $searstory['keywords']; ?></a>
                              </li>
                              <?php } ?>
                              <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <script src="<?=HTTPS_SERVERS;?>catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
 <script>
 function del(id){
                     $.ajax({
                      url: '<?php echo $searchdel; ?>',
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
          url = '<?php echo $search_url; ?>';
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
            //     url = '<?php echo $search_url; ?>';
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
    </script>