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