<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="catalog/view/theme/default/css/ttf.css" />
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/common.css" />
    
        <link rel="stylesheet" href="<?=HTTPS_SERVERS;?>catalog/view/theme/default/css/index.css" />
      <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/jquery.min.js" ></script>
        <script type="text/javascript" src="<?=HTTPS_SERVERS;?>catalog/view/theme/default/js/common.js" ></script>
    <title>ACTIVITY</title>
  </head>
  <style type="text/css">
    @media only screen and (min-width:1201px){
      .activity_con .img{display: block;}
      .activity_con .ac_bg{background: url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/ac_text_bg.jpg) no-repeat 100% 100%;}
      .activity_con .ac_text{width: 80%;margin: auto;}
      .activity_con .top_ul{margin: 80px -18px 100px -18px;}
      .activity_con .top_ul li{width: calc(33.33% - 36px);display: block;float: left;height: 260px;text-align: center;
      border-radius: 9px;background: #f7ebee;margin: 0 18px;position: relative;}
      .activity_con .top_ul li span{font-family: helvetica;font-weight: bold;font-size: 80px;position: absolute;display: block;width: 100%;
      height: 40px;overflow: hidden;}
      .activity_con .top_ul li span.sp1 {color: #fff;line-height: 80px;top: -38px;}
      .activity_con .top_ul li span.sp2 {color: #e8c4cd;line-height: 4px;}
      .activity_con .top_ul li h1{font-family: helvetica;font-size: 30px;line-height: 30px;margin: 75px 0 0 0;}
      .activity_con .top_ul li .p_div{height: 155px;line-height: 155px;}
      .activity_con .top_ul li .center{display: inline-block;vertical-align: middle;}
      .activity_con .top_ul li p{font-family: helvetica;font-size: 16px;line-height: 20px;color: #666;padding: 0 20px;}
      .activity_con .btn_div{border-radius: 9px;margin-bottom: 120px;padding: 0 80px;}
      .activity_con .btn_div.bg_f{background: #eccfd8;}
      .activity_con .btn_div.bg_b{background: #fff;}
      .activity_con .btn_div .bt_div{display: inline-block;padding: 0 58px;font-size: 40px;line-height: 80px;height: 80px;color: #fff;
        border-radius: 9px;border: 1px solid #eccfd8;position: relative;left: 50%;transform: translateX(-50%);top: -40px;
        background: -webkit-linear-gradient(45deg, #ff8fa4, #ff497c); background: -o-linear-gradient(45deg, #ff8fa4, #ff497c); 
        background: -moz-linear-gradient(45deg, #ff8fa4, #ff497c); background: linear-gradient(45deg, #ff8fa4, #ff497c);
      }
      .activity_con .center_ul{margin: 0 -10px;padding-bottom: 20px;}
      .activity_con .center_ul li{display: block;float: left;width: calc(20% - 20px);margin: 0 10px;}
      .activity_con .center_ul li .img_a{display: block;width: 100%;overflow: hidden;border-radius: 9px;border: 3px solid #dca8b8;box-sizing: border-box;}
      .activity_con .center_ul li .img_a img{width: 100%;height: 100%;display: block;}
      .activity_con .center_ul li p{font-size: 18px;color: #b37085;font-family: helvetica;line-height: 24px;padding: 5px 0; margin-bottom: 10px;}
      .activity_con .center_ul li .click_a{display: inline-block;padding: 0 33px;height: 40px;line-height: 40px;color: #b37085;
      border-radius:3px;margin-bottom: 40px;background: #fff;font-size: 18px;}
      .activity_con .center_ul li .click_a:hover{color: #fff;
        background: -webkit-linear-gradient(45deg, #ff8fa4, #ff497c); background: -o-linear-gradient(45deg, #ff8fa4, #ff497c); 
        background: -moz-linear-gradient(45deg, #ff8fa4, #ff497c); background: linear-gradient(45deg, #ff8fa4, #ff497c);
      }
      
      .bot_lf{float: left;width: calc(100% - 480px);}
      .bot_lf dl{margin-bottom: 30px;}
      .bot_lf dl dt{font-size: 20px;line-height: 24px;font-family: helvetica;color: #d27284;margin-bottom: 20px;font-weight: bold;}
      .bot_lf dl dd{font-size: 18px;line-height: 24px;font-family: helvetica;color: #333;margin-bottom: 10px;}
      .bot_rf{float: right;width: 480px;background: url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/ac_bg2.jpg) no-repeat;height: 606px;padding: 0 40px;}
      .bot_rf h1{font-size: 30px;height: 30px;line-height: 30px; font-weight: bold;color: #fff;text-align: center;display: block;margin: 70px 0 30px 0;font-family: helvetica;}
      .bot_rf span{display: block;width: 50px;height: 3px;background: #fff;margin:0 auto 80px auto;}
      .bot_rf p{font-size: 18px;line-height: 24px;font-family: helvetica;color: #fff;padding-bottom: 20px;
      border-bottom: 1px solid rgba(255,255,255,.2);margin-bottom: 40px;}
      
    }
    
    @media only screen and (min-width:1px) and (max-width: 1200px) {
      .activity_con .img{display: block;}
      .activity_con .ac_bg{background: url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/ac_text_bg_yd.jpg) no-repeat left top/100% 100%;}
      .activity_con .ac_text{margin: auto;}
      .activity_con .top_ul{margin: 0.7rem auto 0.6rem auto;background: transparent;width: 6.6rem;}
      .activity_con .top_ul li{width:100%;display: block;float: left;text-align: center;
      border-radius: 9px;background: #f7ebee;position: relative;margin-bottom: 0.7rem;}
      .activity_con .top_ul li span{font-family: helvetica;font-weight: bold;font-size: 0.8rem;position: absolute;display: block;width: 100%;
      height: 40px;overflow: hidden;}
      .activity_con .top_ul li span.sp1 {color: #fff;line-height: 0.8rem;top: -0.38rem;}
      .activity_con .top_ul li span.sp2 {color: #e8c4cd;line-height: 0.04rem;}
      .activity_con .top_ul li h1{font-family: helvetica;font-size: 0.3rem;line-height: 0.3rem;margin: 0.7rem 0 0 0;}
      .activity_con .top_ul li .p_div{height: 1.7rem;line-height: 1.7rem;}
      .activity_con .top_ul li .center{display: inline-block;vertical-align: middle;}
      .activity_con .top_ul li p{font-family: helvetica;font-size: 0.22rem;line-height: 0.24rem;color: #666;padding: 0 0.1rem;}
      .activity_con .top_ul li p br{display: none;}
      
      
      .activity_con .btn_div{border-radius: 9px;padding: 0 0.3rem;margin: 0 0.3rem 0.9rem 0.3rem;}
      .activity_con .btn_div.bg_f{background: #eccfd8;}
      .activity_con .btn_div.bg_b{background: #fff;}
      .activity_con .btn_div .bt_div{display: inline-block;padding: 0 0.5rem;font-size: 0.36rem;line-height: 0.7rem;height: 0.7rem;color: #fff;
        border-radius: 9px;border: 1px solid #eccfd8;position: relative;left: 50%;transform: translateX(-50%);top: -40px;
        background: -webkit-linear-gradient(45deg, #ff8fa4, #ff497c); background: -o-linear-gradient(45deg, #ff8fa4, #ff497c); 
        background: -moz-linear-gradient(45deg, #ff8fa4, #ff497c); background: linear-gradient(45deg, #ff8fa4, #ff497c);
      }
      .activity_con .center_ul{margin: 0 -0.15rem;}
      .activity_con .center_ul li{display: block;float: left;width: calc(50% - 0.3rem);margin: 0 0.15rem;}
      .activity_con .center_ul li .img_a{display: block;width: 100%;overflow: hidden;border-radius: 9px;border: 3px solid #dca8b8;box-sizing: border-box;}
      .activity_con .center_ul li .img_a img{width: 100%;height: 100%;display: block;}
      .activity_con .center_ul li p{font-size: 0.2rem;color: #b37085;font-family: helvetica;line-height: 0.22rem;padding: 0.05rem 0; margin-bottom: 0.4rem;}
      .activity_con .center_ul li .click_a{display: none;}
      .bot_lf{width: 100%;}
      .bot_lf dl{margin-bottom: 0.3rem;}
      .bot_lf dl dt{font-size: 0.26rem;line-height: 0.3rem;font-family: helvetica;color: #d27284;margin-bottom: 0.15rem;font-weight: bold;}
      .bot_lf dl dd{font-size: 0.24rem;line-height: 0.3rem;font-family: helvetica;color: #333;margin-bottom: 0.1rem;}
      .bot_rf{background: url(<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/ac_bg2_yd.jpg) no-repeat 100%;padding: 0 0.4rem;width: 6.2rem;margin:0 auto 0.4rem auto;}
      .bot_rf h1{font-size: 0.3rem;height: 0.3rem;line-height: 0.3rem; font-weight: bold;color: #fff;text-align: center;
      display: block;margin: 0.6rem 0 0.25rem 0;font-family: helvetica;}
      .bot_rf span{display: block;width: 0.5rem;height: 3px;background: #fff;margin:0 auto 1rem auto;}
      .bot_rf p{font-size: 0.24rem;line-height: 0.26rem;font-family: helvetica;color: #fff;padding-bottom: 0.2rem;
      border-bottom: 1px solid rgba(255,255,255,.2);margin-bottom: 0.5rem;}
    }
    
  </style>
  <body>
    <div class="activity_con clearfix">
      
      <div class="ac_bg clearfix">
        <!-- banner -->
        <img class="img changeimage lazyLoad" data-image='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/active.jpg' data-mimage='<?=HTTPS_SERVERS;?>catalog/view/theme/default/img/jpg/active_yd.jpg'/>
        <div class="ac_text clearfix">
          <!-- 01 02 03 -->
          <ul class="top_ul clearfix">
            <li>
              <span class="sp1">01</span>
              <span class="sp2">01</span>
              <h1>Overview</h1>
              <div class="p_div">
                <div class="center">
                  <p>
                    For celebrating our 10th Aniversary, <br />
                    hot beauty hair give the profit to our regular  <br />
                    clients and new clients.
                  </p>
                </div>
              </div>
            </li>
            <li>
              <span class="sp1">02</span>
              <span class="sp2">02</span>
              <h1>What to Expect  </h1>
              <div class="p_div">
                <div class="center">
                  <p>
                    When you make any order which amount is <br />
                    over 300$, you could add those extra value product <br />
                    to your cart with a very lower price.<br />
                    Each client or each order can order 6pcs in maximum.
                  </p>
                </div>
              </div>
            </li>
            <li>
              <span class="sp1">03</span>
              <span class="sp2">03</span>
              <h1>Activitiy Duration </h1>
              <div class="p_div">
                <div class="center">
                  <p>
                    12 days <br />
                    ( July 9th-July 20th, 2019 )
                  </p>
                </div>
              </div>
            </li>
          </ul>
        
          <!-- Activitiy Products -->
          <div class="btn_div bg_f clearfix">
            <span class="bt_div">Activitiy Products</span>
            <ul class="center_ul clearfix">
                <?php if($products){ foreach ($products as $product) { ?>
              <li>
                <a class="img_a" href="<?php echo $product['href']; ?>">
                  <img src="<?php echo $product['thumb']; ?>" alt="">
                </a>
                <?php $name=explode("-",$product['name']); ?>
              <p><?=isset($name[0])?$name[0]:'';?></p>
                <a class="click_a" href="<?php echo $product['href']; ?>">CLICK</a>
              </li>
                <?php }} ?>
            </ul>
          </div>
          
          <!-- About the Plus Purchase -->
          <div class="btn_div bg_b clearfix">
            <span class="bt_div">About the Plus Purchase</span>
            
            <div class="bot_lf clearfix">
              <dl>
                <dt>1. Available time: </dt>
                <dd>July 9th-July 20th, 2019</dd>
              </dl>
              <dl>
                <dt>2. Who can attend: </dt>
                <dd>Anybody who can sign in our site</dd>
              </dl>
              <dl>
                <dt>3. How to take part in: </dt>
                <dd>
                  <p>
                    a) Add other products to cart (order must >$300) </br>    
                    -->shopping cart--> browse & purchase -->slect products-->confirm-->check out 
                  </p>
                </dd>
                <dd>
                  <p>
                    b) Add other products to cart（order must >$300) </br> 
                    -->go to product category Plus Purchase -->slect products-->confirm-->check out 
                  </p>
                </dd>
              </dl>
              <dl>
                <dt>4. Discount Percentage:</dt>
                <dd>Order>300$, get extra purchase products with 30% off！</dd>
                <dd>Order>1000$, get extra purchase products with 37% off！</dd>
                <dd>Order>3000$, get extra purchase products with 45% off！</dd>
              </dl>
              <dl>
                <dt>5. Maximum Order Quantity:</dt>
                <dd>6 pcs of the extra value products for each order.</dd>
                <dd>When it sold out, no more new stock in future.</dd>
              </dl>
            </div>
          
            <div class="bot_rf clearfix">
              <h1>Important Information:</h1>
              <span></span>
              <p>
                1) These plus purchase products are not for 
                individual sale, it has to match other products.
              </p>
              <p>
                2) Other products order value must over $300. 
                Then you have the qualification to attend this 
                activity.
              </p>
              <p>
                3) When your order value(not including activity 
                product value) reach a different price level, 
                you'll see different price of these activity products.
              </p>
            </div>  
          </div>
          
        </div>
      </div>
    </div>
  </body> 
</html>